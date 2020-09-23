<div class="row" style="padding:10px;">

    <table width="100%" border="0" cellspacing="-1" style=""> 
        <tr>
            <td width="40%" style="padding: 4px;"><strong>Meter Serial No:</strong> <?php echo $info->serial_no; ?> </td>
            <td width="60%" style="padding: 4px;" colspan="2"><strong>Account # :</strong> <?php echo $info->account_no; ?></td>
        </tr>
        <tr>
            <td style="padding: 4px;"><strong>Receipt # :</strong> <?php echo $info->receipt_no; ?></td>
            <td style="padding: 4px;" colspan="2"><strong>Date :</strong> <?php echo date_format(new DateTime($info->date_paid),"m/d/Y"); ?></td>
        </tr>
        <tr>
            <td style="padding: 4px;"><strong>Payment Method :</strong> <?php echo $info->payment_method; ?></td>
            <td style="padding: 4px;" ><?php  if($info->payment_method_id == 2) { ?>  <strong>Check Date :</strong> <?php echo $info->check_date; ?> <?php } ?></td>
            <td style="padding: 4px;" ><?php  if($info->payment_method_id == 2) { ?><strong>Check # :</strong>  <?php echo $info->check_no; ?> <?php } ?></td>
        </tr>
        <tr>
        <td style="padding: 4px;"><strong>Customer :</strong> <?php echo $info->receipt_name; ?></td>
        <td style="padding: 4px;" ><strong>Payment Amount :</strong>  <?php echo number_format($info->total_payment_amount,2); ?></td>
        <td style="padding: 4px;" ><?php if($info->total_deposit_amount != 0){ ?> <strong>Deposit Used :</strong> <?php echo number_format($info->total_deposit_amount,2); ?> <?php } ?></td>
            
        </tr>
        <td style="padding: 4px;"><strong>Address :</strong> <?php echo $info->address; ?></td>
            <td style="padding: 4px;" > <?php if($info->is_refund == 1){ ?><strong> Refunded Remaining Deposit ?</strong> <?php  echo 'Yes'; } ?> </td>
            <td style="padding: 4px;" ><?php if($info->is_refund == 1){  ?> <strong> Refund Amount: </strong><?php  echo $info->refund_amount; } ?> </td>
        </tr>
            <td style="padding: 4px;" colspan="3"><strong>Remarks :</strong> <?php echo $info->remarks; ?></td>
        </tr>
    </table><br>



        <table width="100%" style="font-size: 12px"  class="modal-child table table-striped"  > 
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
                <td style="text-align: left;"><?php  echo $item->month_name; ?> <?php echo $item->meter_reading_year; ?>  (<?php echo $item->transaction_type; ?>)</td>
                <td><?php echo date('F d, Y', strtotime($item->due_date)); ?></td>
                <td> <?php echo number_format($item->amount_paid,2); ?></td>
                <td> <?php echo number_format($item->penalty_paid,2); ?></td>
                <td style="text-align: right;"><?php  echo number_format($item->total_payment,2) ?></td>
            </tr>
        <?php } ?>
        </tbody>
            <tfoot>   
            <tr>
                <td style="text-align: left;"></td>
                <td></td>
                <td> </td>
                <td style="text-align: right;font-weight: bold;"> GRAND TOTAL</td>
                <td style="text-align: right;font-weight: bold;"><?php  echo number_format($grand_total_payment,2); ?></td>
            </tr>   
            </tfoot>     
        
        </table>


<small><i> <b>Created by </b> : <?php echo $info->posted_by_user; ?><b> on </b>  <?php echo  $info->date_created; ?></i> </small> <br>
<small><i> <?php if ($info->is_active == 0) {?> <b>Cancelled by :</b> <?php echo $info->cancelled_by; ?>  <b> on </b> <?php echo  $info->date_cancelled; } ?> </i> </small><br>
</div>

