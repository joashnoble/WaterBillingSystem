<head>  
    <title>Connection Masterfile </title>
    <link rel="icon" href="<?php echo base_url('assets/img/companyico.ico'); ?>" type="image/ico" sizes="16x16">
</head>
<body> <style type="text/css">
        body {
            font-family: 'Calibri',sans-serif;
            font-size: 12px;
        }
        
        .align-right {
            text-align: right;
        }

        .align-left {
            text-align: left;
        }

        .align-center {
            text-align: center;
        }
            table{
        border:none!important;
    }
    table-td.left{
        border-left: 1px solid gray!important;
    }
    table-td.right{
        border-left: 1px solid gray!important;
    }
    #tbl_supplier thead tr th {
        border-bottom: 2px solid gray;text-align: left;height: 30px;padding: 6px;
    }
</style>
<div>
    <table width="100%" cellspacing="5" cellspacing="0">
        <tr>
            <td width="10%"  class="bottom"><img src="<?php echo base_url($company_info->logo_path); ?>" style="height: 90px; width: 120px; text-align: left;"></td>
            <td width="90%"  class="bottom" >
                <h1 class="report-header" style="margin-bottom: 0"><strong><?php echo $company_info->company_name; ?></strong></h1>
                <span><?php echo $company_info->company_address; ?></span><br>
                <span><?php echo $company_info->landline.'/'.$company_info->mobile_no; ?></span><br>
                <span><?php echo $company_info->email_address; ?></span><br>

            </td>
        </tr>
    </table>
    <br>
    <table width="100%" style="font-size: 10pt;border-collapse: collapse;border-spacing: 0;">
        <tr>
            <td style="font-size: 12pt;"><b>SERVICE CONNECTION MASTERFILE</b></td>
            <td align="right">Date Printed : <?php echo date('m/d/Y h:i a'); ?></td>
        </tr>
        <tr>
            <td></td>
            <td align="right">Printed by : <?php echo $user; ?></td>
        </tr>
    </table>

        <table width="100%" style="border-collapse: collapse;border-spacing: 0;font-family: tahoma;font-size: 11" id="tbl_supplier">
            <thead>
            <tr>
                <th>#</th>
                <th style="width: 80px;">Service No</th>
                <th style="width: 80px;">Account No</th>
                <th>Customer</th>
                <th style="width: 60px;">Service Date</th>
                <th>Meter Serial</th>
                <th>Name to appear on receipt</th>
                <th>Address</th>
                <th>Target Installation Date & Time</th>
                <th>Contract Type</th>
                <th>Rate Type</th>
                <th>Account Type</th>
                <th style="text-align: right;">Initial Reading</th>
                <th style="text-align: right;">Initial Deposit</th>
                <th>Attended By</th>
                <th>Current Account Status</th>
            </tr>
            </thead>
            <tbody>
            
            <?php 
            $i=1;
            foreach ($connection as $row) { ?>
            <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo $row->service_no ?></td>
                <td><?php echo $row->account_no ?></td>
                <td><?php echo $row->customer_name ?></td>
                <td><?php echo $row->service_date ?></td>
                <td><?php echo $row->serial_no ?></td>
                <td><?php echo $row->receipt_name ?></td>
                <td><?php echo $row->address ?></td>
                <td><?php echo $row->target_date.' '.$row->target_time ?></td>
                <td><?php echo $row->contract_type_name ?></td>
                <td><?php echo $row->rate_type_name ?></td>
                <td><?php echo $row->customer_account_type_desc; ?></td>
                <td align="right"><?php echo number_format($row->initial_meter_reading,0) ?></td>
                <td align="right"><?php echo number_format($row->initial_meter_deposit,2) ?></td>

                <td><?php echo $row->attendant ?></td>
                <td><?php echo $row->current_account_status ?></td>
            </tr>
            <?php $i++; } ?>

            </tr>
            </tbody>
            <tfoot>
            </tfoot>
        </table><br /><br />
    </center>
</div>








<script type="text/javascript">
    window.print();
</script>













