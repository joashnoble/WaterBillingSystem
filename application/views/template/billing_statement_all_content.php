<head><title>Billing Statement</title></head>
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

<?php foreach($billing as $billing){?>

<div style="page-break-after:always;">
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
            <?php echo $company_info->company_name; ?><br/>
            <?php echo $company_info->company_address; ?>
        </div>
        <hr style="margin: 0px!important;">
        <div class="center">
            <b>BILLING STATEMENTS</b>
        </div>
        <hr style="margin: 0px!important;">
        <table style="font-size: 12px;">
            <tbody>
                <tr>
                    <td>ACCOUNT NO : &nbsp;&nbsp; <?php echo $billing->account_no; ?></td>
                </tr>
                <tr>
                    <td>Customer Name : &nbsp;&nbsp; <?php echo $billing->customer_name; ?></td>
                </tr>
                <tr>
                    <td>Address: &nbsp;&nbsp; <?php echo $billing->address; ?>
                </tr>
            </tbody>
        </table>
        <hr>
        <table width="100%" style="font-size: 12px;">
            <tbody>
                <tr>
                    <td colspan="2">PERIOD COVERED : <?php echo $billing->period_covered; ?></td>
                    <td colspan="2">Due Date: <?php echo $billing->due_date?></td>
                </tr>
                <tr>
                    <td colspan="2">Meter Reading</td>
                    <td colspan="2">Payables</td>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td>Reading Date: <?php echo $billing->reading_date; ?></td>
                    <td width="10%"></td>
                    <td>Amount Due:&nbsp;&nbsp;<?php echo number_format($billing->amount_due,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Previous Reading:&nbsp;&nbsp; <?php echo number_format($billing->previous_reading,0);?></td>
                    <td></td>
                    <td>Arrears Amount: &nbsp;&nbsp; <?php echo number_format($billing->arrears_amount,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Current Reading: &nbsp;&nbsp; <?php echo number_format($billing->current_reading,0);?></td>
                    <td></td>
                    <td>Arrears Penalty Amount:&nbsp;&nbsp;<?php echo number_format($billing->arrears_penalty_amount,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Consume: &nbsp;&nbsp;<b><?php echo number_format($billing->total_consumption,0);?></b></td>
                    <td></td>
                    <td>Penalty:&nbsp;&nbsp;<?php echo number_format($billing->penalty_amount,2);?></td>
                </tr>
                <tr>
                    <td colspan="3">Charges</td>
                    <td>Total Amount Due:&nbsp;&nbsp;<?php echo number_format($billing->total_amount_due,2);?></td>
                </tr>
                <?php 
                foreach($charges as $charges){
                    if ($billing->billing_id == $charges->billing_id){
                ?>
                    <tr>
                        <td></td>
                        <td><?php echo $charges->other_charge_no.' - '.$charges->charge_desc.':&nbsp;&nbsp; '.number_format($charges->charge_line_total,2); ?></td>
                        <td colspan="2"></td>
                    </tr>
                <?php }}?>
                <tr>
                    <td colspan="4">&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">TOTAL AMOUNT BEFORE DUE DATE:&nbsp;&nbsp;<b><?php echo number_format($billing->grand_total_amount,2);?></b></td>
                    <td colspan="2">TOTAL AMOUNT AFTER DUE DATE:&nbsp;&nbsp;<b><?php echo number_format($billing->amount_after_due,2);?></b></td>
                </tr>
            </tbody>
        </table>   
    <div style="float: right!important;margin-right: auto;display: block;text-align: right;margin-right: 10px;">File Copy</div>
    <center><div style="border-top: 1px dashed black;height: 1px;width: 100%;text-align: center!important;margin-left: auto;margin-right: auto;display: block;margin-top: 5px;margin-bottom: 5px;"></div></center>
    </div>
    <!-- End -->
    <!-- Customer Copy -->
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
            <?php echo $company_info->company_name; ?><br/>
            <?php echo $company_info->company_address; ?>
        </div>
        <hr style="margin: 0px!important;">
        <div class="center">
            <b>BILLING STATEMENTS</b>
        </div>
        <hr style="margin: 0px!important;">
        <table style="font-size: 12px;">
            <tbody>
                <tr>
                    <td>ACCOUNT NO : &nbsp;&nbsp; <?php echo $billing->account_no; ?></td>
                </tr>
                <tr>
                    <td>Customer Name : &nbsp;&nbsp; <?php echo $billing->customer_name; ?></td>
                </tr>
                <tr>
                    <td>Address: &nbsp;&nbsp; <?php echo $billing->address; ?>
                </tr>
            </tbody>
        </table>
        <hr>
        <table width="100%" style="font-size: 12px;">
            <tbody>
                <tr>
                    <td colspan="2">PERIOD COVERED : <?php echo $billing->period_covered; ?></td>
                    <td colspan="2">Due Date: <?php echo $billing->due_date?></td>
                </tr>
                <tr>
                    <td colspan="2">Meter Reading</td>
                    <td colspan="2">Payables</td>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td>Reading Date: <?php echo $billing->reading_date; ?></td>
                    <td width="10%"></td>
                    <td>Amount Due:&nbsp;&nbsp;<?php echo number_format($billing->amount_due,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Previous Reading:&nbsp;&nbsp; <?php echo number_format($billing->previous_reading,0);?></td>
                    <td></td>
                    <td>Arrears Amount: &nbsp;&nbsp; <?php echo number_format($billing->arrears_amount,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Current Reading: &nbsp;&nbsp; <?php echo number_format($billing->current_reading,0);?></td>
                    <td></td>
                    <td>Arrears Penalty Amount:&nbsp;&nbsp;<?php echo number_format($billing->arrears_penalty_amount,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Consume: &nbsp;&nbsp;<b><?php echo number_format($billing->total_consumption,0);?></b></td>
                    <td></td>
                    <td>Penalty:&nbsp;&nbsp;<?php echo number_format($billing->penalty_amount,2);?></td>
                </tr>
                <tr>
                    <td colspan="3">Charges</td>
                    <td>Total Amount Due:&nbsp;&nbsp;<?php echo number_format($billing->total_amount_due,2);?></td>
                </tr>
                <?php 
                foreach($charges_1 as $charges_1){
                    if ($billing->billing_id == $charges_1->billing_id){
                ?>
                    <tr>
                        <td></td>
                        <td><?php echo $charges_1->other_charge_no.' - '.$charges_1->charge_desc.':&nbsp;&nbsp; '.number_format($charges_1->charge_line_total,2); ?></td>
                        <td colspan="2"></td>
                    </tr>
                <?php }}?>
                <tr>
                    <td colspan="4">&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">TOTAL AMOUNT BEFORE DUE DATE:&nbsp;&nbsp;<b><?php echo number_format($billing->grand_total_amount,2);?></b></td>
                    <td colspan="2">TOTAL AMOUNT AFTER DUE DATE:&nbsp;&nbsp;<b><?php echo number_format($billing->amount_after_due,2);?></b></td>
                </tr>
            </tbody>
        </table>   
    <div style="float: right!important;margin-right: auto;display: block;text-align: right;margin-right: 10px;">Customer Copy</div>
    <center><div style="border-top: 1px dashed black;height: 1px;width: 100%;text-align: center!important;margin-left: auto;margin-right: auto;display: block;margin-top: 5px;margin-bottom: 5px;"></div></center>
    </div>
    <!-- End -->
    <!-- Accounting Copy -->
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
            <?php echo $company_info->company_name; ?><br/>
            <?php echo $company_info->company_address; ?>
        </div>
        <hr style="margin: 0px!important;">
        <div class="center">
            <b>BILLING STATEMENTS</b>
        </div>
        <hr style="margin: 0px!important;">
        <table style="font-size: 12px;">
            <tbody>
                <tr>
                    <td>ACCOUNT NO : &nbsp;&nbsp; <?php echo $billing->account_no; ?></td>
                </tr>
                <tr>
                    <td>Customer Name : &nbsp;&nbsp; <?php echo $billing->customer_name; ?></td>
                </tr>
                <tr>
                    <td>Address: &nbsp;&nbsp; <?php echo $billing->address; ?>
                </tr>
            </tbody>
        </table>
        <hr>
        <table width="100%" style="font-size: 12px;">
            <tbody>
                <tr>
                    <td colspan="2">PERIOD COVERED : <?php echo $billing->period_covered; ?></td>
                    <td colspan="2">Due Date: <?php echo $billing->due_date?></td>
                </tr>
                <tr>
                    <td colspan="2">Meter Reading</td>
                    <td colspan="2">Payables</td>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td>Reading Date: <?php echo $billing->reading_date; ?></td>
                    <td width="10%"></td>
                    <td>Amount Due:&nbsp;&nbsp;<?php echo number_format($billing->amount_due,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Previous Reading:&nbsp;&nbsp; <?php echo number_format($billing->previous_reading,0);?></td>
                    <td></td>
                    <td>Arrears Amount: &nbsp;&nbsp; <?php echo number_format($billing->arrears_amount,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Current Reading: &nbsp;&nbsp; <?php echo number_format($billing->current_reading,0);?></td>
                    <td></td>
                    <td>Arrears Penalty Amount:&nbsp;&nbsp;<?php echo number_format($billing->arrears_penalty_amount,2);?></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Consume: &nbsp;&nbsp;<b><?php echo number_format($billing->total_consumption,0);?></b></td>
                    <td></td>
                    <td>Penalty:&nbsp;&nbsp;<?php echo number_format($billing->penalty_amount,2);?></td>
                </tr>
                <tr>
                    <td colspan="3">Charges</td>
                    <td>Total Amount Due:&nbsp;&nbsp;<?php echo number_format($billing->total_amount_due,2);?></td>
                </tr>
                <?php 
                foreach($charges_2 as $charges_2){
                    if ($billing->billing_id == $charges_2->billing_id){
                ?>
                    <tr>
                        <td></td>
                        <td><?php echo $charges_2->other_charge_no.' - '.$charges_2->charge_desc.':&nbsp;&nbsp; '.number_format($charges_2->charge_line_total,2); ?></td>
                        <td colspan="2"></td>
                    </tr>
                <?php }}?>
                <tr>
                    <td colspan="4">&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">TOTAL AMOUNT BEFORE DUE DATE:&nbsp;&nbsp;<b><?php echo number_format($billing->grand_total_amount,2);?></b></td>
                    <td colspan="2">TOTAL AMOUNT AFTER DUE DATE:&nbsp;&nbsp;<b><?php echo number_format($billing->amount_after_due,2);?></b></td>
                </tr>
            </tbody>
        </table>   
    <div style="float: right!important;margin-right: auto;display: block;text-align: right;margin-right: 10px;">Accounting Copy</div>
    <center><div style="border-top: 1px dashed black;height: 1px;width: 100%;text-align: center!important;margin-left: auto;margin-right: auto;display: block;margin-top: 5px;"></div></center>
    </div>
    <!-- End -->     
</div>
<?php }?>













