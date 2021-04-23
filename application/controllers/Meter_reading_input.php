<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Meter_reading_input extends CORE_Controller
{

    function __construct() {
        parent::__construct('');
        $this->validate_session();

        $this->load->model('Other_charge_model');
        $this->load->model('Charges_model');
        $this->load->model('Users_model');
        $this->load->model('Trans_model');
        $this->load->model('Other_charge_item_model');
        $this->load->model('Meter_reading_period_model');
        $this->load->model('Meter_reading_input_model');
        $this->load->model('Meter_reading_input_items_model');
        $this->load->model('Customers_model');
        $this->load->model('Account_title_model');
        $this->load->model('Departments_model');
        $this->load->model('Account_integration_model');
        $this->load->model('Billing_model');
        $this->load->model('Billing_payments_model');


    }

    public function index() {
        $this->Users_model->validate();
        //default resources of the active view
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', TRUE);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
        $data['_rights'] = $this->load->view('template/elements/rights', '', TRUE);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', TRUE);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', TRUE);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', TRUE);

        $data['charges'] = $this->Charges_model->get_list(
            array('charges.is_active'=>TRUE,'charges.is_deleted'=>FALSE), 
            array('charges.*','charge_unit.*'),
            array(
                array('charge_unit','charge_unit.charge_unit_id=charges.charge_unit_id','left')
                )   
            );

        $data['periods'] = $this->Meter_reading_period_model->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE),
        'meter_reading_period.*,
        months.month_name,
        DATE_FORMAT(meter_reading_period.meter_reading_period_start,"%m/%d/%Y") as meter_reading_period_start,
        DATE_FORMAT(meter_reading_period.meter_reading_period_end,"%m/%d/%Y") as meter_reading_period_end',
        array(
            array('months','months.month_id = meter_reading_period.month_id','left')),
        'meter_reading_period.meter_reading_year DESC, months.month_id ASC'
        );
      

        $data['title'] = 'Meter Reading Input';
        (in_array('18-1',$this->session->user_rights)? 
        $this->load->view('meter_reading_input_view', $data)
        :redirect(base_url('dashboard')));
    }


    function transaction($txn = null,$id_filter=null) {
        switch ($txn){

            //******************************************* Datatable when page loads ****************************************************************
            case 'list' :
                $response['data']= $this->response_rows_invoice('meter_reading_input.is_active=TRUE AND meter_reading_input.is_deleted=FALSE');
                echo json_encode($response);

                break;

            case 'receivables-for-review' :
                $response['data']= $this->response_rows_invoice('meter_reading_input.is_active=TRUE AND meter_reading_input.is_deleted=FALSE AND meter_reading_input.is_sent=TRUE AND meter_reading_input.is_journal_posted=FALSE ');
                echo json_encode($response);

                break;

            case 'list-inputs' :
                $meter_reading_period_id = $this->input->post('meter_reading_period_id',TRUE);
                $meter_period_info = $this->Meter_reading_period_model->get_list($meter_reading_period_id,
                'DATE(CONCAT(meter_reading_period.meter_reading_year,  "-", meter_reading_period.month_id, "-01")) as before_date');
                $before_date = $meter_period_info[0]->before_date;
                // echo $before_date;
                $response['data']= $this->Meter_reading_period_model->get_meter_reading_for_inputs($before_date);
                echo json_encode($response);
                break;

            case 'check-transaction' :
                $connection_id = $this->input->post('connection_id',TRUE);
                $meter_reading_period_id = $this->input->post('meter_reading_period_id',TRUE);
                $meter_reading_input_id = $this->input->post('meter_reading_input_id',TRUE);
                // $info= $this->Meter_reading_input_items_model->get_list(
                //     array('meter_reading_input_items.connection_id'=>$connection_id,
                //         'meter_reading_input.meter_reading_period_id'=>$meter_reading_period_id,
                //         'meter_reading_input.is_deleted'=>FALSE),
                //     'batch_no, account_no',
                //     array(
                //         array('meter_reading_input','meter_reading_input.meter_reading_input_id = meter_reading_input_items.meter_reading_input_id','left'),
                //         array(' ','    ','left')
                //         )
                //     );
                $info = $this->Meter_reading_input_items_model->validate_duplication($connection_id,$meter_reading_period_id,$meter_reading_input_id);
                if(count($info) > 0){
                    $response['stat']='error';
                    $response['batch_no']=$info[0]->batch_no;
                    $response['account_no']=$info[0]->account_no;
                    die(json_encode($response));
                }

                $response['stat'] = 'success';
                echo json_encode($response);
                break;

            ////****************************************items/products of selected Items***********************************************
            case 'items-input':

                $m_items=$this->Meter_reading_input_items_model;
                $response['data']=$m_items->get_list(
                    array('meter_reading_input_id'=>$id_filter),
                    array(
                        'meter_reading_input_items.meter_reading_input_item_id',
                        'meter_reading_input_items.connection_id',
                        'meter_reading_input_items.previous_reading',
                        'meter_reading_input_items.current_reading',
                        'meter_reading_input_items.total_consumption',
                        'meter_reading_input_items.previous_month',
                        'service_connection.account_no',
                        'service_connection.receipt_name',
                        'customers.customer_name',
                        'meter_inventory.serial_no',
                        '(SELECT 
                            count(*)
                        FROM
                            billing_payment_items bpi
                            LEFT JOIN billing_payments bp ON bp.billing_payment_id = bpi.billing_payment_id
                            LEFT JOIN billing b ON b.billing_id = bpi.billing_id
                            WHERE b.connection_id = meter_reading_input_items.connection_id AND
                            b.meter_reading_input_id = meter_reading_input_items.meter_reading_input_id
                            AND bp.is_active = TRUE
                            AND bp.is_deleted = FALSE) as payment_count'
                    ),
                    array(
                        array('service_connection','service_connection.connection_id=meter_reading_input_items.connection_id','left'),
                        array('customers','customers.customer_id=service_connection.customer_id','left'),
                        array('meter_inventory','meter_inventory.meter_inventory_id=service_connection.meter_inventory_id','left'),
                    ),
                    'meter_reading_input_items.meter_reading_input_item_id ASC'
                );

                echo json_encode($response);

                break;

            case 'check-meter-payment':

                $m_payments = $this->Billing_payments_model;
                $meter_reading_input_id = $this->input->post('meter_reading_input_id', TRUE);
                $response['data']=$m_payments->get_meter_reading_payments($meter_reading_input_id);
                echo json_encode($response);

                break;


            case 'create-batch':
                $m_invoice=$this->Meter_reading_input_model;
                $meter_reading_period_id = $this->input->post('meter_reading_period_id',TRUE);
                $m_invoice->set('date_created','NOW()');
                $m_invoice->meter_reading_period_id = $meter_reading_period_id;
                $m_invoice->date_input=date('Y-m-d',strtotime($this->input->post('date_input',TRUE)));
                $m_invoice->posted_by_user=$this->session->user_id;
                $m_invoice->remarks = $this->input->post('remarks');

                $batch_info = $this->Meter_reading_period_model->get_list($meter_reading_period_id)[0];
                $batch_id = (count($m_invoice->get_list(array('meter_reading_period_id'=>$meter_reading_period_id))) + 1);
                $month_id = str_pad($batch_info->month_id, 2, '0', STR_PAD_LEFT);
                $m_invoice->batch_no  = 'BCH-'.$batch_info->meter_reading_year.''.$month_id.'-'.$batch_id;
                $m_invoice->save();

                $meter_reading_input_id=$m_invoice->last_insert_id();
                $m_invoice_items=$this->Meter_reading_input_items_model;

                //prepare the items with multiple values for looping statement
                $connection_id = $this->input->post('connection_id');
                $previous_reading = $this->input->post('previous_reading');
                $previous_month = $this->input->post('previous_month');
                $current_reading = $this->input->post('current_reading');
                $total_consumption = $this->input->post('total_consumption');
                
                for($i=0;$i<count($connection_id);$i++){
                    $m_invoice_items->meter_reading_input_id=$meter_reading_input_id;
                    $m_invoice_items->connection_id=$this->get_numeric_value($connection_id[$i]);
                    $m_invoice_items->previous_month=$previous_month[$i];
                    $m_invoice_items->previous_reading=$this->get_numeric_value($previous_reading[$i]);
                    $m_invoice_items->current_reading=$this->get_numeric_value($current_reading[$i]);
                    $m_invoice_items->total_consumption=$this->get_numeric_value($total_consumption[$i]);
                    $m_invoice_items->save();
                }

                if($m_invoice->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Batch Meter Input successfully created.';
                    $response['row_added']=$this->response_rows_invoice($meter_reading_input_id);

                    // Audittrail Log           
                    $m_trans=$this->Trans_model;
                    $m_trans->user_id=$this->session->user_id;
                    $m_trans->set('trans_date','NOW()');
                    $m_trans->trans_key_id=1; //CRUD
                    $m_trans->trans_type_id=79; // TRANS TYPE
                    $m_trans->trans_log='Created New Batch Meter Reading: BCH-'.$batch_info->meter_reading_year.''.$month_id.'-'.$batch_id;
                    $m_trans->save();

                    echo json_encode($response);
                }

                break;

            case 'update-reading':
                $m_reading_items = $this->Meter_reading_input_items_model;
                $meter_reading_input_item_id = $this->input->post('meter_reading_input_item_id', TRUE);
                $current_reading = $this->input->post('current_reading');
                $total_consumption = $this->input->post('total_consumption');

                $m_reading_items->current_reading = $this->get_numeric_value($current_reading);
                $m_reading_items->total_consumption = $this->get_numeric_value($total_consumption);
                $m_reading_items->is_processed = FALSE;
                $m_reading_items->modify($meter_reading_input_item_id);

                $response['title'] = 'Success!';
                $response['stat'] = 'success';
                $response['msg'] = 'Meter Reading successfully updated.';
                echo json_encode($response);
                break;

            case 'update-batch':
                $m_invoice=$this->Meter_reading_input_model;
                $meter_reading_input_id = $this->input->post('meter_reading_input_id',TRUE);


                $info = $this->Meter_reading_input_model->get_list(array('meter_reading_input_id'=>$meter_reading_input_id,'is_sent'=>TRUE));
                if(count($info) > 0){
                    $response['stat']='error';
                    $response['title'] = 'Cannot Edit';
                    $response['msg'] = 'Batch Meter Input already sent to Accounting.';
                    die(json_encode($response));
                }

                $m_invoice->date_input=date('Y-m-d',strtotime($this->input->post('date_input',TRUE)));
                $m_invoice->remarks = $this->input->post('remarks');
                $m_invoice->modify($meter_reading_input_id);

                $m_invoice_items=$this->Meter_reading_input_items_model;
                $m_invoice_items->delete_via_fk($meter_reading_input_id); 
                //prepare the items with multiple values for looping statement
                $connection_id = $this->input->post('connection_id');
                $previous_reading = $this->input->post('previous_reading');
                $current_reading = $this->input->post('current_reading');
                $total_consumption = $this->input->post('total_consumption');
                $previous_month = $this->input->post('previous_month');
                for($i=0;$i<count($connection_id);$i++){
                    $m_invoice_items->meter_reading_input_id=$meter_reading_input_id;
                    $m_invoice_items->connection_id=$this->get_numeric_value($connection_id[$i]);
                    $m_invoice_items->previous_month=$previous_month[$i];                 
                    $m_invoice_items->previous_reading=$this->get_numeric_value($previous_reading[$i]);
                    $m_invoice_items->current_reading=$this->get_numeric_value($current_reading[$i]);
                    $m_invoice_items->total_consumption=$this->get_numeric_value($total_consumption[$i]);
                    $m_invoice_items->save();
                }


                if($m_invoice->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Batch Meter Input successfully updated.';
                    $response['row_updated']=$this->response_rows_invoice($meter_reading_input_id);

                    // Audittrail Log           
                    $m_trans=$this->Trans_model;
                    $m_trans->user_id=$this->session->user_id;
                    $m_trans->set('trans_date','NOW()');
                    $m_trans->trans_key_id=2; //CRUD
                    $m_trans->trans_type_id=79; // TRANS TYPE
                    $m_trans->trans_log='Updated Batch Meter Reading: ID('.$meter_reading_input_id.')';
                    $m_trans->save();

                    echo json_encode($response);
                }

                break;


            //***************************************************************************************
            case 'delete':
                $m_invoice=$this->Meter_reading_input_model;
                $meter_reading_input_id=$this->input->post('meter_reading_input_id',TRUE);

                //mark Items as deleted
                // $m_invoice->set('date_deleted','NOW()'); //treat NOW() as function and not string
                // $m_invoice->deleted_by_user=$this->session->user_id;//user that deleted the record
                $m_invoice->is_deleted=1;//mark as deleted
                $m_invoice->modify($meter_reading_input_id);

                $response['title']='Success!';
                $response['stat']='success';
                $response['msg']='Record successfully deleted.';

                // Audittrail Log           
                $m_trans=$this->Trans_model;
                $m_trans->user_id=$this->session->user_id;
                $m_trans->set('trans_date','NOW()');
                $m_trans->trans_key_id=3; //CRUD
                $m_trans->trans_type_id=79; // TRANS TYPE
                $m_trans->trans_log='Deleted Batch Meter Reading: ID('.$meter_reading_input_id.')';
                $m_trans->save();

                echo json_encode($response);

                break;    

            case 'billing-receivable-journal-for-review':
                $meter_reading_input_id=$this->input->get('id',TRUE);

                $m_customers=$this->Customers_model;
                $m_accounts=$this->Account_title_model;
                $m_inputs=$this->Meter_reading_input_model;

                $m_departments=$this->Departments_model;
                $meter_reading_input_info = $m_inputs->get_list($meter_reading_input_id)[0];
                $data['billing_info'] = $meter_reading_input_info;
                $data['billing_items']=$this->Billing_model->billing_statement($meter_reading_input_info->meter_reading_period_id,$meter_reading_input_id);
                $data['account_integration'] = $this->Account_integration_model->get_list()[0];

                $data['departments']=$m_departments->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE));

                $data['customers']=$m_customers->get_list(
                    array(
                        'customers.is_active'=>TRUE,
                        'customers.is_deleted'=>FALSE
                    ),

                    array(
                        'customers.customer_id',
                        'customers.customer_name'
                    )
                );
                $data['entries']=$m_inputs->get_journal_entries($meter_reading_input_id);
                $data['accounts']=$m_accounts->get_list(
                    array(
                        'account_titles.is_active'=>TRUE,
                        'account_titles.is_deleted'=>FALSE
                    )
                );


                echo $this->load->view('template/billing_journal_for_review',$data,TRUE); //details of the journal


                break;        
        }

    }



//**************************************user defined*************************************************

    function response_rows_invoice($filter_value){
        return $this->Meter_reading_input_model->get_list(
                $filter_value,
                'meter_reading_input.*,
                meter_reading_period.*,
                DATE_FORMAT(meter_reading_input.date_input,"%m/%d/%Y") as date_input,
                months.month_name,
                CONCAT_WS(" ",user_accounts.user_fname,user_accounts.user_lname)as posted_by',
                array(
                    array('meter_reading_period','meter_reading_period.meter_reading_period_id=meter_reading_input.meter_reading_period_id','left'),
                    array('months','months.month_id=meter_reading_period.month_id','left'),
                    array('user_accounts','user_accounts.user_id=meter_reading_input.posted_by_user','left')
                )

        );
    }                           

}
