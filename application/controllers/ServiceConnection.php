<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ServiceConnection extends CORE_Controller {

    function __construct() {
        parent::__construct('');
        $this->validate_session();

        $this->load->model('Service_connection_model');
        $this->load->model('Meter_inventory_model');
        $this->load->model('Customers_model');
        $this->load->model('Contract_type_model');
        $this->load->model('Rate_type_model');
        $this->load->model('Users_model');
        $this->load->model('Trans_model');
        $this->load->model('Trans_services_model');
        $this->load->model('Company_model');
        $this->load->model('Customer_type_model');
        $this->load->model('Customer_account_type_model');
        $this->load->model('Nationality_model');
        $this->load->model('Civil_status_model');
        $this->load->model('Attendant_model');
        $this->load->model('Departments_model');
        $this->load->model('Sex_model');
        $this->load->library('excel');
    }

    public function index() {
        $this->Users_model->validate();
        $data['_def_css_files']=$this->load->view('template/assets/css_files','',TRUE);
        $data['_def_js_files']=$this->load->view('template/assets/js_files','',TRUE);
        $data['_rights'] = $this->load->view('template/elements/rights', '', TRUE);
        $data['_switcher_settings']=$this->load->view('template/elements/switcher','',TRUE);
        $data['_side_bar_navigation']=$this->load->view('template/elements/side_bar_navigation','',TRUE);
        $data['_top_navigation']=$this->load->view('template/elements/top_navigation','',TRUE);
        $data['title']='Connection Service';
        
        $data['customers']=$this->Customers_model->get_list(
            array('customers.is_deleted'=>FALSE),
            'customers.*, customer_account_type.customer_account_type_desc',
            array(
                array('customer_account_type','customers.customer_account_type_id = customer_account_type.customer_account_type_id','left')
            ),
            'customers.customer_name ASC'
        );
        $data['customer_type']=$this->Customer_type_model->get_list(
            array('customer_type.is_deleted'=>FALSE)
        );
        $data['customer_account_types']=$this->Customer_account_type_model->get_list(
            array('customer_account_type.is_deleted'=>FALSE)
        );        
        $data['nationalities']=$this->Nationality_model->get_list(  
            array('nationality.is_deleted'=>FALSE,'nationality.is_active'=>TRUE)
        );
        $data['civils']=$this->Civil_status_model->get_list(
            array('civil_status.is_deleted'=>FALSE,'civil_status.is_active'=>TRUE)
        );
        $data['sexes']=$this->Sex_model->get_list(
            array('sex.is_deleted'=>FALSE,'sex.is_active'=>TRUE)
        );
        $data['attendant']=$this->Attendant_model->get_list(array('attendant.is_deleted'=>FALSE,'attendant.is_active'=>TRUE),
            'attendant_id, CONCAT(last_name,", ",first_name," ",middle_name) as full_name'
        );
        $data['departments']=$this->Departments_model->get_list(
            array('departments.is_deleted'=>FALSE,'departments.is_active'=>TRUE)
        );
        $data['contract_types']=$this->Contract_type_model->get_list(
            array('contract_types.is_deleted'=>FALSE,'contract_types.is_active'=>TRUE)
        );
        $data['rate_types']=$this->Rate_type_model->get_list(
            array('rate_types.is_deleted'=>FALSE,'rate_types.is_active'=>TRUE)
        );

        (in_array('17-1',$this->session->user_rights)? 
        $this->load->view('service_connection_view',$data)
        :redirect(base_url('dashboard')));
        
    }

    function transaction($txn=null) {
        switch($txn) {
            case 'list':
                $m_connection=$this->Service_connection_model;
                $response['data']=$m_connection->getList();
                echo json_encode($response);

                break;

            case 'create':
                $m_connection=$this->Service_connection_model;

                $customer_id = $this->input->post('customer_id',TRUE);
                $meter_inventory_id = $this->input->post('meter_inventory_id',TRUE);
                $serial_no =$this->input->post('serial_no',TRUE);

                $service_date = date("Y-m-d",strtotime($this->input->post('service_date',TRUE)));
                $target_date = date("Y-m-d",strtotime($this->input->post('target_date',TRUE)));

                $m_connection->set('date_created','NOW()');
                $m_connection->customer_id=$customer_id;
                $m_connection->meter_inventory_id=$meter_inventory_id;
                $m_connection->service_date=$service_date;
                $m_connection->receipt_name=$this->input->post('receipt_name',TRUE);
                $m_connection->address=$this->input->post('address',TRUE);
                $m_connection->target_date=$target_date;
                $m_connection->target_time=$this->input->post('target_time',TRUE);
                $m_connection->contract_type_id=$this->input->post('contract_type_id',TRUE);
                $m_connection->rate_type_id=$this->input->post('rate_type_id',TRUE);
                $m_connection->initial_meter_deposit=$this->get_numeric_value($this->input->post('initial_meter_deposit',TRUE));
                $m_connection->initial_meter_reading=$this->get_numeric_value($this->input->post('initial_meter_reading',TRUE));
                $m_connection->attendant_id=$this->input->post('attendant_id',TRUE);
                $m_connection->created_by=$this->session->user_id;
                $m_connection->save();

                $connection_id=$m_connection->last_insert_id();

                //update no on formatted last insert id
                $service_no='SCN-'.date('Ymd').'-'.$connection_id;
                $account_no='ACN-'.date('Ymd').'-'.$connection_id;

                $m_connection->service_no=$service_no;
                $m_connection->account_no=$account_no;
                $m_connection->current_id=$connection_id;
                $m_connection->modify($connection_id);

                // Updating Meter Inventory Status
                $m_meter_inventory = $this->Meter_inventory_model;
                $m_meter_inventory->meter_status_id=1; // Active Status
                $m_meter_inventory->is_new=0; // Active Status
                $m_meter_inventory->modify($meter_inventory_id);

                $response['title']='Success!';
                $response['stat']='success';
                $response['msg']='Service Connection Information successfully created.';
                $response['row_added']= $m_connection->getList($connection_id);

                // Audittrail Log
                $customer = $this->Customers_model->get_list($customer_id);            
                $m_trans=$this->Trans_model;
                $m_trans->user_id=$this->session->user_id;
                $m_trans->set('trans_date','NOW()');
                $m_trans->trans_key_id=1; //CRUD
                $m_trans->trans_type_id=69; // TRANS TYPE
                $m_trans->trans_log='Created New Connection: '.$service_no.' - '.$customer[0]->customer_name.' ('.$serial_no.') ';
                $m_trans->save();

                // Service History
                $m_trans_services=$this->Trans_services_model;
                $m_trans_services->user_id=$this->session->user_id;
                $m_trans_services->set('trans_date','NOW()');
                $m_trans_services->trans_key_id=1; //CRUD
                $m_trans_services->trans_type_id=1; // TRANS TYPE
                $m_trans_services->connection_id=$connection_id; // CONNECTION ID
                $m_trans_services->trans_log='Created New Connection: ('.$service_no.')';
                $m_trans_services->save();

                echo json_encode($response);

                break;

            case 'delete':
                $m_connection=$this->Service_connection_model;
                $connection_id=$this->input->post('connection_id',TRUE);         

                // Updating Meter Inventory Status
                $connection = $m_connection->getList($connection_id);
                $meter_inventory_id = $connection[0]->meter_inventory_id;
                $service_no = $connection[0]->service_no;
                $customer_name = $connection[0]->customer_name;
                $serial_no = $connection[0]->serial_no;
                if($connection[0]->service_connection_batch_id > 0){
                    $response['stat']='error';
                    $response['title']='<b>Error!</b>';
                    $response['msg']='Service Connection already sent in Accounting!<br />';
                    die(json_encode($response));
                }

                $m_connection->is_deleted=1;


                if($m_connection->modify($connection_id)){     

                    $response['title']='Success!';
                    $response['stat']='success';
                    $response['msg']='Service Connection information successfully deleted.';
                    $m_trans=$this->Trans_model;

                    $m_meter_inventory = $this->Meter_inventory_model;
                    $m_meter_inventory->meter_status_id=2; // Inactive Status
                    $m_meter_inventory->is_new=1; // Is Not New Status
                    $m_meter_inventory->modify($meter_inventory_id);                    

                    $m_trans->user_id=$this->session->user_id;
                    $m_trans->set('trans_date','NOW()');
                    $m_trans->trans_key_id=3; //CRUD
                    $m_trans->trans_type_id=69; // TRANS TYPE
                    $m_trans->trans_log='Deleted Connection : ID('.$connection_id.')';
                    $m_trans->save();
                    
                    // Service History
                    $m_trans_services=$this->Trans_services_model;
                    $m_trans_services->user_id=$this->session->user_id;
                    $m_trans_services->set('trans_date','NOW()');
                    $m_trans_services->trans_key_id=2; //CRUD
                    $m_trans_services->trans_type_id=1; // TRANS TYPE
                    $m_trans_services->connection_id=$connection_id; // CONNECTION ID
                    $m_trans_services->trans_log='Deleted Service Connection: ('.$service_no.')';
                    $m_trans_services->save();

                    echo json_encode($response);
                }

                break;

            case 'update':
                $m_connection=$this->Service_connection_model;
                
                $connection_id = $this->input->post('connection_id',TRUE);
                $service_no =$this->input->post('service_no',TRUE);

                $service_date = date("Y-m-d",strtotime($this->input->post('service_date',TRUE)));
                $target_date = date("Y-m-d",strtotime($this->input->post('target_date',TRUE)));

                $m_connection->service_date=$service_date;
                $m_connection->receipt_name=$this->input->post('receipt_name',TRUE);
                $m_connection->address=$this->input->post('address',TRUE);
                $m_connection->target_date=$target_date;
                $m_connection->target_time=$this->input->post('target_time',TRUE);
                $m_connection->contract_type_id=$this->input->post('contract_type_id',TRUE);
                $m_connection->rate_type_id=$this->input->post('rate_type_id',TRUE);
                $m_connection->initial_meter_deposit=$this->get_numeric_value($this->input->post('initial_meter_deposit',TRUE));
                $m_connection->initial_meter_reading=$this->get_numeric_value($this->input->post('initial_meter_reading',TRUE));
                $m_connection->attendant_id=$this->input->post('attendant_id',TRUE);
                $m_connection->modify($connection_id);

                $response['title']='Success!';
                $response['stat']='success';
                $response['msg']='Service Connection Information successfully updated.';
                $response['row_updated']= $m_connection->getList($connection_id);
         
                $m_trans=$this->Trans_model;
                $m_trans->user_id=$this->session->user_id;
                $m_trans->set('trans_date','NOW()');
                $m_trans->trans_key_id=2; //CRUD
                $m_trans->trans_type_id=69; // TRANS TYPE
                $m_trans->trans_log='Updated Service Connection: ID('.$connection_id.')';
                $m_trans->save();

                echo json_encode($response);

                break;

            case 'chck_connection_service':
                    $m_connection=$this->Service_connection_model;

                    $connection_id=$this->input->post('connection_id',TRUE);
                    $mode=$this->input->post('mode',TRUE);

                    $connection = $m_connection->getList($connection_id);
                    $service_no = $connection[0]->service_no;

                    $validate = $m_connection->chck_meter_reading($connection_id); // Meter Reading Entry
                    $validate_2 = $m_connection->chck_connection($connection_id); // Disconnection
                    $validate_3 = $m_connection->getList(null,1,$connection_id); // Current ID

                    if (count($validate) > 0 OR count($validate_2) > 0 OR count($validate_3) <= 0){
                        if ($mode == "delete"){$response['title']='Cannot delete!';}else{$response['title']='Cannot update!';}
                        $response['stat']='error';
                        $response['msg'] = 'Connection Service #('.$service_no.') still has an active transaction.';
                    }
                    else{
                        $response['stat']='success';
                    }

                    echo json_encode($response);

                break;

            case 'print-masterfile':
                $m_company_info=$this->Company_model;
                $m_connection=$this->Service_connection_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];
                $data['user'] = $this->session->user_fullname;

                $data['connection']=$m_connection->getList();
                $this->load->view('template/service_connection_list',$data);

                break;

            case 'export-masterfile':

                $excel = $this->excel;

                $m_company_info=$this->Company_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];
                $connection=$this->Service_connection_model->getList();

                $excel->setActiveSheetIndex(0);

                $excel->getActiveSheet()->getColumnDimensionByColumn('A1:B1')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A2:C2')->setWidth('50');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A3')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A4')->setWidth('40');

                //name the worksheet
                $excel->getActiveSheet()->setTitle("Service Connection Masterfile");
                $excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->mergeCells('A1:D1');
                $excel->getActiveSheet()->mergeCells('A2:D2');
                $excel->getActiveSheet()->mergeCells('A3:D3');
                $excel->getActiveSheet()->mergeCells('A4:D4');

                $excel->getActiveSheet()->setCellValue('A1',$company_info[0]->company_name)
                                        ->setCellValue('A2',$company_info[0]->company_address)
                                        ->setCellValue('A3',$company_info[0]->landline.'/'.$company_info[0]->mobile_no)
                                        ->setCellValue('A4',$company_info[0]->email_address);

                $excel->getActiveSheet()->setCellValue('A6','Service Connection Masterfile')
                                        ->getStyle('A6')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('A7','')
                                        ->getStyle('A7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('A8','')
                                        ->getStyle('A8')->getFont()->setItalic(TRUE);

                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('5');
                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('F')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('G')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimension('H')->setWidth('40');
                $excel->getActiveSheet()->getColumnDimension('I')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('J')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('K')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('L')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('M')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('N')->setWidth('20');
                $excel->getActiveSheet()->getColumnDimension('O')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('P')->setWidth('20');

                 $style_header = array(

                    'fill' => array(
                        'type' => PHPExcel_Style_Fill::FILL_SOLID,
                        'color' => array('rgb'=>'CCFF99'),
                    ),
                    'font' => array(
                        'bold' => true,
                    )
                );


                $excel->getActiveSheet()->getStyle('A9:P9')->applyFromArray( $style_header );

                $excel->getActiveSheet()->setCellValue('A9','#')
                                        ->getStyle('A9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('B9','Service No')
                                        ->getStyle('B9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('C9','Account No')
                                        ->getStyle('C9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('D9','Customer')
                                        ->getStyle('D9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('E9','Service Date')
                                        ->getStyle('E9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('F9','Meter Serial')
                                        ->getStyle('F9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('G9','Name to appear on receipt')
                                        ->getStyle('G9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('H9','Address')
                                        ->getStyle('H9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('I9','Target Installation Date & Time')
                                        ->getStyle('I9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('J9','Contract Type')
                                        ->getStyle('J9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('K9','Rate Type')
                                        ->getStyle('K9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('L9','Account Type')
                                        ->getStyle('L9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('M9','Initial Reading')
                                        ->getStyle('M9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('N9','Initial Deposit')
                                        ->getStyle('N9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('O9','Attended By')
                                        ->getStyle('O9')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('P9','Attended By')
                                        ->getStyle('P9')->getFont()->setBold(TRUE);                                        

                $a=1;
                $i=10;

                foreach ($connection as $row) {
                $excel->getActiveSheet()->setCellValue('A'.$i,$a)
                                        ->setCellValue('B'.$i,$row->service_no)
                                        ->setCellValue('C'.$i,$row->account_no)
                                        ->setCellValue('D'.$i,$row->customer_name)
                                        ->setCellValue('E'.$i,$row->service_date)
                                        ->setCellValue('F'.$i,$row->serial_no)
                                        ->setCellValue('G'.$i,$row->receipt_name)
                                        ->setCellValue('H'.$i,$row->address)
                                        ->setCellValue('I'.$i,$row->target_date.' '.$row->target_time)
                                        ->setCellValue('J'.$i,$row->contract_type_name)
                                        ->setCellValue('K'.$i,$row->rate_type_name)
                                        ->setCellValue('L'.$i,$row->customer_account_type_desc)
                                        ->setCellValue('M'.$i,$row->initial_meter_reading)
                                        ->setCellValue('N'.$i,$row->initial_meter_deposit)
                                        ->setCellValue('O'.$i,$row->attendant)
                                        ->setCellValue('P'.$i,$row->current_account_status);
                $i++;
                $a++;

                }

                $i++; $i++;
                $excel->getActiveSheet()->setCellValue('A'.$i,'Date Printed: '.date('Y-m-d h:i:s'));
                $i++;
                $excel->getActiveSheet()->setCellValue('A'.$i,'Printed by: '.$this->session->user_fullname);


                header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
                header('Content-Disposition: attachment;filename="Service Connection Masterfile '.date('M-d-Y',NOW()).'.xlsx"');
                header('Cache-Control: max-age=0');
                // If you're serving to IE 9, then the following may be needed
                header('Cache-Control: max-age=1');

                // If you're serving to IE over SSL, then the following may be needed
                header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
                header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
                header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
                header ('Pragma: public'); // HTTP/1.0

                $objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
                $objWriter->save('php://output');            
                     
            break;
       	}
    }
}
