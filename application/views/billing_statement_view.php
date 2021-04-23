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
    <link type="text/css" href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/datatables/dataTables.themify.css" rel="stylesheet">
    <link href="assets/plugins/select2/select2.min.css" rel="stylesheet">
    <style>
        .toolbar{
            float: left;
        }

        td.details-control {
            background: url('assets/img/Folder_Closed.png') no-repeat center center;
            cursor: pointer;
        }
        td.details-control-print {
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

        @keyframes spin {
            from { transform: scale(1) rotate(0deg); }
            to { transform: scale(1) rotate(360deg); }
        }

        @-webkit-keyframes spin2 {
            from { -webkit-transform: rotate(0deg); }
            to { -webkit-transform: rotate(360deg); }
        }

        #tbl_billing_filter, #tbl_account_list_filter{
                display: none;
        }

        label{
            font-weight: normal;
        }

        div.dataTables_processing{ 
        position: absolute!important; 
        top: 0%!important; 
        right: -45%!important; 
        left: auto!important; 
        width: 100%!important; 
        height: 40px!important; 
        background: none!important; 
        background-color: transparent!important; 
        } 
    </style>

</head>

<body class="animated-content">

<?php echo $_top_navigation; ?>

<div id="wrapper">
    <div id="layout-static">

        <?php echo $_side_bar_navigation;?>

        <div class="static-content-wrapper white-bg custom-background">
            <div class="static-content"  >
                <div class="page-content"><!-- #page-content -->
                    <ol class="breadcrumb transparent-background" style="margin: 0;">
                        <li><a href="dashboard">Dashboard</a></li>
                        <li><a href="Billing_statement">Billing Statement</a></li>
                    </ol>
                    <div class="container-fluid">
                        <div data-widget-group="group1">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="div_reconnection_list">
                                        <div class="panel panel-default">
                                            <div class="panel-body table-responsive" style="overflow-x: hidden;">
                                            <h2 class="h2-panel-heading">Billing Statement</h2><hr>
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <label> Period :</label> <br />
                                                        <select name="meter_reading_period_id" id="cbo_period" data-error-msg="Meter Reading Period is required." required style="width: 100%;">
                                                            <option value="">Select a period</option>
                                                            <?php foreach($periods as $period){ ?>
                                                                <option value="<?php echo $period->meter_reading_period_id; ?>" data-start="<?php echo $period->meter_reading_period_start; ?>" data-end="<?php echo $period->meter_reading_period_end; ?>"><?php echo $period->month_name; ?> <?php echo $period->meter_reading_year; ?></option>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label>Start Date :</label> <br />
                                                        <input type="text"  class="form-control" id="start_date" readonly>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label> End Date :</label> <br />
                                                        <input type="text"  class="form-control" id="end_date" readonly>
                                                    </div>
                                                    <div class="col-lg-offset-1 col-lg-3">
                                                        <label>  Search :</label> <br />
                                                        <input type="text" id="searchbox_billing" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <label> Batch No :</label> <br />
                                                        <select name="meter_reading_input_id" id="cbo_meter_reading_input" data-error-msg="Meter Reading Period is required." required style="width: 100%;">
                                                        </select>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <label> Particular :</label> <br />
                                                        <select name="customer_id" id="cbo_customer" data-error-msg="Meter Reading Period is required." required style="width: 100%;">
                                                            <option value="0">ALL</option>
                                                            <?php foreach($customer as $customer){?>
                                                                <option value="<?php echo $customer->customer_id;?>">
                                                                    <?php echo $customer->customer_name; ?>
                                                                </option>
                                                            <?php }?>
                                                        </select>
                                                    </div>
                                                    <div class="col-lg-offset-1 col-lg-3">
                                                        <button type="button" class="btn btn-primary" id="print_billing" style="width: 100%;margin-top: 5px;">
                                                            <i class="fa fa-print"></i> Print Billing
                                                        </button>

                                                        <button type="button" class="btn btn-success" id="print_report" style="width: 49%;margin-top: 5px;">
                                                            <i class="fa fa-print"></i> Print
                                                        </button>
                                                        <button type="button" class="btn btn-warning" id="export_report" style="width: 49%;margin-top: 5px;">
                                                            <i class="fa fa-file-excel-o"></i> Export
                                                        </button>

                                                        <button type="button" class="btn btn-success hidden" id="update_report" style="width: 100%;margin-top: 5px;">
                                                            <i class="fa fa-refresh"></i> Update Billing Statement
                                                        </button>

                                                    </div>
                                                </div><br>
                                                Note: The <b>Grand Total Column </b> does not include the penalty after due date of the current period.
                                                <table id="tbl_billing" class="table table-striped" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th>Control No</th>
                                                            <th style="width: 100px;">Account No</th>
                                                            <th style="width: 200px;">Particular</th>
                                                            <th>Consumption</th>
                                                            <th>Due Amount</th>
                                                            <th>Previous Balance</th>
                                                            <th>Arrears Penalty</th>
                                                            <th>Charges</th>
                                                            <th>Grand Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
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
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                            <h4 class="modal-title" style="color:white;"><span id="modal_mode"> </span>Confirm Process</h4>
                        </div>

                        <div class="modal-body">
                            <p id="modal-body-message">Are you sure?</p>
                        </div>

                        <div class="modal-footer">
                            <button id="btn_yes" type="button" class="btn btn-success" data-dismiss="modal">Yes</button>
                            <button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div><!---modal-->
            <footer role="contentinfo">
                <div class="clearfix">
                    <ul class="list-unstyled list-inline pull-left">
                        <li><h6 style="margin: 0;">&copy; 2018 - JDEV OFFICE SOLUTION INC</h6></li>
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

<script src="assets/plugins/datapicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
<script src="assets/plugins/select2/select2.full.min.js"></script>
<!-- numeric formatter -->
<script src="assets/plugins/formatter/autoNumeric.js" type="text/javascript"></script>
<script src="assets/plugins/formatter/accounting.js" type="text/javascript"></script>

<script>

$(document).ready(function(){
    var dt; var _txnMode; var _selectedID; var _selectRowObj;

    var initializeControls=function(){

        _cboPeriod=$("#cbo_period").select2({
            placeholder: "Please Select Period.",
            allowClear: false
        });

        _cboPeriod.select2('val',0);

        _cboBatchNo=$("#cbo_meter_reading_input").select2({
            placeholder: "Please Select Batch No.",
            allowClear: false
        });

        _cboCustomer=$("#cbo_customer").select2({
            allowClear: false
        });            

        dt=$('#tbl_billing').DataTable({
            "bLengthChange":false,
            oLanguage: {
                    sProcessing: '<center><br /><img src="assets/img/loader/ajax-loader-sm.gif" /><br /><br /></center>'
            },
            processing : true,
            "ajax" : {
                "url" : "Billing_statement/transaction/statement",
                "bDestroy": true,            
                "data": function ( d ) {
                        return $.extend( {}, d, {
                            "period_id": $('#cbo_period').val(),
                            "meter_reading_input_id": $('#cbo_meter_reading_input').val(),
                            "customer_id": $('#cbo_customer').val()
                        });
                    }
            }, 
            "columns": [
                { targets:[0],data: "batch_no", visible:false},
                {
                    "targets": [1],
                    "class":          "details-control",
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": ""
                },
                {
                    "targets": [2],
                    "class":          "details-control-print",
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": ""
                },
                { targets:[3],data: "serial_no" },
                { targets:[4],data: "account_no" },
                { targets:[5],data: "receipt_name" },
                {
                    className: "text-right",
                    targets:[6],data: "total_consumption",
                    render: function(data){
                        return accounting.formatNumber(data,0);
                    }
                },
                {
                    className: "text-right",
                    targets:[7],data: "amount_due",
                    render: function(data){
                        return accounting.formatNumber(data,2);
                    }
                },
                {
                    className: "text-right",
                    targets:[8],data: "previous_balance",
                    render: function(data){
                        return accounting.formatNumber(data,2);
                    }
                },
                {
                    className: "text-right",
                    targets:[9],data: "arrears_penalty_amount",
                    render: function(data){
                        return accounting.formatNumber(data,2);
                    }
                },
                {
                    className: "text-right",
                    targets:[10],data: "charges_amount",
                    render: function(data){
                        return accounting.formatNumber(data,2);
                    }
                },
                {
                    className: "text-right",
                    targets:[11],data: "grand_total_amount_label_for_report",
                    render: function(data){
                        return accounting.formatNumber(data,2);
                    }
                },
            ],
            "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;

                        api.column(0, {page:'current'} ).data().each( function ( group, i ) {
                            if ( last !== group ) {
                                $(rows).eq( i ).before(
                                    '<tr class="group"><td colspan="12" style="background-color:#ccfdff;"><strong>'+'Batch No #: <i>'+group+'</i></strong></td></tr>'
                                );

                                last = group;
                            }
                        } );
                    }
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

        $('#tbl_billing tbody').on( 'click', 'tr td.details-control', function () {
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
                    "url":"Templates/layout/billing_statement/"+ d.billing_id+"?type=contentview",
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

        $('#tbl_billing tbody').on( 'click', 'tr td.details-control-print', function () {
            var tr = $(this).closest('tr');
            var row = dt.row( tr );
            var idx = $.inArray( tr.attr('id'), detailRows );                
                var d=row.data();
                window.open("Templates/layout/billing_statement/"+ d.billing_id+"?type=preview");
        });

        $('#print_billing').on( 'click', function () {

            var period_id = _cboPeriod.select2('val');
            var meter_reading_input_id = _cboBatchNo.select2('val');
            var customer_id = _cboCustomer.select2('val');

            if(period_id != null){
                window.open("Templates/layout/billing_statement_all/"+period_id+"/"+meter_reading_input_id+"/"+customer_id+"?type=preview");
            }else{
                showNotification({title:"Error!",stat:"error",msg:"Meter Period is Required!"});
            }

        });

        _cboPeriod.on('select2:select',function(e){
            var i=$(this).select2('val');
            batches(i).done(function(response){
                var rows = response.data;

                $("#cbo_meter_reading_input option").remove();
                _cboBatchNo.select2('val',null);

                if (rows.length > 0){
                    $("#cbo_meter_reading_input").append('<option value="0">All</option>');
                    $.each(rows,function(i,value){
                       $("#cbo_meter_reading_input").append('<option value="'+ value.meter_reading_input_id +'">'+ value.batch_no +'</option>');
                    });
                    
                    $('#cbo_meter_reading_input').val("").trigger("change")
                    _cboBatchNo.select2('val',0);
                }

            });
        }); 

        $('#print_report').on( 'click', function () {

            var period_id = _cboPeriod.select2('val');
            var meter_reading_input_id = _cboBatchNo.select2('val');
            var customer_id = _cboCustomer.select2('val');

            if(period_id != null){
                window.open("Templates/layout/billing_statement_period/"+period_id+"/"+meter_reading_input_id+"/"+customer_id+"?type=preview");
            }else{
                showNotification({title:"Error!",stat:"error",msg:"Meter Period is Required!"});
            }

        });

        $(document).on('click','#export_report',function(){
            var period_id = _cboPeriod.select2('val');

            if(period_id != null){
                window.open('Templates/layout/billing_statement_report?type=export&period_id='+_cboPeriod.select2('val')+'&meter_reading_input_id='+_cboBatchNo.select2('val')+'&customer_id'+_cboCustomer.select2('val'));

            }else{
                showNotification({title:"Error!",stat:"error",msg:"Meter Period is Required!"});
            }

        });        

        $('#update_report').on('click',function(){
            update_report().done(function(response){
                if(response.stat == "success"){
                    showNotification(response);
                }
            }).always(function(){
                showSpinningProgress($('#update_report'));
            });
        });

        var update_report=function(){
            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"Billing_statement/transaction/update_report",
                "beforeSend": showSpinningProgress($('#update_report'))
            });
        };    

        $('#tbl_billing tbody').on('click','button[name="edit_info"]',function(){
            _txnMode="edit";
            _selectRowObj=$(this).closest('tr');
            var data=dt.row(_selectRowObj).data();
            _selectedID=data.reconnection_id;

            $('input[name="service_no"]').val(data.disconnection_code);
            $('input[name="disconnection_id"]').val(data.disconnection_id);
            $('input[name="date_disconnection_date"]').val(data.date_disconnection_date);
            $('input[name="customer_name"]').val(data.customer_name);
            $('input[name="contract_type_name"]').val(data.contract_type_name);
            $('input[name="rate_type_name"]').val(data.rate_type_name);

            _cboRateType.select2('val',data.rate_type_id);

            $('input,textarea,select').each(function(){
                var _elem=$(this);
                $.each(data,function(name,value){
                    if(_elem.attr('name')==name){
                        _elem.val(value);
                    }
                });
            });

            $('#link_browse_disc').hide();
            $('#sn_icon').show();
            $('#modal_title').text('Edit Reconnection Service');
            $('#modal_new_reconnection').modal('show');
        });

        $('#select_all').on('click',function(){
            var checked = $("#select_all:checked").length;
            if (checked == 1){
                $('.btch_chckbx').prop('checked',true);
            }else{
                $('.btch_chckbx').prop('checked',false);
            }
        });

        $("#searchbox_billing").keyup(function(){         
            dt
                .search(this.value)
                .draw();
        });        

        $('#tbl_billing tbody').on('click','button[name="remove_info"]',function(){
            _selectRowObj=$(this).closest('tr');
            var data=dt.row(_selectRowObj).data();
            _selectedID=data.reconnection_id;

            chck_reconnection_service(_selectedID,'delete').done(function(response){
                if(response.stat == "success"){
                    $('#modal_confirmation').modal('show');
                }else{
                    showNotification(response);
                }
            });          
        });

        _cboPeriod.on('select2:select', function(){
            var i=$(this).select2('val');
            _currentMeterPeriod = $(this).select2('val'); // SET CURRENT METER READING PERIOD TO GET ALL ACCOUNTS
            var obj_period=$('#cbo_period').find('option[value="' + i + '"]');
            $('#start_date').val(obj_period.data('start'));
            $('#end_date').val(obj_period.data('end'));

            $('#tbl_billing tbody').html('<tr><td colspan="11"><center><br/><br /><br /></center></td></tr>');
            dt.ajax.reload( null, false );
        });

       _cboBatchNo.on('select2:select', function(){
            $('#tbl_billing tbody').html('<tr><td colspan="11"><center><br/><br /><br /></center></td></tr>');
            dt.ajax.reload( null, false );
        });

       _cboCustomer.on('select2:select', function(){
            $('#tbl_billing tbody').html('<tr><td colspan="11"><center><br/><br /><br /></center></td></tr>');
            dt.ajax.reload( null, false );
        });       

        $('#btn_process').on('click',function(){
            check_process().done(function(response){
                if(response.stat == "success"){
                    $('#modal_confirmation').modal('show');
                }else{   
                    showNotification(response);
                }
            }).always(function(){
                showSpinningProgress($('#btn_process'));
            });
        });

        $('#btn_yes').click(function(){
            $('#btn_process').attr('disabled',true);
            $("#btn_process span").text('Processing');
            process_billing().done(function(response){
                showNotification(response);
                $('#select_all').prop('checked', false);
                dt.ajax.reload( null, false );
            }).always(function(){
                showSpinningProgress($('#btn_process'));
                $("#btn_process span").text('Process');
                $('#btn_process').attr('disabled',false);
            });
        });

        $('#btn_save').click(function(){
            if(validateRequiredFields($('#frm_reconnection'))){
                if(_txnMode=="new"){
                    createReconnection().done(function(response){
                        showNotification(response);
                        dt.row.add(response.row_added[0]).draw();
                        clearFields($('#frm_reconnection'));

                    }).always(function(){
                        showSpinningProgress($('#btn_save'));
                    });
                }else{
                    updateReconnection().done(function(response){
                        showNotification(response);
                        dt.row(_selectRowObj).data(response.row_updated[0]).draw();
                        clearFields($('#frm_reconnection'));
                    }).always(function(){
                        showSpinningProgress($('#btn_save'));
                    });
                }
                $('#modal_new_reconnection').modal('hide');
            }
        });

    })();

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
                if($(this).val()=="" || $(this).val()== '0'){
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

    var batches=function(i){
        var _data=$('#').serializeArray();
        _data.push({name : "period_id" ,value : i});

        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Billing_statement/transaction/get_batches",
            "data":_data,
            "beforeSend": showSpinningProgress($('#btn_process'))
        });
    };

    var process_billing=function(){
        var _data = dt.$('input, select').serialize();
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Process_billing/transaction/process",
            "data":_data,
            "beforeSend": showSpinningProgress($('#btn_process'))
        });
    };

    var check_process=function(){
        var _data = dt.$('input, select').serialize();
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Process_billing/transaction/check_process",
            "data":_data,
            "beforeSend": showSpinningProgress($('#btn_process'))
        });
    };    

    var showList=function(b){
        if(b){
            $('#div_reconnection_list').show();
            $('#div_department_fields').hide();
        }else{
            $('#div_reconnection_list').hide();
            $('#div_department_fields').show();
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
        $(e).find('i').toggleClass('glyphicon glyphicon-refresh spinning');
    };

    var clearFields=function(f){
        $('input:not(.date-picker),input[required],textarea',f).val('');
        $('form').find('input:first').focus();
    };

    function format ( d ) {
        return '<br /><table style="margin-left:10%;width: 80%;">' +
        '<thead>' +
        '</thead>' +
        '<tbody>' +
        '<tr>' +
        '<td>Department Name : </td><td><b>'+ d.department_name+'</b></td>' +
        '</tr>' +
        '<tr>' +
        '<td>Department Description : </td><td>'+ d.department_desc+'</td>' +
        '</tr>' +
        '</tbody></table><br />';
    };
});

</script>

</body>

</html>