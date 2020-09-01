<?php

class Service_connection_model extends CORE_Model{

    protected  $table="service_connection"; //table name
    protected  $pk_id="connection_id"; //primary key id

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }

    function getList($connection_id=null,$status_id=null,$current_id=null,$month_id=null,$year=null){
	$query = $this->db->query("SELECT 
		    sc.*,
		    inv.serial_no,
		    c.customer_name,
            CONCAT(sc.account_no,' - ',sc.receipt_name) as customer_account,
		    ct.contract_type_name,
            cat.customer_account_type_desc,
		    rt.rate_type_name,
            CONCAT_WS(' ',a.first_name,a.middle_name,a.last_name) as attendant,
		    DATE_FORMAT(sc.service_date, '%m/%d/%Y') AS service_date,
		    DATE_FORMAT(sc.target_date, '%m/%d/%Y') AS target_date,
            CONCAT(DATE_FORMAT(sc.target_date, '%m/%d/%Y'),' ',sc.target_time) as installation_date,
            if(sc.status_id = 2, 'Inactive', 'Active') as current_account_status
		FROM
		    service_connection sc
		        LEFT JOIN
		    meter_inventory inv ON inv.meter_inventory_id = sc.meter_inventory_id
		        LEFT JOIN
		    customers c ON c.customer_id = sc.customer_id
                LEFT JOIN
            customer_account_type cat ON cat.customer_account_type_id = c.customer_account_type_id
		        LEFT JOIN
		    contract_types ct ON ct.contract_type_id = sc.contract_type_id
		        LEFT JOIN
		    rate_types rt ON rt.rate_type_id = sc.rate_type_id
                LEFT JOIN 
            attendant a ON a.attendant_id = sc.attendant_id
		WHERE
		    sc.is_deleted = FALSE
		        AND sc.is_active = TRUE
		        ".($connection_id==null?"":" AND sc.connection_id=".$connection_id)."
                ".($status_id==null?"":" AND sc.status_id=".$status_id)."
                ".($current_id==null?"":" AND sc.current_id=".$current_id)."
                ".($month_id==null?"":" AND month(sc.target_date)=".$month_id)."
                ".($year==null?"":" AND year(sc.target_date)=".$year)."");
    	return $query->result();
    }

    function chck_meter($meter_inventory_id=null,$connection_id=null)
    {
    	$query = $this->db->query("SELECT sc.connection_id,sc.meter_inventory_id,inv.serial_no 
    					FROM service_connection sc
    					LEFT JOIN meter_inventory inv ON inv.meter_inventory_id = sc.meter_inventory_id
    				WHERE 
    					sc.is_deleted = FALSE
    					".($meter_inventory_id==null?"":" AND sc.meter_inventory_id=".$meter_inventory_id)."
    					".($connection_id==null?"":" AND sc.connection_id=".$connection_id)."");
        return $query->result();
    }

    function chck_meter_reading($connection_id=null){
    	$query = $this->db->query("SELECT 
				    mri.*, sc.service_no
				FROM
				    meter_reading_input mri
				    LEFT JOIN meter_reading_input_items mrii ON mrii.meter_reading_input_id = mri.meter_reading_input_id
				    LEFT JOIN service_connection sc ON sc.connection_id = mrii.connection_id
				    WHERE mri.is_deleted = FALSE
				    AND mrii.connection_id = $connection_id");
    			return $query->result();
    }

    function chck_connection($connection_id=null){
    	$query = $this->db->query("SELECT sd.*, sc.service_no
                    FROM service_disconnection sd
                        LEFT JOIN service_connection sc ON sc.connection_id = sd.connection_id 
                        WHERE sd.is_deleted = FALSE 
                        AND sd.connection_id = $connection_id");
    	return $query->result();
    }    

}

?>