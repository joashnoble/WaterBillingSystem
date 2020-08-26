<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">

    <title>JCORE - <?php echo $title; ?></title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-cdjp-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="description" content="Avenxo Admin Theme">
    <meta name="author" content="">

    <?php echo $_def_css_files; ?>

    <link rel="stylesheet" href="assets/plugins/spinner/dist/ladda-themeless.min.css">
    <link type="text/css" href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/datatables/dataTables.themify.css" rel="stylesheet">
    <link href="assets/plugins/select2/select2.min.css" rel="stylesheet">
    <!--<link href="assets/dropdown-enhance/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">-->
    <link href="assets/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/iCheck/skins/minimal/blue.css" rel="stylesheet">              <!-- iCheck -->
    <link type="text/css" href="assets/plugins/iCheck/skins/minimal/_all.css" rel="stylesheet">                   <!-- Custom Checkboxes / iCheck -->

    <style>
        .toolbar{
            float: left;
        }
        .number{
            text-align: right;
        }
        .bold{
            font-weight: bolder;
        }
        #tbl_customer_receivables_filter{
            display: none;
        }
    </style>

</head>

<body class="animated-content" style="font-family: tahoma;">

<?php echo $_top_navigation; ?>

<div id="wrapper">
    <div id="layout-static">

        <?php echo $_side_bar_navigation;?>

        <div class="static-content-wrapper white-bg">
            <div class="static-content"  >

                <div class="page-content"><!-- #page-content -->

                    <ol class="breadcrumb" style="margin-bottom: 0px;">
                        <li><a href="dashboard">Dashboard</a></li>
                        <li><a href="Customer_billing_receivables">Customer Billing Receivables</a></li>
                    </ol>

                    <div class="container-fluid">
                        <div data-widget-group="group1">
                            <div class="row">
                                <div class="col-md-12">

                                    <div id="div_payable_list">

                                        <div class="panel-group panel-default" id="accordionA">


                                            <div class="panel panel-default">
                                                <div id="collapseTwo" class="collapse in">
                                                    <div class="panel-body">
                                                    <h2 class="h2-panel-heading">Customer Billing Receivables</h2><hr>
                                                        <div style="">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    Type * : <br />
                                                                    <select id="cbo_type" class="form-control">
                                                                        <option value="1">Per Account</option>
                                                                        <option value="2">Per Customer</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <br />
                                                                    <center>
                                                                        <button class="btn btn-primary" id="btn_print" style="text-transform: none; font-family: Tahoma, Georgia, Serif;  padding: 7px!important;" data-toggle="modal" data-placement="left" title="Print" ><i class="fa fa-print"></i> Print Report</button>
                                                                        <button class="btn btn-green" id="btn_export" style="text-transform: none; font-family: Tahoma, Georgia, Serif;  padding: 7px!important;" data-toggle="modal" data-placement="left" title="Export" ><i class="fa fa-file-excel-o"></i> Export</button>
                                                                        <button class="btn btn-green" id="btn_email" style="text-transform: none; font-family: Tahoma, Georgia, Serif;  padding: 7px!important;" data-toggle="modal" data-placement="left" title="Email" ><i class="fa fa-share"></i> Email</button>
                                                                        <button class="btn btn-success" id="btn_refresh" style="text-transform: none; font-family: Tahoma, Georgia, Serif;  padding: 7px!important;" data-toggle="modal" data-placement="left" title="Reload" ><i class="fa fa-refresh"></i></button>
                                                                    </center>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    Search : <br />
                                                                        <input type="text" id="searchbox_receivables" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />

                                                        <div style="">
                                                            <table id="tbl_customer_receivables" class="table table-striped" cellspacing="0" width="100%">
                                                                <thead class="">
                                                                <tr>
                                                                    <th width="15%">Serial #</th>
                                                                    <th>Customer</th>
                                                                    <th>Address</th>
                                                                    <th style="text-align: right;">Penalty</th>
                                                                    <th style="text-align: right;">Fees</th>
                                                                    <th style="text-align: right;">Payments</th>
                                                                    <th style="text-align: right;">Balance</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <td colspan="3" style="text-align: right"><b>Total:</b></td>
                                                                        <td><input type="text"  class="form-control" name="tota_penalty_amount" style="font-weight: bold;border: 0px;background-color: transparent;padding: 0px;height: 18px;text-align: right;" readonly> </td>
                                                                         <td><input type="text"  class="form-control" name="tota_fee_amount" style="font-weight: bold;border: 0px;background-color: transparent;padding: 0px;height: 18px;text-align: right;" readonly> </td> <td><input type="text"  class="form-control" name="tota_payment_amount" style="font-weight: bold;border: 0px;background-color: transparent;padding: 0px;height: 18px;text-align: right;" readonly> </td>
                                                                        <td><input type="text"  class="form-control" name="tota_receivables_amount" style="font-weight: bold;border: 0px;background-color: transparent;padding: 0px;height: 18px;text-align: right;" readonly> </td>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>


                                                    </div>
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


<script type="text/javascript" src="assets/plugins/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/dataTables.bootstrap.js"></script>

<!-- Select2-->
<script src="assets/plugins/select2/select2.full.min.js"></script>
<!---<script src="assets/plugins/dropdown-enhance/dist/js/bootstrap-select.min.js"></script>-->

<!-- Date range use moment.js same as full calendar plugin -->
<script src="assets/plugins/fullcalendar/moment.min.js"></script>
<!-- Data picker -->
<script src="assets/plugins/datapicker/bootstrap-datepicker.js"></script>

