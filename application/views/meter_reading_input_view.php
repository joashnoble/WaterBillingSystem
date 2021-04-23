<!DOCTYPE html>
<html lang="en">
<!-- Mirrored from avenxo.kaijuthemes.com/ui-typography.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 06 Jun 2016 12:09:25 GMT -->
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
    <link type="text/css" href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/datatables/dataTables.themify.css" rel="stylesheet">
    <link href="assets/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="assets/plugins/select2/select2.min.css" rel="stylesheet">
    <!--/twitter typehead-->
    <link href="assets/plugins/twittertypehead/twitter.typehead.css" rel="stylesheet">
    <style>
        #span_invoice_no{
            min-width: 50px;
        }
        #span_invoice_no:focus{
            border: 3px solid orange;
            background-color: yellow;
        }
        .alert {
            border-width: 0;
            border-style: solid;
            padding: 24px;
            margin-bottom: 32px;
        }
        .alert-danger, .alert-danger h1, .alert-danger h2, .alert-danger h3, .alert-danger h4, .alert-danger h5, .alert-danger h6, .alert-danger small {
            color: #E9EDEF;
        }
        .alert-danger {
            color: #E9EDEF;
            background-color: #f9bdbb;
            border-color: #e84e40;
        }
        .toolbar{
            float: left;
        }
        td.details-control {
            background: url('assets/img/print.png') no-repeat center center;
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
        .select2-container{
            min-width: 100%;
            z-index: 9999999999;
        }
        .dropdown-menu > .active > a,.dropdown-menu > .active > a:hover{
            background-color: dodgerblue;
        }
        @keyframes spin {
            from { transform: scale(1) rotate(0deg); }
            to { transform: scale(1) rotate(360deg); }
        }
        @-webkit-keyframes spin2 {
            from { -webkit-transform: rotate(0deg); }
            to { -webkit-transform: rotate(360deg); }
        }
        .custom_frame{
            border: 1px solid lightgray;
            margin: 1% 1% 1% 1%;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
        .numeric{
            text-align: right;
        }

        #tbl_items .form-control[readonly]{
            background-color: transparent;
            border: 0;
        }
        #tbl_meter_input_filter{
                display: none;
        }
        button[name="update_item"] {
            font-size: 15px!important;
            padding-top: 6px!important;
            padding-right: 10px!important;
            padding-bottom: 6px!important;
            padding-left: 10px!important;
        }

    </style>
</head>

<body class="animated-content"  style="font-family: tahoma;">
<?php echo $_top_navigation; ?>
<div id="wrapper">
<div id="layout-static">
<?php echo $_side_bar_navigation;
?>
<div class="static-content-wrapper white-bg">
<div class="static-content"  >
<div class="page-content"><!-- #page-content -->
<ol class="breadcrumb"  style="margin-bottom: 0;">
    <li><a href="Dashboard">Dashboard</a></li>
    <li><a href="Meter_reading_input">Meter Reading Input</a></li>
</ol>
<div class="container-fluid">
<div data-widget-group="group1">
<div class="row">
<div class="col-md-12">
<div id="div_meter_reading_list">
    <div class="panel panel-default">
        <div class="panel-body table-responsive">
            <div class="row panel-row">
             <h2 class="h2-panel-heading">Meter Reading Input</h2><hr>
             <div class="row">
                <div class="col-lg-3"><br>
                    <button class="btn btn-success create_meter_reading_entry" id="btn_new" style="text-transform: none;font-family: Tahoma, Georgia, Serif;"  title="Record New Batch" ><i class="fa fa-plus"></i> Record New Batch</button>
                </div>
                <div class="col-lg-offset-6 col-lg-3">
                    Search :<br />
                     <input type="text" id="searchbox_reading" class="form-control">
                </div>
                </div><br>           
                <table id="tbl_meter_input" class="table table-striped"  cellspacing="0" width="100%" style="">
                <thead class="">
                <tr>
                    <th></th>
                    <th>Batch No</th>
                    <th>Year</th>
                    <th>Month</th>
                    <th>Input Date</th>
                    <th width="20%">Created By</th>
                    <th><center>Action</center></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            </div>
        </div>
        <!-- <div class="panel-footer"></div> -->
    </div>
