<!DOCTYPE html>
<html>
<head>
	<title>Penalties Incurred (<?php echo $month[0]->month_name.' '.$year; ?>)</title>
	<style>
		body{
			font-family: arial;
		}
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
	    .border-bottom{
	    	border-bottom: 1px solid black;
	    }
	    .border-top{
	    	border-top: 1px solid black;
	    }
	</style>	
</head>
<body>
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

	<table width="100%">
		<tr>
			<td align="center">
				<h3>Penalties Incurred for the month of <?php echo $month[0]->month_name.' '.$year; ?></h3>	
			</td>
		</tr>
	</table> <br/>

	<table width="100%">
		<tr>
			<td class="border-bottom" width="5%"><strong>#</strong></td>
			<td class="border-bottom" width="20%"><strong>Account #</strong></td>
			<td class="border-bottom" width="15%"><strong>Meter Serial</strong></td>
			<td class="border-bottom" width="40%"><strong>Particular</strong></td>
			<td class="border-bottom" width="20%" align="right"><strong>Penalty Amount</strong></td>
		</tr>
		<?php 
			$i=1;
			$total_penalties = 0;
			foreach($infos as $info){
			$total_penalties += $info->penalty_fee; ?>
			<tr>
				<td><?php echo $i; ?>.</td>
				<td><?php echo $info->account_no; ?></td>
				<td><?php echo $info->serial_no; ?></td>
				<td><?php echo $info->receipt_name; ?></td>
				<td align="right"><?php echo $info->penalty_fee; ?></td>
			</tr>
		<?php 
			$i++;
		}?>
		<tr>
			<td class="border-top" colspan="4" align="right"><strong>Total</strong></td>
			<td class="border-top" align="right">
				<strong><?php echo number_format($total_penalties,2); ?></strong>
			</td>
		</tr>
	</table>
</body>
</html>