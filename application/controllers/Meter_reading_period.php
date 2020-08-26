<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Meter_reading_period extends CORE_Controller {
    function __construct() {
        parent::__construct('');
        $this->validate_session();
        $this->load->model('Bank_model');
        $this->load->model('Users_model');
        $this->load->model('Trans_model');
        $this->load->model('Months_model');
        $this->load->model('Meter_reading_period_model');
        $this->load->model('Meter_reading_input_model');

    }

    public function index() {
        $this->Users_model->validate();
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', TRUE);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
        $data['_rights'] = $this->load->view('template/elements/rights', '', TRUE);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', TRUE);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', TRUE);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', TRUE);
        $data['title'] = 'Mater Reading Period Management';
        $data['months'] = $this->Months_model->get_list();
        (in_array('20-4',$this->session->user_rights)? 
        $this->load->view('meter_reading_period_view', $data)
        :redirect(base_url('dashboard')));
        
    }

    function transaction($txn = null) {
        switch ($txn) {
            case 'list':
                $m_period = $this->Meter_reading_period_model;
                $response['data'] = $this->response_rows('meter_reading_period.is_deleted=FALSE');
                echo json_encode($response);
                break;

            case 'create':
                $m_period = $this->Meter_reading_period_model;

                $month_id = $this->input->post('month_id', TRUE);
                $meter_reading_year = $this->input->post('meter_reading_year', TRUE);

                $p_validate = count($m_period->validate_count_period($meter_reading_year,$month_id,0));  // VALIDATE MONTH AND YEAR IF EXISTS IN TABLE

                if($p_validate > 0){
                    $response['stat']='error';
                    $response['title']='<b>Duplicate!</b>';
                    $response['msg']='Cannot make an Existing Meter Reading Period !<br />';
                    die(json_encode($response));

                }

                $m_period->meter_reading_period_start = date('Y-m-d',strtotime($this->input->post('meter_reading_period_start', TRUE)));
                $m_period->meter_reading_period_end = date('Y-m-d',strtotime($this->input->post('meter_reading_period_end', TRUE)));
                $m_period->month_id = $month_id;
                $m_period->meter_reading_year = $meter_reading_year;

                $m_period->save();
                $meter_reading_period_id = $m_period->last_insert_id();

                $response['title'] = 'Success!';
                $response['stat'] = 'success';
                $response['msg'] = 'Meter Reading Period Successfully Created.';
                $response['row_added'] = $this->response_rows($meter_reading_period_id);

                // Audittrail Log          
                $period = $response['row_added'][0]->month_name.' '.$response['row_added'][0]->meter_reading_year.' ('.$response['row_added'][0]->meter_reading_period_start.' - '.$response['row_added'][0]->meter_reading_period_end.')'; 
                $m_trans=$this->Trans_model;
                $m_trans->user_id=$this->session->user_id;
                $m_trans->set('trans_date','NOW()');
                $m_trans->trans_key_id=1; //CRUD
                $m_trans->trans_type_id=75; // TRANS TYPE
                $m_trans->trans_log='Created New Meter Reading Period : '.$period;
                $m_trans->save();


                echo json_encode($response);

                break;

            case 'delete':
                $m_period=$this->Meter_reading_period_model;
                $meter_reading_period_id=$this->input->post('meter_reading_period_id',TRUE);

                $m_input = $this->Meter_Reading_input_model;
                $p_input_validate = count($m_input->get_list(array('is_active'=> TRUE, 'is_deleted'=>FALSE , 'meter_reading_period_id'=>$meter_reading_period_id))); // VALIDATE IF THERE IS A METER PERIOD IN  METER READING ENTRY (INPUT)
                if($p_input_validate > 0){
                    $response['stat']='error';
                    $response['title']='<b>Cannot Delete!</b>';
                    $response['msg']='Meter Reading Entries are created using this period !<br />';
                    die(json_encode($response));

                }
                $m_period->is_deleted=1;
                if($m_period->modify($meter_reading_period_id)){
                    $response['title']='Success!';
                    $response['stat']='success';
                    $response['msg']='Meter Reading Period information successfully deleted.';

                    // Audittrail Log          
                    $m_trans=$this->Trans_model;
                    $m_trans->user_id=$this->session->user_id;
                    $m_trans->set('trans_date','NOW()');
                    $m_trans->trans_key_id=3; //CRUD
                    $m_trans->trans_type_id=75; // TRANS TYPE
                    $m_trans->trans_log='Deleted Meter Reading Period : ID('.$meter_reading_period_id.')';
                    $m_trans->save();

                    echo json_encode($response);
                }

                break;

            case 'close':
                $m_period=$this->Meter_reading_period_model;
                $meter_reading_period_id=$this->input->post('meter_reading_period_id',TRUE);

                $m_period->is_closed=1;
                if($m_period->modify($meter_reading_period_id)){
                    $response['title']='Success!';
                    $response['stat']='success';
                    $response['msg']='Meter Reading Period was successfully closed.';
                    $response['row_updated'] = $this->response_rows($meter_reading_period_id);

                    // Audittrail Log          
                    $m_trans=$this->Trans_model;
                    $m_trans->user_id=$this->session->user_id;
                    $m_trans->set('trans_date','NOW()');
                    $m_trans->trans_key_id=13; //CRUD
                    $m_trans->trans_type_id=75; // TRANS TYPE
                    $m_trans->trans_log='Close Meter Reading Period : ID('.$meter_reading_period_id.')';
                    $m_trans->save();

                    echo json_encode($response);
                }

                break;                

            case 'update':
                $m_period = $this->Meter_reading_period_model;
                $meter_reading_period_id =$this->input->post('meter_reading_period_id', TRUE);
                $month_id = $this->input->post('month_id', TRUE);
                $meter_reading_year = $this->input->post('meter_reading_year', TRUE);
                $p_validate = count($m_period->validate_count_period($meter_reading_year,$month_id,$meter_reading_period_id));

                if($p_validate > 0){
                    $response['stat']='error';
                    $response['title']='<b>Duplicate!</b>';
                    $response['msg']='Matrix Exists !<br />';
                    die(json_encode($response));

                }
                $m_input = $this->Meter_Reading_input_model;
                $p_input_validate = count($m_input->get_list(array('is_active'=> TRUE, 'is_deleted'=>FALSE , 'meter_reading_period_id'=>$meter_reading_period_id))); // VALIDATE IF THERE IS A METER PERIOD IN  METER READING ENTRY (INPUT)
                if($p_input_validate > 0){
                    $response['stat']='error';
                    $response['title']='<b>Cannot Update!</b>';
                    $response['msg']='Meter Reading Entries are created using this period !<br />';
                    die(json_encode($response));

                }
                $m_period->meter_reading_period_start = date('Y-m-d',strtotime($this->input->post('meter_reading_period_start', TRUE)));
                $m_period->meter_reading_period_end = date('Y-m-d',strtotime($this->input->post('meter_reading_period_end', TRUE)));
                $m_period->month_id = $month_id; 
                $m_period->meter_reading_year = $meter_reading_year; 
                $m_period->modify($meter_reading_period_id);
    
                $response['title'] = 'Success!';
                $response['stat'] = 'success';
                $response['msg'] = 'Meter Reading Period Successfully Updated.';
                $response['row_updated'] = $this->response_rows($meter_reading_period_id);

                // Audittrail Log          
                $m_trans=$this->Trans_model;
                $m_trans->user_id=$this->session->user_id;
                $m_trans->set('trans_date','NOW()');
                $m_trans->trans_key_id=2; //CRUD
                $m_trans->trans_type_id=75; // TRANS TYPE
                $m_trans->trans_log='Updated Meter Reading Period : ID('.$meter_reading_period_id.')';
                $m_trans->save();

                echo json_encode($response);
                break;
        }
    }

    function response_rows($filter_value){
            $m_period = $this->Meter_reading_period_model;
            return $m_period->get_list($filter_value,
                'meter_reading_period.*,
                months.month_name,
                DATE_FORMAT(meter_reading_period.meter_reading_period_start,"%m/%d/%Y") as meter_reading_period_start,
                DATE_FORMAT(meter_reading_period.meter_reading_period_end,"%m/%d/%Y") as meter_reading_period_end,
                (CASE 
                    WHEN meter_reading_period.is_closed = 0
                        THEN "Open"
                    ELSE "Closed"
                END) as status 
                ',
                array(
                    array('months','months.month_id = meter_reading_period.month_id','left') ));
    }
}



