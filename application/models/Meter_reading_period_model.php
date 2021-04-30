<?php

class Meter_reading_period_model extends CORE_Model {
    protected  $table="meter_reading_period";
    protected  $pk_id="meter_reading_period_id";

    function __construct() {
        parent::__construct();
    }

    function get_meter_reading_for_inputs($before_date=null,$connection_id=null){
        $sql='SELECT
			main.connection_id,
			sc.account_no,
			sc.receipt_name,
			c.customer_name,
			mi.serial_no,
			TRIM(LEADING "0" FROM mi.serial_no) as serial_no_2,
			main.current_reading as previous_reading,
			main.applicable_month,
			DATE_FORMAT(main.applicable_month,"%b %Y") as previous_month

			 FROM (SELECT n.*

			FROM
			(SELECT 
			connection_id,
			applicable_month,
			MAX(current_reading) as current_reading
			 FROM 

			(SELECT 
			mrii.connection_id,
			DATE(CONCAT(mrp.meter_reading_year,  "-", mrp.month_id, "-01")) as applicable_month,
			mrii.current_reading

			FROM meter_reading_input_items mrii 

			LEFT JOIN meter_reading_input mri ON mri.meter_reading_input_id=mrii.meter_reading_input_id
			LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = mri.meter_reading_period_id
			WHERE mri.is_deleted = FALSE 
			AND mri.is_active = TRUE

			UNION ALL
			
			SELECT 
			sd.connection_id,
			-- DATE(sd.date_disconnection_date) as applicable_month,

			DATE_SUB(DATE(CONCAT(YEAR(sd.date_disconnection_date),  "-", MONTH(sd.date_disconnection_date), "-01")), INTERVAL 1 MONTH) as applicable_month,

			sd.last_meter_reading as current_reading FROM 

			service_disconnection sd 

			WHERE  sd.is_active = TRUE 
			AND sd.is_deleted = FALSE

			UNION ALL
			SELECT 
			scr.connection_id,
			DATE_SUB(DATE(CONCAT(YEAR(scr.service_date),  "-", MONTH(scr.service_date), "-01")), INTERVAL 1 MONTH) as applicable_month,
			scr.initial_meter_reading as current_reading
			FROM service_connection scr
			 
			WHERE scr.is_active= TRUE AND scr.is_deleted = FALSE )
			 as main
			 
			 '.($before_date==null?'':'WHERE applicable_month < DATE("'.$before_date.'")').'
			
            GROUP BY applicable_month, connection_id
			ORDER BY connection_id ASC,applicable_month ASC)  as n

			LEFT OUTER JOIN 

			(SELECT 
			connection_id,
			applicable_month,
			MAX(current_reading) as current_reading
			 FROM 

			(SELECT 
			mrii.connection_id,
			DATE(CONCAT(mrp.meter_reading_year,  "-", mrp.month_id, "-01")) as applicable_month,
			mrii.current_reading

			FROM meter_reading_input_items mrii 

			LEFT JOIN meter_reading_input mri ON mri.meter_reading_input_id=mrii.meter_reading_input_id
			LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = mri.meter_reading_period_id
			WHERE mri.is_deleted = FALSE 
			AND mri.is_active = TRUE

			UNION ALL

			SELECT 
			sd.connection_id,
			-- DATE(sd.date_disconnection_date) as applicable_month,
			DATE_SUB(DATE(CONCAT(YEAR(sd.date_disconnection_date),  "-", MONTH(sd.date_disconnection_date), "-01")), INTERVAL 1 MONTH) as applicable_month,
			sd.last_meter_reading as current_reading FROM 

			service_disconnection sd 

			WHERE  sd.is_active = TRUE 
			AND sd.is_deleted = FALSE

			UNION ALL

			SELECT 
			scr.connection_id,
			DATE_SUB(DATE(CONCAT(YEAR(scr.service_date),  "-", MONTH(scr.service_date), "-01")), INTERVAL 1 MONTH) as applicable_month,
			scr.initial_meter_reading as current_reading
			FROM service_connection scr
			 
			WHERE scr.is_active= TRUE AND scr.is_deleted = FALSE )
			 as main
			 
			'.($before_date==null?'':'WHERE applicable_month < DATE("'.$before_date.'")').'

            GROUP BY applicable_month, connection_id
			ORDER BY connection_id ASC,applicable_month ASC) as o

			on (n.connection_id = o.connection_id and n.applicable_month < o.applicable_month)

			where o.connection_id is null
			order by o.connection_id) as main

			LEFT JOIN service_connection sc ON sc.connection_id = main.connection_id 
			LEFT JOIN customers c ON c.customer_id = sc.customer_id
			LEFT JOIN meter_inventory mi ON mi.meter_inventory_id = sc.meter_inventory_id


			'.($connection_id==null?'WHERE sc.status_id != 2 ':' WHERE main.connection_id='.$connection_id.' AND sc.status_id != 2').'
			';
        return $this->db->query($sql)->result();
    }

