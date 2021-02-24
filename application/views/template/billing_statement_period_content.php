<head>
    <title>Billing Statement Report</title>
    <link rel="icon" href="<?php echo base_url('assets/img/companyico.ico'); ?>" type="image/ico" sizes="16x16">
</head>
<body>
<style>
    table{
        border:none!important;
        font-family: Calibri;
        font-size: 12px;
        border-collapse: collapse;
    }
    td{
        padding: 0px!important;
        margin: 0px!important; 
        padding: 3px;
    }
    th{
        border-bottom: 1px solid lightgray;
    }
</style>
<table width="100%" class="nohover" >
    <tr>
        <td  class="bottom-only" width="10%" style="object-fit: cover;"><img src="<?php echo $company_info->logo_path; ?>" style="height: 90px; width: 90px; text-align: left;"></td>
        <td class="bottom-only" width="90%" class="">
            <h1 class="report-header"><strong><?php echo $company_info->company_name; ?></strong></h1>
            <p><?php echo $company_info->company_address; ?></p>
            <p><?php echo $company_info->landline.'/'.$company_info->mobile_no; ?></p>
            <span><?php echo $company_info->email_address; ?></span><br>

        </td>
    </tr>
</table><hr>    
<h4>Monthly Billing Summary</h4>
<table width="100%">
    <tr>
        <td>Date Inclusive : <?php echo $meter_period->date_inclusive; ?></td>
        <td align="right">Date Printed : <?php echo date('m/d/Y h:i a');?></td>
    </tr>
    <tr>
        <td></td>
        <td align="right">Printed by: <?php echo $user; ?></td>
    </tr>
</table>
<br>
<table width="100%">
    <thead>
        <tr>
            <th align="left" width="12%"><b>Account No</b></th>
            <th align="left" width="22%"><b>Customer Name</b> </th>
            <th align="left" width="10%"><b>Serial No</b> </th>
            <th align="right" width="8%"><b>Total Consumption</b></th>
            <th align="right" width="8%"><b>Amount Due</b></th>
            <th align="right" width="10%"><b>Previous Balance</b></th>
            <th align="right" width="10%"><b>Arrears Penalty</b></th>
            <th align="right" width="10%"><b>Charges</b></th>
            <th align="right" width="10%"><b>Grand Total</b></th>
        </tr>  
    </thead>  
    <tbody>
        <?php 
            $total = 0;
            if(count($billings) > 0){
            foreach($billings as $billing){
                $total += $billing->grand_total_amount_label_for_report;
            ?>
            <tr>
                <td><?php echo $billing->account_no; ?></td>
                <td><?php echo $billing->receipt_name; ?></td>
                <td><?php echo $billing->serial_no; ?></td>
                <td align="right"><?php echo number_format($billing->total_consumption,0); ?></td>
                <td align="right"><?php echo number_format($billing->amount_due,2); ?></td>
                <td align="right"><?php echo number_format($billing->previous_balance,2);?></td>
                <td align="right"><?php echo number_format($billing->arrears_penalty_amount,2);?></td>
                <td align="right"><?php echo number_format($billing->charges_amount,2);?></td>
                <td align="right"><?php echo number_format($billing->grand_total_amount_label_for_report,2);?></td>
            </tr>
        <?php }
            echo '<tr>';
            echo '<td colspan="8" align="right" style="border-top: 1px solid lightgray;"><b>Total</b></td>';
            echo '<td align="right" style="border-top: 1px solid lightgray;"><b>'.number_format($total ,2).'</b></td>';
            echo '</tr>';
        }else{
            echo '<tr>';
            echo '<td colspan="9" style="border-top: 1px solid lightgray;">';        
            echo '<center>No Data Available</center>';
            echo '</td>';
            echo '</tr>';
        }?>        
    </tbody>   
</table>