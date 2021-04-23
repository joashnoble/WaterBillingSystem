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

        #tbl_process_billing_filter, #tbl_account_list_filter{
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
                        <li><a href="Process_billing">Process Billing</a></li>
                    </ol>
                    <div class="container-fluid">
                        <div data-widget-group="group1">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="div_reconnection_list">
                                        <div class="panel panel-default">
                                            <div class="panel-body table-responsive" style="overflow-x: hidden;">
                                            <h2 class="h2-panel-heading">Process Billing</h2><hr>
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
                                                        <input type="text" id="searchbox_reading" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                <div class="col-lg-offset-6 col-lg-3">
                                                        <br>
                                                        <input type="checkbox" class="css-checkbox" name="select_all" id="select_all" style="width: 10px!important;height: 10px!important;">
                                                        <label for="select_all" class="css-label">Select All</label>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <br>
                                                        <button class="btn btn-primary btn_process_billing" id="btn_process" style="width: 100%;">
                                                            <i class="fa fa-check-circle"></i>
                                                            <span>Process</span>
                                                        </button>
                                                    </div>
                                                </div><br>
                                                <table id="tbl_process_billing" class="table table-striped" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>Batch No</th>
                                                            <th>Input Date</th>
                                                            <th>Created By</th>
                                                            <th><center>Processed</center></th>
                                                            <th><center>Action</center></th>
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

<?php echo $_rights; ?>
<script>

$(document).ready(function(){
    var dt; var _txnMode; var _selectedID; var _selectRowObj;

    var initializeControls=function(){

        _cboPeriod=$("#cbo_period").select2({
            placeholder: "Please Select Period.",
            allowClear: false
        });

        _cboPeriod.select2('val',0);

        dt=$('#tbl_process_billing').DataTable({
            "bLengthChange":false,
            oLanguage: {
                    sProcessing: '<center><br /><img src="assets/img/loader/ajax-loader-sm.gif" /><br /><br /></center>'
            },
            processing : true,
            "ajax" : {
                "url" : "Process_billing/transaction/reading",
                "bDestroy": true,            
                "data": function ( d ) {
                        return $.extend( {}, d, {
                            "period_id": $('#cbo_period').val()
                        });
                    }
            }, 
            "columns": [
                {
                    "targets": [0],
                    "class":          "details-control",
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": ""
                },
                { targets:[0],data: "batch_no" },
                { targets:[1],data: "date_input" },
                { targets:[2],data: "posted_by" },
                {
                    targets:[3],data: null,
                    render: function (data, type, full, meta){
                        var _attribute='';
                        if(data.is_processed=="1"){
                            _attribute=' class="fa fa-check-circle" style="color:green;" ';
                        }else{
                            _attribute=' class="fa fa-times-circle" style="color:red;" ';
                        }

                        return '<center><i '+_attribute+'></i></center>';
                    }
                },
                {
                    targets:[4],data: null,
                    render: function (data, type, full, meta){
                        var checkbox='<input type="checkbox" class="css-checkbox btch_chckbx" name="meter_reading_input_id[]" value="'+data.meter_reading_input_id+'" id="'+data.meter_reading_input_id+'"><label for="'+data.meter_reading_input_id+'" class="css-label "></label> ';
                        
                        if(data.payment_count <= 0){
                            return '<center>'+checkbox+'</center>';
                        }else{
                            return '<center><label class="label label-success">Active Payment</label></center>';
                        }

                    }
                }
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

        $('#tbl_process_billing tbody').on( 'click', 'tr td.details-control', function () {
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
                    "url":"Templates/layout/meter-reading-input-dropdown/"+ d.meter_reading_input_id+"?type=contentview",
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

        $('#tbl_process_billing tbody').on('click','button[name="edit_info"]',function(){
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

        $("#searchbox_reading").keyup(function(){         
            dt
                .search(this.value)
                .draw();
        });        

        $('#tbl_process_billing tbody').on('click','button[name="remove_info"]',function(){
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

            checkPeriodStatus(_currentMeterPeriod).done(function(response){
                var rows = response.data[0];
                if (rows.is_closed == 1){
                    $('#btn_process').prop("disabled",true); 
                    showNotification({title:"Billing Period Closed !",stat:"info",msg:"You cannot Process/Reprocess this Period."}); 
                }else{
                    $('#btn_process').prop("disabled",false);
                }
            });

            var obj_period=$('#cbo_period').find('option[value="' + i + '"]');
            $('#start_date').val(obj_period.data('start'));
            $('#end_date').val(obj_period.data('end'));

            $('#tbl_process_billing tbody').html('<tr><td colspan="7"><center><br/><br /><br /></center></td></tr>');
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

    var checkPeriodStatus=function(period_id){
        var _data=$('#').serializeArray();
        _data.push({name : "period_id" ,value : period_id});

        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Process_billing/transaction/chck_status",
            "data":_data
        });
    };

    var process_billing=function(){
        var _data = dt.$('input, select').serialize();
        var period_id = $('#cbo_period').val();
        return $.ajax({
            "dataType":"json",
            "type":"POST",
            "url":"Process_billing/transaction/process/"+period_id,
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