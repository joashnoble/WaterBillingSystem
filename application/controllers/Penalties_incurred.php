<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penalties_incurred extends CORE_Controller {
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
        $this->load->model('Months_model');
        $this->load->library('excel');
    }

    public function index() {
        $this->Users_model->validate();
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', TRUE);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', TRUE);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', TRUE);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', TRUE);
        $data['title'] = 'Penalties Incurred';

        $data['customer'] = $this->Customers_model->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE));
        $data['months'] = $this->Months_model->get_list();

        (in_array('21-9',$this->session->user_rights)? 
        $this->load->view('penalties_incurred_view', $data)
        :redirect(base_url('dashboard')));
        
    }

    function transaction($txn = null) {
        switch ($txn) {
            case 'penalties':

                $period_id = $this->input->get('period_id',TRUE);
                $year = $this->input->get('year',TRUE);

                $response['data']=$this->Billing_model->get_penalties_incurred($period_id,$year);
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
