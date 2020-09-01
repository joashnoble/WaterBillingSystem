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

 }

 ?>