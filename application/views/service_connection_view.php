<!DOCTYPE html>

<html lang="en">

    <head>

        <meta charset="utf-8">

        <title>JCORE - <?php echo $title; ?></title>

        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes">
        <meta name="description" content="Avenxo Admin Theme">
        <meta name="author" content="">

        <?php echo $_def_css_files; ?>

        <link rel="stylesheet" href="assets/plugins/spinner/dist/ladda-themeless.min.css">
        <link href="assets/plugins/select2/select2.min.css" rel="stylesheet">
        <link type="text/css" href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">
        <link type="text/css" href="assets/plugins/datatables/dataTables.themify.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/plugins/datapicker/datepicker3.css">

        <style>
            .toolbar{
                float: left;
            }
            td.details-control {
            background: url('assets/img/Folder_Closed.png') no-repeat center center;
            cursor: pointer;
            }
            tr.details td.details-control {
                background: url('assets/img/Folder_Opened.png') no-repeat center center;
            }
            .child_table{
                padding: 5px;
                border: 1px #ff0000 solid;
            }

            .glyphicon.spinning {
                animation: spin 1s infinite linear;
                -webkit-animation: spin2 1s infinite linear;
            }

            @keyframes spin {
                from { transform: scale(1) rotate(0deg); }
                to { transform: scale(1) rotate(360deg); }
            }

            @-webkit-keyframes spin2 {
                from { -webkit-transform: rotate(0deg); }
                to { -webkit-transform: rotate(360deg); }
            }

            .select2-close-mask{
                z-index: 999999;
            }
            .select2-dropdown{
                z-index: 999999;
            }
            .bottom-10{
                padding-bottom: 10px!important;
            }
            .right{
                text-align: right;
            }

            #tbl_connection_filter, #tbl_meter_list_filter{
                display: none;
            }

            .modal-customer {
              width: 95%;

            }
            .red{
                color: red;
            }
        </style>

    </head>

    <body class="animated-content">

    <?php echo $_top_navigation; ?>

        <div id="wrapper">
            <div id="layout-static">

            <?php echo $_side_bar_navigation;?>

                <div class="static-content-wrapper white-bg">
                    <div class="static-content"  >
                        <div class="page-content"><!-- #page-content -->

                            <ol class="breadcrumb" style="margin:0;">
                                <li><a href="dashboard">Dashboard</a></li>
                                <li><a href="ServiceConnection">Connection Service</a></li>
                            </ol>

                            <div class="container-fluid">
                                <div data-widget-group="group1">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div id="div_category_list">
                                                <div class="panel panel-default">
                                                    <!-- <div class="panel-heading">
                                                        <b style="color: white; font-size: 12pt;"><i class="fa fa-bars"></i>&nbsp; Sales Person</b>
                                                    </div> -->
                                                    <div class="panel-body table-responsive">
                                                    <h2 class="h2-panel-heading">Connection Service</h2><hr>

                                                         <div class="row">
                                                            <div class="col-lg-3"><br>
                                                                    <button class="btn btn-primary create_service_connection" id="btn_new" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;margin-bottom: 0px !important; float: left;" data-toggle="modal" data-target="" data-placement="left" title="New Meter" ><i class="fa fa-plus"></i>  New Connection</button>
                                                            </div>
                                                            <div class="col-lg-offset-3 col-lg-3" style="text-align: right;">
                                                            &nbsp;<br>
                                                                    <button class="btn btn-primary" id="btn_print" style="text-transform: none; font-family: Tahoma, Georgia, Serif;padding: 6px 10px!important;" data-toggle="modal" data-placement="left" title="Print Connection Masterfile" ><i class="fa fa-print"></i> Print</button> &nbsp;
                                                                    <button class="btn btn-success" id="btn_export" style="text-transform: none; font-family: Tahoma, Georgia, Serif;padding: 6px 10px!important;" data-toggle="modal" data-placement="left" title="Export Connection Masterfile" ><i class="fa fa-file-excel-o"></i> Export</button>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                    Search :<br />
                                                                     <input type="text" id="searchbox_connection" class="form-control">
                                                            </div>
                                                        </div><br>

                                                        <table id="tbl_connection" class="table table-striped" cellspacing="0" width="100%">
                                                            <thead class="">
                                                            <tr>
                                                                <th></th>
                                                                <th>Service No</th>
                                                                <th>Account No</th>
                                                                <th>Customer</th>
                                                                <th>Meter Serial</th>
                                                                <th>Service Date</th>
                                                                <th>Status</th>
                                                                <th><center>Action</center></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- <div class="panel-footer"></div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- .container-fluid -->

                    </div> <!-- #page-content -->
                </div>

                <div id="modal_confirmation" class="modal fade" tabindex="-1" role="dialog"><!--modal-->
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                                <h4 class="modal-title" style="color:white;"><span id="modal_mode"> </span>Confirm Deletion</h4>
                            </div>

                            <div class="modal-body">
                                <p id="modal-body-message">Are you sure ?</p>
                            </div>

                            <div class="modal-footer">
                                <button id="btn_yes" type="button" class="btn btn-danger" data-dismiss="modal">Yes</button>
                                <button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            </div>
                        </div>
                    </div>
                </div><!---modal-->

                <div id="modal_new_connection" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color:#2ecc71;">
                                <h4 id="connection_title" class="modal-title" style="color: #ecf0f1;"><span id="modal_mode"></span></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <form id="frm_connection" role="form">
                                        <div class="">

                                            <div class="col-lg-12">
                                                <div class="col-md-6">
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-3 control-label"><strong>Service No:</strong></label>
                                                            <div class="col-xs-12 col-md-9">
                                                                <div class="input-group">
                                                                    <input type="text" name="service_no" class="form-control" placeholder="SCN-YYYYMMDD-XXXX" readonly>
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-3 control-label"><strong>Account No:</strong></label>
                                                            <div class="col-xs-12 col-md-9">
                                                                <div class="input-group">
                                                                    <input type="text" name="account_no" class="form-control" placeholder="ACN-YYYYMMDD-XXXX" readonly>
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-3 control-label"><strong><span class="red">*</span> Customer:</strong></label>
                                                            <div class="col-xs-12 col-md-9">
                                                                <select name="customer_id" id="cbo_customer" class="form-control" style="width: 100%;" required data-error-msg="Customer is required!">
                                                                    <option value="0">[ Create New Customer ]</option>
                                                                    <?php foreach($customers as $customer){?>
                                                                        <option value="<?php echo $customer->customer_id; ?>" data-address="<?php echo $customer->address; ?>" data-account-type="<?php echo $customer->customer_account_type_desc; ?>" ><?php echo $customer->customer_name; ?></option>
                                                                    <?php }?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong><span class="red">*</span> Date:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </span>
                                                                    <input type="text" name="service_date" id="service_date" class="date-picker form-control" placeholder="MM/DD/YYYY" data-error-msg="Service Date is required." required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong><span class="red">*</span> Meter Serial:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <input type="text" id="serial_no" name="serial_no" class="form-control" placeholder="Serial No" required data-error-msg="Meter Serial is required." readonly>
                                                                    <input type="hidden" name="meter_inventory_id" value="0">
                                                                    <span class="input-group-addon">
                                                                        <a href="#" id="link_browse_cu"><b>...</b></a>
                                                                        <i class="fa fa-code" id="ms_icon"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong> Account Type:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <input type="text"  name="customer_account_type_desc" id="customer_account_type" class="form-control" readonly placeholder="Account Type">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <hr><br>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="col-md-6">
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-12 control-label">
                                                                <strong><span class="red">*</span> Name to appear on receipt:</strong>
                                                            </label>
                                                            <div class="col-xs-12 col-md-12">
                                                                <div class="input-group">
                                                                    <textarea class="form-control" name="receipt_name" id="receipt_name" placeholder="Receipt Name" data-error-msg="Name on receipt is required." required></textarea>
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-12 control-label">
                                                                <strong><span class="red">*</span> Address:</strong>
                                                            </label>
                                                            <div class="col-xs-12 col-md-12">
                                                                <div class="input-group">
                                                                    <textarea class="form-control" name="address" id="address" placeholder="Customer Address" data-error-msg="Address is required." required></textarea>
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong><span class="red">*</span> Initial Reading:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                    <input type="text" name="initial_meter_reading" class="number form-control" placeholder="Meter Reading" data-error-msg="Initial Meter Reading is required." required style="text-align: right;">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong><span class="red">*</span> Initial Deposit:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                                    <input type="text" name="initial_meter_deposit" class="numeric form-control" placeholder="Meter Deposit" data-error-msg="Initial Meter Deposit is required." required style="text-align: right;">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="row bottom-10">
                                                        <label class="col-xs-12 col-md-4 control-label"><strong>
                                                            Installation:</strong></label>
                                                        <hr>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong>
                                                            Target Date:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </span>
                                                                    <input type="text" name="target_date" class="date-picker form-control" placeholder="MM/DD/YYYY" autocomplete="off">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong>Target Time:</strong></label>
                                                            
                                                            <div class="col-xs-12 col-md-8">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-clock-o"></i>
                                                                    </span>
                                                                    <input type="text" name="target_time" class="time-picker form-control" placeholder="HH:MM">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label">
                                                                <strong>Contract Type:</strong>
                                                            </label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <select name="contract_type_id" id="cbo_contract_type" class="form-control" data-error-msg="Contract Type is required!" style="width: 100%;" required>
                                                                    <?php foreach($contract_types as $contract_type) { ?>
                                                                        <option value="<?php echo $contract_type->contract_type_id; ?>"><?php echo $contract_type->contract_type_name; ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label">
                                                                <strong>Rate Type:</strong>
                                                            </label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <select name="rate_type_id" id="cbo_rate_type" class="form-control" data-error-msg="Rate Type is required!" style="width: 100%;" required>
                                                                    <?php foreach($rate_types as $rate_type) { ?>
                                                                        <option value="<?php echo $rate_type->rate_type_id; ?>"><?php echo $rate_type->rate_type_name; ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row bottom-10">
                                                        <div class="form-group">
                                                            <label class="col-xs-12 col-md-4 control-label"><strong><span class="red">*</span> Attended by:</strong></label>
                                                            <div class="col-xs-12 col-md-8">
                                                                <select name="attendant_id" id="cbo_attendant" class="form-control" data-error-msg="Attendant is required!" style="width: 100%;" required>
                                                                    <option value="0">[ Create New Attendant ]</option>
                                                                    <?php foreach($attendant as $attendant) { ?>
                                                                        <option value="<?php echo $attendant->attendant_id; ?>"><?php echo $attendant->full_name; ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btn_save" class="btn btn-primary" name="btn_save"><span></span>Save</button>
                                <button id="btn_cancel" class="btn btn-default">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>

            <div id="modal_meter_list" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false"><!--modal-->
                <div class="modal-dialog" style="width: 80%;">
                    <div class="modal-content"><!---content--->
                        <div class="modal-header ">
                            <h4 class="modal-title" style="color: white;"><span id="modal_mode"> </span>Meter Inventory List</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-offset-9 col-lg-3">
                                        Search :<br />
                                         <input type="text" id="searchbox_meter" class="form-control">
                                </div>
                            </div><br>
                            <table id="tbl_meter_list" class="table table-striped" width="100%">
                                <thead>
                                    <tr>
                                        <th>Meter Code</th>
                                        <th>Serial No</th>
                                        <th>Description</th>
                                        <th><center>Action</center></th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btn_cancel_meter" class="btn btn-default" data-dismiss="modal" style="text-transform: none;font-family: Tahoma, Georgia, Serif;">Cancel</button>
                        </div>
                    </div><!---content---->
                </div>
            </div><!---modal-->

            <div id="modal_new_customer" class="modal fade" role="dialog" style="margin-top: 0;padding-top: 0" data-backdrop="static" data-keyboard="false"><!--modal-->
                <div class="modal-dialog modal-lg" style="width: 95%;">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#2ecc71;">
                            <h4 class="modal-title" style="color:#ecf0f1;"><span id="modal_mode"> </span>Customer Information</h4>
                        </div>

                        <div class="modal-body">
                            <form id="frm_customer">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="col-md-12">
                                            Customer Code (Auto):
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-code"></i>
                                                    </span>
                                                    <input type="text" class="form-control" placeholder="YYYY-XXXXX" readonly>
                                                </div>
                                            </div>
                                        </div>  
                                        <div class="col-md-12">
                                           <b class="required">* </b> Customer Name:
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-users"></i>
                                                    </span>
                                                    <input type="text" name="customer_name" class="form-control" placeholder="Customer Name" data-error-msg="Customer Name is required!" required>
                                                </div>
                                            </div>
                                        </div>                                    
                                        <div class="col-md-12">
                                            <b class="required">* </b> Address:
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-home"></i>
                                                     </span>
                                                     <textarea name="address" class="form-control" data-error-msg="Supplier address is required!" placeholder="Address" required ></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <b class="required">* </b> Contact No :
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </span>
                                                    <input type="text" name="contact_no" id="contact_no" class="form-control" placeholder="Contact No" required data-error-msg="Contact No. is required!">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            Email Address:
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope-o"></i>
                                                    </span>
                                                    <input type="text" name="email_address" class="form-control" placeholder="Email Address">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                             Occupation :
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-users"></i>
                                                    </span>
                                                    <input type="text" name="tenant_occupation" class="form-control" placeholder="Occupation">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            Date Move In :
                                            <div class="form-group">
                                                <div class="input-group">
                                                     <span class="input-group-addon">
                                                         <i class="fa fa-calendar"></i>
                                                    </span>
                                                    <input type="text" name="date_move_in" class="date-picker form-control" value="<?php echo date('m/d/Y'); ?>" placeholder="MM/DD/YYYY">
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="col-md-4">
                                        <div class="col-md-12" >
                                            Nationality:
                                            <div style="padding: 5px 0px 5px 0px">
                                            <select name="nationality_id" id="cbo_nationality" style="width: 100%">
                                                <option value="0">None</option>
                                                <?php foreach($nationalities as $nationality){ ?>
                                                    <option value="<?php echo $nationality->nationality_id; ?>"><?php echo $nationality->nationality_name?></option>
                                                <?php } ?>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            Civil Status:
                                            <div style="padding: 5px 0px 5px 0px">
                                            <select name="civil_status_id" id="cbo_civil_status" style="width: 100%">
                                                <option value="0">None</option>
                                                <?php foreach($civils as $civil){ ?>
                                                    <option value="<?php echo $civil->civil_status_id; ?>"><?php echo $civil->civil_status_name?></option>
                                                <?php } ?>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            Sex:
                                            <div style="padding: 5px 0px 5px 0px">
                                            <select name="sex_id" id="cbo_sex" style="width: 100%">
                                                <?php foreach($sexes as $sex){ ?>
                                                    <option value="<?php echo $sex->sex_id; ?>"><?php echo $sex->sex_name?></option>
                                                <?php } ?>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <br><br>
                                                Customer Type :
                                            <div style="padding: 5px 0px 5px 0px;">
                                            <select name="customer_type_id" id="cbo_customer_type" style="width: 100%">
                                                <option value="0">None</option>
                                                <?php foreach($customer_type as $customer_type){ ?>
                                                    <option value="<?php echo $customer_type->customer_type_id; ?>"><?php echo $customer_type->customer_type_name?></option>
                                                <?php } ?>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                                Customer Account Type :
                                            <div style="padding: 5px 0px 5px 0px;">
                                            <select name="customer_account_type_id" id="cbo_customer_account_type" style="width: 100%">
                                                <?php foreach($customer_account_types as $customer_account_type){ ?>
                                                    <option value="<?php echo $customer_account_type->customer_account_type_id; ?>"><?php echo $customer_account_type->customer_account_type_desc; ?></option>
                                                <?php } ?>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            Contact Person:
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-users"></i>
                                                    </span>
                                                    <input type="text" name="contact_name" class="form-control" placeholder="Contact Person">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            Birth Date:
                                            <div class="form-group">
                                                <div class="input-group">
                                                     <span class="input-group-addon">
                                                         <i class="fa fa-calendar"></i>
                                                    </span>
                                                    <input type="text" name="tenant_birth_date" class="date-picker form-control" value="<?php echo date("m/d/Y"); ?>" placeholder="MM/DD/YYYY">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="col-md-12">
                                                TIN :
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-file-code-o"></i>
                                                    </span>
                                                    <input type="text" name="tin_no" id="tin_no" class="form-control" placeholder="TIN">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            If Married (Spouse):
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </span>
                                                    <input type="text" name="spouse_name" class="form-control" placeholder="Spouse">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            Spouse's Occupation:
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-users"></i>
                                                    </span>
                                                    <input type="text" name="spouse_occupation" class="form-control" placeholder="Occupation">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div style="padding: 5px 0px 5px 0px;">
                                            Spouse's Nationality:
                                            <select name="spouse_nationality_id" id="cbo_spouse_nationality" style="width: 100%">
                                                <option value="0">None</option>
                                                <?php foreach($nationalities as $nationality){ ?>
                                                    <option value="<?php echo $nationality->nationality_id; ?>"><?php echo $nationality->nationality_name?></option>
                                                <?php } ?>
                                            </select>
                                            </div>
                                        </div>
                                       
                                        <div class="col-md-12">
                                            <div class="col-md-12">
                                                <label class="control-label boldlabel" style="text-align:left;padding-top:10px;"><i class="fa fa-user" aria-hidden="true" style="padding-right:10px;"></i>Customer's Photo</label>
                                                <hr style="margin-top:0px !important;height:1px;background-color:black;">
                                            </div>
                                            <div style="width:100%;height:230px;border:2px solid #34495e;border-radius:5px;">
                                                <center>
                                                    <img name="img_user" id="img_user" src="assets/img/anonymous-icon.png" height="140px;" width="140px;"></img>
                                                </center>
                                                <hr style="margin-top:0px !important;height:1px;background-color:black;">
                                                <center>
                                                     <button type="button" id="btn_browse" style="width:150px;" class="btn btn-primary">Browse Photo</button>
                                                     <button type="button" id="btn_remove_photo" style="width:150px;" class="btn btn-danger">Remove</button>
                                                     <input type="file" name="file_upload[]" class="hidden">
                                                </center> 
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="modal-footer">
                            <button id="btn_save_customer" type="button" class="btn" style="background-color:#2ecc71;color:white;">Save</button>
                            <button id="btn_cancel_customer" type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </div><!---content---->
                </div>
            </div><!---modal-->

            <div id="modal_new_attendant" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color:#2ecc71;">
                                <h4 id="attendant_title" class="modal-title" style="color: #ecf0f1;"><span id="modal_mode"></span></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <form id="frm_attendant" role="form">
                                        <div class="">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="col-xs-12 col-md-4 control-label "><strong> Attendant Code :</strong></label>
                                                    <div class="col-xs-12 col-md-8">
                                                        <input type="text" class="form-control" placeholder="ATD-YYYYMMDD-XXXX" readonly>
                                                    </div>
                                                </div>
                                            </div><br><br>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="col-xs-12 col-md-4 control-label "><strong><font color="red">*</font> First name :</strong></label>
                                                    <div class="col-xs-12 col-md-8">
                                                        <input type="text" name="first_name" class="form-control" placeholder="Firstname" data-error-msg="Firstname is required!" required>
                                                    </div>
                                                </div>
                                            </div><br><br>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="col-xs-12 col-md-4 control-label "><strong>&nbsp;&nbsp;Middle name :</strong></label>
                                                    <div class="col-xs-12 col-md-8">
                                                        <input type="text" name="middle_name" class="form-control" placeholder="Middlename">
                                                    </div>
                                                </div>
                                            </div><br><br>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="col-xs-12 col-md-4 control-label "><strong><font color="red">*</font> Last name :</strong></label>
                                                    <div class="col-xs-12 col-md-8">
                                                        <input type="text" name="last_name" class="form-control" placeholder="Last name" required data-error-msg="Lastname is required!">
                                                    </div>
                                                </div>
                                            </div><br><br>
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="col-xs-12 col-md-4 control-label "><strong>Contact Number :</strong></label>
                                                    <div class="col-xs-12 col-md-8">
                                                        <input type="text" name="contact_no" id="contact_no" class="form-control" placeholder="Contact Number">
                                                    </div>
                                                </div>
                                            </div><br><br>
                                            <div class="col-xs-12">
                                                <label class="col-xs-12 col-md-4 control-label "><strong>Department :</strong></label>
                                                <div class="col-xs-12 col-md-8">
                                                    <select name="department_id" id="cbo_department" class="form-control" data-error-msg="Department is required!" style="width: 100%;">
                                                        <option value="0">[ Create New Department ]</option>
                                                        <?php foreach($departments as $department) { ?>
                                                            <option value="<?php echo $department->department_id; ?>"><?php echo $department->department_name; ?></option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btn_save_attendant" class="btn btn-primary" name="btn_save"><span></span>Save</button>
                                <button id="btn_cancel_attendant" class="btn btn-default">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="modal_new_department" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background: #2ecc71">
                                 <h2 id="department_title" class="modal-title" style="color:white;">Create New Department</h2>
                            </div>
                            <div class="modal-body">
                                <form id="frm_department" role="form" class="form-horizontal">
                                    <div class="row" style="margin: 1%;">
                                        <div class="col-lg-12">
                                            <div class="form-group" style="margin-bottom:0px;">
                                                <label class=""><font color="red">*</font> Department Name :</label>
                                                <textarea name="department_name" class="form-control" data-error-msg="Department Name is required!" placeholder="Department name" required></textarea>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="row" style="margin: 1%;">
                                        <div class="col-lg-12">
                                            <div class="form-group" style="margin-bottom:0px;">
                                                <label class="">Department Description :</label>
                                                <textarea name="department_desc" class="form-control" placeholder="Department Description"></textarea>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button id="btn_save_department" class="btn btn-primary">Save</button>
                                <button id="btn_cancel_department" class="btn btn-default">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>

                <footer role="contentinfo">
                    <div class="clearfix">
                        <ul class="list-unstyled list-inline pull-left">
                            <li><h6 style="margin: 0;">&copy; 2018 - JDEV OFFICE SOLUTION INC.</h6></li>
                        </ul>
                        <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="ti ti-arrow-up"></i></button>
                    </div>
                </footer>

                </div>
        </div>
    </div>


    <?php echo $_switcher_settings; ?>
    <?php echo $_def_js_files; ?>

    <!-- Date range use moment.js same as full calendar plugin -->
    <script src="assets/plugins/fullcalendar/moment.min.js"></script>
    <!-- Data picker -->
    <script src="assets/plugins/datapicker/bootstrap-datepicker.js"></script>

    <script src="assets/plugins/spinner/dist/spin.min.js"></script>
    <script src="assets/plugins/spinner/dist/ladda.min.js"></script>

    <script src="assets/plugins/select2/select2.full.min.js"></script>
    <script type="text/javascript" src="assets/plugins/datatables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/plugins/datatables/dataTables.bootstrap.js"></script>

    <!-- numeric formatter -->
    <script src="assets/plugins/formatter/autoNumeric.js" type="text/javascript"></script>
    <script src="assets/plugins/formatter/accounting.js" type="text/javascript"></script>

    <?php echo $_rights;?>
    <script>

    $(document).ready(function(){
        var dt; var _txnMode; var _selectedID; var _selectRowObj; var _selectRowObjMeter;
        var _cboCustomer; var _cboContractType; var _cboRateType;var _cboCustomerType; var _cboCustomerAccountType;
        var _cboNationality; var _cboCivilStatus; var _cboSex; var _cboSpouseNationality;
        var _cboAttendant; var _cboDepartment;
        
        var initializeControls=function(){
            _cboCustomer=$("#cbo_customer").select2({
                placeholder: "Please select customer.",
                allowClear: false
            });

            _cboCustomer.select2('val',null);

            _cboContractType=$("#cbo_contract_type").select2({
                minimumResultsForSearch: -1,
                allowClear: false
            });

            _cboRateType=$("#cbo_rate_type").select2({
                minimumResultsForSearch: -1,
                allowClear: false
            });    

            _cboCustomerType=$("#cbo_customer_type").select2({
                allowClear: false
            });

            _cboCustomerAccountType=$("#cbo_customer_account_type").select2({
                allowClear: false
            });

            _cboNationality=$("#cbo_nationality").select2({
                allowClear: false
            });

            _cboCivilStatus=$("#cbo_civil_status").select2({
                allowClear: false
            });

            _cboSex=$("#cbo_sex").select2({
                allowClear: false
            });
            
            _cboSpouseNationality=$("#cbo_spouse_nationality").select2({
                allowClear: false
            });     

            _cboAttendant=$("#cbo_attendant").select2({
                placeholder: "Please select attendant.",
                allowClear: false
            });     

            _cboAttendant.select2('val',null);

            _cboDepartment=$("#cbo_department").select2({
                placeholder: "Please select department.",
                allowClear: false
            });  

            _cboDepartment.select2('val',null);

            $('.numeric').autoNumeric('init');
            $('.number').autoNumeric('init', {mDec:0});

            dt=$('#tbl_connection').DataTable({
                "fnInitComplete": function (oSettings, json) {
                },
                "dom": '<"toolbar">frtip',
                "bLengthChange":false,
                "order": [[ 8, "desc" ]],
                "pageLength": 15,
                "ajax" : "ServiceConnection/transaction/list",
                "columns": [
                    {
                        "targets": [0],
                        "class":          "details-control",
                        "orderable":      false,
                        "data":           null,
                        "defaultContent": ""
                    },
                    { targets:[1],data: "service_no" },
                    { targets:[2],data: "account_no" },
                    { targets:[3],data: "receipt_name" },
                    { targets:[4],data: "serial_no" },
                    { targets:[5],data: "service_date" },
                    { targets:[6],data: "current_account_status" },
                    {
                        targets:[7],
                        render: function (data, type, full, meta){
                            return '<center>'+btn_edit_service_connection+'&nbsp;'+btn_trash_service_connection+'</center>';
                        }
                    },
                    { targets:[8],data: "connection_id", visible:false}
                ]
            });

            dt_meter=$('#tbl_meter_list').DataTable({
                "scrollY":        "300px",
                "scrollCollapse": true,
                "bLengthChange":false,
                "order": [[ 4, "desc" ]],
                "pageLength": 15,
                "ajax" : "MeterInventory/transaction/open",
                "columns": [
                    { targets:[0],data: "meter_code" },
                    { targets:[1],data: "serial_no" },
                    { targets:[2],data: "meter_description" },
                    {
                        targets:[3],
                        render: function (data, type, full, meta){
                            var btn_accept='<button class="btn btn-success btn-sm" name="accept_meter"  style="margin-left:-15px;text-transform: none;" data-toggle="tooltip" data-placement="top" title="Accept"><i class="fa fa-check"></i> Accept</button>';
                            return '<center>'+btn_accept+'</center>';
                        }
                    },
                    { targets:[4],data: "meter_inventory_id", visible:false}

                ]
            });

            $('.date-picker').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });

        }();

        var bindEventHandlers=(function(){
            var detailRows = [];

            var getCurrentDate = function(){
                var d = new Date();
                var strDate =  (d.getMonth()+1) + "/" + d.getDate() + "/" + d.getFullYear();
                return strDate;
            };

            $('#btn_cancel_meter').click(function(){
                $('#modal_new_connection').modal('show');
                $('#modal_meter_list').modal('hide');
            });

            $('#btn_cancel_customer').click(function(){
                $('#modal_new_connection').modal('show');
                $('#modal_new_customer').modal('hide');
            });

            $('#btn_cancel_attendant').click(function(){
                $('#modal_new_connection').modal('show');
                $('#modal_new_attendant').modal('hide');
            });

            $('#btn_cancel_department').click(function(){
                $('#modal_new_attendant').modal('show');
                $('#modal_new_department').modal('hide');
            });

            $('#link_browse_cu').click(function(){

                $('#modal_new_connection').modal('hide');
                $('#modal_meter_list').modal('show');

                setTimeout(function(){
                    $('#tbl_meter_list tbody').html('<tr><td colspan="4"><center><br/><img src="assets/img/loader/ajax-loader-lg.gif" /><br /><br /></center></td></tr>');
                    dt_meter.ajax.reload(); 
                },100);

            });

            _cboCustomer.on('select2:select',function(e){
                var i=$(this).select2('val');
                if(i==0){ //new customer
                    _cboCustomer.select2('val',null);
                    _cboCustomerType.select2('val', 0);
                    _cboCustomerAccountType.select2('val', 1);
                    _cboNationality.select2('val', 0);
                    _cboSpouseNationality.select2('val', 0);
                    _cboCivilStatus.select2('val', 0);
                    _cboSex.select2('val', 1);

                    $('#modal_new_customer').modal('show');
                    $('#modal_new_connection').modal('hide');
                    clearFields($('#modal_new_customer').find('form'));

                }else{
                    var obj_customer=$('#cbo_customer').find('option[value="'+i+'"]');
                    $('#receipt_name').val(obj_customer.text());
                    $('#address').val(obj_customer.data('address'));
                    $('#customer_account_type').val(obj_customer.data('account-type'));
                }
            });

            _cboAttendant.on('select2:select',function(e){
                var i=$(this).select2('val');
                if(i==0){ //new attendant

                    _cboAttendant.select2('val',null);
                    _cboDepartment.select2('val',null);
                    $('#attendant_title').text('Create New Attendant');
                    $('#modal_new_attendant').modal('show');
                    $('#modal_new_connection').modal('hide');
                    clearFields($('#modal_new_attendant').find('form'));

                }
            });            

            _cboDepartment.on('select2:select', function(){
                if (_cboDepartment.val() == 0) {
                    _cboDepartment.select2('val',null);
                    clearFields($('#frm_department'));
                    $('#modal_new_department').modal('show');
                    $('#modal_new_attendant').modal('hide');
                }
            });

            $('#tbl_meter_list > tbody').on('click','button[name="accept_meter"]',function(){
                _selectRowObjMeter=$(this).closest('tr');
                var data=dt_meter.row(_selectRowObjMeter).data();

                $('#serial_no').val(data.serial_no);
                $('input[name="meter_inventory_id"]').val(data.meter_inventory_id);

                $('#modal_meter_list').modal('hide');
                $('#modal_new_connection').modal('show');

            }); 

            $('#btn_browse').click(function(event){
                    event.preventDefault();
                    $('input[name="file_upload[]"]').click();
            });

            $('#btn_remove_photo').click(function(event){
                event.preventDefault();
                $('img[name="img_user"]').attr('src','assets/img/anonymous-icon.png');
            });

            $('input[name="file_upload[]"]').change(function(event){
                    var _files=event.target.files;
                    var data=new FormData();
                    $.each(_files,function(key,value){
                        data.append(key,value);
                    });

                    console.log(_files);

                    $.ajax({
                        url : 'Customers/transaction/upload',
                        type : "POST",
                        data : data,
                        cache : false,
                        dataType : 'json',
                        processData : false,
                        contentType : false,
                        success : function(response){
                            $('img[name="img_user"]').attr('src',response.path);
                        }
                    });
                });

                $('#tbl_connection tbody').on( 'click', 'tr td.details-control', function () {
                    var tr = $(this).closest('tr');
                    var row = dt.row( tr );
                    var idx = $.inArray( tr.attr('id'), detailRows );

                    if ( row.child.isShown() ) {
                        tr.removeClass( 'details' );
                        row.child.hide();

                        // Remove from the 'open' array
                        detailRows.splice( idx, 1 );
                    }
                    else {
                        tr.addClass( 'details' );
                        //console.log(row.data());
                        var d=row.data();

                        $.ajax({
                            "dataType":"html",
                            "type":"POST",
                            "url":"Templates/layout/connection/"+ d.connection_id,
                            "beforeSend" : function(){
                                row.child( '<center><br /><img src="assets/img/loader/ajax-loader-lg.gif" /><br /><br /></center>' ).show();
                            }
                        }).done(function(response){
                            row.child( response,'no-padding' ).show();
                            // Add to the 'open' array
                            if ( idx === -1 ) {
                                detailRows.push( tr.attr('id') );
                            }
                        });
                    }
                });            

            $("#searchbox_connection").keyup(function(){         
                dt
                    .search(this.value)
                    .draw();
            });

            $("#searchbox_meter").keyup(function(){         
                dt_meter
                    .search(this.value)
                    .draw();
            });           

            $('#btn_print').click(function(){
               window.open('ServiceConnection/transaction/print-masterfile');
            });  

            $('#btn_export').click(function(){
               window.open('ServiceConnection/transaction/export-masterfile');
            }); 

            $('#btn_new').click(function(){
                _txnMode="new";
                clearFields($('#frm_connection'));
                $('#connection_title').text('New Connection Service');
                $('#service_date').val(getCurrentDate());
                $('#modal_new_connection').modal('show');
                $('#link_browse_cu').show();
                $('#ms_icon').hide();
                _cboCustomer.select2('val',null);
                _cboAttendant.select2('val',null);
                _cboContractType.select2('val',1);
                _cboRateType.select2('val',1);
                _cboCustomer.select2("enable",true);

                $('input[name="initial_meter_reading"]').val("0");
                $('input[name="initial_meter_deposit"]').val("0.00");

            });

            $('#tbl_connection tbody').on('click','button[name="edit_info"]',function(){
                _txnMode="edit";
                _selectRowObj=$(this).closest('tr');
                var data=dt.row(_selectRowObj).data();
                _selectedID=data.connection_id;
                
                $('input,textarea').each(function(){
                    var _elem=$(this);
                    $.each(data,function(name,value){
                        if(_elem.attr('name')==name){
                            _elem.val(value);
                        }
                    });
                });

                _cboCustomer.select2('val',data.customer_id);
                _cboAttendant.select2('val',data.attendant_id);
                _cboContractType.select2('val',data.contract_type_id);
                _cboRateType.select2('val',data.rate_type_id);
                _cboCustomer.select2("enable",false);

                $('#link_browse_cu').hide();
                $('#ms_icon').show();

                $('#connection_title').text('Edit Connection Service');
                $('#modal_new_connection').modal('show');
            });

            $('#tbl_connection tbody').on('click','button[name="remove_info"]',function(){
                _selectRowObj=$(this).closest('tr');
                var data=dt.row(_selectRowObj).data();
                _selectedID=data.connection_id;

                chck_connection_service(_selectedID,'delete').done(function(response){
                    if(response.stat == "success"){
                        $('#modal_confirmation').modal('show');
                    }else{
                        showNotification(response);
                    }
                });
            });

            $('#btn_yes').click(function(){
                removeConnection().done(function(response){
                    showNotification(response);
                    if(response.stat == 'success'){
                        dt.row(_selectRowObj).remove().draw();
                    }
                    
                });
            });

            $('#btn_cancel').click(function(){
                $('#modal_new_connection').modal('hide');
            });

            $('#btn_save_customer').click(function(){
                if(validateRequiredFields($('#frm_customer'))){
                    createCustomer().done(function(response){
                        var customer=response.row_added[0];

                        $('#cbo_customer').append('<option value="'+ customer.customer_id +'" data-address="'+ customer.address +'"  data-account-type="'+customer.customer_account_type_desc+'">'+ customer.customer_name +'</option>');
                        _cboCustomer.select2('val',customer.customer_id);
                        _cboCustomer.trigger('select2:select');
                        $('#modal_new_customer').modal('hide');
                        $('#modal_new_connection').modal('show');
                        clearFields($('#frm_customer'));
                    }).always(function(){
                        showSpinningProgress($('#btn_save_customer'));
                    });
                }
            }); 

            $('#btn_save_department').click(function(){
                if(validateRequiredFields($('#frm_department'))){
                    createDepartment().done(function(response){
                        var department=response.row_added[0];

                        $('#cbo_department').append('<option value="'+ department.department_id +'">'+ department.department_name +'</option>');
                        _cboDepartment.select2('val',department.department_id);

                        $('#modal_new_department').modal('hide');
                        $('#modal_new_attendant').modal('show');
                        clearFields($('#frm_department'));
                    }).always(function(){
                        showSpinningProgress($('#btn_save_department'));
                    });
                }
            });

            $('#btn_save_attendant').click(function(){
                if(validateRequiredFields($('#frm_attendant'))){
                    createAttendant().done(function(response){
                        var attendant=response.row_added[0];

                        $('#cbo_attendant').append('<option value="'+ attendant.attendant_id +'">'+ attendant.full_name +'</option>');
                        _cboAttendant.select2('val',attendant.attendant_id);

                        $('#modal_new_attendant').modal('hide');
                        $('#modal_new_connection').modal('show');
                        clearFields($('#frm_attendant'));
                    }).always(function(){
                        showSpinningProgress($('#btn_save_attendant'));
                    });
                }
            }); 

            $('#btn_save').click(function(){
                if(validateRequiredFields($('#frm_connection'))){
                    if(_txnMode=="new"){
                        createConnection().done(function(response){
                            showNotification(response);
                            dt.row.add(response.row_added[0]).draw();
                            clearFields($('#frm_connection'));

                        }).always(function(){
                            showSpinningProgress($('#btn_save'));
                        });
                    }else{
                        updateConnection().done(function(response){
                            showNotification(response);
                            dt.row(_selectRowObj).data(response.row_updated[0]).draw();
                            clearFields($('#frm_connection'));
                        }).always(function(){
                            showSpinningProgress($('#btn_save'));
                        });
                    }
                    $('#modal_new_connection').modal('hide');
                }
            });
        })();

    var reInitializeNumeric=function(){
        $('.numeric').autoNumeric('init',{mDec: 2});
        $('.number').autoNumeric('init', {mDec:0});
    };

    var validateRequiredFields=function(f){
        var stat=true;

        $('div.form-group').removeClass('has-error');
        $('input[required],textarea[required],select[required]',f).each(function(){

                if($(this).is('select')){
                    if($(this).val()==null || $(this).val()==""){
                        showNotification({title:"Error!",stat:"error",msg:$(this).data('error-msg')});
                        $(this).closest('div.form-group').addClass('has-error');
                        $(this).focus();
                        stat=false;
                        return false;
                    }
                }else{
                if($(this).val()==""){
                    showNotification({title:"Error!",stat:"error",msg:$(this).data('error-msg')});
                    $(this).closest('div.form-group').addClass('has-error');
                    $(this).focus();
                    stat=false;
                    return false;
                }
            }
        });

        return stat;
    };

        var createCustomer=function(){
            var _dataCustomer=$('#frm_customer').serializeArray();

            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"Customers/transaction/create",
                "data":_dataCustomer,
                "beforeSend": showSpinningProgress($('#btn_save_customer'))
            });
        }

        var createConnection=function(){
            var _data=$('#frm_connection').serializeArray();

            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"ServiceConnection/transaction/create",
                "data":_data,
                "beforeSend": showSpinningProgress($('#btn_save'))
            });
        };

        var createDepartment=function(){
            var _dataDepartment=$('#frm_department').serializeArray();

            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"Departments/transaction/create",
                "data":_dataDepartment,
                "beforeSend": showSpinningProgress($('#btn_save_department'))
            });
        }

        var createAttendant=function(){
            var _data=$('#frm_attendant').serializeArray();

            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"Attendant/transaction/create",
                "data":_data,
                "beforeSend": showSpinningProgress($('#btn_save_attendant'))
            });
        };

        var updateConnection=function(){
            var _data=$('#frm_connection').serializeArray();
            _data.push({name : "connection_id" ,value : _selectedID});

            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"ServiceConnection/transaction/update",
                "data":_data,
                "beforeSend": showSpinningProgress($('#btn_save'))
            });
        };

        var removeConnection=function(){
            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"ServiceConnection/transaction/delete",
                "data":{connection_id : _selectedID}
            });
        };

        var chck_connection_service=function(connection_id,mode){

            var _data=$('#').serializeArray();
            _data.push({name : "connection_id" ,value : connection_id});
            _data.push({name : "mode" ,value : mode});

            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"ServiceConnection/transaction/chck_connection_service",
                "data":_data
            });
        }; 

        var showList=function(b){
            if(b){
                $('#div_category_list').show();
                $('#div_category_fields').hide();
            }else{
                $('#div_category_list').hide();
                $('#div_category_fields').show();
            }
        };

        var showNotification=function(obj){
            PNotify.removeAll();
            new PNotify({
                title:  obj.title,
                text:  obj.msg,
                type:  obj.stat
            });
        };

        var showSpinningProgress=function(e){
            $(e).find('span').toggleClass('glyphicon glyphicon-refresh spinning');
            $(e).toggleClass('disabled');
        };

        var clearFields=function(frm){
            $('input[required],input,textarea',frm).val('');
            $('form').find('input:first').focus();
        };

        function format ( d ) {
            return '<br /><table style="margin-left:10%;width: 80%;">' +
            '<thead>' +
            '</thead>' +
            '<tbody>' +
            '<tr>' +
            '<td>Category Name : </td><td><b>'+ d.category_name+'</b></td>' +
            '</tr>' +
            '<tr>' +
            '<td>Category Description : </td><td>'+ d.category_desc+'</td>' +
            '</tr>' +
            '</tbody></table><br />';
        };
    });

    </script>

    </body>

</html>