<style type="text/css">
    .static-sidebar-wrapper {
        transition: .2s;
    }

    .sidebar nav.widget-body > ul.acc-menu li.secondChild > a {
        background: #/161616;
    }

    .sidebar nav.widget-body > ul.acc-menu ul {
        padding: 0!important;
    }
</style>
<div class="static-sidebar-wrapper sidebar-default">
    <div class="static-sidebar">
        <div class="sidebar">
            <div class="widget">
                <div class="widget-body">
                    <div class="userinfo">
                        <div class="avatar">
                            <img style="min-width: 60px; min-height: 60px;" src="<?php echo $this->session->user_photo; ?>" class="img-responsive img-circle">
                        </div>
                        <div class="info">
                            <span class="username"><?php echo $this->session->user_fullname; ?></span>
                            <span class="useremail"><?php echo $this->session->user_email; ?></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="widget stay-on-collapse" id="widget-sidebar">
                <nav role="navigation" class="widget-body">
                    <ul class="acc-menu">
                        <li class="nav-separator"><span>Explore</span></li>
                        <li><a href="Dashboard"><i class="ti ti-home"></i><span>Dashboard</span>
                        <li class="<?php echo (in_array('17',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-wallet"></i><span>Billing Services</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('17-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="ServiceConnection">Service Connection</a></li>
                                <li class="<?php echo (in_array('17-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Service_disconnection">Service Disconnection</a></li>
                                <li class="<?php echo (in_array('17-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Service_reconnection">Service Reconnection</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('18',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="fa fa-circle-o-notch"></i><span>Process Billing</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('18-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Meter_reading_input">Meter Reading Entry</a></li>
                                <li class="<?php echo (in_array('18-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Process_billing">Process Billing</a></li>
                                <li class="<?php echo (in_array('18-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Billing_payments">Billing Payments</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('19',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="fa fa-money "></i><span>Charges</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('19-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Charges">Charges Management</a></li>
                                <li class="<?php echo (in_array('19-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Charge_unit">Charge Unit Management</a></li>
                                <li class="<?php echo (in_array('19-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Other_charges">Other Charges</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('20',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-view-list-alt"></i><span>Billing References</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('20-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Matrix_residential">Residential Rate Matrix</a></li>
                                <li class="<?php echo (in_array('20-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Matrix_commercial">Commercial Rate Matrix</a></li>
                                <li class="<?php echo (in_array('20-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="MeterInventory">Meter Inventory</a></li>
                                <li class="<?php echo (in_array('20-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Meter_reading_period">Meter Reading Period</a></li>
                                <li class="<?php echo (in_array('20-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Attendant">Attendant Management</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('21',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-file"></i><span>Billing Reports</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('21-8',$this->session->user_rights)?'':'hidden'); ?>"><a href="Monthly_connection">Monthly Connection</a></li>
                                <li class="<?php echo (in_array('21-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Billing_statement">Billing Statement</a></li>
                                <li class="<?php echo (in_array('21-9',$this->session->user_rights)?'':'hidden'); ?>"><a href="Penalties_incurred">Penalties Incurred</a></li>
                                <li class="<?php echo (in_array('21-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Customer_consumption_history">Consumption History</a></li>
                                <li class="<?php echo (in_array('21-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Customer_billing_subsidiary">Customer Billing Subsidiary</a></li>
                                 <li class="<?php echo (in_array('21-7',$this->session->user_rights)?'':'hidden'); ?>"><a href="Customer_billing_receivables">Customer Billing Receivables</a></li> 
                                <li class="<?php echo (in_array('21-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Batch_connection_deposit_report">Batch Connection Deposits</a></li>
                                <li class="<?php echo (in_array('21-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Batch_payments_report">Batch Payments Report</a></li>
                                <li class="<?php echo (in_array('21-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Service_trail">Service Trail</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('22',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="fa fa-paper-plane "></i><span>Billing Transfer</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('22-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Connection_sending">Connection Deposits Sending</a></li>
                                <li class="<?php echo (in_array('22-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Billing_sending">Billing Sending</a></li>
                                <li class="<?php echo (in_array('22-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Payment_sending">Payment Sending</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('1',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-wallet"></i><span>Financing</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('1-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="General_journal">General Journal</a></li>
                                <li class="<?php echo (in_array('1-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Cash_disbursement">Cash Disbursement</a></li>
                                <li class="<?php echo (in_array('1-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_payables">Purchase Journal</a></li>
                                <li class="<?php echo (in_array('1-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Accounts_receivable">Sales Journal</a></li>
                                <li class="<?php echo (in_array('1-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Petty_cash_journal">Petty Cash Journal</a></li>
                                <li class="<?php echo (in_array('1-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Cash_receipt">Cash Receipt Journal</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('13',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-view-list-alt"></i><span>Services</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('13-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Service_invoice">Service Invoice</a></li>
                                <li class="<?php echo (in_array('13-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Service_journal">Service Journal</a></li>
                                <li class="<?php echo (in_array('13-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Service_unit">Service Unit</a></li>
                                <li class="<?php echo (in_array('13-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Services">Service Management</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('2',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-package"></i><span>Purchasing</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('2-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Purchases">Purchase Order</a></li>
                                <li class="<?php echo (in_array('2-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Deliveries">Purchase Invoice</a></li>
                                <li class="<?php echo (in_array('2-8',$this->session->user_rights)?'':'hidden'); ?>"><a href="Purchase_history">Purchase History</a></li>
                                <li class="<?php echo (in_array('2-7',$this->session->user_rights)?'':'hidden'); ?>"><a href="Purchase_monitoring">Purchase Monitoring</a></li>
                                <li class="<?php echo (in_array('2-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Payable_payments">Record Payment</a></li>

                            </ul>
                        </li>
                        <li class="<?php echo (in_array('3',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-shopping-cart"></i><span>Sales</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('3-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Sales_order">Sales Order</a></li>
                                <li class="<?php echo (in_array('3-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Sales_invoice">Sales Invoice</a></li>
                                <li class="<?php echo (in_array('3-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Cash_invoice">Cash Invoice</a></li>
                                <li class="<?php echo (in_array('3-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Dispatching">Warehouse Dispatching</a></li>

                                <!-- <li><a href="Sales_invoice_other">Other Sales Invoice</a></li> -->
                                <li class="<?php echo (in_array('3-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Receivable_payments">Collection Entry</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('15',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-stats-up"></i><span>Inventory</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('15-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="products">Product Management</a></li>
                                <li class="<?php echo (in_array('15-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Issuances">Item Issuance</a></li>
                                <li class="<?php echo (in_array('15-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Issuance_department">Item Transfer</a></li>
                                <li class="<?php echo (in_array('15-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Adjustments">Item Adjustment</a></li>
                                <li class="<?php echo (in_array('15-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Inventory">Inventory</a></li>
                                <li class="<?php echo (in_array('15-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Stock_card">Stock Card</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('4',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-view-list-alt"></i><span>References</span></a>
                            <ul class="acc-menu">
                                <li  class="<?php echo (in_array('4-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_classes">Account Classification</a></li>
                                <li  class="<?php echo (in_array('4-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="categories">Category Management</a></li>
                                <li  class="<?php echo (in_array('4-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="departments">Department Management</a></li>
                                <li  class="<?php echo (in_array('4-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="units">Unit Management</a></li>
                                <li  class="<?php echo (in_array('4-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Locations">Locations Management</a></li>
                                <li  class="<?php echo (in_array('4-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Bank">Bank Management</a></li>
                                <li  class="<?php echo (in_array('4-7',$this->session->user_rights)?'':'hidden'); ?>"><a href="Brands">Brands Management</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('5',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-harddrive"></i><span>Masterfiles</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('5-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="products">Product Management</a></li>
                                <li class="<?php echo (in_array('5-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="suppliers">Supplier Management</a></li>
                                <li class="<?php echo (in_array('5-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="customers">Customer Management</a></li>
                                <li class="<?php echo (in_array('5-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Salesperson">Salesperson Management</a></li>

                            </ul>
                        </li>
                        <li class="<?php echo (in_array('14',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-view-list-alt"></i><span>Treasury</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('14-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Treasury">Treasury</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('11',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-credit-card"></i><span>Bank Reconciliation</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('11-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Bank_reconciliation">Bank Reconciliation</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('10',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-bag"></i><span>Assets Management</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('10-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Fixed_asset_management">Fixed Asset Management</a></li>
                                <li class="<?php echo (in_array('10-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Depreciation_expense">Depreciation Expense Report</a></li>
                            </ul>
                        </li>
<!--                         <li class="<?php echo (in_array('15',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-file"></i><span>Bir Forms</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('15-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Form_2307">Form 2307</a></li>
                               
                            </ul>
                        </li> -->
                        <li class="<?php echo (in_array('6',$this->session->parent_rights)?'':'hidden'); ?>">
                            <a href="#/"><i class="ti ti-settings"></i><span>Settings</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('6-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Tax">Setup Tax</a></li>
                                <li class="<?php echo (in_array('6-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_titles">Setup Chart of Accounts</a></li>
                                <li class="<?php echo (in_array('6-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_integration">General Configuration</a></li>
                                <li class="<?php echo (in_array('6-14',$this->session->user_rights)?'':'hidden'); ?>"><a href="Soa_settings">SOA Settings</a></li>
                                <li class="<?php echo (in_array('6-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="User_groups">Setup User Rights</a></li>
                                <li class="<?php echo (in_array('6-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="users">Create User Account</a></li>
                                <li class="<?php echo (in_array('6-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="company">Setup Company Info</a></li>
                                <li class="<?php echo (in_array('6-7',$this->session->user_rights)?'':'hidden'); ?>"><a href="Check_layout">Setup Check Layout</a></li>
                                <li class="<?php echo (in_array('6-8',$this->session->user_rights)?'':'hidden'); ?>"><a href="Recurring_template">Recurring Template</a></li>
                                <li class="<?php echo (in_array('6-10',$this->session->user_rights)?'':'hidden'); ?>"><a href="Email_settings">Email Settings</a></li>
                                <li class="<?php echo (in_array('6-11',$this->session->user_rights)?'':'hidden'); ?>"><a href="Email_report_settings">Email Report Settings</a></li>
                                <li class="<?php echo (in_array('6-9',$this->session->user_rights)?'':'hidden'); ?>"><a href="DBBackup">Backup Database</a></li>
                                <li class="<?php echo (in_array('6-13',$this->session->user_rights)?'':'hidden'); ?>"><a href="Trail">Audit Trail</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('9',$this->session->parent_rights)?'':'hidden'); ?>">
                            <a href="#/"><i class="ti ti-bar-chart"></i><span>Accounting Reports</span></a>
                            <ul class="acc-menu parent-menu">
                                <li class="hasChild secondChild">
                                    <a href="#/"><span>Client</span></a>
                                    <ul class="acc-menu">
                                        <li class="<?php echo (in_array('9-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Customer_Subsidiary">Customer Subsidiary</a></li>
                                        <li class="<?php echo (in_array('9-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_receivable_schedule">AR Schedule</a></li>
                                        <li class="<?php echo (in_array('9-15',$this->session->user_rights)?'':'hidden'); ?>"><a href="AR_Receivable">AR Reports</a></li>
                                        <li class="<?php echo (in_array('9-17',$this->session->user_rights)?'':'hidden'); ?>"><a href="Aging_receivables">Aging of Receivables</a></li>
                                        <li class="<?php echo (in_array('9-19',$this->session->user_rights)?'':'hidden'); ?>"><a href="SOA">Statement of Account</a></li>
                                    </ul>
                                </li>
                                <li class="hasChild secondChild">
                                    <a href="#/"><span>Vendor</span></a>
                                    <ul class="acc-menu">
                                        <li class="<?php echo (in_array('9-7',$this->session->user_rights)?'':'hidden'); ?>"><a href="Supplier_Subsidiary">Supplier Subsidiary</a></li>
                                        <li class="<?php echo (in_array('9-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_payable_schedule">AP Schedule</a></li>
                                        <li class="<?php echo (in_array('9-18',$this->session->user_rights)?'':'hidden'); ?>"><a href="Aging_payables">Aging of Payables</a></li>
                                    </ul>
                                </li>
                                <li class="hasChild secondChild">
                                    <a href="#/"><span>Financial Reports</span></a>
                                    <ul class="acc-menu">
                                        <li class="<?php echo (in_array('9-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Income_statement">Income Statement</a></li>
                                        <li class="<?php echo (in_array('9-9',$this->session->user_rights)?'':'hidden'); ?>"><a href="Annual_income_statement">Annual Income Report</a></li>
                                        <li class="<?php echo (in_array('9-16',$this->session->user_rights)?'':'hidden'); ?>"><a href="Comparative_income">Comparative Income Report</a></li>
                                        <li class="<?php echo (in_array('9-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Trial_balance">Trial Balance</a></li>
                                        <li class="<?php echo (in_array('9-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Balance_sheet">Balance Sheet</a></li>
                                    </ul>
                                </li>
                                <li class="hasChild secondChild">
                                    <a href="#/"><span>Other Accounting Report</span></a>
                                    <ul class="acc-menu">
                                        <li class="<?php echo (in_array('9-14',$this->session->user_rights)?'':'hidden'); ?>"><a href="TAccount">T-Accounts</a></li>
                                        <!-- <li class="<?php echo (in_array('9-11',$this->session->user_rights)?'':'hidden'); ?>"><a href="Schedule_expense">Schedule of Expense</a></li> -->
                                        <li class="<?php echo (in_array('9-8',$this->session->user_rights)?'':'hidden'); ?>"><a href="Account_Subsidiary">Account Subsidiary</a></li>
                                        <li class="<?php echo (in_array('9-13',$this->session->user_rights)?'':'hidden'); ?>"><a href="Replenishment_report">Replenishment Report</a></li>
                                        <li class="<?php echo (in_array('9-20',$this->session->user_rights)?'':'hidden'); ?>"><a href="Replenishment_batch">Replenishment Batch</a></li>
                                        <li class="<?php echo (in_array('9-21',$this->session->user_rights)?'':'hidden'); ?>"><a href="General_ledger">General Ledger</a></li>
                                    </ul>
                                </li>
                                <li class="hasChild secondChild">
                                    <a href="#/"><span>Cost</span></a>
                                    <ul class="acc-menu">
                                        <li class="<?php echo (in_array('9-12',$this->session->user_rights)?'':'hidden'); ?>"><a href="Cogs">Cost of Goods</a></li>
                                        <li class="<?php echo (in_array('9-10',$this->session->user_rights)?'':'hidden'); ?>"><a href="Vat_relief_report">Vat Relief Report</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('16',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-pie-chart"></i><span>BIR Forms</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('16-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Certificate_of_creditable_tax">2307</a></li>
                                <li class="<?php echo (in_array('16-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Monthly_percentage_tax_return">2551M</a></li>
                                <li class="<?php echo (in_array('16-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Quarterly_percentage_tax_return">2551Q</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('8',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-pie-chart"></i><span>Sales &amp; Purchasing</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('8-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Sales_detailed_summary">Sales Report</a></li>
                                <li class="<?php echo (in_array('8-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Purchase_Invoice_Report">Purchase Invoice Report</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('12',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#/"><i class="ti ti-view-list-alt"></i><span>List</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('12-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Pick_list">Product Reorder (Pick-list)</a></li>
                                <li class="<?php echo (in_array('12-7',$this->session->user_rights)?'':'hidden'); ?>"><a href="Product_list_report">Product List Report</a></li>

                                <li class="<?php echo (in_array('12-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Voucher_registry_report">Voucher Registry Report</a></li>
                                <li class="<?php echo (in_array('12-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Check_registry_report">Check Registry Report</a></li>
                                <li class="<?php echo (in_array('12-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Collection_list_report">Collection List Report</a></li>
                                <li class="<?php echo (in_array('12-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Open_purchase">Open Purchases</a></li>
                                <li class="<?php echo (in_array('12-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Open_sales">Open Sales</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <!--<div class="widget" id="widget-progress">
                <div class="widget-heading">
                    Progress
                </div>
                <div class="widget-body">
                    <div class="mini-progressbar">
                        <div class="clearfix mb-sm">
                            <div class="pull-left">Bandwidth</div>
                            <div class="pull-right">50%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-lime" style="width: 50%"></div>
                        </div>
                    </div>
                    <div class="mini-progressbar">
                        <div class="clearfix mb-sm">
                            <div class="pull-left">Storage</div>
                            <div class="pull-right">25%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-info" style="width: 25%"></div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>
    </div>
</div>

<!-- <script>
    (function(){
        $('.non').click(function(){
            alert('')
        });
    })();
</script> -->