</div>
<div id="div_meter_reading_fields" style="display: none;">
    <div class="panel panel-default" style="">
        <div class="panel-body">
        <div class="row panel-row" >
            <form id="frm_meter_reading_input" role="form" class="form-horizontal">
                <h2 class="h2-panel-heading">Meter Reading Input <small id="span_invoice_no" ></small></h2>
                <div>
                <hr>
                    <div class="row">
                        <div class="col-sm-4">
                            <b class="required">*</b><label>Billing Period :</label> <br />
                            <select name="meter_reading_period_id" id="cbo_period" data-error-msg="Meter Reading Period is required." required>
                                <?php foreach($periods as $period){ ?>
                                    <option value="<?php echo $period->meter_reading_period_id; ?>" data-start="<?php echo $period->meter_reading_period_start; ?>" data-end="<?php echo $period->meter_reading_period_end; ?>"
                                        <?php if($period->is_closed == 1){ echo 'disabled'; }?>><?php echo $period->month_name; ?> <?php echo $period->meter_reading_year; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <b class="required">*</b><label> Start Date :</label> <br />
                            <input type="text"  class="form-control" id="start_date" readonly>
                        </div>
                        <div class="col-sm-2">
                            <b class="required">*</b><label> End Date :</label> <br />
                            <input type="text"  class="form-control" id="end_date" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <b class="required">* </b><label>Input Date :</label> <br />
                            <div class="input-group">
                                <input type="text" name="date_input" id="invoice_default" class="date-picker form-control" value="<?php echo date("m/d/Y"); ?>" placeholder="Date Input" data-error-msg="Please set the date !" required>
                                 <span class="input-group-addon">
                                     <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div><hr>
            <label class="control-label" style="font-family: Tahoma;"><strong>Enter Account Number or Customer Name :</strong></label>
            <button id="refreshlist" class="btn-primary btn pull-right" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;"><span class=""></span>  Refresh</button>
            <div id="custom-templates">
                <input class="typeahead" type="text" placeholder="Enter Account Number or Customer Name">
            </div><br />
            <form id="frm_items">
                <div class="table-responsive">
                    <table id="tbl_items" class="table table-striped" cellspacing="0" width="100%" style="font-font:tahoma;">
                        <thead class="">    
                        <tr>
                            <th style="display: none;">Connection ID</th>
                            <th style="width: 15%">Account No</th>
                            <th style="">Customer Name</th>
                            <th style="width: 10%;">Meter Serial</th>
                            <th style="width:10%;">Previous Month</th>
                            <th style="text-align: right;width: 7%;">Previous</th>
                            <th style="text-align: right;width: 7%;">Current</th>
                            <th style="text-align: right;width: 7%;">Consumption</th>
                            <th style="width: 10%"><center>Action</center></th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

        <form id="frm_remarks">
        <div class="row">
            <div class="container-fluid">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><br />
                <div class="row">
                <hr>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label control-label><strong>Remarks :</strong></label>
                        <div class="col-lg-12" style="padding: 0%;">
                            <textarea name="remarks" id="remarks" class="form-control" placeholder="Remarks"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        </form>
        <br />
    </div>
    <div class="panel-footer" >
        <div class="row">
            <div class="col-sm-12">
                <button id="btn_save" class="btn-primary btn" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;"><span class=""></span>Save Changes</button>
                <button id="btn_cancel" class="btn-default btn" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;">Cancel</button>
            </div>
        </div>
    </div>
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
            <div class="modal-header ">
                <button type="button" class="close"   data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title" style="color:white;"><span id="modal_mode"> </span>Confirm Deletion</h4>
            </div>
            <div class="modal-body">
                <p id="modal-body-message">Are you sure you want to delete?</p>
            </div>
            <div class="modal-footer">
                <button id="btn_yes" type="button" class="btn btn-danger" data-dismiss="modal" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;">Yes</button>
                <button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;">No</button>
            </div>
        </div>
    </div>
</div><!---modal-->

<div id="modal_update_item" class="modal fade" tabindex="-1" role="dialog"><!--modal-->
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header ">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title" style="color:white;"><span id="modal_mode"> </span>Confirm Update</h4>
            </div>
            <div class="modal-body">
                <p id="modal-body-message">Are you sure you want to update this reading?</p>
            </div>
            <div class="modal-footer">
                <button id="btn_update_item" type="button" class="btn btn-success" data-dismiss="modal" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;">Yes</button>
                <button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal" style="text-transform: capitalize;font-family: Tahoma, Georgia, Serif;">No</button>
            </div>
        </div>
    </div>
</div><!---modal-->

<footer role="contentinfo">
    <div class="clearfix">
        <ul class="list-unstyled list-inline pull-left">
            <li><h6 style="margin: 0;">&copy; 2017 - JDEV IT BUSINESS SOLUTION</h6></li>
        </ul>
        <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="ti ti-arrow-up"></i></button>
    </div>
</footer>
</div>
</div>
</div>
<?php echo $_switcher_settings; ?>
<?php echo $_def_js_files; ?>
<script src="assets/plugins/spinner/dist/spin.min.js"></script>
<script src="assets/plugins/spinner/dist/ladda.min.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/ellipsis.js"></script>
<!-- Date range use moment.js same as full calendar plugin -->
<script src="assets/plugins/fullcalendar/moment.min.js"></script>
<!-- Data picker -->
<script src="assets/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- Select2 -->
<script src="assets/plugins/select2/select2.full.min.js"></script>
<!-- twitter typehead -->
<script src="assets/plugins/twittertypehead/handlebars.js"></script>
<script src="assets/plugins/twittertypehead/bloodhound.min.js"></script>
<script src="assets/plugins/twittertypehead/typeahead.bundle.js"></script>
<script src="assets/plugins/twittertypehead/typeahead.jquery.min.js"></script>
<!-- touchspin -->
<script type="text/javascript" src="assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"></script>
<!-- numeric formatter -->
<script src="assets/plugins/formatter/autoNumeric.js" type="text/javascript"></script>
<script src="assets/plugins/formatter/accounting.js" type="text/javascript"></script>

<?php echo $_rights; ?>
<script>
$(document).ready(function(){
    var dt; var _txnMode; var _selectedID; var _selectRowObj; var _cboPeriod; var meterins; var _meter_reading_input_id_for_validation;
    var _id;
    var _current_reading;
    var _total_consumption;

    var yearNow = new Date().getFullYear();
    var monthNow = new Date().getMonth() + 1;
    var _currentMeterPeriod;
    var oTableItems={
        connection_id : 'td:eq(0)',
        previous_reading : 'td:eq(5)',
        current_reading : 'td:eq(6)',
        total_consumption : 'td:eq(7)'

    };
    var oTableDetails={
        total_after_discount : 'tr:eq(0) > td:eq(1)',
        total : 'tr:eq(1) > td:eq(1)'
    };
    var initializeControls=function(){
        dt=$('#tbl_meter_input').DataTable({
            "dom": '<"toolbar">frtip',
            "bLengthChange":false,
            "order": [[ 7, "desc" ]],
            "ajax" : "Meter_reading_input/transaction/list",
            "language": {
                "searchPlaceholder":"Search Invoice"
            },
            "columns": [
                {
                    "targets": [0],
                    "class":          "details-control",
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": ""
                },
                { targets:[1],data: "batch_no" },
                { targets:[2],data: "meter_reading_year" },
                { targets:[3],data: "month_name" },
                { targets:[4],data: "date_input" },
                { targets:[5],data: "posted_by",render: $.fn.dataTable.render.ellipsis(60)},
                {
                    targets:[6],
                    render: function (data, type, full, meta){
                        return '<center>'+btn_edit_meter_reading_entry+"&nbsp;"+btn_trash_meter_reading_entry+'</center>';
                    }
                },
                { targets:[7],data: "meter_reading_input_id",visible:false },
            ]
        });

        _cboPeriod=$("#cbo_period").select2({
            placeholder: "Please Select Billing Period.",
            allowClear: false
        });

        $('.number').autoNumeric('init',{mDec:0});
        $('.date-picker').datepicker({
            startDate: new Date(yearNow, (monthNow-1), 1),
            endDate: new Date(yearNow, (monthNow-1)+1,0),
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

        $('#custom-templates .typeahead').keypress(function(event){
            if (event.keyCode == 13) {
                $('.tt-suggestion:first').click();
            }
        });

        meterins = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('account_no','serial_no','receipt_name','serial_no_2'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local : meterins
        });
        var _objTypeHead=$('#custom-templates .typeahead');
        _objTypeHead.typeahead(null, {
        name: 'meterins',
        display: 'account_no',
        source: meterins,  // edit this , this must be the same as the var meterins declared in the new BLoodhound
        templates: {
            header: [
                '<table class="tt-head"><tr><td width=20%" style="padding-left: 1%;"><b>Account No</b></td><td width="20%" align="left"><b>Meter Serial</b></td><td width="60%" align="left" style="padding-right: 2%;"><b>Customer Name</b></td></tr></table>'
            ].join('\n'),
            suggestion: Handlebars.compile('<table class="tt-items"><tr><td width="20%" style="padding-left: 1%;">{{account_no}}</td><td width="20%" align="left">{{serial_no}}</td><td width="60%" align="left" style="padding-right: 2%;">{{receipt_name}}</td></tr></table>')
        }
        }).on('keyup', this, function (event) {
            if (_objTypeHead.typeahead('val') == '') {
                return false;
            }
            if (event.keyCode == 13) {
                //$('.tt-suggestion:first').click();
                _objTypeHead.typeahead('close');
                _objTypeHead.typeahead('val','');
            }
        }).bind('typeahead:select', function(ev, suggestion) {

            if(_cboPeriod.val() == '' || _cboPeriod.val() == null){
                showNotification({title: 'Meter Reading Period' ,stat:"error",msg: "Please select a Meter Reading Period before proceeding."});
                return;
            }

            if(!(checkAccount(suggestion.connection_id))){ // Checks if item is already existing in the Table of Items for invoice
                showNotification({title: suggestion.account_no,stat:"error",msg: "Account is Already Added."});
                return;
            }

            $('#tbl_items > tbody').append(newRowItem({
                connection_id : suggestion.connection_id,
                account_no : suggestion.account_no,
                customer_name : suggestion.receipt_name,
                serial_no : suggestion.serial_no,
                previous_month : suggestion.previous_month,
                previous_reading : suggestion.previous_reading,
                current_reading : '',
                total_consumption : 0,
                payment_count : 0,
                meter_reading_input_item_id : 0,
                btnRemoveAttr: "",
                btnUpdateAttr: "hidden",
                inputCurrentAttr: ""
            }));
            reInitializeNumeric();
            // $('#tbl_items > tbody > tr:last').find('.current').val('').focus();
            $('#custom-templates .typeahead').val('');
            checkTableLength();
        });
        $('div.tt-menu').on('click','table.tt-suggestion',function(){
            _objTypeHead.typeahead('val','');
        });
        $("input#touchspin4").TouchSpin({
            verticalbuttons: true,
            verticalupclass: 'fa fa-fw fa-plus',
            verticaldownclass: 'fa fa-fw fa-minus'
        });
    }();
    var bindEventHandlers=(function(){
        var detailRows = [];

        $("#searchbox_reading").keyup(function(){         
            dt
                .search(this.value)
                .draw();
        });

        $('#tbl_meter_input tbody').on( 'click', 'tr td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = dt.row( tr );
            var idx = $.inArray( tr.attr('id'), detailRows );                
                var d=row.data();
                window.open("Templates/layout/meter-reading-input-dropdown/"+ d.meter_reading_input_id+"?type=html");
        } );

        $('#btn_cancel').click(function(){
        showList(true);
    });

        $('#btn_new').click(function(){
            _txnMode="new";
            clearFields($('#div_meter_reading_fields'));
            $('#span_invoice_no').html('| BCH-YYYYMM-XXXX');
            _cboPeriod.select2('val',null);
            showList(false);
            $('#tbl_items > tbody').html('');
            $('#img_user').attr('src','assets/img/anonymous-icon.png');
            $('#total_amount').html('0.00');
            $('#txt_total_overall_discount').val('0.00');
            $('#txt_total_overall_discount_amount').val('0.00');
            $('#invoice_default').datepicker('setDate', 'today');
            $('#due_default').datepicker('setDate', 'today');
            $('#btn_save').attr('disabled', false);
            _meter_reading_input_id_for_validation = 0; // FOR VALIDATION
            // getMeterInputs().done(function(data){
            //     meterins.clear();
            //     meterins.local = data.data;
            //     meterins.initialize(true);
            //     countaccountlist = data.data.length;
            //         if(countaccountlist > 100){
            //         showNotification({title:"Success !",stat:"success",msg:"Accounts List successfully updated."});
            //         }

            // }).always(function(){  });
            _cboPeriod.select2("enable",true);
        });

        _cboPeriod.on('select2:select', function(){
            var i=$(this).select2('val');
            _currentMeterPeriod = $(this).select2('val'); // SET CURRENT METER READING PERIOD TO GET ALL ACCOUNTS
            var obj_period=$('#cbo_period').find('option[value="' + i + '"]');
            $('#start_date').val(obj_period.data('start'));
            $('#end_date').val(obj_period.data('end'));
            getMeterInputs().done(function(data){
                meterins.clear();
                meterins.local = data.data;
                meterins.initialize(true);
                countaccountlist = data.data.length;
                showNotification({title:"Success !",stat:"success",msg:"Accounts List successfully updated."});
                    // if(countaccountlist > 100){
                    // showNotification({title:"Success !",stat:"success",msg:"Accounts List successfully updated."});
                    // }

            }).always(function(){  });


        });

        $('#tbl_meter_input tbody').on('click','button[name="edit_info"]',function(){
            ///alert("ddd");
            _txnMode="edit";
            _selectRowObj=$(this).closest('tr');
            var data=dt.row(_selectRowObj).data();
            _selectedID=data.meter_reading_input_id;
            _meter_reading_input_id_for_validation=data.meter_reading_input_id;
            $('#span_invoice_no').html('| '+data.batch_no);
            $('input,textarea').each(function(){
                var _elem=$(this);
                $.each(data,function(name,value){
                    if(_elem.attr('name')==name&&_elem.attr('type')!='password'){
                        _elem.val(value);
                    }
                });
            });
            _cboPeriod.select2('val',data.meter_reading_period_id);
            if(data.is_closed == 1){  showNotification({title:"Billing Period Closed !",stat:"info",msg:"You cannot modify this batch of inputs."}); }
            if(data.is_sent == '1' || data.is_closed == '1'){ $('#btn_save').attr('disabled', true); }else{ $('#btn_save').attr('disabled', false);}
            var obj_period=$('#cbo_period').find('option[value="' + data.meter_reading_period_id + '"]');
            $('#start_date').val(obj_period.data('start'));
            $('#end_date').val(obj_period.data('end'));
            _cboPeriod.select2("enable",false);

            check_meter_reading_payments(data.meter_reading_input_id).done(function(response){
                var data = response.data;
            
                if(data.length > 0){
                    showNotification({title:"Active Payment !",stat:"info",msg:"There is an active payment for this Meter Reading."});
                    // $('#btn_save').attr('disabled', true);
                }
                // else{
                //     $('#btn_save').attr('disabled', false);
                // }

            });

            $.ajax({
                url : 'Meter_reading_input/transaction/items-input/'+data.meter_reading_input_id,
                type : "GET",
                cache : false,
                dataType : 'json',
                processData : false,
                contentType : false,
                beforeSend : function(){
                    $('#tbl_items > tbody').html('<tr><td align="center" colspan="8"><br /><img src="assets/img/loader/ajax-loader-sm.gif" /><br /><br /></td></tr>');
                },
                success : function(response){
                    var rows=response.data;
                    $('#tbl_items > tbody').html('');

                    $.each(rows,function(i,value){

                        var btnRemoveAttr = "";
                        var btnUpdateAttr = "";
                        var inputCurrentAttr = "";

                        if (value.payment_count > 0){
                            btnRemoveAttr = "hidden";
                            btnUpdateAttr = "hidden";
                            inputCurrentAttr = "readonly";
                        }

                        $('#tbl_items > tbody').append(newRowItem({
                            connection_id : value.connection_id,
                            account_no : value.account_no,
                            customer_name : value.receipt_name,
                            serial_no : value.serial_no,
                            previous_month : value.previous_month,
                            previous_reading : value.previous_reading,
                            current_reading : value.current_reading,
                            total_consumption : value.total_consumption,
                            meter_reading_input_item_id : value.meter_reading_input_item_id,
                            payment_count : value.payment_count,
                            btnRemoveAttr : btnRemoveAttr,
                            btnUpdateAttr : btnUpdateAttr,
                            inputCurrentAttr : inputCurrentAttr

                        }));

                    });



                   reInitializeNumeric();
                }

            });
            _currentMeterPeriod = data.meter_reading_period_id; // SET CURRENT METER READING PERIOD TO GET ALL ACCOUNTS
            getMeterInputs().done(function(data){
                meterins.clear();
                meterins.local = data.data;
                meterins.initialize(true);
                countaccountlist = data.data.length;
                    if(countaccountlist > 100){
                    showNotification({title:"Success !",stat:"success",msg:"Accounts List successfully updated."});
                    }

            }).always(function(){  });
            showList(false);
            checkTableLength();
        });

         $('#refreshlist').click(function(){
            getMeterInputs().done(function(data){
                meterins.clear();
                meterins.local = data.data;
                meterins.initialize(true);
                    showNotification({title:"Success !",stat:"success",msg:"Accounts List successfully updated."});
            }).always(function(){
                $('#custom-templates .typeahead').val('');
                });
         });


        $('#tbl_meter_input tbody').on('click','button[name="remove_info"]',function(){
            _selectRowObj=$(this).closest('tr');
            var data=dt.row(_selectRowObj).data();
            _selectedID=data.meter_reading_input_id;

            if(data.is_sent == '1'){ 
                showNotification({title:"Cannot Delete!",stat:"error",msg:"Batch already sent to Accounting."});
            }else if(data.is_closed == 1){  
                showNotification({title:"Billing Period Closed !",stat:"info",msg:"You cannot delete this batch of inputs."}); 
            }else if(data.is_processed == 1){  
                showNotification({title:"Billing Period Already Processed !",stat:"info",msg:"You cannot delete this batch of inputs."}); 
            } else {  
                $('#modal_confirmation').modal('show'); 
            }
        });

        $('#tbl_items tbody').on('keyup','input.numeric,input.number',function(){
            var row=$(this).closest('tr');
            var previous_reading=parseFloat(accounting.unformat(row.find(oTableItems.previous_reading).find('input.number').val()));
            var current_reading=parseFloat(accounting.unformat(row.find(oTableItems.current_reading).find('input.number').val()));

            
            if(current_reading < previous_reading){
                 $(oTableItems.total_consumption,row).find('input.number').val(accounting.formatNumber(total_consumption,0));
            }else{
                var total_consumption=current_reading-previous_reading;
                $(oTableItems.total_consumption,row).find('input.number').val(accounting.formatNumber(total_consumption,0)); // line total amount
            }
        });

        $('#tbl_items tbody').on('keypress','input.current',function(){
        if (event.keyCode == 13) {
                $('#custom-templates .typeahead').val('');
                $('#custom-templates .typeahead').focus();
            }

        });

        $('#btn_yes').click(function(){
            removeMeterInput().done(function(response){
                showNotification(response);
                if(response.stat=="success"){
                    dt.row(_selectRowObj).remove().draw();
                }
            });
        });

        $('#btn_save').click(function(){
            if(!(checkTable())){ // Checks if item is already existing in the Table of Items for invoice
                showNotification({title: 'Error !' ,stat:"error",msg: "Current Consumption is less than the Previous Consumption."});
                return;
            }
            if(!(checkTransaction())){ // Checks if item is already existing in the Table of Items for invoice
                return;
            }

            if(validateRequiredFields($('#frm_meter_reading_input'))){
                if(_txnMode=="new"){
                    createMeterInput().done(function(response){
                        showNotification(response);
                        dt.row.add(response.row_added[0]).draw();
                        clearFields($('#frm_meter_reading_input'));
                        showList(true);
                    }).always(function(){
                        showSpinningProgress($('#btn_save'));
                    });
                }else{
                    updateMeterInput().done(function(response){
                        showNotification(response);
                        if(response.stat == 'success'){
                            dt.row(_selectRowObj).data(response.row_updated[0]).draw();
                            clearFields($('#frm_meter_reading_input'));
                            showList(true);
                        }
                    }).always(function(){
                        showSpinningProgress($('#btn_save'));
                    });
                }
            }
        });
    
        $('#tbl_items > tbody').on('click','button[name="remove_item"]',function(){
            $(this).closest('tr').remove();
            checkTableLength();
        });


        $('#tbl_items > tbody').on('click','button[name="update_item"]',function(){
            _id = $(this).data('id');
            var row = $(this).closest('tr');

            _current_reading=parseFloat(accounting.unformat(row.find(oTableItems.current_reading).find('input.number').val()));
            _total_consumption=parseFloat(accounting.unformat(row.find(oTableItems.total_consumption).find('input.number').val()));    
            $('#modal_update_item').modal('show');

        });


        $('#btn_update_item').on('click', function(){
            updateMeterReading(_id,_current_reading,_total_consumption).done(function(response){

                if(response.stat=="success"){
                    showNotification(response);
                    clearFields($('#frm_meter_reading_input'));
                    showList(true);
                }

            });
        });

    })();
    var validateRequiredFields=function(f){
        var stat=true;
        $('div.form-group').removeClass('has-error');
        $('input[required],textarea[required],select[required]',f).each(function(){
                if($(this).is('select')){
                    if($(this).val()==0 || $(this).val()==null || $(this).val()==undefined || $(this).val()==""){
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

    var getMeterInputs=function(){
       return $.ajax({
           "dataType":"json",
           "type":"POST",
           "data":{meter_reading_period_id : _currentMeterPeriod},
           "url":"Meter_reading_input/transaction/list-inputs",
           "beforeSend": function(){
                countinputs = meterins.local.length;
                if(countinputs > 100){
                    showNotification({title:"Please Wait !",stat:"info",msg:"Refreshing your Accounts List."});
                }
           }
      });
    };

    var check_meter_reading_payments=function(meter_reading_input_id){
        var _data=$('#').serializeArray();
        _data.push({name : "meter_reading_input_id" ,value : meter_reading_input_id});
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Meter_reading_input/transaction/check-meter-payment", // edit this
            "data":_data
        });
    };

    var createMeterInput=function(){
        var _data=$('#frm_meter_reading_input,#frm_items,#frm_remarks').serializeArray();
        _data.push({name : "meter_reading_period_id" ,value : _cboPeriod.val()});
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Meter_reading_input/transaction/create-batch", // edit this
            "data":_data,
            "beforeSend": showSpinningProgress($('#btn_save'))
        });
    };
    var updateMeterInput=function(){
        var _data=$('#frm_meter_reading_input,#frm_items,#frm_remarks').serializeArray();
        _data.push({name : "meter_reading_input_id" ,value : _selectedID});
        _data.push({name : "meter_reading_period_id" ,value : _cboPeriod.val()});
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Meter_reading_input/transaction/update-batch",
            "data":_data,
            "beforeSend": showSpinningProgress($('#btn_save'))
        });
    };

    var updateMeterReading=function(id, current_reading, total_consumption){
        var _data=$('#').serializeArray();
        _data.push({name : "meter_reading_input_item_id" ,value : id});
        _data.push({name : "current_reading" ,value : current_reading});
        _data.push({name : "total_consumption" ,value : total_consumption});

        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Meter_reading_input/transaction/update-reading",
            "data":_data
        });
    };

    var removeMeterInput=function(){
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Meter_reading_input/transaction/delete",
            "data":{meter_reading_input_id : _selectedID}
        });
    };
    var showList=function(b){
        if(b){
            $('#div_meter_reading_list').show();
            $('#div_meter_reading_fields').hide();
            $('.datepicker.dropdown-menu').hide();
        }else{
            $('#div_meter_reading_list').hide();
            $('#div_meter_reading_fields').show();
        }
    };
    var showNotification=function(obj){
        PNotify.removeAll(); //remove all notifications
        new PNotify({
            title:  obj.title,
            text:  obj.msg,
            type:  obj.stat
        });
    };

    var showSpinningProgress=function(e){
        $(e).find('span').toggleClass('glyphicon glyphicon-refresh spinning');
    };
    var clearFields=function(f){
        $('input,textarea,select,input:not(.date-picker)',f).val('');
        $('#remarks').val('');
        $(f).find('input:first').focus();
    };

    var checkAccount= function(check_id){
        var accstat=true;
        var rowcheck=$('#tbl_items > tbody tr');
        $.each(rowcheck,function(){
            item = parseFloat(accounting.unformat($(oTableItems.connection_id,$(this)).find('input.conn').val()));
            if(check_id == item){
                accstat=false;
                return false;
            }
        });
         return accstat;    
    };

    var checkTable= function(){
        var tblstat=true;
        var rowcheck=$('#tbl_items > tbody tr');
        $.each(rowcheck,function(){
            prev = parseFloat(accounting.unformat($(oTableItems.previous_reading,$(this)).find('input.number').val()));
            curr = parseFloat(accounting.unformat($(oTableItems.current_reading,$(this)).find('input.number').val()));
            if(curr < prev){
                tblstat=false;
                return false;
            }
        });
         return tblstat;    
    };

    var checkTableLength= function(){
        if(_txnMode=="new"){
            var rowtable=$('#tbl_items > tbody tr');
            if(rowtable.length > 0){
                _cboPeriod.select2("enable",false);
            }else{
                _cboPeriod.select2("enable",true);
            }
        }
        
    };

    var checkTransaction= function(){
        var tbltranstat=true;
        var rowcheck=$('#tbl_items > tbody tr');
        meter_reading_period_id = _cboPeriod.val();
        $.each(rowcheck,function(){
            connection_id = parseFloat(accounting.unformat($(oTableItems.connection_id,$(this)).find('input.number').val()));
                $.ajax({
                    "dataType":"json",
                    "type":"POST",
                    "async": false,
                    "url":"Meter_reading_input/transaction/check-transaction",
                    "data":{'connection_id' : connection_id , 'meter_reading_period_id' : meter_reading_period_id, 'meter_reading_input_id': _meter_reading_input_id_for_validation},
                    "beforeSend" : function(){
                    }
                }).done(function(response){
                    if(response.stat=="error"){
                        showNotification({title: 'Error !' ,stat:"error",msg: response.account_no+" already Exists in "+ response.batch_no});
                        tbltranstat=false;
                        return false;
                    }
                });
            if(tbltranstat == false ){ // SINCE AJAX IS ASYNC - WELL MAKE SURE THAT WHEN ERROR COMES, IT WILL END THE FOREACH IMMEDIATELY
                return false
            }
        });
         return tbltranstat;    
    };


    var getFloat=function(f){
        return parseFloat(accounting.unformat(f));
    };

    var newRowItem=function(d){
        return '<tr>'+
        '<td style="display:none;"><input name="connection_id[]" type="text" class="number form-control conn" value="'+d.connection_id+'" style="text-align:right;" readonly></td>'+
        '<td><input type="text" class="form-control" value="'+d.account_no+'" readonly></td>'+
        '<td><input type="text" class="form-control" value="'+d.customer_name +'" readonly></td>'+
        '<td><input type="text" class="form-control" value="'+d.serial_no +'" readonly></td>'+
        '<td><input type="text" name="previous_month[]" class="form-control" value="'+d.previous_month +'" readonly></td>'+
        '<td><input type="text" name="previous_reading[]" class="number form-control" value="'+ d.previous_reading+'" style="text-align:right;" readonly></td>'+
        '<td><input type="text" name="current_reading[]" class="number form-control current" value="'+ d.current_reading+'" style="text-align:right;" '+d.inputCurrentAttr+'></td>'+
        '<td><input type="text" name="total_consumption[]" class="number form-control" value="'+ d.total_consumption+'" style="text-align:right;" readonly></td>'+
        '<td align="center"><button type="button" name="update_item" data-id="'+d.meter_reading_input_item_id+'" class="btn btn-success '+d.btnUpdateAttr+'"><i class="fa fa-save"></i></button><button type="button" name="remove_item" class="btn btn-red '+d.btnRemoveAttr+'"><i class="fa fa-trash"></i></button></td>'+
        '</tr>';
    };

    var reInitializeNumeric=function(){
        $('.number').autoNumeric('init',{mDec:0});
    };

});
</script>
</body>
</html>