<?php

class Billing_payment_items_model extends CORE_Model{

    protected  $table="billing_payment_items"; //table name
    protected  $pk_id="billing_payment_item_id"; //table name
    protected  $fk_id="billing_payment_id"; //primary key id


    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }


    function get_receipt_info($billing_payment_id){
        $query=$this->db->query("SELECT *, months.month_name FROM (SELECT b.control_no,
            b.amount_due,
            b.charges_amount,
            b.penalty_amount,            
            b.due_date,
            mrp.month_id,
            mrp.meter_reading_year,
            bpi.receivable_amount,
            bpi.deposit_payment,
            bpi.payment_amount,
            'Billing' as transaction_type
                                
            FROM  billing_payment_items bpi 

            LEFT JOIN billing b ON b.billing_id = bpi.billing_id
            LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = b.meter_reading_period_id

            WHERE bpi.billing_payment_id = '$billing_payment_id' AND bpi.billing_id != 0

            UNION ALL 

            SELECT sd.disconnection_code as control_no,
            sd.meter_amount_due as amount_due,
            sd.charges_amount,
            sd.penalty_amount,            
            sd.due_date,
            MONTH(sd.service_date) as month_id,
            YEAR(sd.service_date) as meter_reading_year,
            bpi.receivable_amount,
            bpi.deposit_payment,
            bpi.payment_amount,
            'Disconnection' as transaction_type
                                
            FROM  billing_payment_items bpi 
            LEFT JOIN service_disconnection sd ON sd.disconnection_id  = bpi.disconnection_id
            WHERE bpi.billing_payment_id = '$billing_payment_id' AND bpi.disconnection_id != 0)

            as main

            LEFT JOIN months ON  months.month_id = main.month_id");
                        return $query->result();
    }

    function get_receipt_info_v2($billing_payment_id){
        $query=$this->db->query("
        SELECT o.* , months.month_name FROM 

           ( SELECT 
        m.control_no,
        m.billing_id,
        m.due_date,
        m.amount_paid,
        m.penalty_paid,
        m.acquired_payment,
        m.total_payment,
        m.month_id,
        m.meter_reading_year,
        m.transaction_type
        FROM (

        SELECT main.control_no,
        main.billing_id,
        main.due_date,
        main.acquired_payment,
        @pd := main.total_payment as pd_run,
        CONVERT( IF(@pd < (main.total_amount_due - main.amount_already_paid ) , @pd, (main.total_amount_due - main.amount_already_paid ) )  , DECIMAL (20 , 2 ))as  amount_paid,
        CONVERT( IF(@pd < (main.total_amount_due - main.amount_already_paid ) , @pd := @pd-@pd, @pd := (@pd - (main.total_amount_due - main.amount_already_paid ) ) ), DECIMAL (20 , 2 )) as rem_after_amount_paid,
        CONVERT( IF(@pd < (main.penalty_amount - main.penalty_already_paid) , @pd, (main.penalty_amount - main.penalty_already_paid) )  , DECIMAL (20 , 2 ))as  penalty_paid,
        CONVERT( IF(@pd < (main.penalty_amount - main.penalty_already_paid) , @pd := @pd-@pd, @pd := (@pd - (main.penalty_amount - main.penalty_already_paid) ) ), DECIMAL (20 , 2 )) as rem_after_penalty_amount,
        (main.total_amount_due - main.amount_already_paid ) amount_due,
        (main.penalty_amount - main.penalty_already_paid) penalty_amount,
        main.total_payment,
        main.month_id,
        main.meter_reading_year,
        main.transaction_type

         FROM 
                    (SELECT b.control_no,
                    b.billing_id,
                    b.due_date,
                    @acc := IFNULL(acquired.acquired_payment,0) run_acc,
                    CONVERT( IF(@acc < (b.amount_due + b.charges_amount) , @acc, (b.amount_due + b.charges_amount) )  , DECIMAL (20 , 2 ))as  amount_already_paid,
                    CONVERT( IF(@acc < (b.amount_due + b.charges_amount) , @acc := @acc-@acc, @acc := (@acc - (b.amount_due + b.charges_amount) ) ), DECIMAL (20 , 2 )) as rem_after_amount_due,
                    CONVERT( IF(@acc < b.penalty_amount , @acc, b.penalty_amount )  , DECIMAL (20 , 2 ))as  penalty_already_paid,
                    CONVERT( IF(@acc < b.penalty_amount , @acc := @acc-@acc, @acc := (@acc - b.penalty_amount ) ), DECIMAL (20 , 2 )) as rem_after_penalty_amount,
                    (b.amount_due + b.charges_amount) as total_amount_due,
                    b.penalty_amount,
                    IFNULL(acquired.acquired_payment,0) as acquired_payment,
                    (bpi.deposit_payment + bpi.payment_amount) as total_payment,            
                    mrp.month_id,
                    mrp.meter_reading_year,

                    'Billing' as transaction_type
                                        
                    FROM  billing_payment_items bpi 

                    LEFT JOIN billing b ON b.billing_id = bpi.billing_id
                    LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = b.meter_reading_period_id
                    LEFT JOIN (SELECT bpi.billing_id, IFNULL((SUM(deposit_payment) + SUM(payment_amount)),0) as acquired_payment FROM billing_payment_items  bpi

                            LEFT JOIN billing_payments bp ON bp.billing_payment_id = bpi.billing_payment_id

                            WHERE bp.billing_payment_id < $billing_payment_id AND bp.date_paid <= bp.date_paid AND bpi.billing_id !=0 and bp.is_active = TRUE and bp.is_deleted = FALSE
                            AND bpi.billing_id IN (SELECT * FROM (SELECT billing_id FROM billing_payment_items WHERE billing_payment_id = $billing_payment_id AND billing_id != 0 ) as subquery)

                            GROUP BY bpi.billing_id) as acquired ON acquired.billing_id = bpi.billing_id


                    WHERE bpi.billing_payment_id = $billing_payment_id AND bpi.billing_id != 0) as main ) as m
            
                    UNION ALL

                    SELECT 
                    m.control_no,
                    m.disconnection_id,
                    m.due_date,
                    m.amount_paid,
                    m.penalty_paid,
                    m.acquired_payment,
                    m.total_payment,
                    m.month_id,
                    m.meter_reading_year,
                    m.transaction_type
                    FROM (

                    SELECT main.control_no,
                    main.disconnection_id,
                    main.due_date,
                    main.acquired_payment,
                    @pdsd := main.total_payment as pd_run,
                    CONVERT( IF(@pdsd < (main.total_amount_due - main.amount_already_paid ) , @pdsd, (main.total_amount_due - main.amount_already_paid ) )  , DECIMAL (20 , 2 ))as  amount_paid,
                    CONVERT( IF(@pdsd < (main.total_amount_due - main.amount_already_paid ) , @pdsd := @pdsd-@pdsd, @pdsd := (@pdsd - (main.total_amount_due - main.amount_already_paid ) ) ), DECIMAL (20 , 2 )) as rem_after_amount_paid,
                    CONVERT( IF(@pdsd < (main.penalty_amount - main.penalty_already_paid) , @pdsd, (main.penalty_amount - main.penalty_already_paid) )  , DECIMAL (20 , 2 ))as  penalty_paid,
                    CONVERT( IF(@pdsd < (main.penalty_amount - main.penalty_already_paid) , @pdsd := @pdsd-@pdsd, @pdsd := (@pdsd - (main.penalty_amount - main.penalty_already_paid) ) ), DECIMAL (20 , 2 )) as rem_after_penalty_amount,
                    (main.total_amount_due - main.amount_already_paid ) amount_due,
                    (main.penalty_amount - main.penalty_already_paid) penalty_amount,
                    main.total_payment,
                    main.month_id,
                    main.meter_reading_year,
                    main.transaction_type

                    FROM 
                    (SELECT 
                    sd.disconnection_code as control_no,
                    sd.disconnection_id,
                    sd.due_date,
                    @dcc := IFNULL(acquired.acquired_payment,0) run_acc,
                    CONVERT( IF(@dcc < (sd.meter_amount_due + sd.charges_amount) , @dcc, (sd.meter_amount_due + sd.charges_amount) )  , DECIMAL (20 , 2 ))as  amount_already_paid,
                    CONVERT( IF(@dcc < (sd.meter_amount_due + sd.charges_amount) , @dcc := @dcc-@dcc, @dcc := (@dcc - (sd.meter_amount_due + sd.charges_amount) ) ), DECIMAL (20 , 2 )) as rem_after_amount_due,
                    CONVERT( IF(@dcc < sd.penalty_amount , @dcc, sd.penalty_amount)  , DECIMAL (20 , 2 ))as  penalty_already_paid,
                    CONVERT( IF(@dcc < sd.penalty_amount , @dcc := @dcc-@dcc, @dcc := (@dcc - sd.penalty_amount ) ), DECIMAL (20 , 2 )) as rem_after_penalty_amount,

                    (sd.meter_amount_due + sd.charges_amount) as total_amount_due,
                    sd.penalty_amount,   
                    IFNULL(acquired.acquired_payment,0) as acquired_payment, 
                    (bpi.deposit_payment + bpi.payment_amount) as total_payment,  
                    MONTH(sd.service_date) as month_id,
                    YEAR(sd.service_date) as meter_reading_year,
                    'Disconnection' as transaction_type
                                        
                    FROM  billing_payment_items bpi 
                    LEFT JOIN service_disconnection sd ON sd.disconnection_id  = bpi.disconnection_id

                        LEFT JOIN (
                        SELECT bpi.disconnection_id, IFNULL((SUM(deposit_payment) + SUM(payment_amount)),0) as acquired_payment FROM billing_payment_items  bpi
                            LEFT JOIN billing_payments bp ON bp.billing_payment_id = bpi.billing_payment_id
                            WHERE bp.billing_payment_id < $billing_payment_id  AND bp.date_paid <= bp.date_paid  AND bpi.disconnection_id !=0 and bp.is_active = TRUE and bp.is_deleted = FALSE
                            AND bpi.disconnection_id IN (SELECT * FROM (SELECT disconnection_id FROM billing_payment_items WHERE billing_payment_id =  $billing_payment_id AND disconnection_id != 0) as subquery)

                            GROUP BY bpi.disconnection_id
                        )  as acquired ON acquired.disconnection_id = bpi.disconnection_id

                    WHERE bpi.billing_payment_id = $billing_payment_id AND bpi.disconnection_id != 0) as main) as m


            ) as  o 

            LEFT JOIN months ON  months.month_id = o.month_id
            ");
                        return $query->result();
    }    

 }

 ?>