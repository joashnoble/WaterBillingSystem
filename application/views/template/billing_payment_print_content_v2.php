<head>
    <title>Billing Statement</title>
    <link rel="icon" href="<?php echo base_url('assets/img/companyico.ico'); ?>" type="image/ico" sizes="16x16">
</head>
<body>
<style>
    @page {
      /*size: 8.5in 11in!important;*/
      margin: 8px!important;
    }
    table{
        border:none!important;
    }
    td{
        padding: 0px!important;
        margin: 0px!important; 
    }
    table th {
        text-align: right;

    }
    table.items td {
        text-align: right;

    }    
    .center{
        margin-right:auto;
        margin-left:auto;
        width: 90%;
        text-align: center!important;
        font-size: 12px;
        padding: 0px!important; 
        
    }
    .pb{
        height: 30px;
        margin: 0px!important;
    }
    table.items tbody tr td:last-child{
            /*border-bottom: 1px solid lightgray!important;*/
            color:red!important;
        }
</style>

<!-- -->
<div style="page-break-after:inherit;">
    <?php for($x = 1; $x <= 3; $x++){?>
    <!-- File Copy -->
    <div class="pb">
        <table style="font-size: 12px;width: 100%;">
            <tbody>
                <tr>
                    <td width="50%" align="left">Print Date/Time : <?php echo date("m/d/Y h:i a");?></td>
                    <td width="50%" align="right">Acknowledgement Receipt No: <?php echo $info->receipt_no; ?></td>
                </tr>
            </tbody>
        </table>
        <div class="center" style="text-transform: uppercase;">
            <b style="font-size: 15px;"><?php echo $company_info->company_name; ?></b><br/>
            <?php echo $company_info->company_address; ?>
        </div>
        <hr style="margin: 0px!important;margin-top:10px;">
        <div class="center">
            <b>ACKNOWLEDGEMENT RECEIPT</b>
        </div>
        <hr style="margin: 0px!important;">
        <table style="font-size: 12px;" width="100%">
            <tbody>
                <tr>
                   
                    <td>METER SERIAL : &nbsp;&nbsp; <?php echo $info->serial_no; ?></td>
                    <td>PAYMENT DATE : &nbsp;&nbsp; <?php echo $info->date_paid; ?></td>
                </tr>
                <tr>
                    <td style="text-transform: uppercase;">Customer Name : &nbsp;&nbsp; <?php echo $info->receipt_name; ?></td>
                    <td style="text-transform: uppercase;">METHOD : &nbsp;&nbsp; <?php echo $info->payment_method; ?></td>
                </tr>
                <tr>
                    <td style="text-transform: uppercase;">Address: &nbsp;&nbsp; <?php echo $info->address; ?>
                    <td><?php if($info->payment_method_id == 2){ ?> CHECK NO : &nbsp;&nbsp; <?php echo $info->check_no; ?>  <?php } ?></td>
                    
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid lightgray; ">ACCOUNT NO : &nbsp;&nbsp; <?php echo $info->account_no; ?> </td>
                    <td style="border-bottom: 1px solid lightgray; "><?php if($info->payment_method_id == 2){ ?>CHECK DATE : &nbsp;&nbsp; <?php echo $info->check_date; ?>  <?php } ?> </td>
                    
                </tr>
            </tbody>
        </table>
        <table width="100%" style="font-size: 12px"  class="items"> 
        <thead>
            <tr>
                <th style="text-align: left;">MONTH</th>
                <th>DUE DATE</th>
                <th>AMOUNT DUE</th>
                <th>PENALTY</th>
                <th>SUBTOTAL</th>
            </tr>
        </thead>
        <tbody>
        <?php $grand_total_payment = 0; foreach ($items as $item) {  $grand_total_payment += $item->total_payment;?>
            <tr>
                <td style="text-align: left;"><?php  echo $item->month_name; ?> <?php echo $item->meter_reading_year; ?></td>
                <td><?php echo date('F d, Y', strtotime($item->due_date)); ?></td>
                <td> <?php echo number_format($item->amount_paid,2); ?></td>
                <td> <?php echo number_format($item->penalty_paid,2); ?></td>
                <td style="text-align: right;"><?php  echo number_format($item->total_payment,2) ?></td>
            </tr>
        <?php } ?>
        </tbody>
            <tfoot>
            <tr>
                <td style="text-align: left;" colspan="5">&nbsp;&nbsp;</td>
            </tr>         
            <tr>
                <td style="text-align: left;"></td>
                <td></td>
                <td> </td>
                <td style="text-align: right;font-weight: bold;"> GRAND TOTAL</td>
                <td style="text-align: right;font-weight: bold;"><?php  echo number_format($grand_total_payment,2); ?></td>
            </tr>   
            </tfoot>     
        
        </table>   <br>
        <table width="100%">
        <tr>
            <td width="100%" style="text-align: right;font-size: ">  <?php 
            if($x == 1){
                echo 'File Copy';
            }else if ($x == 2){
                echo 'Customer Copy';
            }else{
                echo 'Accounting Copy';
            }
        ?></td>    
        </tr>
        </table>
        <center>
            <div style="border-top: 1px dashed black;height: 1px;width: 100%;text-align: center!important;margin-left: auto;margin-right: auto;display: block;margin-top: 5px;margin-bottom: 5px;"></div>
        </center>
    </div>
    <!-- End -->   
    <?php }?>
</div>
