    function validate_count_period($meter_reading_year,$month_id,$meter_reading_period_id){
        $sql="SELECT 
			meter_reading_period_id
			FROM 
			meter_reading_period

			WHERE
			is_active = TRUE AND 
			is_deleted = FALSE  AND 
			month_id = $month_id AND 
			meter_reading_year = $meter_reading_year

            ".($meter_reading_period_id==0? " ":
                " AND meter_reading_period_id != $meter_reading_period_id"
            )."
            ";
        return $this->db->query($sql)->result();
    }


    function get_history($connection_id=null,$year = null){
    	$query = $this->db->query('
            '.($year==null?'':'SELECT o.* FROM ( SELECT n.*,months.month_name, months.month_id as month_asc FROM(').'
    		SELECT 
			m.connection_id,
			m.applicable_date,
			DATE_FORMAT(m.applicable_date, "%m") as month_id,
			DATE_FORMAT(m.applicable_date, "%Y") as meter_reading_year,
			m.reading,
			SUM(m.consumption) as  total_consumption,
			SUM(m.amount) as total_amount
			
			FROM (

			SELECT 
			sdr.connection_id,
			DATE(CONCAT(YEAR(sdr.date_disconnection_date),  "-", MONTH(sdr.date_disconnection_date), "-01")) as applicable_date,
			sdr.last_meter_reading as reading,
			sdr.total_consumption as consumption,
			sdr.meter_amount_due as amount
			FROM service_disconnection sdr
			 
			WHERE sdr.is_active= TRUE AND sdr.is_deleted = FALSE 
			AND sdr.connection_id = '.$connection_id.'
		    
		    UNION ALL
		    
			SELECT 
			scr.connection_id,
			DATE(CONCAT(YEAR(scr.service_date),  "-", MONTH(scr.service_date), "-01")) as applicable_date,
			scr.initial_meter_reading as reading,
			0 as consumption,
			0 as amount
			FROM service_connection scr
			 
			WHERE scr.is_active= TRUE AND scr.is_deleted = FALSE 
			AND scr.connection_id = '.$connection_id.'

			UNION ALL
		    
			SELECT 
			b.connection_id,
			DATE(CONCAT(mrp.meter_reading_year,  "-", mrp.month_id, "-01")) as applicable_date,
			current_reading as reading,
			total_consumption as consumption,
			amount_due as amount

			FROM billing b
			LEFT JOIN meter_reading_period mrp ON mrp.meter_reading_period_id = b.meter_reading_period_id

			WHERE b.connection_id ='.$connection_id.' 
		    ORDER BY reading DESC
		    ) as m
		    '.($year==null?'':' WHERE YEAR(applicable_date) = "'.$year.'"').'
		    GROUP BY applicable_date

		    '.($year==null?'':' )as n
            RIGHT JOIN months on months.month_id = n.month_id) as o
            ORDER BY o.month_asc').'
			');
			return $query->result();


    }

}
?>