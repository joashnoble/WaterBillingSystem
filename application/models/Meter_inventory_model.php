<?php

class Meter_inventory_model extends CORE_Model{

    protected  $table="meter_inventory"; //table name
    protected  $pk_id="meter_inventory_id"; //primary key id


    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }

    function getList($meter_inventory_id=null,$meter_status_id=null,$customer_id=null,$is_new=null)
    {
    	$query = $this->db->query("SELECT 
				    inv.*,
				    stat.status_name,
					COALESCE(sc.customer_id,0) as customer_id,
				    COALESCE(c.customer_name,'N/A') as customer_name
				FROM
				    meter_inventory inv
						LEFT JOIN
					service_connection sc ON sc.connection_id = inv.meter_inventory_id
				        LEFT JOIN
				    customers c ON c.customer_id = sc.customer_id
				        LEFT JOIN
				    meter_status stat ON stat.meter_status_id = inv.meter_status_id
				WHERE
				    inv.is_deleted = FALSE
				        AND inv.is_active = TRUE
				        ".($meter_status_id==null?"":" AND inv.meter_status_id=".$meter_status_id)."
				        ".($is_new==null?"":" AND inv.is_new=".$is_new)."
				        ".($meter_inventory_id==null?"":" AND inv.meter_inventory_id=".$meter_inventory_id)."
				        ".($customer_id==null?"":" AND sc.customer_id=".$customer_id)."
				     ORDER BY inv.meter_code ASC");
        return $query->result();
    }

    function chckMeter($serial_no,$meter_inventory_id=null){
    	$query = $this->db->query("SELECT * FROM meter_inventory WHERE serial_no ='".$serial_no."'
    			".($meter_inventory_id==null?"":" AND meter_inventory_id!=".$meter_inventory_id)."");
    	return $query->result();
    }

}

?>