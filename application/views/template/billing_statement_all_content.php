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
    .center{
        margin-right:auto;
        margin-left:auto;
        width: 90%;
        text-align: center!important;
        font-size: 12px;
        padding: 0px!important; 
        
    }
    .pb{
        height: 330px;
        margin: 0px!important;
    }
</style>

<?php foreach($billings as $billing){?>
<div style="page-break-after:inherit;">
    <?php for($x = 1; $x <= 3; $x++){?>
    <!-- File Copy -->
    <div class="pb">
        <table style="font-size: 12px;width: 100%;">
            <tbody>
                <tr>
                    <td width="50%" align="left">Print Date/Time : <?php echo date("m/d/Y h:i a");?></td>
                    <td width="50%" align="right">Control No: <?php echo $billing->control_no; ?></td>
                </tr>
            </tbody>
        </table>
        <div class="center" style="text-transform: uppercase;">
            <b style="font-size: 15px;"><?php echo $company_info->company_name; ?></b><br/>
            <?php echo $company_info->company_address; ?>
        </div>
        <hr style="margin: 0px!important;margin-top:10px;">
        <div class="center">
            <b>BILLING STATEMENT</b>
        </div>
        <hr style="margin: 0px!important;">
        <table style="font-size: 12px;" width="100%">
            <tbody>
                <tr>
                    <td>ACCOUNT NO : &nbsp;&nbsp; <?php echo $billing->account_no; ?></td>
                </tr>
                <tr>
                    <td style="text-transform: uppercase;">Customer Name : &nbsp;&nbsp; <?php echo $billing->receipt_name; ?></td>
                </tr>
                <tr>
                    <td style="text-transform: uppercase;border-bottom: 1px solid lightgray;">Address: &nbsp;&nbsp; <?php echo $billing->address; ?>
                </tr>
            </tbody>
        </table>
        <table width="100%" style="font-size: 12px">
            <tbody>
                <tr>
                    <td colspan="4">PERIOD COVERED : <?php echo $billing->period_covered; ?></td>
                    <td colspan="4">Due Date: <?php echo $billing->due_date?></td>
                </tr>
                <tr>
                    <td colspan="4"><b>Meter Reading</b></td>
                    <td colspan="4"><b>Payables</b></td>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td width="13%">Reading Date:</td>
                    <td width="8%" align="right"><?php echo $billing->reading_date; ?></td>
                    <td width="19%"></td>
                    <td width="10%"></td>
                    <td width="18%">Amount Due:</td>
                    <td width="10%" align="right"><?php echo number_format($billing->amount_due,2);?></td>
                    <td width="7%"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Previous Reading:&nbsp;&nbsp;</td>
                    <td align="right"><?php echo number_format($billing->previous_reading,0);?></td>
                    <td></td>
                    <td></td>
                    <td>Arrears Amount: &nbsp;&nbsp;</td>
                    <td align="right"><?php echo number_format($billing->arrears_amount,2);?></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Current Reading: &nbsp;&nbsp; </td>
                    <td align="right"><?php echo number_format($billing->current_reading,0);?></td>
                    <td></td>
                    <td></td>
                    <td>Arrears Penalty Amount:&nbsp;&nbsp;</td>
                    <td align="right"><?php echo number_format($billing->arrears_penalty_amount,2);?></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Consume: &nbsp;&nbsp;</td>
                    <td align="right"><b><?php echo number_format($billing->total_consumption,0);?></b></td>
                    <td></td>
                    <td></td>
                    <td>Penalty:&nbsp;&nbsp;</td>
                    <td align="right"><?php echo number_format($billing->penalty_amount,2);?></td>
                    <td></td>
                </tr>
                <?php if(count($charges) > 0){?>
                <tr>
                    <td colspan="8"><b>Other Charges</b></td>
                </tr>
                <?php foreach($charges as $charge){
                    if($charge->billing_id == $billing->billing_id){
                ?>
                    <tr>
                        <td></td>
                        <td colspan="3">
                            <?php echo $charge->other_charge_no.' - '.$charge->charge_desc.':&nbsp;&nbsp; '; ?>
                            <span style="float: right;"><?php echo number_format($charge->charge_line_total,2); ?></span>
                        </td>
                        <td colspan="4"></td>
                    </tr>
                <?php }}}?>
                <tr>
                    <td colspan="8">&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">TOTAL AMOUNT BEFORE DUE DATE:&nbsp;&nbsp;<b><?php echo number_format(($billing->total_amount_due +$billing->arrears_amount + $billing->arrears_penalty_amount) ,2);?></b></td>
                    <td colspan="4">TOTAL AMOUNT AFTER DUE DATE:&nbsp;&nbsp;<b><?php echo number_format(($billing->amount_after_due+$billing->arrears_amount) + $billing->arrears_penalty_amount,2);?></b></td>
                </tr>
            </tbody>
        </table>   
        <table width="100%">
        <tr>
            <td width="85%" style="font-size: 10pt!important;">NOTE:  For check payments, please make checks payable to <b>DON PEPE HENSON ENTERPRISES INC.</b></td>  
            <td width="15%" style="text-align: right;font-size: ">  <?php 
            if($x == 1){
                echo 'Customer Copy';
            }else if ($x == 2){
                echo 'File Copy';
            }else{
                echo 'Accounting Copy';
            }
        ?></td>    
        </tr>
        </table>
        <br>
        <center>
            <div style="border-top: 1px dashed black;height: 1px;width: 100%;text-align: center!important;margin-left: auto;margin-right: auto;display: block;margin-top: 5px;margin-bottom: 5px;"></div>
        </center>
    </div>
    <!-- End -->   
    <?php }?>
</div>
<?php }?>














