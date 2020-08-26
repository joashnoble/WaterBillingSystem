<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Billing_payments extends CORE_Controller
{

    function __construct() {
        parent::__construct('');

        $this->validate_session();

        $this->load->model('Departments_model');
        $this->load->model('Billing_model');
        $this->load->model('Users_model');
        $this->load->model('Trans_model');
        $this->load->model('Service_connection_model');
        $this->load->model('Company_model');
        $this->load->model('Billing_payments_model');
        $this->load->model('Billing_payment_items_model');
        $this->load->model('Payment_method_model');

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


        $data['accounts']=$this->Service_connection_model->get_list(array('service_connection.is_active'=> TRUE, 'service_connection.is_deleted'=> FALSE), 'connection_id,account_no,customer_name,serial_no,receipt_name',
            array(
                array('customers c', 'c.customer_id=service_connection.customer_id','left'),
                array('meter_inventory','meter_inventory.meter_inventory_id = service_connection.meter_inventory_id','left')
                ),
            'receipt_name ASC'
            );
        $data['title'] = 'Billing Payments';
        $data['methods']=$this->Payment_method_model->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE));
        (in_array('18-3',$this->session->user_rights)? 
        $this->load->view('billing_payments_view', $data)
        :redirect(base_url('dashboard')));

    }


    function transaction($txn=null,$filter_value=null,$filter_date=null){
        switch($txn){
            case 'list':
                // $response['data']=$this->response_rows($filter_value);

                $tsd = date('Y-m-d',strtotime($this->input->get('tsd')));
                $ted = date('Y-m-d',strtotime($this->input->get('ted')));
                $flt = $this->input->get('flt');
                if($flt == 1){
                    $filter_active = "DATE(billing_payments.date_paid) BETWEEN '$tsd' AND '$ted'";

                }else if ($flt==2){
                $filter_active = "DATE(billing_payments.date_paid) BETWEEN '$tsd' AND '$ted' AND billing_payments.is_active = TRUE";

                }elseif ($flt==3) {
                $filter_active = "DATE(billing_payments.date_paid) BETWEEN '$tsd' AND '$ted' AND billing_payments.is_active = FALSE";
                    # code...
                }
                $response['data']=$this->response_rows($filter_value,$filter_active);
                echo json_encode($response);
                break;
            //***********************************************************************************************
        
            case 'billing-receivables':

                $response['receivables'] = $this->Billing_model->billing_receivables($filter_value,$filter_date);
                $response['deposit_info'] = $this->Billing_payments_model->get_account_with_allowable_deposit($filter_value);
                echo json_encode($response);
            break;
    

        
            case 'billing-payment-print':
                $info= $this->response_rows($filter_value)[0];
                $data['num_words']=$this->convertDecimalToWords($info->total_payment_amount);
                $data['info'] =$info;
                $m_company_info=$this->Company_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];
                echo $this->load->view('template/billing_payment_print_content',$data,TRUE); 
            break;

            case 'billing-payment-print-refund':
                $info= $this->response_rows($filter_value)[0];
                $data['num_words']=$this->convertDecimalToWords($info->refund_amount);
                $data['info'] =$info;
                $m_company_info=$this->Company_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];
                echo $this->load->view('template/billing_payment_print_refund_content',$data,TRUE); 
            break;



            case 'create':
                $m_billing_payment=$this->Billing_payments_model;
                $m_billing_payment_items=$this->Billing_payment_items_model;

                // $receipt_no=$this->input->post('receipt_no',TRUE);

                // //******************************************************************************************************
                // //IMPORTANT!!!!!
                // //validation
                // if( count(
                //         $m_payment->get_list(
                //             array(
                //                 'receivable_payments.receipt_no'=>$receipt_no,
                //                 'receivable_payments.is_active'=>TRUE,
                //                 'receivable_payments.is_deleted'=>FALSE
                //             ),
                //             'receivable_payments.payment_id'
                //         )
                //     )  > 0
                // ){
                //     $response['title']="Error!";
                //     $response['stat']="error";
                //     $response['msg']="Invalid receipt number. Please make sure receipt number do not exists.";
                //     echo json_encode($response);
                //     exit;
                // }
                //******************************************************************************************************




                $m_billing_payment->begin();
                //details for auditing
                $m_billing_payment->set('date_created','NOW()');
                $m_billing_payment->created_by_user=$this->session->user_id;
                $m_billing_payment->connection_id=$this->input->post('connection_id',TRUE);
                // $m_billing_payment->department_id=$this->input->post('department',TRUE);
                $m_billing_payment->is_refund=$this->get_numeric_value($this->input->post('is_refund',TRUE)); 

                $payment_method_id=$this->input->post('payment_method_id',TRUE);
                $m_billing_payment->payment_method_id=$payment_method_id;

                if($payment_method_id==2){ //if check, insert additional infos
                    $m_billing_payment->check_no=$this->input->post('check_no',TRUE);
                    $m_billing_payment->check_date=date('Y-m-d',strtotime($this->input->post('check_date',TRUE)));
                }
                // SUMMARY
                $m_billing_payment->total_paid_amount=$this->get_numeric_value($this->input->post('total_paid_amount',TRUE)); // TOTAL PAYMENT FROM DEPOST AND CASH
                $m_billing_payment->total_deposit_amount=$this->get_numeric_value($this->input->post('total_deposit_amount',TRUE)); // PAYMENT FROM DEPOSIT
                $m_billing_payment->total_payment_amount=$this->get_numeric_value($this->input->post('total_payment_amount',TRUE)); // CASH CHECK OR CARD PAYMENT
                $m_billing_payment->deposit_allowed=$this->get_numeric_value($this->input->post('deposit_allowed',TRUE)); // Deposit allowed to use
                // Deposit remaining after use
                if($this->get_numeric_value($this->input->post('is_refund',TRUE)) == 1){
                    $m_billing_payment->remaining_deposit=0;
                    $m_billing_payment->refund_amount=$this->get_numeric_value($this->input->post('remaining_deposit',TRUE));
                }else{
                    $m_billing_payment->remaining_deposit=$this->get_numeric_value($this->input->post('remaining_deposit',TRUE));
                    $m_billing_payment->refund_amount = 0;
                }

                $m_billing_payment->remarks=$this->input->post('remarks',TRUE);
                $m_billing_payment->date_paid=date('Y-m-d',strtotime($this->input->post('date_paid',TRUE)));
                $m_billing_payment->save();


                $billing_payment_id=$m_billing_payment->last_insert_id();
                $m_billing_payment->receipt_no = date('Y').'-'.str_pad($billing_payment_id, 6, "0", STR_PAD_LEFT);
                $m_billing_payment->modify($billing_payment_id);
                $receivable_amount = $this->input->post('receivable_amount',TRUE);
                $payment_amount = $this->input->post('payment_amount',TRUE);
                $deposit_payment = $this->input->post('deposit_payment',TRUE);
                $billing_id = $this->input->post('billing_id',TRUE);
                $disconnection_id = $this->input->post('disconnection_id',TRUE);



                for($i=0;$i<=count($billing_id)-1;$i++){
                    if($this->get_numeric_value($payment_amount[$i]) > 0 || $this->get_numeric_value($deposit_payment[$i]) > 0 ){
                    $m_billing_payment_items->billing_payment_id=$billing_payment_id;
                    $m_billing_payment_items->billing_id=$this->get_numeric_value($billing_id[$i]);
                    $m_billing_payment_items->disconnection_id=$this->get_numeric_value($disconnection_id[$i]);
                    $m_billing_payment_items->receivable_amount=$this->get_numeric_value($receivable_amount[$i]);
                    $m_billing_payment_items->deposit_payment=$this->get_numeric_value($deposit_payment[$i]);
                    $m_billing_payment_items->payment_amount=$this->get_numeric_value($payment_amount[$i]);
                    $m_billing_payment_items->save();
                }
                }



                $m_billing_payment->commit();

                if($m_billing_payment->status()===TRUE){
                    $response['title']="Success!";
                    $response['stat']="success";
                    $response['msg']="Payment successfully recorded.";
                    $response['row_added']=$this->response_rows($billing_payment_id);

                    // Audittrail Log          
                    $m_trans=$this->Trans_model;
                    $m_trans->user_id=$this->session->user_id;
                    $m_trans->set('trans_date','NOW()');
                    $m_trans->trans_key_id=1; //CRUD
                    $m_trans->trans_type_id=81; // TRANS TYPE
                    $m_trans->trans_log='Created New Billing Payment: ('.$billing_payment_id.')';
                    $m_trans->save();

                    echo json_encode($response);
                }


                break;

                case 'cancel':
                    $billing_payment_id=$this->input->post('billing_payment_id',TRUE);

                    $m_payment=$this->Billing_payments_model;

                    $receipt = $m_payment->get_list($billing_payment_id);

                    if($receipt[0]->billing_payment_batch_id > 0){

                    $response['stat']='error';
                    $response['title']='Error !';
                    $response['msg']='Payment already sent to Accounting';
                    die(json_encode($response));

                    }
                    $m_payment->begin();
                    $m_payment->set('date_cancelled','NOW()');
                    $m_payment->is_active=0;
                    $m_payment->cancelled_by_user=$this->session->user_id;
                    $m_payment->modify($billing_payment_id);
                    $m_payment->commit();

                    if($m_payment->status()===TRUE){
                        $response['title']="Success!";
                        $response['stat']="success";
                        $response['msg']="Payment successfully cancelled.";
                        $response['row_updated']=$this->response_rows($billing_payment_id);

                        // Audittrail Log          
                        $m_trans=$this->Trans_model;
                        $m_trans->user_id=$this->session->user_id;
                        $m_trans->set('trans_date','NOW()');
                        $m_trans->trans_key_id=4; //CRUD
                        $m_trans->trans_type_id=81; // TRANS TYPE
                        $m_trans->trans_log='Cancelled Billing Payment: '.$receipt[0]->receipt_no;
                        $m_trans->save();

                        echo json_encode($response);
                    }
                break;


        }



    }





    function response_rows($id=null,$filter_active=FALSE){ //$show_unposted is TRUE, only unposted will be filtered
        $m_payments=$this->Billing_payments_model;
        return $m_payments->get_list(
        //filter
            ($id==null?'':' billing_payments.billing_payment_id='.$id)." 
            ".($filter_active==FALSE?"": $filter_active),
            //fields
            array(
                'billing_payments.*',
                'meter_inventory.serial_no',
                'DATE_FORMAT(billing_payments.date_paid,"%m/%d/%Y")as date_paid',
                'FORMAT(billing_payments.total_paid_amount,2)as total_paid_amount',
                'payment_methods.payment_method',
                'customers.customer_name',
                'service_connection.account_no',
                'service_connection.receipt_name',
                'CONCAT_WS(" ",user_accounts.user_fname,user_accounts.user_lname)as posted_by_user'
            ),
            //joins
            array(
                array('user_accounts','user_accounts.user_id=billing_payments.created_by_user','left'),
                array('service_connection','service_connection.connection_id=billing_payments.connection_id','left'),
                array('meter_inventory','meter_inventory.meter_inventory_id=service_connection.meter_inventory_id','left'),
                array('customers','customers.customer_id=service_connection.customer_id','left'),
                array('payment_methods','payment_methods.payment_method_id=billing_payments.payment_method_id','left')
            ),
            'billing_payments.billing_payment_id DESC'

        );
    }


}
