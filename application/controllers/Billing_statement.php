<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Billing_statement extends CORE_Controller {
    function __construct() {
        parent::__construct('');
        $this->validate_session();
        $this->load->model('Meter_inventory_model');
        $this->load->model('Meter_reading_period_model');
        $this->load->model('Meter_reading_input_model');
        $this->load->model('Customers_model');
        $this->load->model('Billing_model');
        $this->load->model('Users_model');
        $this->load->model('Trans_model');
        $this->load->model('Company_model');
        $this->load->library('excel');
    }

    public function index() {
        $this->Users_model->validate();
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', TRUE);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', TRUE);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', TRUE);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', TRUE);
        $data['title'] = 'Billing Statement';

        $data['customer'] = $this->Customers_model->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE));
        $data['periods'] = $this->Meter_reading_period_model->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE),
        'meter_reading_period.*,
        months.month_name,
        DATE_FORMAT(meter_reading_period.meter_reading_period_start,"%m/%d/%Y") as meter_reading_period_start,
        DATE_FORMAT(meter_reading_period.meter_reading_period_end,"%m/%d/%Y") as meter_reading_period_end',
        array(
            array('months','months.month_id = meter_reading_period.month_id','left')),
        'meter_reading_period.meter_reading_year DESC, months.month_id ASC'
        );        

        (in_array('21-3',$this->session->user_rights)? 
        $this->load->view('billing_statement_view', $data)
        :redirect(base_url('dashboard')));
        
    }

    function transaction($txn = null) {
        switch ($txn) {
            case 'statement':

                $period_id = $this->input->get('period_id',TRUE);
                $meter_reading_input_id = $this->input->get('meter_reading_input_id',TRUE);
                $customer_id = $this->input->get('customer_id',TRUE);

                $response['data']=$this->Billing_model->billing_statement($period_id,$meter_reading_input_id,$customer_id);
                echo json_encode($response);
                break;


            case 'get_batches':
                $m_batches = $this->Meter_reading_input_model;
                $period_id = $this->input->post('period_id',TRUE);

                $response['data'] = $m_batches->get_batches($period_id);
                echo json_encode($response);
                break;

            case 'update_report':

                $start_date='2020-01-01';
                $end_date='2020-12-31';

                $m_billing = $this->Billing_model;

                $update_arrears = $m_billing->update_arrears($start_date,$end_date);

                if(count($update_arrears) > 0){


                    for ($i=0; $i < count($update_arrears); $i++) { 

                        $m_billing->arrears_penalty_amount = $this->get_numeric_value($update_arrears[$i]->fee);
                        $m_billing->modify($update_arrears[$i]->previous_id);

                    }

                    $response['title']='Success!';
                    $response['stat']='success';
                    $response['msg']='Arrears Penalty successfully updated.';

                }else{

                    $response['title']='Error!';
                    $response['stat']='error';
                    $response['msg']='No update found for billing statements.';

                }

                echo json_encode($response);

                break;

        }
    }
}
