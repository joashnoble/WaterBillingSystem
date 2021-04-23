<?php

class Meter_reading_input_model extends CORE_Model {
    protected  $table="meter_reading_input";
    protected  $pk_id="meter_reading_input_id";

    function __construct() {
        parent::__construct();
    }

    function get_batches($period_id=null){
    	$query = $this->db->query("SELECT 
				    mri.*
				FROM
				    meter_reading_input mri
				    WHERE mri.is_deleted = FALSE AND
				    mri.is_active = TRUE
			        ".($period_id==null?" AND mri.meter_reading_period_id=0":" AND mri.meter_reading_period_id=".$period_id)."");
    	return $query->result();
    }

	function meter_reading($period_id=null,$meter_reading_input_id=0,$paytype=null,$processtype=null){
        $query = $this->db->query("
        		SELECT main.* FROM
        		(SELECT 
        			mrii.meter_reading_input_item_id,
        			mri.meter_reading_input_id,
				    mri.batch_no,
				    sc.account_no,
				    sc.receipt_name,
				    mi.serial_no,
				    mrii.previous_month,
				    mrii.previous_reading,
				    mrii.current_reading,
				    mrii.total_consumption,
				    mrp.meter_reading_period_id,
				    mri.is_deleted,
				    DATE_FORMAT(mri.date_input, '%m/%d/%Y') AS date_input,
				    m.month_name,
				    CONCAT_WS(' ', user.user_fname, user.user_lname) AS posted_by,
				    mrii.is_processed,
					(SELECT 
					    count(*)
					FROM
						billing_payment_items bpi
					    LEFT JOIN billing_payments bp ON bp.billing_payment_id = bpi.billing_payment_id
					    LEFT JOIN billing b ON b.billing_id = bpi.billing_id
					    WHERE b.connection_id = mrii.connection_id AND
					    b.meter_reading_input_id = mri.meter_reading_input_id
					    AND bp.is_active = TRUE
					    AND bp.is_deleted = FALSE) as payment_count				    
				FROM
				    meter_reading_input_items mrii
				        LEFT JOIN
				    meter_reading_input mri ON mri.meter_reading_input_id = mrii.meter_reading_input_id
				        LEFT JOIN
				    meter_reading_period mrp ON mrp.meter_reading_period_id = mri.meter_reading_period_id
				        LEFT JOIN
				    service_connection sc ON sc.connection_id = mrii.connection_id
				        LEFT JOIN
				    meter_inventory mi ON mi.meter_inventory_id = sc.meter_inventory_id
				        LEFT JOIN
				    months m ON m.month_id = mrp.month_id
				        LEFT JOIN
				    user_accounts user ON user.user_id = mri.posted_by_user

					WHERE
					    mri.is_deleted = FALSE
					    ".($period_id==null?" AND mrp.meter_reading_period_id=0":" AND mrp.meter_reading_period_id=".$period_id)."
			        	".($meter_reading_input_id==0?"":" AND mri.meter_reading_input_id=".$meter_reading_input_id)."
			        	".($processtype==null?"":" AND mrii.is_processed = ".$processtype)."
			        ) as main
			        
			        ".($paytype==null?"":" WHERE main.payment_count ".$paytype)."
			        ");
					return $query->result();
    }    


	// function meter_reading($period_id=null,$meter_reading_input_id=0){
 //        $query = $this->db->query("SELECT 
	// 		    mri.*,
	// 		    mrp.*,
	// 		    DATE_FORMAT(mri.date_input, '%m/%d/%Y') AS date_input,
	// 		    m.month_name,
	// 		    CONCAT_WS(' ', user.user_fname, user.user_lname) AS posted_by,
	// 			(SELECT 
	// 					count(*)
	// 			FROM
	// 			    billing_payment_items bpi
	// 			        LEFT JOIN
	// 			    billing_payments bp ON bp.billing_payment_id = bpi.billing_payment_id
	// 			        LEFT JOIN
	// 			    billing ON billing.billing_id = bpi.billing_id
	// 			        LEFT JOIN
	// 			    meter_reading_input ON meter_reading_input.meter_reading_input_id = billing.meter_reading_input_id
	// 			        LEFT JOIN
	// 			    meter_reading_input_items mrii ON mrii.meter_reading_input_id = meter_reading_input.meter_reading_input_id
	// 			WHERE
	// 			    meter_reading_input.meter_reading_input_id = mri.meter_reading_input_id
	// 			        AND bp.is_active = 1
	// 			        AND bp.is_deleted = 0) as payment_count
	// 		FROM
	// 		    meter_reading_input mri
	// 		        LEFT JOIN
	// 		    meter_reading_period mrp ON mrp.meter_reading_period_id = mri.meter_reading_period_id
	// 		        LEFT JOIN
	// 		    months m ON m.month_id = mrp.month_id
	// 		        LEFT JOIN
	// 		    user_accounts user ON user.user_id = mri.posted_by_user
	// 		WHERE
	// 		    mri.is_deleted = FALSE
	// 		        ".($period_id==null?" AND mri.meter_reading_period_id=0":" AND mri.meter_reading_period_id=".$period_id)."
	// 		        ".($meter_reading_input_id==0?"":" AND mri.meter_reading_input_id=".$meter_reading_input_id)."");
	// 				return $query->result();
 //    }     

	function get_journal_entries($meter_reading_input_id){
        $query = $this->db->query("SELECT main.* FROM (SELECT 
			(SELECT receivable_account_id FROM account_integration) as account_id,
			'' as memo,
			SUM(IFNULL(amount_due+charges_amount,0)) as dr_amount,
			0 as cr_amount
			 FROM  billing WHERE meter_reading_input_id = $meter_reading_input_id
			 
			UNION ALL 

			SELECT 
			(SELECT billing_meter_account_id FROM account_integration) as account_id,
			'' as memo,
			0 as dr_amount,
			SUM(IFNULL(amount_due,0)) as cr_amount FROM billing WHERE meter_reading_input_id = $meter_reading_input_id

			UNION ALL
			SELECT charges.* FROM
			(SELECT 
			c.income_account_id as account_id,
			'' as memo,
			0 as dr_amount,
			SUM(IFNULL(charge_line_total,0)) as cr_amount
			FROM  billing_charges bc
			LEFT JOIN charges c on c.charge_id = bc.charge_id 
			WHERE meter_reading_input_id = '$meter_reading_input_id'

			GROUP BY c.income_account_id) as charges

			) as main WHERE main.dr_amount > 0 or main.cr_amount > 0
			");
					return $query->result();
    }    
}
?>