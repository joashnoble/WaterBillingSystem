<?php

class Service_disconnection_model extends CORE_Model {
    protected  $table="service_disconnection";
    protected  $pk_id="disconnection_id";

    function __construct() {
        parent::__construct();
    }

    function getList($disconnection_id=null,$customer_id=null,$status_id=null)
    {
        $query = $this->db->query("SELECT 
                    sd.*,
                    DATE_FORMAT(sd.service_date, '%m/%d/%Y') AS service_date,
                    DATE_FORMAT(sd.date_disconnection_date, '%m/%d/%Y') AS date_disconnection_date,
                    sd.service_no,
                    sc.account_no,
                    sc.meter_inventory_id,
                    sc.customer_id,
                    sc.address,
                    sc.receipt_name,
                    inv.serial_no,
                    customers.customer_name,
                    ct.contract_type_name,
                    cat.customer_account_type_desc,
                    rt.rate_type_name,
                    dr.reason_desc
                FROM
                    service_disconnection sd
                        LEFT JOIN
                    service_connection sc ON sc.connection_id = sd.connection_id
                        LEFT JOIN
                    customers ON customers.customer_id = sc.customer_id
                        LEFT JOIN
                    customer_account_type cat ON cat.customer_account_type_id = customers.customer_account_type_id
                        LEFT JOIN 
                    meter_inventory inv ON inv.meter_inventory_id = sc.meter_inventory_id
                        LEFT JOIN
                    contract_types ct ON ct.contract_type_id = sc.contract_type_id
                        LEFT JOIN
                    rate_types rt ON rt.rate_type_id = sc.rate_type_id
                        LEFT JOIN
                    disconnection_reason dr ON dr.disconnection_reason_id = sd.disconnection_reason_id
                WHERE
                    sd.is_deleted = FALSE
                        AND sd.is_active = TRUE
                        ".($disconnection_id==null?"":" AND sd.disconnection_id=".$disconnection_id)."
                        ".($customer_id==null?"":" AND sc.customer_id=".$customer_id)."
                        ".($status_id==null?"":" AND sc.status_id=".$status_id)."
                     ORDER BY sd.disconnection_id ASC");
        return $query->result();
    }

    function accounts($customer_id=null){
        $query = $this->db->query("SELECT 
                sc.*,
                c.customer_name,
                inv.serial_no,
                (CASE 
                    WHEN sc.status_id = 1
                        THEN sc.service_no
                    ELSE 
                        (SELECT reconnection_code FROM service_reconnection WHERE reconnection_id = sc.current_id)
                END) as service_no,
                (CASE 
                    WHEN sc.status_id = 1
                        THEN sc.connection_id
                    ELSE 
                        (SELECT reconnection_id FROM service_reconnection WHERE reconnection_id = sc.current_id)
                END) as previous_id
            FROM
                service_connection sc
                LEFT JOIN meter_inventory inv ON inv.meter_inventory_id = sc.meter_inventory_id
                LEFT JOIN customers c ON c.customer_id = sc.customer_id
            WHERE
                (sc.status_id = 1 OR sc.status_id = 3)
                AND sc.is_deleted = FALSE
                AND sc.is_active = TRUE
                ".($customer_id==null?"":" AND sc.customer_id=".$customer_id)."");
        return $query->result();
    }

    function chck_disconnection($disconnection_id){
        $query=$this->db->query("SELECT 
                    sd.*
                FROM
                    service_disconnection sd
                        LEFT JOIN
                    service_reconnection sr ON sr.disconnection_id = sd.disconnection_id
                WHERE
                    sr.is_deleted = FALSE
                        AND sd.is_deleted = FALSE
                        AND sr.disconnection_id = $disconnection_id");
                        return $query->result();
    }


    function previous_billing_info($connection_id,$previous_month){
        $query=$this->db->query("SELECT * FROM (SELECT 
                        mri.date_input,
                        mrii.meter_reading_input_id,
                        b.billing_id,
                        mrii.connection_id,
                        0 as disconnection_id,
                        DATE_FORMAT(CONCAT(mrp.meter_reading_year,'-',mrp.month_id,'-01'), '%b %Y') as current_month,
                        mri.meter_reading_period_id
                        FROM meter_reading_input_items mrii

                        LEFT JOIN meter_reading_input mri ON mri.meter_reading_input_id = mrii.meter_reading_input_id
                        LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = mri.meter_reading_period_id
                        LEFT JOIN billing b ON b.meter_reading_input_id = mrii.meter_reading_input_id AND b.connection_id= mrii.connection_id
                        WHERE mrii.connection_id = ".$connection_id." AND mri.is_active= TRUE AND mri.is_deleted= FALSE

                        UNION ALL

                        SELECT 
                        sd.service_date,
                        0 as meter_reading_input_id,
                        0 as billing_id,
                        sd.connection_id,
                        sd.disconnection_id,
                        sd.previous_month as current_month,
                        0 as meter_reading_period_id
                        FROM service_disconnection sd

                        WHERE sd.connection_id = ".$connection_id." AND sd.is_active = TRUE AND sd.is_deleted = FALSE) as main

                         WHERE main.current_month = '".$previous_month."'
                        ORDER BY main.date_input desc  LIMIT 1");
                        return $query->result();
    }

    function check_previous_billing_if_paid($billing_id,$before_date){
        $query=$this->db->query("SELECT 
            b.connection_id,
            b.due_date,
            b.control_no,
            CONCAT(m.month_name, ' ', mrp.meter_reading_year) as description,
            mrp.month_id,
            mrp.meter_reading_year,
            b.billing_id,
            0 as disconnection_id,
            b.amount_due as meter_amount_due_comparison,
            IF('$before_date' > b.due_date AND IFNULL(payment_before_due.paid_amount,0) < b.amount_due, (b.amount_due + b.penalty_amount + charges_amount),(b.amount_due + charges_amount)) receivable_amount,
            IFNULL(payment.paid_amount,0) as paid_amount,
            IF('$before_date' > b.due_date AND IFNULL(payment_before_due.paid_amount,0) < b.amount_due, ((b.amount_due + b.penalty_amount + charges_amount)  - IFNULL(payment.paid_amount,0)),((b.amount_due + charges_amount) - IFNULL(payment.paid_amount,0))) as amount_due,
            0 as payment_amount

            FROM billing b
            LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = b.meter_reading_period_id
            LEFT JOIN months m ON m.month_id = mrp.month_id

            LEFT JOIN
            (SELECT 
            bpi.billing_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount

            FROM billing_payment_items bpi
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            LEFT JOIN billing b ON b.billing_id = bpi.billing_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE 
            AND bp.date_paid <= b.due_date

            GROUP BY bpi.billing_id) as payment ON payment.billing_id = b.billing_id

            LEFT JOIN
            (SELECT 
            bpi.billing_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount
            FROM billing_payment_items bpi
            LEFT JOIN billing b ON b.billing_id = bpi.billing_id
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE AND bp.date_paid <= b.due_date
            GROUP BY bpi.billing_id) as payment_before_due ON payment_before_due.billing_id = b.billing_id             

            WHERE b.billing_id  = ".$billing_id."");
        return $query->result();
    }

    function check_previous_disconnection_if_paid($disconnection_id,$before_date){
        $query=$this->db->query("SELECT 
            sd.connection_id,
            DATE_FORMAT(sd.due_date, '%m/%d/%Y') AS due_date,
            sd.service_no as control_no,
            'Service Disconnection' as description,
            0 as billing_id,
            sd.disconnection_id,
            sd.meter_amount_due as meter_amount_due_comparison,
            IF('$before_date' > sd.due_date AND IFNULL(payment_before_due.paid_amount,0) < sd.meter_amount_due, (sd.meter_amount_due + sd.penalty_amount + sd.charges_amount),(sd.meter_amount_due + sd.charges_amount)) receivable_amount,
            IFNULL(payment.paid_amount,0) as paid_amount,
            IF('$before_date' > sd.due_date AND IFNULL(payment_before_due.paid_amount,0) < sd.meter_amount_due, ((sd.meter_amount_due + sd.penalty_amount + sd.charges_amount)  - IFNULL(payment.paid_amount,0)),((sd.meter_amount_due + sd.charges_amount) - IFNULL(payment.paid_amount,0))) as amount_due,

            0 as payment_amount
            FROM service_disconnection sd
            LEFT JOIN
            
            (SELECT 
            bpi.disconnection_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount
            FROM billing_payment_items bpi
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE AND bpi.billing_id = 0
            GROUP BY bpi.disconnection_id) as payment ON payment.disconnection_id= sd.disconnection_id
            
            LEFT JOIN
            
            (SELECT 
            bpi.disconnection_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount
            FROM billing_payment_items bpi
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            LEFT JOIN service_disconnection sd ON sd.disconnection_id = bpi.disconnection_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE AND bpi.billing_id = 0 AND bp.date_paid <= sd.due_date
            GROUP BY bpi.disconnection_id) as payment_before_due ON payment_before_due.disconnection_id= sd.disconnection_id    

            WHERE sd.is_active = TRUE AND sd.is_deleted= FALSE
            AND sd.disconnection_id = ".$disconnection_id."");
        return $query->result();
    }


    function arrears_amount_info($connection_id,$before_date){
        $query=$this->db->query("SELECT SUM(IFNULL(main.amount_due,0)) as arrears_amount FROM(SELECT 
            b.connection_id,
            b.due_date,
            b.control_no,
            CONCAT(m.month_name, ' ', mrp.meter_reading_year) as description,
            b.billing_id,
            0 as disconnection_id,
            IF('$before_date' > b.due_date AND IFNULL(payment_before_due.paid_amount,0) < b.amount_due, (b.amount_due + b.penalty_amount + charges_amount),(b.amount_due + charges_amount)) receivable_amount,
            IFNULL(payment.paid_amount,0) as paid_amount,
            IF('$before_date' > b.due_date AND IFNULL(payment_before_due.paid_amount,0) < b.amount_due, ((b.amount_due + b.penalty_amount + charges_amount)  - IFNULL(payment.paid_amount,0)),((b.amount_due + charges_amount) - IFNULL(payment.paid_amount,0))) as amount_due,
            0 as payment_amount

            FROM billing b
            LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = b.meter_reading_period_id
            LEFT JOIN months m ON m.month_id = mrp.month_id

            LEFT JOIN
            (SELECT 
            bpi.billing_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount

            FROM billing_payment_items bpi
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE
            

            GROUP BY bpi.billing_id) as payment ON payment.billing_id = b.billing_id

            LEFT JOIN
            (SELECT 
            bpi.billing_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount
            FROM billing_payment_items bpi
            LEFT JOIN billing b ON b.billing_id = bpi.billing_id
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE AND bp.date_paid <= b.due_date
            GROUP BY bpi.billing_id) as payment_before_due ON payment_before_due.billing_id = b.billing_id

             ".($connection_id==0?"":" WHERE b.connection_id=".$connection_id)."


             UNION ALL

            SELECT 
            sd.connection_id,
            DATE_FORMAT(sd.due_date, '%m/%d/%Y') AS due_date,
            sd.service_no as control_no,
            'Service Disconnection' as description,
            0 as billing_id,
            sd.disconnection_id,
            IF('$before_date' > sd.due_date AND IFNULL(payment_before_due.paid_amount,0) < sd.meter_amount_due, (sd.meter_amount_due + sd.penalty_amount + sd.charges_amount),(sd.meter_amount_due + sd.charges_amount)) receivable_amount,
            IFNULL(payment.paid_amount,0) as paid_amount,
            IF('$before_date' > sd.due_date AND IFNULL(payment_before_due.paid_amount,0) < sd.meter_amount_due, ((sd.meter_amount_due + sd.penalty_amount + sd.charges_amount)  - IFNULL(payment.paid_amount,0)),((sd.meter_amount_due + sd.charges_amount) - IFNULL(payment.paid_amount,0))) as amount_due,

            0 as payment_amount
            FROM service_disconnection sd
            LEFT JOIN
            
            (SELECT 
            bpi.disconnection_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount
            FROM billing_payment_items bpi
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE AND bpi.billing_id = 0
            GROUP BY bpi.disconnection_id) as payment ON payment.disconnection_id= sd.disconnection_id
            
            LEFT JOIN
            
            (SELECT 
            bpi.disconnection_id,
            (SUM(bpi.payment_amount) + SUM(bpi.deposit_payment)) as paid_amount
            FROM billing_payment_items bpi
            LEFT JOIN billing_payments bp on bp.billing_payment_id = bpi.billing_payment_id
            LEFT JOIN service_disconnection sd ON sd.disconnection_id = bpi.disconnection_id
            WHERE bp.is_active = TRUE AND bp.is_deleted = FALSE AND bpi.billing_id = 0 AND bp.date_paid <= sd.due_date
            GROUP BY bpi.disconnection_id) as payment_before_due ON payment_before_due.disconnection_id= sd.disconnection_id    

            WHERE sd.is_active = TRUE AND sd.is_deleted= FALSE
            ".($connection_id==0?"":" AND sd.connection_id=".$connection_id)." 



              ) as main
            "); 
        return $query->result();
    }


    function  get_disconnection_rate($id,$consumption){
                    $query = $this->db->query("SELECT 
                        z.*,
                        ((10 / 100) * z.amount_due) as penalty_amount
                    FROM
                        (SELECT 
                            x.*,
                                (CASE
                                    WHEN x.contract_type_id = 1 
                                    THEN
                                        (SELECT
                                            SUM((CASE 
                                            WHEN is_fixed_amount = TRUE 
                                                THEN matrix_residential_amount
                                            WHEN ($consumption+1) > matrix_residential_to 
                                                THEN (
                                                IF( matrix_residential_from = 0,
                                                (matrix_residential_to - matrix_residential_from),
                                                ((matrix_residential_to+1) - matrix_residential_from))
                                                    *matrix_residential_amount) 
                                            WHEN ($consumption+1) <= matrix_residential_to
                                            THEN ((($consumption+1) - matrix_residential_from)*matrix_residential_amount)
                                            END))
                                         FROM matrix_residential_items WHERE matrix_residential_from <= ($consumption+1))
                                    ELSE
                                        (SELECT
                                            SUM((CASE 
                                            WHEN is_fixed_amount = TRUE 
                                                THEN matrix_commercial_amount
                                            WHEN ($consumption+1) > matrix_commercial_to 
                                                THEN (
                                                IF( matrix_commercial_from = 0,
                                                (matrix_commercial_to - matrix_commercial_from),
                                                ((matrix_commercial_to+1) - matrix_commercial_from))
                                                    *matrix_commercial_amount) 
                                            WHEN ($consumption+1) <= matrix_commercial_to
                                            THEN ((($consumption+1) - matrix_commercial_from)*matrix_commercial_amount)
                                            END))
                                         FROM matrix_commercial_items WHERE matrix_commercial_from <= ($consumption+1))
                                END) as amount_due,
                                -- (CASE
                                --     WHEN
                                --         x.contract_type_id = 1
                                --     THEN COALESCE((SELECT mtrx_ri.matrix_residential_amount FROM matrix_residential mtrx_r
                             --            LEFT JOIN matrix_residential_items mtrx_ri ON mtrx_ri.matrix_residential_id = mtrx_r.matrix_residential_id
                             --            WHERE mtrx_r.matrix_residential_id = default_matrix_id
                             --                AND $consumption BETWEEN matrix_residential_from AND matrix_residential_to), 0)
                                --     ELSE COALESCE((SELECT mtrx_ci.matrix_commercial_amount FROM matrix_commercial mtrx_c
                                --         LEFT JOIN matrix_commercial_items mtrx_ci ON mtrx_ci.matrix_commercial_id = mtrx_c.matrix_commercial_id
                                --         WHERE mtrx_c.matrix_commercial_id = default_matrix_id
                                --             AND $consumption BETWEEN matrix_commercial_from AND matrix_commercial_to), 0)
                                -- END) AS rate,
                                (CASE
                                    WHEN
                                        x.contract_type_id = 1
                                    THEN COALESCE((SELECT mtrx_ri.is_fixed_amount FROM matrix_residential mtrx_r
                                        LEFT JOIN matrix_residential_items mtrx_ri ON mtrx_ri.matrix_residential_id = mtrx_r.matrix_residential_id
                                        WHERE mtrx_r.matrix_residential_id = default_matrix_id
                                            AND $consumption BETWEEN matrix_residential_from AND matrix_residential_to), 0)
                                    ELSE COALESCE((SELECT mtrx_ci.is_fixed_amount FROM matrix_commercial mtrx_c
                                        LEFT JOIN matrix_commercial_items mtrx_ci ON mtrx_ci.matrix_commercial_id = mtrx_c.matrix_commercial_id
                                        WHERE mtrx_c.matrix_commercial_id = default_matrix_id
                                            AND $consumption BETWEEN matrix_commercial_from AND matrix_commercial_to), 0)
                                END) AS is_fixed_amount     
                        FROM
                            (SELECT 
                            sc.connection_id,
                                sc.contract_type_id, 
                                (CASE 
                                    WHEN sc.contract_type_id = 1
                                    THEN (SELECT default_matrix_residential_id FROM account_integration)
                                    ELSE (SELECT default_matrix_commercial_id FROM account_integration)
                                END) AS default_matrix_id
                        FROM
                             service_connection sc 
                        WHERE
                            sc.is_deleted = FALSE
                            AND sc.connection_id = ".$id.") AS x) AS z");

    return $query->result();
    }
}
?>