<!-- numeric formatter -->
<script src="assets/plugins/formatter/autoNumeric.js" type="text/javascript"></script>
<script src="assets/plugins/formatter/accounting.js" type="text/javascript"></script>

<script>
    $(document).ready(function(){
        var _cboType; var dt; var _cboCustomers;
        var _date_from = $('input[name="date_from"]');
        var _date_to = $('input[name="date_to"]');

        var initializeControls=function(){

            _cboType=$("#cbo_type").select2({
                placeholder: "Please select type.",
                allowClear: true
            });

            $('.date-picker').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true

            });

            dt=$('#tbl_customer_receivables').DataTable({
                "order": [[ 6, "asc" ]],
                "bLengthChange":false,
                "bPaginate":false,
                "ajax": {
                    "url": "Customer_billing_receivables/transaction/get-customer-billing-receivables",
                    "type": "GET",
                    "bDestroy": true,
                    "data": function ( d ) {
                        return $.extend( {}, d, {
                            "type_id" : _cboType.select2('val')
                        });
                    }
                },
                "columns": [
                    { targets:[0],data: "serial_no" },
                    { targets:[1],data: "customer_name" },
                    { targets:[2],data: "address" },
                    {
                        targets:[3],data: "total_penalty",
                        render: function(data, type, full, meta){
                            return accounting.formatNumber(data,2);
                        }
                    },
                    {
                        targets:[3],data: "fee",
                        render: function(data, type, full, meta){
                            return accounting.formatNumber(data,2);
                        }
                    },
                    {
                        targets:[4],data: "payment",
                        render: function(data, type, full, meta){
                            return accounting.formatNumber(data,2);
                        }
                    },
                    {
                        targets:[5],data: "balance",
                        render: function(data, type, full, meta){
                            return accounting.formatNumber(data,2);
                        }
                    },
                    { visible:false, targets:[6],data: "connection_id"}
                ],
                rowCallback: function (row, data) {
                    if (_cboType.select2('val') == 1){
                        dt.column( 0 ).visible( true );
                        $('td', row).eq(3).addClass('number');
                        $('td', row).eq(4).addClass('number');
                        $('td', row).eq(5).addClass('number');
                        $('td', row).eq(6).addClass('number');
                        $('td', row).eq(6).addClass('bold');
                    }else{
                        dt.column( 0 ).visible( false );   
                        $('td', row).eq(2).addClass('number');
                        $('td', row).eq(3).addClass('number');
                        $('td', row).eq(4).addClass('number');
                        $('td', row).eq(5).addClass('number');
                        $('td', row).eq(5).addClass('bold');
                    }
                },
                footerCallback: function ( row, data, start, end, display ) {
                    var api = this.api(), data;
                   // console.log(data);

                    // Remove the formatting to get integer data for summation
                    var intVal = function ( i ) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '')*1 :
                            typeof i === 'number' ?
                                i : 0;
                    };
                    var totalAmount = 0;
                    // Total over all pages
                
                        totalAmount = api
                        .column(6)
                        .data()
                        .reduce( function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0 );

                    var totalFee = 0;
                    // Total over all pages
                
                        totalFee = api
                        .column(4)
                        .data()
                        .reduce( function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0 );

                    var totalPay = 0;
                    // Total over all pages
                
                        totalPay = api
                        .column(5)
                        .data()
                        .reduce( function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0 );

                    var totalPenalty = 0;
                    // Total over all pages
                
                        totalPenalty = api
                        .column(3)
                        .data()
                        .reduce( function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0 );

                     $('input[name="tota_penalty_amount"]').val(accounting.formatNumber(totalPenalty,2));
                     $('input[name="tota_fee_amount"]').val(accounting.formatNumber(totalFee,2));
                     $('input[name="tota_payment_amount"]').val(accounting.formatNumber(totalPay,2));
                     $('input[name="tota_receivables_amount"]').val(accounting.formatNumber(totalAmount,2));

                }

            });
        }();

        var bindEventControls=function(){

            $("#searchbox_receivables").keyup(function(){         
                dt
                    .search(this.value)
                    .draw();
            });

            _cboType.on("select2:select", function (e) {
                $('#tbl_customer_receivables').DataTable().ajax.reload()
            });

            $(document).on('click','#btn_print',function(){
                window.open('Templates/layout/customer-billing-receivables?type=preview&type_id='+_cboType.val());

            });

            $(document).on('click','#btn_export',function(){
                window.open('Templates/layout/customer-billing-receivables-export?type=preview&type_id='+_cboType.val());

            });

            $(document).on('click','#btn_email',function(){
                showNotification({title:"Sending!",stat:"info",msg:"Please wait for a few seconds."});

                var btn=$(this);
            
                $.ajax({
                    "dataType":"json",
                    "type":"POST",
                    "url":"Templates/layout/customer-billing-receivables-email?type=preview&type_id="+_cboType.val(),
                    "beforeSend": showSpinningProgress(btn)
                }).done(function(response){
                    showNotification(response);
                    showSpinningProgress(btn);

                });
            });

            $(document).on('click','#btn_refresh',function(){
                $('#tbl_customer_receivables').DataTable().ajax.reload()
            });

            var showSpinningProgress=function(e){
                $(e).toggleClass('disabled');
                $(e).find('span').toggleClass('glyphicon glyphicon-refresh spinning');
            };

            var showNotification=function(obj){
                PNotify.removeAll(); //remove all notifications
                new PNotify({
                    title:  obj.title,
                    text:  obj.msg,
                    type:  obj.stat
                });
            };
        }();
    });
</script>
</body>
</html>