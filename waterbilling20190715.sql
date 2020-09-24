-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 23, 2020 at 09:55 PM
-- Server version: 5.7.31-0ubuntu0.16.04.1
-- PHP Version: 5.6.40-12+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waterbilling20190715`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_period`
--

CREATE TABLE `accounting_period` (
  `accounting_period_id` bigint(20) NOT NULL,
  `period_start` date DEFAULT '0000-00-00',
  `period_end` date DEFAULT '0000-00-00',
  `closed_by_user` bigint(20) DEFAULT '0',
  `date_time_closed` datetime DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_classes`
--

CREATE TABLE `account_classes` (
  `account_class_id` bigint(20) NOT NULL,
  `account_class` varchar(755) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `account_type_id` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` date DEFAULT '0000-00-00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_classes`
--

INSERT INTO `account_classes` (`account_class_id`, `account_class`, `description`, `account_type_id`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_active`, `is_deleted`) VALUES
(1, 'Current Assets', '', 1, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(2, 'Non-Current Assets', '', 1, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(3, 'Current Liabilities', '', 2, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(4, 'Long-term Liabilities', '', 2, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(5, 'Owners Equity', '', 3, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(6, 'Operating Expense', '', 5, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(7, 'Income', '', 4, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00 00:00:00', 0, 0, 0, b'1', b'0'),
(8, 'Administrative Costs', 'Administrative Costs', 5, '2019-10-04 10:53:09', '0000-00-00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `account_integration`
--

CREATE TABLE `account_integration` (
  `integration_id` int(11) NOT NULL,
  `input_tax_account_id` bigint(20) DEFAULT '0',
  `payable_account_id` bigint(20) DEFAULT '0',
  `payable_discount_account_id` bigint(20) DEFAULT '0',
  `payment_to_supplier_id` bigint(20) DEFAULT '0',
  `output_tax_account_id` bigint(20) DEFAULT '0',
  `receivable_account_id` bigint(20) DEFAULT '0',
  `receivable_discount_account_id` bigint(20) DEFAULT '0',
  `payment_from_customer_id` bigint(20) DEFAULT '0',
  `retained_earnings_id` bigint(20) DEFAULT '0',
  `petty_cash_account_id` int(11) DEFAULT '0',
  `sales_invoice_inventory` bit(1) DEFAULT NULL,
  `depreciation_expense_debit_id` bigint(20) DEFAULT '0',
  `depreciation_expense_credit_id` bigint(20) DEFAULT '0',
  `cash_invoice_debit_id` bigint(20) DEFAULT '0',
  `cash_invoice_credit_id` bigint(20) DEFAULT '0',
  `cash_invoice_inventory` bit(1) DEFAULT NULL,
  `dispatching_invoice_inventory` bit(1) DEFAULT b'0',
  `supplier_wtax_account_id` bigint(20) DEFAULT '0',
  `default_matrix_residential_id` bigint(20) DEFAULT '0',
  `default_matrix_commercial_id` bigint(20) DEFAULT '0',
  `billing_meter_account_id` bigint(20) DEFAULT '0',
  `billing_penalty_account_id` bigint(20) DEFAULT '0',
  `billing_department_id` bigint(20) DEFAULT '0',
  `billing_customer_id` bigint(20) DEFAULT '0',
  `billing_security_deposit_account_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_integration`
--

INSERT INTO `account_integration` (`integration_id`, `input_tax_account_id`, `payable_account_id`, `payable_discount_account_id`, `payment_to_supplier_id`, `output_tax_account_id`, `receivable_account_id`, `receivable_discount_account_id`, `payment_from_customer_id`, `retained_earnings_id`, `petty_cash_account_id`, `sales_invoice_inventory`, `depreciation_expense_debit_id`, `depreciation_expense_credit_id`, `cash_invoice_debit_id`, `cash_invoice_credit_id`, `cash_invoice_inventory`, `dispatching_invoice_inventory`, `supplier_wtax_account_id`, `default_matrix_residential_id`, `default_matrix_commercial_id`, `billing_meter_account_id`, `billing_penalty_account_id`, `billing_department_id`, `billing_customer_id`, `billing_security_deposit_account_id`) VALUES
(1, 5, 17, 1, 1, 31, 2, 42, 1, 34, 1, b'1', 11, 45, 1, NULL, b'1', b'0', 28, 1, 1, 35, 36, 1, 112, 32);

-- --------------------------------------------------------

--
-- Table structure for table `account_titles`
--

CREATE TABLE `account_titles` (
  `account_id` bigint(20) NOT NULL,
  `account_no` varchar(75) DEFAULT '',
  `account_title` varchar(755) DEFAULT '',
  `account_class_id` int(11) DEFAULT '0',
  `parent_account_id` int(11) DEFAULT '0',
  `grand_parent_id` int(11) DEFAULT '0',
  `description` varchar(1000) DEFAULT '',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_titles`
--

INSERT INTO `account_titles` (`account_id`, `account_no`, `account_title`, `account_class_id`, `parent_account_id`, `grand_parent_id`, `description`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_active`, `is_deleted`) VALUES
(1, '11001-01-01', 'Cash in Bank-MBTC 047-5', 1, 0, 1, '', '2019-10-04 10:41:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(2, '11002-01-01', 'Accts Receivables-Waterworks ', 1, 0, 2, '', '2019-10-04 10:41:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(3, '11002-02-01', 'Int. Receivables-Penalties and Surcharges', 1, 0, 3, '', '2019-10-04 10:41:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(4, '11004-01-01', 'Others-Water Meters', 1, 0, 4, '', '2019-10-04 10:41:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(5, '11005-01-01', 'Input VAT', 1, 0, 5, '', '2019-10-04 10:42:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(6, '12001-01-01', 'Office Equipments', 2, 0, 6, '', '2019-10-04 10:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(7, '12001-01-02', 'Furniture & Fixtures', 2, 0, 7, '', '2019-10-04 10:42:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(8, '12001-01-03', 'Land Improvements', 2, 0, 8, '', '2019-10-04 10:42:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(9, '12001-02-01', 'Field Equipments', 2, 0, 9, '', '2019-10-04 10:43:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(10, '12001-01-04', 'Computer Software/Program', 2, 0, 10, '', '2019-10-04 10:43:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(11, '12001-01-05', 'Accum. Depreciation - Office Equipments', 2, 0, 11, '', '2019-10-04 10:43:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(12, '12001-01-06', 'Accum. Depreciation - Furniture & Fixtures', 2, 0, 12, '', '2019-10-04 10:43:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(13, '12001-01-07', 'Accum. Depreciation - Land Improvements', 2, 0, 13, '', '2019-10-04 10:43:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(14, '12001-01-08', 'Accum. Depreciation - Field Equipments', 2, 0, 14, '', '2019-10-04 10:44:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(15, '12001-02-02', 'Amortization - Computer Software/Program', 2, 0, 15, '', '2019-10-04 10:44:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(16, '21001-01-01', 'Accounts Payable-Professional Fees', 3, 0, 16, '', '2019-10-04 10:44:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(17, '21001-01-02', 'Accounts Payable-Supplies', 3, 0, 17, '', '2019-10-04 10:44:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(18, '21001-01-03', 'Accounts Payable-Contractors ', 3, 0, 18, '', '2019-10-04 10:45:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(19, '21001-02-01', 'Accrued Expenses-Tel & Com', 3, 0, 19, '', '2019-10-04 10:45:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(20, '21001-02-02', 'Accrued Expenses-Electric', 3, 0, 20, '', '2019-10-04 10:45:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(21, '21001-02-03', 'Accrued Expenses-Rent', 3, 0, 21, '', '2019-10-04 10:45:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(22, '21001-02-04', 'Accrued Expenses-Internet', 3, 0, 22, '', '2019-10-04 10:46:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(23, '21001-02-05', 'Accrued Expenses-Salaries ', 3, 0, 23, '', '2019-10-04 10:46:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(24, '21001-02-06', 'Accrued Expenses-Social Security System ', 3, 0, 24, '', '2019-10-04 10:46:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(25, '21001-02-07', 'Accrued Expenses-Philhealth ', 3, 0, 25, '', '2019-10-04 10:46:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(26, '21001-02-08', 'Accrued Expenses-Pag - Ibig ', 3, 0, 26, '', '2019-10-04 10:47:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(27, '21001-03-01', 'Taxes Payable-Vat Payable ', 3, 0, 27, '', '2019-10-04 10:47:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(28, '21001-03-02', 'Taxes Payable-WT Expanded - Payable ', 3, 0, 28, '', '2019-10-04 10:47:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(29, '21001-03-03', 'Taxes Payable-WT Compensation - Payable ', 3, 0, 29, '', '2019-10-04 10:48:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(30, '21001-03-04', 'Taxes Payable-Income Tax Payable ', 3, 0, 30, '', '2019-10-04 10:48:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(31, '21001-04-01', 'Other Payables-Output VAT ', 3, 0, 31, '', '2019-10-04 10:50:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(32, '21002-01-01', 'Refundable Deposits-Water Utility Deposits ', 3, 0, 32, '', '2019-10-04 10:50:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(33, '31001-01-01', 'Share Capital', 5, 0, 33, '', '2019-10-04 10:50:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(34, '31001-02-01', 'Retained Earnings', 5, 0, 34, '', '2019-10-04 10:52:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(35, '40002-01-01', 'Waterworks Revenue - Exempt', 7, 0, 35, '', '2019-10-04 10:52:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(36, '40003-01-01', 'Interest Income-Penalties and Surcharges Waterworks', 7, 0, 36, '', '2019-10-04 10:52:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(37, '61001-01-01', 'Utilities-Telephone & Communication', 8, 0, 37, '', '2019-10-04 10:53:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(38, '61002-02-01', 'Utilities-Electric', 6, 0, 38, '', '2019-10-04 10:54:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(39, '61001-01-02', 'Utilities-Rent', 8, 0, 39, '', '2019-10-04 10:54:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(40, '61001-01-03', 'Utilities-Internet', 8, 0, 40, '', '2019-10-04 10:55:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(41, '61001-01-04', 'Professional Fee-Consultant', 8, 0, 41, '', '2019-10-04 10:55:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(42, '61001-01-05', 'Representation Expense', 8, 0, 42, '', '2019-10-04 10:55:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(43, '61002-01-01', 'Salaries Expense', 6, 0, 43, '', '2019-10-04 10:57:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(44, '61002-01-02', 'Employee Benefits', 6, 0, 44, '', '2019-10-04 10:57:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(45, '61001-01-06', 'Depreciation Expense - Office Equipments', 8, 0, 45, '', '2019-10-04 10:58:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(46, '61001-01-07', 'Depreciation Expense - Furniture & Fixtures', 8, 0, 46, '', '2019-10-04 10:58:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(47, '61001-01-08', 'Depreciation Expense - Land Improvements', 8, 0, 47, '', '2019-10-04 10:58:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(48, '61002-01-03', 'Depreciation Expense - Field Equpments', 6, 0, 48, '', '2019-10-04 10:58:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(49, '61001-01-09', 'Amort. Expense - - Computer Software/Program', 8, 0, 49, '', '2019-10-04 10:59:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0'),
(50, '61002-01-04', 'Repairs & Maintenance Expense', 6, 0, 50, '', '2019-10-04 10:59:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `account_type_id` int(11) NOT NULL,
  `account_type` varchar(155) DEFAULT '',
  `description` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`account_type_id`, `account_type`, `description`) VALUES
(1, 'Asset', ''),
(2, 'Liability', ''),
(3, 'Capital', ''),
(4, 'Income', ''),
(5, 'Expense', '');

-- --------------------------------------------------------

--
-- Table structure for table `account_year`
--

CREATE TABLE `account_year` (
  `account_year_id` bigint(20) NOT NULL,
  `account_year` varchar(100) DEFAULT '',
  `description` varchar(755) DEFAULT '',
  `status` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `date_closed` datetime DEFAULT '0000-00-00 00:00:00',
  `closed_by_user` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_info`
--

CREATE TABLE `adjustment_info` (
  `adjustment_id` bigint(20) NOT NULL,
  `adjustment_code` varchar(75) DEFAULT '',
  `department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `adjustment_type` varchar(20) DEFAULT 'IN',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) UNSIGNED ZEROFILL DEFAULT '000000000000000000.00',
  `date_adjusted` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT NULL,
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `pos_is_received` bit(1) DEFAULT b'0',
  `is_for_pos` bit(1) DEFAULT b'0',
  `is_journal_posted` tinyint(1) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `is_returns` bit(1) DEFAULT b'0',
  `inv_no` varchar(145) DEFAULT '',
  `closing_reason` varchar(445) DEFAULT '',
  `closed_by_user` bigint(20) DEFAULT '0',
  `is_closed` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_items`
--

CREATE TABLE `adjustment_items` (
  `adjustment_item_id` bigint(20) NOT NULL,
  `adjustment_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `adjust_qty` decimal(20,2) DEFAULT '0.00',
  `adjust_price` decimal(20,4) DEFAULT '0.0000',
  `adjust_discount` decimal(20,4) DEFAULT '0.0000',
  `adjust_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `adjust_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `adjust_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `adjust_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `adjust_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `approval_status`
--

CREATE TABLE `approval_status` (
  `approval_id` int(11) NOT NULL,
  `approval_status` varchar(100) DEFAULT '',
  `approval_description` varchar(555) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approval_status`
--

INSERT INTO `approval_status` (`approval_id`, `approval_status`, `approval_description`, `is_active`, `is_deleted`) VALUES
(1, 'Approved', '', b'1', b'0'),
(2, 'Pending', '', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `asset_property_status`
--

CREATE TABLE `asset_property_status` (
  `asset_status_id` int(11) NOT NULL,
  `asset_property_status` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset_property_status`
--

INSERT INTO `asset_property_status` (`asset_status_id`, `asset_property_status`, `is_active`, `is_deleted`) VALUES
(1, 'Active', 1, 0),
(2, 'Inactive', 1, 0),
(3, 'Obsolete', 1, 0),
(4, 'Lost', 1, 0),
(5, 'Damage', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendant`
--

CREATE TABLE `attendant` (
  `attendant_id` int(12) NOT NULL,
  `attendant_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `department_id` int(12) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `date_created` date DEFAULT '0000-00-00',
  `posted_by_user` int(12) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendant`
--

INSERT INTO `attendant` (`attendant_id`, `attendant_code`, `first_name`, `middle_name`, `last_name`, `contact_no`, `department_id`, `is_deleted`, `is_active`, `date_created`, `posted_by_user`) VALUES
(1, 'ATD-20190716-1', 'System ', '', 'Administrator', '', 1, b'0', b'1', '2019-07-16', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_code` varchar(20) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `account_type` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_reconciliation`
--

CREATE TABLE `bank_reconciliation` (
  `bank_recon_id` int(11) NOT NULL,
  `bank_id` int(11) DEFAULT '0',
  `date_reconciled` date DEFAULT '0000-00-00',
  `reconciled_by` int(11) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `account_balance` decimal(10,0) DEFAULT '0',
  `bank_service_charge` decimal(10,0) DEFAULT '0',
  `nsf_check` decimal(10,0) DEFAULT '0',
  `check_printing_charge` decimal(10,0) DEFAULT '0',
  `interest_earned` decimal(10,0) DEFAULT '0',
  `notes_receivable` decimal(10,0) DEFAULT '0',
  `actual_balance` decimal(10,0) DEFAULT '0',
  `outstanding_checks` decimal(10,0) DEFAULT '0',
  `deposit_in_transit` decimal(10,0) DEFAULT '0',
  `journal_adjusted_collection` decimal(10,0) DEFAULT '0',
  `bank_adjusted_collection` decimal(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_reconciliation_details`
--

CREATE TABLE `bank_reconciliation_details` (
  `bank_recon_item_id` int(11) NOT NULL,
  `bank_recon_id` int(11) DEFAULT '0',
  `journal_id` int(11) DEFAULT '0',
  `check_status` int(11) DEFAULT '0' COMMENT '0 = no selected\n1 = outstanding\n2 = good check'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch_info`
--

CREATE TABLE `batch_info` (
  `batch_id` bigint(20) NOT NULL,
  `batch_no` varchar(75) DEFAULT '',
  `date_replenished` datetime DEFAULT '0000-00-00 00:00:00',
  `replenished_by` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billing_id` int(12) NOT NULL,
  `control_no` varchar(255) DEFAULT NULL,
  `connection_id` bigint(12) DEFAULT '0',
  `default_matrix_id` int(12) DEFAULT '0',
  `meter_reading_input_id` bigint(20) DEFAULT '0',
  `meter_reading_period_id` int(12) DEFAULT '0',
  `due_date` date DEFAULT '0000-00-00',
  `reading_date` date DEFAULT '0000-00-00',
  `previous_month` varchar(255) DEFAULT NULL,
  `previous_reading` int(12) DEFAULT '0',
  `current_reading` int(12) DEFAULT '0',
  `total_consumption` int(12) DEFAULT '0',
  `amount_due` decimal(20,2) DEFAULT '0.00',
  `rate_amount` decimal(20,2) DEFAULT '0.00',
  `penalty_amount` decimal(20,2) DEFAULT '0.00',
  `charges_amount` decimal(20,2) DEFAULT '0.00',
  `grand_total_amount` decimal(20,2) DEFAULT '0.00',
  `is_fixed` bit(1) DEFAULT b'0',
  `arrears_month_id` int(12) DEFAULT '0',
  `arrears_amount` decimal(20,2) DEFAULT '0.00',
  `date_processed` date DEFAULT '0000-00-00',
  `processed_by` int(12) DEFAULT '0',
  `arrears_penalty_amount` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billing_id`, `control_no`, `connection_id`, `default_matrix_id`, `meter_reading_input_id`, `meter_reading_period_id`, `due_date`, `reading_date`, `previous_month`, `previous_reading`, `current_reading`, `total_consumption`, `amount_due`, `rate_amount`, `penalty_amount`, `charges_amount`, `grand_total_amount`, `is_fixed`, `arrears_month_id`, `arrears_amount`, `date_processed`, `processed_by`, `arrears_penalty_amount`) VALUES
(183, '0000183', 148, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2493, 2498, 5, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(184, '0000184', 166, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2070, 2088, 18, '364.00', '0.00', '36.40', '0.00', '364.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(185, '0000185', 115, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2530, 2548, 18, '364.00', '0.00', '36.40', '0.00', '364.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(186, '0000186', 114, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1825, 1859, 34, '732.50', '0.00', '73.25', '0.00', '732.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(187, '0000187', 161, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2111, 2151, 40, '912.50', '0.00', '91.25', '0.00', '912.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(188, '0000188', 17, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 7324, 7609, 285, '8502.50', '0.00', '850.25', '0.00', '8502.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(189, '0000189', 111, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1331, 1371, 40, '912.50', '0.00', '91.25', '0.00', '912.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(190, '0000190', 116, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5206, 5224, 18, '364.00', '0.00', '36.40', '220.00', '584.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(191, '0000191', 85, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2996, 3016, 20, '405.00', '0.00', '40.50', '355.30', '760.30', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(192, '0000192', 83, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 934, 938, 4, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(193, '0000193', 12, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 245, 258, 13, '261.50', '0.00', '26.15', '0.00', '261.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(194, '0000194', 13, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 9471, 9527, 56, '1403.50', '0.00', '140.35', '0.00', '1403.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(195, '0000195', 71, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3026, 3065, 39, '882.50', '0.00', '88.25', '0.00', '882.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(196, '0000196', 90, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2278, 2290, 12, '241.00', '0.00', '24.10', '0.00', '241.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(197, '0000197', 31, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 8384, 8452, 68, '1775.50', '0.00', '177.55', '0.00', '1775.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(198, '0000198', 110, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 6547, 6568, 21, '425.75', '0.00', '42.58', '0.00', '425.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(199, '0000199', 8, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 12694, 12710, 16, '323.00', '0.00', '32.30', '0.00', '323.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(200, '0000200', 93, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 11616, 11649, 33, '702.50', '0.00', '70.25', '0.00', '702.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(201, '0000201', 38, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1295, 1308, 13, '261.50', '0.00', '26.15', '0.00', '261.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(202, '0000202', 1, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2302, 2336, 34, '732.50', '0.00', '73.25', '0.00', '732.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(203, '0000203', 3, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2903, 2928, 25, '508.75', '0.00', '50.88', '0.00', '508.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(204, '0000204', 2, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2490, 2528, 38, '852.50', '0.00', '85.25', '0.00', '852.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(205, '0000205', 40, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5458, 5504, 46, '1095.50', '0.00', '109.55', '0.00', '1095.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(206, '0000206', 37, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4805, 4854, 49, '1187.00', '0.00', '118.70', '0.00', '1187.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(207, '0000207', 64, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3495, 3530, 35, '762.50', '0.00', '76.25', '805.75', '1568.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(208, '0000208', 63, 1, 1, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3026, 3057, 31, '642.50', '0.00', '64.25', '0.00', '642.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(209, '0000209', 162, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 3451, 3464, 13, '261.50', '0.00', '26.15', '0.00', '261.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(210, '0000210', 164, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 2235, 2244, 9, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(211, '0000211', 118, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 3328, 3345, 17, '343.50', '0.00', '34.35', '400.40', '743.90', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(212, '0000212', 119, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 3686, 3703, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(213, '0000213', 49, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 757, 772, 15, '302.50', '0.00', '30.25', '0.00', '302.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(214, '0000214', 48, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 759, 766, 7, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(215, '0000215', 47, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 540, 550, 10, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(216, '0000216', 46, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 903, 915, 12, '241.00', '0.00', '24.10', '0.00', '241.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(217, '0000217', 104, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 1866, 1883, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(218, '0000218', 108, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 1611, 1633, 22, '446.50', '0.00', '44.65', '0.00', '446.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(219, '0000219', 106, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 2045, 2082, 37, '822.50', '0.00', '82.25', '0.00', '822.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(220, '0000220', 103, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 2772, 2814, 42, '973.50', '0.00', '97.35', '0.00', '973.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(221, '0000221', 45, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 482, 496, 14, '282.00', '0.00', '28.20', '0.00', '282.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(222, '0000222', 117, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 849, 901, 52, '1279.50', '0.00', '127.95', '0.00', '1279.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(223, '0000223', 177, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 5513, 5527, 14, '282.00', '0.00', '28.20', '0.00', '282.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(224, '0000224', 42, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 4217, 4254, 37, '822.50', '0.00', '82.25', '0.00', '822.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(225, '0000225', 167, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 5035, 5116, 81, '2178.50', '0.00', '217.85', '2464.55', '4643.05', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(226, '0000226', 54, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 1862, 1886, 24, '488.00', '0.00', '48.80', '0.00', '488.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(227, '0000227', 86, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 1517, 1547, 30, '612.50', '0.00', '61.25', '0.00', '612.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(228, '0000228', 98, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 1585, 1625, 40, '912.50', '0.00', '91.25', '0.00', '912.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(229, '0000229', 127, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 8469, 8549, 80, '2147.50', '0.00', '214.75', '0.00', '2147.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(230, '0000230', 149, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 5529, 5567, 38, '852.50', '0.00', '85.25', '0.00', '852.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(231, '0000231', 189, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 65, 91, 26, '529.50', '0.00', '52.95', '0.00', '529.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(232, '0000232', 5, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 4259, 4264, 5, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(233, '0000233', 6, 1, 2, 10, '2019-10-15', '2019-11-05', 'Sep 2019', 4412, 4463, 51, '1248.50', '0.00', '124.85', '0.00', '1248.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(234, '0000234', 151, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2202, 2210, 8, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(235, '0000235', 145, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 27032, 27249, 217, '6394.50', '0.00', '639.45', '0.00', '6394.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(236, '0000236', 97, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 6125, 6175, 50, '1217.50', '0.00', '121.75', '0.00', '1217.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(237, '0000237', 135, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3115, 3132, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(238, '0000238', 68, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 19427, 19590, 163, '4720.50', '0.00', '472.05', '0.00', '4720.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(239, '0000239', 65, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 544, 771, 227, '6704.50', '0.00', '670.45', '0.00', '6704.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(240, '0000240', 66, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1441, 1509, 68, '1775.50', '0.00', '177.55', '0.00', '1775.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(241, '0000241', 69, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 9226, 9244, 18, '364.00', '0.00', '36.40', '0.00', '364.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(242, '0000242', 73, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1966, 1991, 25, '508.75', '0.00', '50.88', '0.00', '508.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(243, '0000243', 113, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1323, 1362, 39, '882.50', '0.00', '88.25', '1238.60', '2121.10', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(244, '0000244', 67, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 553, 576, 23, '467.25', '0.00', '46.73', '0.00', '467.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(245, '0000245', 72, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 6198, 6247, 49, '1187.00', '0.00', '118.70', '0.00', '1187.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(246, '0000246', 70, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5916, 5918, 2, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(247, '0000247', 89, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1366, 1385, 19, '384.50', '38.45', '38.45', '0.00', '384.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(248, '0000248', 132, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2411, 2456, 45, '1065.00', '0.00', '106.50', '0.00', '1065.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(249, '0000249', 61, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1552, 1597, 45, '1065.00', '0.00', '106.50', '0.00', '1065.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(250, '0000250', 53, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 250, 295, 45, '1065.00', '0.00', '106.50', '0.00', '1065.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(251, '0000251', 131, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3962, 3974, 12, '241.00', '0.00', '24.10', '0.00', '241.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(252, '0000252', 43, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1924, 1945, 21, '425.75', '0.00', '42.58', '0.00', '425.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(253, '0000253', 153, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2855, 2903, 48, '1156.50', '0.00', '115.65', '0.00', '1156.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(254, '0000254', 152, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3515, 3547, 32, '672.50', '0.00', '67.25', '0.00', '672.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(255, '0000255', 150, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2595, 2620, 25, '508.75', '0.00', '50.88', '0.00', '508.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(256, '0000256', 11, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5655, 5699, 44, '1034.50', '0.00', '103.45', '0.00', '1034.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(257, '0000257', 79, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 8266, 8285, 19, '384.50', '0.00', '38.45', '0.00', '384.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(258, '0000258', 160, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2786, 2832, 46, '1095.50', '0.00', '109.55', '0.00', '1095.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(259, '0000259', 163, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 12047, 12064, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(260, '0000260', 18, 1, 3, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5367, 5417, 50, '1217.50', '0.00', '121.75', '0.00', '1217.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(261, '0000261', 96, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3182, 3208, 26, '529.50', '0.00', '52.95', '0.00', '529.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(262, '0000262', 7, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 11139, 11212, 73, '1930.50', '0.00', '193.05', '0.00', '1930.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(263, '0000263', 126, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 7795, 7795, 0, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(264, '0000264', 107, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2003, 2029, 26, '529.50', '0.00', '52.95', '0.00', '529.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(265, '0000265', 109, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 922, 945, 23, '467.25', '0.00', '46.73', '0.00', '467.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(266, '0000266', 120, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1247, 1256, 9, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(267, '0000267', 133, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 545, 569, 24, '488.00', '0.00', '48.80', '0.00', '488.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(268, '0000268', 100, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3304, 3311, 7, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(269, '0000269', 147, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1559, 1564, 5, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(270, '0000270', 87, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2617, 2621, 4, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(271, '0000271', 140, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2110, 2139, 29, '591.75', '0.00', '59.18', '0.00', '591.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(272, '0000272', 139, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1726, 1734, 8, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(273, '0000273', 155, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 10535, 10569, 34, '732.50', '0.00', '73.25', '0.00', '732.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(274, '0000274', 81, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 7582, 7689, 107, '2984.50', '0.00', '298.45', '0.00', '2984.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(275, '0000275', 92, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 771, 788, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(276, '0000276', 88, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 650, 665, 15, '302.50', '0.00', '30.25', '0.00', '302.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(277, '0000277', 91, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1151, 1182, 31, '642.50', '0.00', '64.25', '0.00', '642.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(278, '0000278', 94, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1426, 1446, 20, '405.00', '0.00', '40.50', '0.00', '405.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(279, '0000279', 169, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1455, 1456, 1, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(280, '0000280', 170, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1762, 1772, 10, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(281, '0000281', 75, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2612, 2629, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(282, '0000282', 77, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2721, 2730, 9, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(283, '0000283', 56, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5785, 5794, 9, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(284, '0000284', 44, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 46, 47, 1, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(285, '0000285', 50, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 190, 191, 1, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(286, '0000286', 52, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5501, 5532, 31, '642.50', '0.00', '64.25', '0.00', '642.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(287, '0000287', 146, 1, 4, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 6199, 6281, 82, '2209.50', '0.00', '220.95', '0.00', '2209.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(288, '0000288', 136, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 9930, 10019, 89, '2426.50', '0.00', '242.65', '0.00', '2426.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(289, '0000289', 134, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 11445, 11545, 100, '2767.50', '0.00', '276.75', '0.00', '2767.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(290, '0000290', 138, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4033, 4068, 35, '762.50', '0.00', '76.25', '0.00', '762.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(291, '0000291', 141, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4368, 4410, 42, '973.50', '0.00', '97.35', '0.00', '973.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(292, '0000292', 105, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 7486, 7519, 33, '702.50', '0.00', '70.25', '0.00', '702.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(293, '0000293', 51, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5474, 5519, 45, '1065.00', '0.00', '106.50', '220.00', '1285.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(294, '0000294', 20, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1949, 1954, 5, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(295, '0000295', 27, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 988, 1015, 27, '550.25', '0.00', '55.03', '0.00', '550.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(296, '0000296', 25, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1056, 1081, 25, '508.75', '0.00', '50.88', '0.00', '508.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(297, '0000297', 24, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 598, 605, 7, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(298, '0000298', 23, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 985, 1047, 62, '1589.50', '0.00', '158.95', '0.00', '1589.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(299, '0000299', 26, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1081, 1098, 17, '343.50', '0.00', '34.35', '422.95', '766.45', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(300, '0000300', 22, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1034, 1061, 27, '550.25', '0.00', '55.03', '0.00', '550.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(301, '0000301', 125, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 191, 195, 4, '200.00', '0.00', '20.00', '287.65', '487.65', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(302, '0000302', 154, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1042, 1065, 23, '467.25', '0.00', '46.73', '0.00', '467.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(303, '0000303', 178, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1302, 1323, 21, '425.75', '0.00', '42.58', '0.00', '425.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(304, '0000304', 78, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1478, 1526, 48, '1156.50', '0.00', '115.65', '0.00', '1156.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(305, '0000305', 82, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3390, 3396, 6, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(306, '0000306', 80, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2698, 2794, 96, '2643.50', '0.00', '264.35', '0.00', '2643.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(307, '0000307', 168, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 612, 629, 17, '343.50', '0.00', '34.35', '422.95', '766.45', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(308, '0000308', 99, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 545, 604, 59, '1496.50', '0.00', '149.65', '0.00', '1496.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(309, '0000309', 122, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 722, 739, 17, '343.50', '0.00', '34.35', '628.10', '971.60', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(310, '0000310', 121, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 348, 370, 22, '446.50', '0.00', '44.65', '0.00', '446.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(311, '0000311', 21, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2037, 2055, 18, '364.00', '0.00', '36.40', '332.75', '696.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(312, '0000312', 144, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 9973, 10065, 92, '2519.50', '0.00', '251.95', '0.00', '2519.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(313, '0000313', 143, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4344, 4351, 7, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(314, '0000314', 142, 1, 5, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 5869, 5951, 82, '2209.50', '0.00', '220.95', '212.36', '2421.86', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(315, '0000315', 124, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 98, 106, 8, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(316, '0000316', 180, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 485, 509, 24, '488.00', '0.00', '48.80', '0.00', '488.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(317, '0000317', 57, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 496, 547, 51, '1248.50', '0.00', '124.85', '0.00', '1248.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(318, '0000318', 59, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1599, 1652, 53, '1310.50', '0.00', '131.05', '0.00', '1310.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(319, '0000319', 28, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 711, 777, 66, '1713.50', '0.00', '171.35', '0.00', '1713.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(320, '0000320', 172, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1112, 1147, 35, '762.50', '0.00', '76.25', '0.00', '762.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(321, '0000321', 191, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1, 35, 34, '732.50', '0.00', '73.25', '220.00', '952.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(322, '0000322', 123, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2131, 2161, 30, '612.50', '0.00', '61.25', '582.45', '1194.95', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(323, '0000323', 102, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 674, 689, 15, '302.50', '0.00', '30.25', '0.00', '302.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(324, '0000324', 101, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2248, 2282, 34, '732.50', '0.00', '73.25', '0.00', '732.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(325, '0000325', 95, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 848, 859, 11, '220.50', '0.00', '22.05', '0.00', '220.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(326, '0000326', 55, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1972, 1986, 14, '282.00', '0.00', '28.20', '0.00', '282.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(327, '0000327', 193, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 0, 1, 1, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(328, '0000328', 159, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1488, 1500, 12, '241.00', '0.00', '24.10', '0.00', '241.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(329, '0000329', 158, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1871, 1999, 128, '3635.50', '0.00', '363.55', '0.00', '3635.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(330, '0000330', 16, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4116, 4159, 43, '1004.00', '0.00', '100.40', '0.00', '1004.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(331, '0000331', 176, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4963, 4972, 9, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(332, '0000332', 10, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1772, 1778, 6, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(333, '0000333', 165, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1454, 1464, 10, '200.00', '0.00', '20.00', '22.00', '222.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(334, '0000334', 174, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1204, 1213, 9, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(335, '0000335', 179, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2045, 2070, 25, '508.75', '0.00', '50.88', '46.84', '555.59', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(336, '0000336', 41, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 1663, 1687, 24, '488.00', '0.00', '48.80', '22.00', '510.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(337, '0000337', 4, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 11398, 11426, 28, '571.00', '0.00', '57.10', '1104.40', '1675.40', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(338, '0000338', 157, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 14948, 15021, 73, '1930.50', '0.00', '193.05', '0.00', '1930.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(339, '0000339', 19, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 8217, 8264, 47, '1126.00', '0.00', '112.60', '0.00', '1126.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(340, '0000340', 175, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4599, 4650, 51, '1248.50', '0.00', '124.85', '0.00', '1248.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(341, '0000341', 29, 1, 6, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2528, 2557, 29, '591.75', '0.00', '59.18', '0.00', '591.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(342, '0000342', 36, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4335, 4339, 4, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(343, '0000343', 35, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3528, 3546, 18, '364.00', '0.00', '36.40', '0.00', '364.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(344, '0000344', 34, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3615, 3637, 22, '446.50', '0.00', '44.65', '0.00', '446.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(345, '0000345', 33, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 8781, 8851, 70, '1837.50', '0.00', '183.75', '0.00', '1837.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(346, '0000346', 32, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3261, 3281, 20, '405.00', '0.00', '40.50', '628.10', '1033.10', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(347, '0000347', 192, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 0, 1, 1, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(348, '0000348', 128, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4034, 4038, 4, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(349, '0000349', 129, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 3170, 3187, 17, '343.50', '0.00', '34.35', '0.00', '343.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(350, '0000350', 130, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 7051, 7075, 24, '488.00', '0.00', '48.80', '377.85', '865.85', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(351, '0000351', 186, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 219, 340, 121, '3418.50', '0.00', '341.85', '2635.05', '6053.55', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(352, '0000352', 185, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 94, 123, 29, '591.75', '0.00', '59.18', '0.00', '591.75', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(353, '0000353', 76, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 316, 320, 4, '200.00', '0.00', '20.00', '620.40', '820.40', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(354, '0000354', 190, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 32, 48, 16, '323.00', '0.00', '32.30', '0.00', '323.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(355, '0000355', 39, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 295, 384, 89, '2426.50', '0.00', '242.65', '970.75', '3397.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(356, '0000356', 182, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 172, 199, 27, '550.25', '0.00', '55.03', '0.00', '550.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(357, '0000357', 9, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 207, 216, 9, '200.00', '0.00', '20.00', '0.00', '200.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(358, '0000358', 187, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 54, 80, 26, '529.50', '0.00', '52.95', '445.50', '975.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(359, '0000359', 188, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 42, 77, 35, '762.50', '0.00', '76.25', '937.75', '1700.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(360, '0000360', 15, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 491, 510, 19, '384.50', '0.00', '38.45', '0.00', '384.50', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(361, '0000361', 14, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 2342, 2370, 28, '571.00', '0.00', '57.10', '0.00', '571.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(362, '0000362', 60, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 305, 336, 31, '642.50', '0.00', '64.25', '904.75', '1547.25', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(363, '0000363', 184, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 8, 12, 4, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00'),
(364, '0000364', 183, 1, 7, 10, '2019-10-15', '2019-10-01', 'Sep 2019', 4, 10, 6, '200.00', '0.00', '20.00', '220.00', '420.00', b'1', 8, '0.00', '2019-10-01', 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `billing_charges`
--

CREATE TABLE `billing_charges` (
  `billing_charge_id` bigint(20) NOT NULL,
  `billing_id` bigint(20) DEFAULT '0',
  `meter_reading_input_id` int(12) DEFAULT '0',
  `other_charge_id` int(12) DEFAULT '0',
  `other_charge_item_id` int(12) DEFAULT '0',
  `charge_id` int(12) DEFAULT '0',
  `charge_unit_id` int(12) DEFAULT '0',
  `charge_amount` decimal(20,2) DEFAULT '0.00',
  `charge_qty` decimal(20,2) DEFAULT '0.00',
  `charge_line_total` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_charges`
--

INSERT INTO `billing_charges` (`billing_charge_id`, `billing_id`, `meter_reading_input_id`, `other_charge_id`, `other_charge_item_id`, `charge_id`, `charge_unit_id`, `charge_amount`, `charge_qty`, `charge_line_total`) VALUES
(37, 190, 1, 31, 31, 1, 1, '220.00', '1.00', '220.00'),
(38, 191, 1, 1, 1, 1, 1, '355.30', '1.00', '355.30'),
(39, 192, 1, 27, 27, 1, 1, '220.00', '1.00', '220.00'),
(40, 207, 1, 26, 26, 1, 1, '805.75', '1.00', '805.75'),
(41, 210, 2, 20, 20, 1, 1, '220.00', '1.00', '220.00'),
(42, 211, 2, 9, 9, 1, 1, '400.40', '1.00', '400.40'),
(43, 225, 2, 39, 39, 1, 1, '2464.55', '1.00', '2464.55'),
(44, 243, 3, 36, 36, 1, 1, '1238.60', '1.00', '1238.60'),
(45, 279, 4, 17, 17, 1, 1, '220.00', '1.00', '220.00'),
(46, 280, 4, 18, 18, 1, 1, '220.00', '1.00', '220.00'),
(47, 283, 4, 14, 14, 1, 1, '220.00', '1.00', '220.00'),
(48, 293, 5, 24, 24, 1, 1, '220.00', '1.00', '220.00'),
(49, 294, 5, 29, 29, 1, 1, '220.00', '1.00', '220.00'),
(50, 299, 5, 13, 13, 1, 1, '422.95', '1.00', '422.95'),
(51, 301, 5, 35, 35, 1, 1, '287.65', '1.00', '287.65'),
(52, 307, 5, 11, 11, 1, 1, '422.95', '1.00', '422.95'),
(53, 309, 5, 23, 23, 1, 1, '628.10', '1.00', '628.10'),
(54, 311, 5, 38, 38, 1, 1, '332.75', '1.00', '332.75'),
(55, 314, 5, 7, 7, 1, 1, '212.36', '1.00', '212.36'),
(56, 321, 6, 12, 12, 1, 1, '220.00', '1.00', '220.00'),
(57, 322, 6, 19, 19, 1, 1, '582.45', '1.00', '582.45'),
(58, 333, 6, 5, 5, 1, 1, '22.00', '1.00', '22.00'),
(59, 335, 6, 6, 6, 1, 1, '46.84', '1.00', '46.84'),
(60, 336, 6, 2, 2, 1, 1, '22.00', '1.00', '22.00'),
(61, 337, 6, 34, 34, 1, 1, '1104.40', '1.00', '1104.40'),
(62, 346, 7, 25, 25, 1, 1, '628.10', '1.00', '628.10'),
(63, 348, 7, 22, 22, 1, 1, '220.00', '1.00', '220.00'),
(64, 350, 7, 3, 3, 1, 1, '377.85', '1.00', '377.85'),
(65, 351, 7, 40, 40, 1, 1, '2635.05', '1.00', '2635.05'),
(66, 353, 7, 21, 21, 1, 1, '620.40', '1.00', '620.40'),
(67, 355, 7, 32, 32, 1, 1, '970.75', '1.00', '970.75'),
(68, 358, 7, 16, 16, 1, 1, '445.50', '1.00', '445.50'),
(69, 359, 7, 30, 30, 1, 1, '937.75', '1.00', '937.75'),
(70, 362, 7, 28, 28, 1, 1, '904.75', '1.00', '904.75'),
(71, 363, 7, 8, 8, 1, 1, '220.00', '1.00', '220.00'),
(72, 364, 7, 10, 10, 1, 1, '220.00', '1.00', '220.00');

-- --------------------------------------------------------

--
-- Table structure for table `billing_payments`
--

CREATE TABLE `billing_payments` (
  `billing_payment_id` bigint(20) NOT NULL,
  `connection_id` bigint(20) DEFAULT NULL,
  `date_paid` date DEFAULT '0000-00-00',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(145) DEFAULT '',
  `remarks` varchar(7755) DEFAULT '',
  `deposit_allowed` decimal(20,2) DEFAULT '0.00',
  `total_deposit_amount` decimal(20,2) DEFAULT '0.00',
  `remaining_deposit` decimal(20,2) DEFAULT '0.00',
  `is_refund` bit(1) DEFAULT b'0',
  `total_payment_amount` decimal(20,2) DEFAULT '0.00',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` bigint(20) DEFAULT '0',
  `cancelled_by_user` bigint(20) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `receipt_no` varchar(545) DEFAULT '',
  `billing_payment_batch_id` bigint(20) DEFAULT '0',
  `refund_amount` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_payments`
--

INSERT INTO `billing_payments` (`billing_payment_id`, `connection_id`, `date_paid`, `payment_method_id`, `check_date`, `check_no`, `remarks`, `deposit_allowed`, `total_deposit_amount`, `remaining_deposit`, `is_refund`, `total_payment_amount`, `total_paid_amount`, `date_created`, `date_cancelled`, `created_by_user`, `cancelled_by_user`, `is_active`, `is_deleted`, `receipt_no`, `billing_payment_batch_id`, `refund_amount`) VALUES
(1, 42, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15013', '3800.00', '0.00', '3800.00', b'0', '822.50', '822.50', '2019-11-06 14:37:59', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000001', 0, '0.00'),
(2, 5, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15004', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 14:38:14', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000002', 0, '0.00'),
(3, 149, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15007\n', '3800.00', '0.00', '3800.00', b'0', '852.50', '852.50', '2019-11-06 14:38:32', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000003', 0, '0.00'),
(4, 10, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15005\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 14:38:49', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000004', 0, '0.00'),
(5, 166, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15012\n', '3800.00', '0.00', '3800.00', b'0', '364.00', '364.00', '2019-11-06 14:39:46', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000005', 0, '0.00'),
(6, 150, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15008\n', '3800.00', '0.00', '3800.00', b'0', '508.75', '508.75', '2019-11-06 14:40:01', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000006', 0, '0.00'),
(7, 151, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15009\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 14:40:15', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000007', 0, '0.00'),
(8, 152, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15010\n', '3800.00', '0.00', '3800.00', b'0', '672.50', '672.50', '2019-11-06 14:41:14', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000008', 0, '0.00'),
(9, 153, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15011\n', '3800.00', '0.00', '3800.00', b'0', '1156.50', '1156.50', '2019-11-06 14:45:28', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000009', 0, '0.00'),
(10, 122, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15006\n', '5000.00', '0.00', '5000.00', b'0', '628.10', '628.10', '2019-11-06 14:46:10', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000010', 0, '0.00'),
(11, 193, '2019-10-02', 1, '0000-00-00', '', 'RECEIPT NO 15014\n', '0.00', '0.00', '0.00', b'0', '200.00', '200.00', '2019-11-06 14:47:51', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000011', 0, '0.00'),
(12, 157, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15028\n', '3800.00', '0.00', '3800.00', b'0', '1930.50', '1930.50', '2019-11-06 14:48:17', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000012', 0, '0.00'),
(13, 145, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15015\n', '3800.00', '0.00', '3800.00', b'0', '6394.50', '6394.50', '2019-11-06 14:48:34', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000013', 0, '0.00'),
(14, 78, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15032\n', '3800.00', '0.00', '3800.00', b'0', '1156.50', '1156.50', '2019-11-06 14:48:50', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000014', 0, '0.00'),
(15, 61, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15020\n', '3800.00', '0.00', '3800.00', b'0', '1065.00', '1065.00', '2019-11-06 14:49:10', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000015', 0, '0.00'),
(16, 120, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15018\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 14:49:21', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000016', 0, '0.00'),
(17, 146, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15016\n', '3800.00', '0.00', '3800.00', b'0', '2209.50', '2209.50', '2019-11-06 14:49:34', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000017', 0, '0.00'),
(18, 21, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15035\n', '5000.00', '0.00', '5000.00', b'0', '332.75', '332.75', '2019-11-06 14:50:07', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000018', 0, '0.00'),
(19, 21, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15036\n', '5000.00', '0.00', '5000.00', b'0', '364.00', '364.00', '2019-11-06 14:50:27', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000019', 0, '0.00'),
(20, 148, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15017\n', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 14:50:45', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000020', 0, '0.00'),
(21, 98, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15021\n', '5000.00', '0.00', '5000.00', b'0', '912.50', '912.50', '2019-11-06 14:51:07', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000021', 0, '0.00'),
(22, 91, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15025\n', '5000.00', '0.00', '5000.00', b'0', '642.50', '642.50', '2019-11-06 14:51:18', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000022', 0, '0.00'),
(23, 88, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15019\n', '5000.00', '0.00', '5000.00', b'0', '302.50', '302.50', '2019-11-06 14:51:53', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000023', 0, '0.00'),
(24, 113, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15033\n', '5000.00', '0.00', '5000.00', b'0', '1238.60', '1238.60', '2019-11-06 14:52:52', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000024', 0, '0.00'),
(25, 172, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15027\n', '5000.00', '0.00', '5000.00', b'0', '762.50', '762.50', '2019-11-06 14:56:42', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000025', 0, '0.00'),
(26, 188, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15029\n', '5000.00', '0.00', '5000.00', b'0', '355.30', '355.30', '2019-11-06 14:57:47', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000026', 0, '0.00'),
(27, 188, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15030\n', '5000.00', '0.00', '5000.00', b'0', '582.45', '582.45', '2019-11-06 14:58:08', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000027', 0, '0.00'),
(28, 188, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15031\n', '5000.00', '0.00', '5000.00', b'0', '762.50', '762.50', '2019-11-06 14:58:31', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000028', 0, '0.00'),
(29, 76, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15022\n', '5000.00', '0.00', '5000.00', b'0', '400.40', '400.40', '2019-11-06 14:58:51', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000029', 0, '0.00'),
(30, 76, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15023\n', '5000.00', '0.00', '5000.00', b'0', '220.00', '220.00', '2019-11-06 14:59:09', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000030', 0, '0.00'),
(31, 76, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15024\n', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 14:59:23', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000031', 0, '0.00'),
(32, 19, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15038\n', '3800.00', '0.00', '3800.00', b'0', '1126.00', '1126.00', '2019-11-06 14:59:53', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000032', 0, '0.00'),
(33, 169, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15044\n', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 15:02:40', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000033', 0, '0.00'),
(34, 169, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15045\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 15:02:56', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000034', 0, '0.00'),
(35, 170, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15042\n', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 15:03:19', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000035', 0, '0.00'),
(36, 170, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15043\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 15:03:34', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000036', 0, '0.00'),
(37, 100, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15037\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 15:03:48', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000037', 0, '0.00'),
(38, 33, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15051\n', '5000.00', '0.00', '5000.00', b'0', '1837.50', '1837.50', '2019-11-06 15:03:59', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000038', 0, '0.00'),
(39, 36, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15052\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 15:04:14', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000039', 0, '0.00'),
(40, 177, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15103', '3800.00', '0.00', '3800.00', b'0', '282.00', '282.00', '2019-11-06 16:40:44', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000040', 0, '0.00'),
(41, 176, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15106', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:41:59', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000041', 0, '0.00'),
(42, 34, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15104\n', '3800.00', '0.00', '3800.00', b'0', '446.50', '446.50', '2019-11-06 16:42:19', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000042', 0, '0.00'),
(43, 174, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15105', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:43:45', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000043', 0, '0.00'),
(44, 106, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15108\n', '3800.00', '0.00', '3800.00', b'0', '822.50', '822.50', '2019-11-06 16:44:20', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000044', 0, '0.00'),
(45, 154, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15102', '5000.00', '0.00', '5000.00', b'0', '467.25', '467.25', '2019-11-06 16:44:52', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000045', 0, '0.00'),
(46, 115, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15046\n', '3800.00', '0.00', '3800.00', b'0', '364.00', '364.00', '2019-11-06 16:45:38', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000046', 0, '0.00'),
(47, 77, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15127', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:45:44', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000047', 0, '0.00'),
(48, 46, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15047\n', '3800.00', '0.00', '3800.00', b'0', '241.00', '241.00', '2019-11-06 16:45:58', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000048', 0, '0.00'),
(49, 7, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15121\n', '3800.00', '0.00', '3800.00', b'0', '1930.50', '1930.50', '2019-11-06 16:46:00', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000049', 0, '0.00'),
(50, 54, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15053\n', '3800.00', '0.00', '3800.00', b'0', '488.00', '488.00', '2019-11-06 16:46:10', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000050', 0, '0.00'),
(51, 47, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15048\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:46:42', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000051', 0, '0.00'),
(52, 48, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15049\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:47:22', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000052', 0, '0.00'),
(53, 49, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15050', '3800.00', '0.00', '3800.00', b'0', '302.50', '302.50', '2019-11-06 16:47:37', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000053', 0, '0.00'),
(54, 168, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15040\n', '5000.00', '0.00', '5000.00', b'0', '422.95', '422.95', '2019-11-06 16:48:08', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000054', 0, '0.00'),
(55, 168, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15041\n', '5000.00', '0.00', '5000.00', b'0', '343.50', '343.50', '2019-11-06 16:48:22', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000055', 0, '0.00'),
(56, 179, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15111', '3800.00', '0.00', '3800.00', b'0', '508.75', '508.75', '2019-11-06 16:48:34', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000056', 0, '0.00'),
(57, 93, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15061\n', '3800.00', '0.00', '3800.00', b'0', '702.50', '702.50', '2019-11-06 16:48:38', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000057', 0, '0.00'),
(58, 18, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15063\n', '3800.00', '0.00', '3800.00', b'0', '1217.50', '1217.50', '2019-11-06 16:48:53', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000058', 0, '0.00'),
(59, 114, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15122', '3800.00', '0.00', '3800.00', b'0', '732.50', '732.50', '2019-11-06 16:48:59', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000059', 0, '0.00'),
(60, 147, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15054\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:49:10', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000060', 0, '0.00'),
(61, 178, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15112', '3800.00', '0.00', '3800.00', b'0', '425.75', '425.75', '2019-11-06 16:49:13', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000061', 0, '0.00'),
(62, 3, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15110', '3800.00', '0.00', '3800.00', b'0', '508.75', '508.75', '2019-11-06 16:49:24', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000062', 0, '0.00'),
(63, 1, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15109', '3800.00', '0.00', '3800.00', b'0', '732.50', '732.50', '2019-11-06 16:49:38', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000063', 0, '0.00'),
(64, 128, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15059\n', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 16:49:44', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000064', 0, '0.00'),
(65, 123, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15123', '3800.00', '0.00', '3800.00', b'0', '582.45', '582.45', '2019-11-06 16:50:00', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000065', 0, '0.00'),
(66, 130, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15058\n', '3800.00', '0.00', '3800.00', b'0', '377.85', '377.85', '2019-11-06 16:50:07', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000066', 0, '0.00'),
(67, 123, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15124', '3800.00', '0.00', '3800.00', b'0', '612.50', '612.50', '2019-11-06 16:50:21', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000067', 0, '0.00'),
(68, 2, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15060\n', '3800.00', '0.00', '3800.00', b'0', '852.50', '852.50', '2019-11-06 16:50:24', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000068', 0, '0.00'),
(69, 135, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15057\n\n', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 16:50:41', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000069', 0, '0.00'),
(70, 66, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15115', '5000.00', '0.00', '5000.00', b'0', '1775.50', '1775.50', '2019-11-06 16:50:44', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000070', 0, '0.00'),
(71, 67, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15114', '5000.00', '0.00', '5000.00', b'0', '467.25', '467.25', '2019-11-06 16:51:04', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000071', 0, '0.00'),
(72, 24, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15062\n', '0.00', '0.00', '0.00', b'0', '200.00', '200.00', '2019-11-06 16:51:08', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000072', 0, '0.00'),
(73, 191, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15125', '5000.00', '0.00', '5000.00', b'0', '220.00', '220.00', '2019-11-06 16:51:29', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000073', 0, '0.00'),
(74, 80, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15056\n', '3800.00', '0.00', '3800.00', b'0', '2643.50', '2643.50', '2019-11-06 16:51:40', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000074', 0, '0.00'),
(75, 191, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15126', '5000.00', '0.00', '5000.00', b'0', '732.50', '732.50', '2019-11-06 16:51:52', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000075', 0, '0.00'),
(76, 43, '2019-10-05', 1, '0000-00-00', '', 'RECEIPT NO 15055\n', '3800.00', '0.00', '3800.00', b'0', '425.75', '425.75', '2019-11-06 16:52:04', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000076', 0, '0.00'),
(77, 110, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15075\n', '3800.00', '0.00', '3800.00', b'0', '425.75', '425.75', '2019-11-06 16:52:23', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000077', 0, '0.00'),
(78, 4, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15070\n', '3800.00', '0.00', '3800.00', b'0', '1104.40', '1104.40', '2019-11-06 16:53:16', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000078', 0, '0.00'),
(79, 60, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15119', '5000.00', '0.00', '5000.00', b'0', '904.75', '904.75', '2019-11-06 16:53:25', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000079', 0, '0.00'),
(80, 4, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15071\n', '3800.00', '0.00', '3800.00', b'0', '571.00', '571.00', '2019-11-06 16:53:29', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000080', 0, '0.00'),
(81, 60, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15120', '5000.00', '0.00', '5000.00', b'0', '642.50', '642.50', '2019-11-06 16:53:40', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000081', 0, '0.00'),
(82, 134, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15066\n', '3800.00', '0.00', '3800.00', b'0', '2767.50', '2767.50', '2019-11-06 16:53:43', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000082', 0, '0.00'),
(83, 136, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15076\n', '3800.00', '0.00', '3800.00', b'0', '2426.50', '2426.50', '2019-11-06 16:53:58', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000083', 0, '0.00'),
(84, 65, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15116', '5000.00', '0.00', '5000.00', b'0', '6704.50', '6704.50', '2019-11-06 16:54:04', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000084', 0, '0.00'),
(85, 90, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15065\n', '3800.00', '0.00', '3800.00', b'0', '241.00', '241.00', '2019-11-06 16:54:16', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000085', 0, '0.00'),
(86, 118, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15068\n', '3800.00', '0.00', '3800.00', b'0', '400.40', '400.40', '2019-11-06 16:54:41', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000086', 0, '0.00'),
(87, 118, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15069\n', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 16:54:59', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000087', 0, '0.00'),
(88, 163, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15081\n', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 16:55:13', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000088', 0, '0.00'),
(89, 130, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15078\n', '3800.00', '0.00', '3800.00', b'0', '488.00', '488.00', '2019-11-06 16:55:23', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000089', 0, '0.00'),
(90, 11, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15074\n', '3800.00', '0.00', '3800.00', b'0', '1034.50', '1034.50', '2019-11-06 16:55:34', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000090', 0, '0.00'),
(91, 75, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15136', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 16:55:37', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000091', 0, '0.00'),
(92, 6, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15142', '3800.00', '0.00', '3800.00', b'0', '1248.50', '1248.50', '2019-11-06 16:55:54', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000092', 0, '0.00'),
(93, 138, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15140', '3800.00', '0.00', '3800.00', b'0', '762.50', '762.50', '2019-11-06 16:56:08', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000093', 0, '0.00'),
(94, 94, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15067\n', '5000.00', '0.00', '5000.00', b'0', '405.00', '405.00', '2019-11-06 16:56:18', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000094', 0, '0.00'),
(95, 139, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15137', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:56:21', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000095', 0, '0.00'),
(96, 28, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15073\n', '5000.00', '0.00', '5000.00', b'0', '1713.50', '1713.50', '2019-11-06 16:56:34', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000096', 0, '0.00'),
(97, 99, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15064\n', '5000.00', '0.00', '5000.00', b'0', '1496.50', '1496.50', '2019-11-06 16:56:46', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000097', 0, '0.00'),
(98, 9, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15080\n', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 16:57:03', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000098', 0, '0.00'),
(99, 117, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15079\n', '5000.00', '0.00', '5000.00', b'0', '1279.50', '1279.50', '2019-11-06 16:57:15', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000099', 0, '0.00'),
(100, 141, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15139', '3800.00', '0.00', '3800.00', b'0', '973.50', '973.50', '2019-11-06 16:57:16', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000100', 0, '0.00'),
(101, 13, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15087\n', '3800.00', '0.00', '3800.00', b'0', '1403.50', '1403.50', '2019-11-06 16:57:32', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000101', 0, '0.00'),
(102, 31, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15085\n', '3800.00', '0.00', '3800.00', b'0', '1775.50', '1775.50', '2019-11-06 16:57:47', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000102', 0, '0.00'),
(103, 105, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15091\n', '3800.00', '0.00', '3800.00', b'0', '702.50', '702.50', '2019-11-06 16:57:58', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000103', 0, '0.00'),
(104, 175, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15086\n', '3800.00', '0.00', '3800.00', b'0', '1248.50', '1248.50', '2019-11-06 16:58:13', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000104', 0, '0.00'),
(105, 128, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15084\n\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:58:42', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000105', 0, '0.00'),
(106, 142, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15129', '3800.00', '0.00', '3800.00', b'0', '2209.50', '2209.50', '2019-11-06 16:58:47', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000106', 0, '0.00'),
(107, 83, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15095\n', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 16:58:57', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000107', 0, '0.00'),
(108, 127, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15135', '3800.00', '0.00', '3800.00', b'0', '2147.50', '2147.50', '2019-11-06 16:59:01', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000108', 0, '0.00'),
(109, 83, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15096\n', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:59:07', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000109', 0, '0.00'),
(110, 143, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15130', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:59:16', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000110', 0, '0.00'),
(111, 144, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15131', '3800.00', '0.00', '3800.00', b'0', '2519.50', '2519.50', '2019-11-06 16:59:27', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000111', 0, '0.00'),
(112, 85, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15097\n', '3800.00', '0.00', '3800.00', b'0', '355.30', '355.30', '2019-11-06 16:59:36', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000112', 0, '0.00'),
(113, 82, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15132', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 16:59:44', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000113', 0, '0.00'),
(114, 85, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15098\n', '3800.00', '0.00', '3800.00', b'0', '405.00', '405.00', '2019-11-06 16:59:46', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000114', 0, '0.00'),
(115, 107, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15082\n', '3800.00', '0.00', '3800.00', b'0', '529.50', '529.50', '2019-11-06 16:59:57', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000115', 0, '0.00'),
(116, 103, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15133', '3800.00', '0.00', '3800.00', b'0', '973.50', '973.50', '2019-11-06 17:00:00', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000116', 0, '0.00'),
(117, 52, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15092\n', '3800.00', '0.00', '3800.00', b'0', '642.50', '642.50', '2019-11-06 17:00:07', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000117', 0, '0.00'),
(118, 26, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15101\n', '3800.00', '0.00', '3800.00', b'0', '422.95', '422.95', '2019-11-06 17:00:24', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000118', 0, '0.00'),
(119, 27, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15141', '3800.00', '0.00', '3800.00', b'0', '550.25', '550.25', '2019-11-06 17:00:26', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000119', 0, '0.00'),
(120, 26, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15100\n', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 17:00:34', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000120', 0, '0.00'),
(121, 109, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15083\n', '5000.00', '0.00', '5000.00', b'0', '467.25', '467.25', '2019-11-06 17:00:45', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000121', 0, '0.00'),
(122, 50, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15093\n', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 17:00:56', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000122', 0, '0.00'),
(123, 104, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15134', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 17:01:02', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000123', 0, '0.00'),
(124, 12, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15090\n', '3800.00', '0.00', '3800.00', b'0', '261.50', '261.50', '2019-11-06 17:01:06', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000124', 0, '0.00'),
(125, 190, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15128', '5000.00', '0.00', '5000.00', b'0', '323.00', '323.00', '2019-11-06 17:01:14', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000125', 0, '0.00'),
(126, 53, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15094\n', '5000.00', '0.00', '5000.00', b'0', '1065.00', '1065.00', '2019-11-06 17:01:17', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000126', 0, '0.00'),
(127, 125, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15089\n', '5000.00', '0.00', '5000.00', b'0', '287.65', '287.65', '2019-11-06 17:01:32', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000127', 0, '0.00'),
(128, 125, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15088\n', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 17:01:44', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000128', 0, '0.00'),
(129, 20, '2019-10-12', 1, '0000-00-00', '', 'RECEIPT NO 15143', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:01:53', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000129', 0, '0.00'),
(130, 20, '2019-10-12', 1, '0000-00-00', '', 'RECEIPT NO 15144', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 17:02:03', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000130', 0, '0.00'),
(131, 68, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15146', '3800.00', '0.00', '3800.00', b'0', '4720.50', '4720.50', '2019-11-06 17:02:22', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000131', 0, '0.00'),
(132, 69, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15147', '3800.00', '0.00', '3800.00', b'0', '364.00', '364.00', '2019-11-06 17:02:39', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000132', 0, '0.00'),
(133, 70, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15149', '3800.00', '0.00', '3800.00', b'0', '200.00', '200.00', '2019-11-06 17:02:52', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000133', 0, '0.00'),
(134, 73, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15148', '3800.00', '0.00', '3800.00', b'0', '508.75', '508.75', '2019-11-06 17:03:53', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000134', 0, '0.00'),
(135, 101, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15151', '3800.00', '0.00', '3800.00', b'0', '732.50', '732.50', '2019-11-06 17:04:08', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000135', 0, '0.00'),
(136, 86, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15150', '5000.00', '0.00', '5000.00', b'0', '612.50', '612.50', '2019-11-06 17:04:21', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000136', 0, '0.00'),
(137, 102, '2019-10-14', 1, '0000-00-00', '', 'RECEIPT NO 15145', '5000.00', '0.00', '5000.00', b'0', '302.50', '302.50', '2019-11-06 17:04:38', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000137', 0, '0.00'),
(138, 162, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15155', '3800.00', '0.00', '3800.00', b'0', '261.50', '261.50', '2019-11-06 17:05:57', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000138', 0, '0.00'),
(139, 160, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15173', '3800.00', '0.00', '3800.00', b'0', '1095.50', '1095.50', '2019-11-06 17:06:09', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000139', 0, '0.00'),
(140, 119, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15154', '3800.00', '0.00', '3800.00', b'0', '343.50', '343.50', '2019-11-06 17:06:21', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000140', 0, '0.00'),
(141, 155, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15168', '3800.00', '0.00', '3800.00', b'0', '732.50', '732.50', '2019-11-06 17:06:31', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000141', 0, '0.00'),
(142, 81, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15169', '3800.00', '0.00', '3800.00', b'0', '2984.50', '2984.50', '2019-11-06 17:06:43', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000142', 0, '0.00'),
(143, 64, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15162', '3800.00', '0.00', '3800.00', b'0', '805.75', '805.75', '2019-11-06 17:07:02', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000143', 0, '0.00'),
(144, 64, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15163', '3800.00', '0.00', '3800.00', b'0', '762.50', '762.50', '2019-11-06 17:07:28', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000144', 0, '0.00'),
(145, 25, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15156', '3800.00', '0.00', '3800.00', b'0', '508.75', '508.75', '2019-11-06 17:07:54', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000145', 0, '0.00'),
(146, 108, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15166', '3800.00', '0.00', '3800.00', b'0', '446.50', '446.50', '2019-11-06 17:08:05', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000146', 0, '0.00'),
(147, 92, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15157', '5000.00', '0.00', '5000.00', b'0', '343.50', '343.50', '2019-11-06 17:23:10', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000147', 0, '0.00'),
(148, 189, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15153', '5000.00', '0.00', '5000.00', b'0', '529.50', '529.50', '2019-11-06 17:23:43', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000148', 0, '0.00'),
(149, 95, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15167', '5000.00', '0.00', '5000.00', b'0', '220.50', '220.50', '2019-11-06 17:23:54', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000149', 0, '0.00'),
(150, 186, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15170', '3000.00', '0.00', '3000.00', b'0', '2635.05', '2635.05', '2019-11-06 17:24:28', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000150', 0, '0.00'),
(151, 186, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15171', '3000.00', '0.00', '3000.00', b'0', '3418.50', '3418.50', '2019-11-06 17:24:41', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000151', 0, '0.00'),
(152, 184, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15160', '5000.00', '0.00', '5000.00', b'0', '220.00', '220.00', '2019-11-06 17:24:56', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000152', 0, '0.00'),
(153, 184, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15161', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 17:25:06', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000153', 0, '0.00'),
(154, 183, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15158', '5000.00', '0.00', '5000.00', b'0', '220.00', '220.00', '2019-11-06 17:25:22', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000154', 0, '0.00'),
(155, 183, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15159', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 17:25:31', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000155', 0, '0.00'),
(156, 182, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15152', '5000.00', '0.00', '5000.00', b'0', '550.25', '550.25', '2019-11-06 17:25:46', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000156', 0, '0.00'),
(157, 44, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15164', '5000.00', '0.00', '5000.00', b'0', '200.00', '200.00', '2019-11-06 17:25:59', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000157', 0, '0.00'),
(158, 45, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15165', '5000.00', '0.00', '5000.00', b'0', '282.00', '282.00', '2019-11-06 17:26:10', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000158', 0, '0.00'),
(159, 51, '2019-10-16', 1, '0000-00-00', '', 'RECEIPT NO 15175', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:26:29', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000159', 0, '0.00'),
(160, 51, '2019-10-16', 1, '0000-00-00', '', 'RECEIPT NO 15176', '3800.00', '0.00', '3800.00', b'0', '1171.50', '1171.50', '2019-11-06 17:26:40', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000160', 0, '0.00'),
(161, 129, '2019-10-16', 1, '0000-00-00', '', 'RECEIPT NO 15174', '3800.00', '0.00', '3800.00', b'0', '377.85', '377.85', '2019-11-06 17:26:55', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000161', 0, '0.00'),
(162, 23, '2019-10-16', 1, '0000-00-00', '', 'RECEIPT NO 15177', '3800.00', '0.00', '3800.00', b'0', '1748.45', '1748.45', '2019-11-06 17:27:11', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000162', 0, '0.00'),
(163, 56, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15179', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:27:37', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000163', 0, '0.00'),
(164, 56, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15180', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:27:49', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000164', 0, '0.00'),
(165, 126, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15185', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:28:04', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000165', 0, '0.00'),
(166, 97, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15178', '3800.00', '0.00', '3800.00', b'0', '1339.25', '1339.25', '2019-11-06 17:28:16', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000166', 0, '0.00'),
(167, 116, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15183', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:28:32', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000167', 0, '0.00'),
(168, 116, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15184', '3800.00', '0.00', '3800.00', b'0', '400.40', '400.40', '2019-11-06 17:28:41', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000168', 0, '0.00'),
(169, 39, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15182', '5000.00', '0.00', '5000.00', b'0', '970.75', '970.75', '2019-11-06 17:28:53', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000169', 0, '0.00'),
(170, 39, '2019-10-17', 1, '0000-00-00', '', 'RECEIPT NO 15181', '5000.00', '0.00', '5000.00', b'0', '2669.15', '2669.15', '2019-11-06 17:29:05', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000170', 0, '0.00'),
(171, 40, '2019-10-18', 1, '0000-00-00', '', 'RECEIPT NO 15189', '5000.00', '0.00', '5000.00', b'0', '1205.05', '1205.05', '2019-11-06 17:29:29', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000171', 0, '0.00'),
(172, 16, '2019-10-18', 1, '0000-00-00', '', 'RECEIPT NO 15186', '3800.00', '0.00', '3800.00', b'0', '1104.40', '1104.40', '2019-11-06 17:29:41', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000172', 0, '0.00'),
(173, 158, '2019-10-18', 1, '0000-00-00', '', 'RECEIPT NO 15187', '3800.00', '0.00', '3800.00', b'0', '3999.05', '3999.05', '2019-11-06 17:29:53', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000173', 0, '0.00'),
(174, 32, '2019-10-19', 1, '0000-00-00', '', 'RECEIPT NO 15190', '3800.00', '0.00', '3800.00', b'0', '628.10', '628.10', '2019-11-06 17:30:53', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000174', 0, '0.00'),
(175, 32, '2019-10-19', 1, '0000-00-00', '', 'RECEIPT NO 15191', '3800.00', '0.00', '3800.00', b'0', '445.50', '445.50', '2019-11-06 17:31:12', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000175', 0, '0.00'),
(176, 167, '2019-10-19', 1, '0000-00-00', '', 'RECEIPT NO 15193', '3800.00', '0.00', '3800.00', b'0', '2464.55', '2464.55', '2019-11-06 17:31:29', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000176', 0, '0.00'),
(177, 167, '2019-10-19', 1, '0000-00-00', '', 'RECEIPT NO 15192', '3800.00', '0.00', '3800.00', b'0', '2396.35', '2396.35', '2019-11-06 17:31:41', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000177', 0, '0.00'),
(178, 132, '2019-10-19', 1, '0000-00-00', '', 'RECEIPT NO 15194', '5000.00', '0.00', '5000.00', b'0', '1171.50', '1171.50', '2019-11-06 17:31:56', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000178', 0, '0.00'),
(179, 41, '2019-10-21', 1, '0000-00-00', '', 'RECEIPT NO 15198', '3800.00', '0.00', '3800.00', b'0', '536.80', '536.80', '2019-11-06 17:34:34', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000179', 0, '0.00'),
(180, 165, '2019-10-21', 1, '0000-00-00', '', 'RECEIPT NO 15196', '3800.00', '0.00', '3800.00', b'0', '220.00', '220.00', '2019-11-06 17:34:55', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000180', 0, '0.00'),
(181, 38, '2019-10-21', 1, '0000-00-00', '', 'RECEIPT NO 15195', '3800.00', '0.00', '3800.00', b'0', '287.65', '287.65', '2019-11-06 17:36:31', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000181', 0, '0.00'),
(182, 55, '2019-10-29', 1, '0000-00-00', '', 'RECEIPT NO 15200', '3800.00', '0.00', '3800.00', b'0', '310.20', '310.20', '2019-11-06 17:37:02', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000182', 0, '0.00'),
(183, 133, '2019-10-29', 1, '0000-00-00', '', 'RECEIPT NO 15201', '5000.00', '0.00', '5000.00', b'0', '536.80', '536.80', '2019-11-06 17:37:13', '0000-00-00 00:00:00', 6, 0, b'1', b'0', '2019-000183', 0, '0.00'),
(184, 15, '2019-10-23', 1, '0000-00-00', '', 'RECEIPT NO 15199\n', '5000.00', '0.00', '5000.00', b'0', '422.95', '422.95', '2019-11-06 17:46:44', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000184', 0, '0.00'),
(185, 29, '2019-10-08', 1, '0000-00-00', '', 'RECEIPT NO 15099\n', '3800.00', '0.00', '3800.00', b'0', '591.75', '591.75', '2019-11-07 09:18:31', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000185', 0, '0.00'),
(186, 37, '2019-10-09', 1, '0000-00-00', '', 'RECEIPT NO 15107\n', '3800.00', '0.00', '3800.00', b'0', '1187.00', '1187.00', '2019-11-07 09:30:27', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000186', 0, '0.00'),
(187, 72, '2019-10-10', 1, '0000-00-00', '', 'RECEIPT NO 15113\n', '3800.00', '0.00', '3800.00', b'0', '1187.00', '1187.00', '2019-11-07 09:35:15', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000187', 0, '0.00'),
(188, 79, '2019-10-04', 1, '0000-00-00', '', 'RECEIPT NO 15039\n', '3800.00', '0.00', '3800.00', b'0', '384.50', '384.50', '2019-11-07 09:38:03', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000188', 0, '0.00'),
(189, 89, '2019-10-07', 1, '0000-00-00', '', 'RECEIPT NO 15072\n', '3800.00', '0.00', '3800.00', b'0', '384.50', '384.50', '2019-11-07 09:40:22', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000189', 0, '0.00'),
(190, 113, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15034\n', '5000.00', '0.00', '5000.00', b'0', '882.50', '882.50', '2019-11-07 09:44:11', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000190', 0, '0.00'),
(191, 140, '2019-10-11', 1, '0000-00-00', '', 'RECEIPT NO 15138\n', '3800.00', '0.00', '3800.00', b'0', '591.75', '591.75', '2019-11-07 09:49:49', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000191', 0, '0.00'),
(192, 159, '2019-10-18', 1, '0000-00-00', '', 'RECEIPT NO 15188 PAID 265.65', '3800.00', '0.00', '3800.00', b'0', '265.10', '265.10', '2019-11-07 10:05:42', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000192', 0, '0.00'),
(193, 185, '2019-10-03', 1, '0000-00-00', '', 'RECEIPT NO 15026', '5000.00', '0.00', '5000.00', b'0', '591.75', '591.75', '2019-11-07 10:25:24', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000193', 0, '0.00'),
(194, 192, '2019-10-15', 1, '0000-00-00', '', 'RECEIPT NO 15172\n', '0.00', '0.00', '0.00', b'0', '200.00', '200.00', '2019-11-07 10:27:08', '0000-00-00 00:00:00', 1, 0, b'1', b'0', '2019-000194', 0, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `billing_payment_batch`
--

CREATE TABLE `billing_payment_batch` (
  `billing_payment_batch_id` bigint(20) NOT NULL,
  `start_date` date DEFAULT '0000-00-00',
  `end_date` date DEFAULT '0000-00-00',
  `batch_code` varchar(145) DEFAULT '',
  `batch_total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `batch_total_paid_cash` decimal(20,2) DEFAULT '0.00',
  `batch_total_paid_check` decimal(20,2) DEFAULT '0.00',
  `batch_total_paid_card` decimal(20,2) DEFAULT '0.00',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `batch_total_paid_deposit` decimal(20,2) DEFAULT '0.00',
  `batch_total_deposit_refund` decimal(20,2) DEFAULT '0.00',
  `posted_by_user_id` bigint(20) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing_payment_items`
--

CREATE TABLE `billing_payment_items` (
  `billing_payment_item_id` bigint(20) NOT NULL,
  `billing_payment_id` bigint(20) DEFAULT '0',
  `billing_id` bigint(20) DEFAULT '0',
  `disconnection_id` bigint(20) DEFAULT '0',
  `receivable_amount` decimal(20,2) DEFAULT '0.00',
  `deposit_payment` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_payment_items`
--

INSERT INTO `billing_payment_items` (`billing_payment_item_id`, `billing_payment_id`, `billing_id`, `disconnection_id`, `receivable_amount`, `deposit_payment`, `payment_amount`) VALUES
(1, 1, 224, 0, '822.50', '0.00', '822.50'),
(2, 2, 232, 0, '200.00', '0.00', '200.00'),
(3, 3, 230, 0, '852.50', '0.00', '852.50'),
(4, 4, 332, 0, '200.00', '0.00', '200.00'),
(5, 5, 184, 0, '364.00', '0.00', '364.00'),
(6, 6, 255, 0, '508.75', '0.00', '508.75'),
(7, 7, 234, 0, '200.00', '0.00', '200.00'),
(8, 8, 254, 0, '672.50', '0.00', '672.50'),
(9, 9, 253, 0, '1156.50', '0.00', '1156.50'),
(10, 10, 309, 0, '971.60', '0.00', '628.10'),
(11, 11, 327, 0, '200.00', '0.00', '200.00'),
(12, 12, 338, 0, '1930.50', '0.00', '1930.50'),
(13, 13, 235, 0, '6394.50', '0.00', '6394.50'),
(14, 14, 304, 0, '1156.50', '0.00', '1156.50'),
(15, 15, 249, 0, '1065.00', '0.00', '1065.00'),
(16, 16, 266, 0, '200.00', '0.00', '200.00'),
(17, 17, 287, 0, '2209.50', '0.00', '2209.50'),
(18, 18, 311, 0, '696.75', '0.00', '332.75'),
(19, 19, 311, 0, '364.00', '0.00', '364.00'),
(20, 20, 183, 0, '200.00', '0.00', '200.00'),
(21, 21, 228, 0, '912.50', '0.00', '912.50'),
(22, 22, 277, 0, '642.50', '0.00', '642.50'),
(23, 23, 276, 0, '302.50', '0.00', '302.50'),
(24, 24, 243, 0, '1851.10', '0.00', '1238.60'),
(25, 25, 320, 0, '762.50', '0.00', '762.50'),
(26, 26, 359, 0, '1700.25', '0.00', '355.30'),
(27, 27, 359, 0, '1344.95', '0.00', '582.45'),
(28, 28, 359, 0, '762.50', '0.00', '762.50'),
(29, 29, 353, 0, '820.40', '0.00', '400.40'),
(30, 30, 353, 0, '420.00', '0.00', '220.00'),
(31, 31, 353, 0, '200.00', '0.00', '200.00'),
(32, 32, 339, 0, '1126.00', '0.00', '1126.00'),
(33, 33, 279, 0, '420.00', '0.00', '220.00'),
(34, 34, 279, 0, '200.00', '0.00', '200.00'),
(35, 35, 280, 0, '420.00', '0.00', '220.00'),
(36, 36, 280, 0, '200.00', '0.00', '200.00'),
(37, 37, 268, 0, '200.00', '0.00', '200.00'),
(38, 38, 345, 0, '1837.50', '0.00', '1837.50'),
(39, 39, 342, 0, '200.00', '0.00', '200.00'),
(40, 40, 223, 0, '282.00', '0.00', '282.00'),
(41, 41, 331, 0, '200.00', '0.00', '200.00'),
(42, 42, 344, 0, '446.50', '0.00', '446.50'),
(43, 43, 334, 0, '200.00', '0.00', '200.00'),
(44, 44, 219, 0, '822.50', '0.00', '822.50'),
(45, 45, 302, 0, '467.25', '0.00', '467.25'),
(46, 46, 185, 0, '364.00', '0.00', '364.00'),
(47, 47, 282, 0, '200.00', '0.00', '200.00'),
(48, 48, 216, 0, '241.00', '0.00', '241.00'),
(49, 49, 262, 0, '1930.50', '0.00', '1930.50'),
(50, 50, 226, 0, '488.00', '0.00', '488.00'),
(51, 51, 215, 0, '200.00', '0.00', '200.00'),
(52, 52, 214, 0, '200.00', '0.00', '200.00'),
(53, 53, 213, 0, '302.50', '0.00', '302.50'),
(54, 54, 307, 0, '766.45', '0.00', '422.95'),
(55, 55, 307, 0, '343.50', '0.00', '343.50'),
(56, 56, 335, 0, '555.59', '0.00', '508.75'),
(57, 57, 200, 0, '702.50', '0.00', '702.50'),
(58, 58, 260, 0, '1217.50', '0.00', '1217.50'),
(59, 59, 186, 0, '732.50', '0.00', '732.50'),
(60, 60, 269, 0, '200.00', '0.00', '200.00'),
(61, 61, 303, 0, '425.75', '0.00', '425.75'),
(62, 62, 203, 0, '508.75', '0.00', '508.75'),
(63, 63, 202, 0, '732.50', '0.00', '732.50'),
(64, 64, 348, 0, '420.00', '0.00', '220.00'),
(65, 65, 322, 0, '1194.95', '0.00', '582.45'),
(66, 66, 350, 0, '865.85', '0.00', '377.85'),
(67, 67, 322, 0, '612.50', '0.00', '612.50'),
(68, 68, 204, 0, '852.50', '0.00', '852.50'),
(69, 69, 237, 0, '343.50', '0.00', '343.50'),
(70, 70, 240, 0, '1775.50', '0.00', '1775.50'),
(71, 71, 244, 0, '467.25', '0.00', '467.25'),
(72, 72, 297, 0, '200.00', '0.00', '200.00'),
(73, 73, 321, 0, '952.50', '0.00', '220.00'),
(74, 74, 306, 0, '2643.50', '0.00', '2643.50'),
(75, 75, 321, 0, '732.50', '0.00', '732.50'),
(76, 76, 252, 0, '425.75', '0.00', '425.75'),
(77, 77, 198, 0, '425.75', '0.00', '425.75'),
(78, 78, 337, 0, '1675.40', '0.00', '1104.40'),
(79, 79, 362, 0, '1547.25', '0.00', '904.75'),
(80, 80, 337, 0, '571.00', '0.00', '571.00'),
(81, 81, 362, 0, '642.50', '0.00', '642.50'),
(82, 82, 289, 0, '2767.50', '0.00', '2767.50'),
(83, 83, 288, 0, '2426.50', '0.00', '2426.50'),
(84, 84, 239, 0, '6704.50', '0.00', '6704.50'),
(85, 85, 196, 0, '241.00', '0.00', '241.00'),
(86, 86, 211, 0, '743.90', '0.00', '400.40'),
(87, 87, 211, 0, '343.50', '0.00', '343.50'),
(88, 88, 259, 0, '343.50', '0.00', '343.50'),
(89, 89, 350, 0, '488.00', '0.00', '488.00'),
(90, 90, 256, 0, '1034.50', '0.00', '1034.50'),
(91, 91, 281, 0, '343.50', '0.00', '343.50'),
(92, 92, 233, 0, '1248.50', '0.00', '1248.50'),
(93, 93, 290, 0, '762.50', '0.00', '762.50'),
(94, 94, 278, 0, '405.00', '0.00', '405.00'),
(95, 95, 272, 0, '200.00', '0.00', '200.00'),
(96, 96, 319, 0, '1713.50', '0.00', '1713.50'),
(97, 97, 308, 0, '1496.50', '0.00', '1496.50'),
(98, 98, 357, 0, '200.00', '0.00', '200.00'),
(99, 99, 222, 0, '1279.50', '0.00', '1279.50'),
(100, 100, 291, 0, '973.50', '0.00', '973.50'),
(101, 101, 194, 0, '1403.50', '0.00', '1403.50'),
(102, 102, 197, 0, '1775.50', '0.00', '1775.50'),
(103, 103, 292, 0, '702.50', '0.00', '702.50'),
(104, 104, 340, 0, '1248.50', '0.00', '1248.50'),
(105, 105, 348, 0, '200.00', '0.00', '200.00'),
(106, 106, 314, 0, '2421.86', '0.00', '2209.50'),
(107, 107, 192, 0, '420.00', '0.00', '220.00'),
(108, 108, 229, 0, '2147.50', '0.00', '2147.50'),
(109, 109, 192, 0, '200.00', '0.00', '200.00'),
(110, 110, 313, 0, '200.00', '0.00', '200.00'),
(111, 111, 312, 0, '2519.50', '0.00', '2519.50'),
(112, 112, 191, 0, '760.30', '0.00', '355.30'),
(113, 113, 305, 0, '200.00', '0.00', '200.00'),
(114, 114, 191, 0, '405.00', '0.00', '405.00'),
(115, 115, 264, 0, '529.50', '0.00', '529.50'),
(116, 116, 220, 0, '973.50', '0.00', '973.50'),
(117, 117, 286, 0, '642.50', '0.00', '642.50'),
(118, 118, 299, 0, '766.45', '0.00', '422.95'),
(119, 119, 295, 0, '550.25', '0.00', '550.25'),
(120, 120, 299, 0, '343.50', '0.00', '343.50'),
(121, 121, 265, 0, '467.25', '0.00', '467.25'),
(122, 122, 285, 0, '200.00', '0.00', '200.00'),
(123, 123, 217, 0, '343.50', '0.00', '343.50'),
(124, 124, 193, 0, '261.50', '0.00', '261.50'),
(125, 125, 354, 0, '323.00', '0.00', '323.00'),
(126, 126, 250, 0, '1065.00', '0.00', '1065.00'),
(127, 127, 301, 0, '487.65', '0.00', '287.65'),
(128, 128, 301, 0, '200.00', '0.00', '200.00'),
(129, 129, 294, 0, '420.00', '0.00', '220.00'),
(130, 130, 294, 0, '200.00', '0.00', '200.00'),
(131, 131, 238, 0, '4720.50', '0.00', '4720.50'),
(132, 132, 241, 0, '364.00', '0.00', '364.00'),
(133, 133, 246, 0, '200.00', '0.00', '200.00'),
(134, 134, 242, 0, '508.75', '0.00', '508.75'),
(135, 135, 324, 0, '732.50', '0.00', '732.50'),
(136, 136, 227, 0, '612.50', '0.00', '612.50'),
(137, 137, 323, 0, '302.50', '0.00', '302.50'),
(138, 138, 209, 0, '261.50', '0.00', '261.50'),
(139, 139, 258, 0, '1095.50', '0.00', '1095.50'),
(140, 140, 212, 0, '343.50', '0.00', '343.50'),
(141, 141, 273, 0, '732.50', '0.00', '732.50'),
(142, 142, 274, 0, '2984.50', '0.00', '2984.50'),
(143, 143, 207, 0, '1568.25', '0.00', '805.75'),
(144, 144, 207, 0, '762.50', '0.00', '762.50'),
(145, 145, 296, 0, '508.75', '0.00', '508.75'),
(146, 146, 218, 0, '446.50', '0.00', '446.50'),
(147, 147, 275, 0, '343.50', '0.00', '343.50'),
(148, 148, 231, 0, '529.50', '0.00', '529.50'),
(149, 149, 325, 0, '220.50', '0.00', '220.50'),
(150, 150, 351, 0, '6053.55', '0.00', '2635.05'),
(151, 151, 351, 0, '3418.50', '0.00', '3418.50'),
(152, 152, 363, 0, '420.00', '0.00', '220.00'),
(153, 153, 363, 0, '200.00', '0.00', '200.00'),
(154, 154, 364, 0, '420.00', '0.00', '220.00'),
(155, 155, 364, 0, '200.00', '0.00', '200.00'),
(156, 156, 356, 0, '550.25', '0.00', '550.25'),
(157, 157, 284, 0, '200.00', '0.00', '200.00'),
(158, 158, 221, 0, '282.00', '0.00', '282.00'),
(159, 159, 293, 0, '1391.50', '0.00', '220.00'),
(160, 160, 293, 0, '1171.50', '0.00', '1171.50'),
(161, 161, 349, 0, '377.85', '0.00', '377.85'),
(162, 162, 298, 0, '1748.45', '0.00', '1748.45'),
(163, 163, 283, 0, '440.00', '0.00', '220.00'),
(164, 164, 283, 0, '220.00', '0.00', '220.00'),
(165, 165, 263, 0, '220.00', '0.00', '220.00'),
(166, 166, 236, 0, '1339.25', '0.00', '1339.25'),
(167, 167, 190, 0, '620.40', '0.00', '220.00'),
(168, 168, 190, 0, '400.40', '0.00', '400.40'),
(169, 169, 355, 0, '3639.90', '0.00', '970.75'),
(170, 170, 355, 0, '2669.15', '0.00', '2669.15'),
(171, 171, 205, 0, '1205.05', '0.00', '1205.05'),
(172, 172, 330, 0, '1104.40', '0.00', '1104.40'),
(173, 173, 329, 0, '3999.05', '0.00', '3999.05'),
(174, 174, 346, 0, '1073.60', '0.00', '628.10'),
(175, 175, 346, 0, '445.50', '0.00', '445.50'),
(176, 176, 225, 0, '4860.90', '0.00', '2464.55'),
(177, 177, 225, 0, '2396.35', '0.00', '2396.35'),
(178, 178, 248, 0, '1171.50', '0.00', '1171.50'),
(179, 179, 336, 0, '558.80', '0.00', '536.80'),
(180, 180, 333, 0, '242.00', '0.00', '220.00'),
(181, 181, 201, 0, '287.65', '0.00', '287.65'),
(182, 182, 326, 0, '310.20', '0.00', '310.20'),
(183, 183, 267, 0, '536.80', '0.00', '536.80'),
(184, 184, 360, 0, '422.95', '0.00', '422.95'),
(185, 185, 341, 0, '591.75', '0.00', '591.75'),
(186, 186, 206, 0, '1187.00', '0.00', '1187.00'),
(187, 187, 245, 0, '1187.00', '0.00', '1187.00'),
(188, 188, 257, 0, '384.50', '0.00', '384.50'),
(189, 189, 247, 0, '384.50', '0.00', '384.50'),
(190, 190, 243, 0, '882.50', '0.00', '882.50'),
(191, 191, 271, 0, '591.75', '0.00', '591.75'),
(192, 192, 328, 0, '265.10', '0.00', '265.10'),
(193, 193, 352, 0, '591.75', '0.00', '591.75'),
(194, 194, 347, 0, '200.00', '0.00', '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` bigint(20) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `is_deleted`, `is_active`) VALUES
(1, 'NONE', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `card_id` bigint(20) NOT NULL,
  `card_code` varchar(100) NOT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cash_invoice`
--

CREATE TABLE `cash_invoice` (
  `cash_invoice_id` bigint(20) NOT NULL,
  `cash_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `email_address` varchar(75) DEFAULT NULL,
  `contact_no` varchar(75) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  `for_dispatching` bit(1) DEFAULT b'0',
  `closing_reason` varchar(445) DEFAULT '',
  `closed_by_user` bigint(20) DEFAULT '0',
  `is_closed` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cash_invoice_items`
--

CREATE TABLE `cash_invoice_items` (
  `cash_item_id` bigint(20) NOT NULL,
  `cash_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `category_code` bigint(20) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_desc` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_code`, `category_name`, `category_desc`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
(1, NULL, 'Category', '', NULL, '0000-00-00 00:00:00', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `charge_id` bigint(20) NOT NULL,
  `charge_code` varchar(255) DEFAULT NULL,
  `charge_desc` varchar(255) DEFAULT NULL,
  `charge_unit_id` varchar(255) DEFAULT NULL,
  `charge_amount` decimal(25,2) DEFAULT '0.00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `income_account_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`charge_id`, `charge_code`, `charge_desc`, `charge_unit_id`, `charge_amount`, `is_active`, `is_deleted`, `created_by_user`, `deleted_by_user`, `modified_by_user`, `income_account_id`) VALUES
(1, 'CH-2019-01', 'Balances as of August 30, 2019', '1', '0.00', b'1', b'0', 0, 0, 0, 35);

-- --------------------------------------------------------

--
-- Table structure for table `charge_unit`
--

CREATE TABLE `charge_unit` (
  `charge_unit_id` int(11) NOT NULL,
  `charge_unit_name` varchar(255) DEFAULT NULL,
  `charge_unit_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charge_unit`
--

INSERT INTO `charge_unit` (`charge_unit_id`, `charge_unit_name`, `charge_unit_desc`, `is_deleted`, `is_active`) VALUES
(1, 'N/A', 'N/A', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` bigint(20) NOT NULL,
  `chat_code` varchar(150) DEFAULT '0',
  `message` varchar(160) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `check_layout`
--

CREATE TABLE `check_layout` (
  `check_layout_id` int(11) NOT NULL,
  `check_layout` varchar(755) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `particular_pos_left` decimal(20,0) DEFAULT '0',
  `particular_pos_top` decimal(20,0) DEFAULT '0',
  `particular_font_family` varchar(555) DEFAULT 'Tahoma',
  `particular_font_size` varchar(20) DEFAULT '12pt',
  `particular_is_italic` varchar(55) DEFAULT 'normal',
  `particular_is_bold` varchar(55) DEFAULT 'bold',
  `words_pos_left` decimal(20,4) DEFAULT '0.0000',
  `words_pos_top` decimal(20,4) DEFAULT '0.0000',
  `words_font_family` varchar(555) DEFAULT 'Tahoma',
  `words_font_size` varchar(20) DEFAULT '12pt',
  `words_is_italic` varchar(55) DEFAULT 'normal',
  `words_is_bold` varchar(55) DEFAULT 'bold',
  `amount_pos_left` decimal(20,4) DEFAULT '0.0000',
  `amount_pos_top` decimal(20,4) DEFAULT '0.0000',
  `amount_font_family` varchar(555) DEFAULT '',
  `amount_font_size` varchar(20) DEFAULT '12pt',
  `amount_is_italic` varchar(55) DEFAULT 'normal',
  `amount_is_bold` varchar(20) DEFAULT 'bold',
  `date_pos_left` decimal(20,4) DEFAULT '0.0000',
  `date_pos_top` decimal(20,4) DEFAULT '0.0000',
  `date_font_family` varchar(555) DEFAULT '',
  `date_font_size` varchar(20) DEFAULT '12pt',
  `date_is_italic` varchar(55) DEFAULT 'normal',
  `date_is_bold` varchar(55) DEFAULT 'bold',
  `is_portrait` bit(1) DEFAULT b'1',
  `posted_by_user` bigint(20) DEFAULT '0',
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` bigint(20) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` bigint(20) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `check_layout`
--

INSERT INTO `check_layout` (`check_layout_id`, `check_layout`, `description`, `particular_pos_left`, `particular_pos_top`, `particular_font_family`, `particular_font_size`, `particular_is_italic`, `particular_is_bold`, `words_pos_left`, `words_pos_top`, `words_font_family`, `words_font_size`, `words_is_italic`, `words_is_bold`, `amount_pos_left`, `amount_pos_top`, `amount_font_family`, `amount_font_size`, `amount_is_italic`, `amount_is_bold`, `date_pos_left`, `date_pos_top`, `date_font_family`, `date_font_size`, `date_is_italic`, `date_is_bold`, `is_portrait`, `posted_by_user`, `date_posted`, `modified_by_user`, `date_modified`, `deleted_by_user`, `date_deleted`, `is_active`, `is_deleted`) VALUES
(1, 'Security Bank', '', '47', '832', 'Tahoma', '16px', 'normal', 'bold', '46.7500', '868.7190', 'Tahoma', '16px', 'normal', 'bold', '527.6250', '826.6250', 'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif', '16px', 'normal', 'bold', '529.7030', '792.6410', 'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif', '16px', 'normal', 'bold', b'1', 1, '2017-09-13 11:47:30', 0, '2018-10-11 14:50:25', 0, '0000-00-00 00:00:00', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `civil_status`
--

CREATE TABLE `civil_status` (
  `civil_status_id` int(11) NOT NULL,
  `civil_status_name` varchar(145) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `civil_status`
--

INSERT INTO `civil_status` (`civil_status_id`, `civil_status_name`, `is_active`, `is_deleted`) VALUES
(1, 'Single', b'1', b'0'),
(2, 'Married', b'1', b'0'),
(3, 'Widowed', b'1', b'0'),
(4, 'Divorced', b'1', b'0'),
(5, 'Separated', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(555) DEFAULT '',
  `company_address` varchar(755) DEFAULT '',
  `email_address` varchar(155) DEFAULT '',
  `mobile_no` varchar(125) DEFAULT '',
  `landline` varchar(125) DEFAULT '',
  `tin_no` varchar(55) DEFAULT NULL,
  `tax_type_id` int(11) DEFAULT '0',
  `registered_to` varchar(555) DEFAULT '',
  `logo_path` varchar(555) DEFAULT '',
  `rdo_no` varchar(55) DEFAULT NULL,
  `nature_of_business` varchar(155) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `registered_address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `industry_classification` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`company_id`, `company_name`, `company_address`, `email_address`, `mobile_no`, `landline`, `tin_no`, `tax_type_id`, `registered_to`, `logo_path`, `rdo_no`, `nature_of_business`, `business_type`, `registered_address`, `zip_code`, `telephone_no`, `industry_classification`) VALUES
(1, 'Friendship Plaza Waterworks', 'Friendship Plaza Clubhouse, Kanlaon Street, Friendship Plaza, Angeles City', 'donpepehenson@yahoo.com / dphe.finaceandacctg@gmail.com', '', '(045) 888-1023 / (045) 409-0225', '469299358000', 1, 'JDEV OFFICE SOLUTIONS INC.', 'assets/img/company/5cff2a2dc76bb.png', '057', 'Service', 1, '4776 Montang Ave., Service Rd, Diamond Subd., Balibago, Angeles City', '2009', '9003988 ', 'Service');

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `contract_type_id` int(11) NOT NULL,
  `contract_type_name` varchar(145) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`contract_type_id`, `contract_type_name`, `is_active`, `is_deleted`) VALUES
(1, 'Residential', b'1', b'0'),
(2, 'Commercial', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL,
  `pos_customer_id` bigint(20) DEFAULT '0',
  `hotel_customer_id` bigint(20) DEFAULT '0',
  `customer_code` varchar(255) DEFAULT '',
  `customer_name` varchar(255) DEFAULT '',
  `contact_name` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email_address` varchar(255) DEFAULT '',
  `contact_no` varchar(100) DEFAULT '',
  `term` varchar(100) DEFAULT '',
  `customer_type_id` bigint(20) DEFAULT '0',
  `customer_account_type_id` bigint(20) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `link_department_id` int(11) DEFAULT '0',
  `refcustomertype_id` bigint(20) DEFAULT '0',
  `tin_no` varchar(100) DEFAULT '',
  `photo_path` varchar(500) DEFAULT '',
  `total_receivable_amount` decimal(19,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `credit_limit` decimal(20,4) DEFAULT '0.0000',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `ceiling_amount` decimal(20,4) DEFAULT '0.0000',
  `spouse_nationality_id` int(11) DEFAULT '0',
  `spouse_occupation` varchar(445) DEFAULT '',
  `spouse_name` varchar(145) DEFAULT '',
  `tenant_birth_date` date DEFAULT '0000-00-00',
  `sex_id` int(11) DEFAULT '0',
  `civil_status_id` int(11) DEFAULT '0',
  `nationality_id` int(11) DEFAULT '0',
  `date_move_in` date DEFAULT '0000-00-00',
  `tenant_occupation` varchar(445) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `pos_customer_id`, `hotel_customer_id`, `customer_code`, `customer_name`, `contact_name`, `address`, `email_address`, `contact_no`, `term`, `customer_type_id`, `customer_account_type_id`, `department_id`, `link_department_id`, `refcustomertype_id`, `tin_no`, `photo_path`, `total_receivable_amount`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `credit_limit`, `modified_by_user`, `deleted_by_user`, `is_paid`, `is_deleted`, `is_active`, `ceiling_amount`, `spouse_nationality_id`, `spouse_occupation`, `spouse_name`, `tenant_birth_date`, `sex_id`, `civil_status_id`, `nationality_id`, `date_move_in`, `tenant_occupation`) VALUES
(1, 0, 0, '', 'JOSE HUBERTO S. TAYAG', 'JOSE HUBERTO S. TAYAG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:35:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(2, 0, 0, '', 'JOSEPH PONCE MARLYN', 'JOSEPH PONCE MARLYN', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:37:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(3, 0, 0, '', 'JOSIE NAVARRO', 'JOSIE NAVARRO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:38:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(4, 0, 0, '', 'JUN KIM', 'SHIN YOUNG GIL', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:43:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(5, 0, 0, '', 'JUNG WOO CHUL', 'JOUNG KI', ' ', '', '   ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 01:44:00', '2019-07-16 01:44:41', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(6, 0, 0, '', 'A.V CONSTRUCTION', 'ANNA MARIE DIZON', 'LOT 3 BLK. 2 APO ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:45:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(7, 0, 0, '', 'KATHERINE GRACE ALFONSO', 'KATHERINE GRACE ALFONSO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:45:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(8, 0, 0, '', 'KIM JIN HONG ', 'KIM JIN HONG ', '\r\n', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:46:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(9, 0, 0, '', 'KYO KIM YOUNG', 'KYO KIM YOUNG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:47:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(10, 0, 0, '', 'L.M HICKEY PROPERTIES', 'L.M HICKEY PROPERTIES', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:48:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(11, 0, 0, '', 'LAURA MALONZO', 'LAURA MALONZO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:50:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(12, 0, 0, '', 'LEE HWA YOUNG', 'LEE HWA YOUNG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:51:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(13, 0, 0, '', 'LEE HYUN BAEK UNJIN', 'LEE HYUN BAEK UNJIN', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:51:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(14, 0, 0, '', 'LEE YOUNG HEUNG', 'LEE YOUNG HEUNG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 01:53:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(15, 0, 0, '', 'LITO LAPID', 'KIM KYU SUB', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 01:54:22', '2019-07-16 01:54:47', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(16, 0, 0, '', 'LORETA NARCISCO', 'LORETA NARCISCO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:14:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(17, 0, 0, '', 'LOUIE NEPOMUCENO', 'TEODORO TINIO', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 02:15:16', '2019-07-16 02:16:33', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(18, 0, 0, '', 'LUKE LEE', 'LUKE LEE', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:16:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(19, 0, 0, '', 'M.J. MASAYA CORPORATION', 'CHA YOUNG SAM', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 02:19:23', '2019-07-16 04:06:32', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(20, 0, 0, '', 'MANUEL SUAREZ', 'MANUEL SUAREZ / J. H. TAYAG', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 02:19:59', '2019-07-16 04:06:21', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(21, 0, 0, '', 'MELISSA ANGELA HENSON', 'MELISSA ANGELA HENSON', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:23:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(22, 0, 0, '', 'MELODY REYES', 'J. H. TAYAG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:24:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(23, 0, 0, '', 'MOO SEUNG LIM', 'MOO SEUNG LIM', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:24:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(24, 0, 0, '', 'NANCY BURKE', 'NANCY BURKE', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:25:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(25, 0, 0, '', 'NARCISO BARBARRA', 'NARCISO BARBARRA', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:25:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(26, 0, 0, '', 'NUMERIANO PANGILINAN', 'ESTRELLA A. BELTRAN', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 02:26:03', '2019-07-16 04:04:58', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(27, 0, 0, '', 'OK KWANG', 'OK KWANG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:35:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(28, 0, 0, '', 'ORLEANS MALONES', 'ORLEANS MALONES', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:37:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(29, 0, 0, '', 'PATRICIA NARCISO', 'PATRICIA NARCISO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:39:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(30, 0, 0, '', 'ABEL DIZON', 'ABEL DIZON', 'LOT 2-3 BLK. 16 DON PEPE ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:39:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(31, 0, 0, '', 'PATRICIA RATHMELL', 'ADRIAN RATHMELL', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 02:39:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(32, 0, 0, '', 'RAFAEL JESUS DEL ROSARIO', 'RAFAEL JESUS DEL ROSARIO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:14:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(33, 0, 0, '', 'RAMON FRANCISCO KATIGBAK MD', 'RAMON FRANCISCO KATIGBAK MD', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:16:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(34, 0, 0, '', 'RAOUL PAOLO HENSON', 'RAOUL PAOLO HENSON', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:16:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(35, 0, 0, '', 'RAUL NARCISO', 'WEN TAO LI', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:17:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(36, 0, 0, '', 'RAYMOND SUAREZ', 'RAYMOND SUAREZ', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:19:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(37, 0, 0, '', 'REENCHA CORPORATION', 'LEE BYUNG REEN / CHOREEN', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', 'assets/img/anonymous-icon.png', '0.00', '2019-07-16 03:20:00', '2019-07-16 04:04:27', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(38, 0, 0, '', 'REY CARILLO', 'REY CARILLO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:25:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(39, 0, 0, '', 'ROMMEL YUSON', 'ROMMEL YUSON', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:25:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(40, 0, 0, '', 'ROMULO POLICARPIO', 'MINERVA PALO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:26:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(41, 0, 0, '', 'ADRIAN RATHMELL', 'ADRIAN RATHMELL', 'LOT.23, BLK.6 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:51:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(42, 0, 0, '', 'SANG MI HAN', 'SANG MI HAN', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:52:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(43, 0, 0, '', 'SEE MIN PARK', 'SEE MIN PARK', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:53:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(44, 0, 0, '', 'SELL 4 ANGELES CORPORATION', 'SEUNG TEAK PARK / ECONARA', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:53:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(45, 0, 0, '', 'SIRIN SUAT', 'SIRIN SUAT', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:54:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(46, 0, 0, '', 'SONIA / PETER STUBLEY', ' SONIA ', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:57:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(47, 0, 0, '', 'AHN AND CHUN CORPORATION', 'OH KYUNG IL', 'LOT 1 BLK. 7 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:57:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(48, 0, 0, '', 'SOTERO SUNGA', 'SOTERO SUNGA', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:57:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(49, 0, 0, '', 'SUNG KYU CHOI', 'SUNG KYU CHOI', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:58:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(50, 0, 0, '', 'SUNG KYU WOO ', 'SUNG KYU WOO ', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:58:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(51, 0, 0, '', 'TRIXIE HENSON', 'TRIXIE HENSON', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:59:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(52, 0, 0, '', 'AMANDO A. GOMEZ', 'AMANDO A. GOMEZ', 'LOT.9, BLK.6 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:59:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(53, 0, 0, '', 'VENCIO MACATANGAY', 'VENCIO MACATANGAY', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 03:59:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(54, 0, 0, '', 'AMIRAY TOMER', 'JAROLD ALBERT NARCISO', 'LOT 14 BLK. 2 ARAYAT ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:00:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(55, 0, 0, '', '46070 WURI CONSTRUCTION', '46070 WURI CONSTRUCTION', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:00:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(56, 0, 0, '', 'ANNA MARIA TINIO', 'ANNA MARIA TINIO', 'LOT.14, BLK.6 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:00:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(57, 0, 0, '', 'YOUNG CHANG INC LEE HYUN JOUNG', 'LEE HYUN JOUNG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:01:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(58, 0, 0, '', 'ANNESTER MAXWELL', 'ANNESTER MAXWELL', 'LOT 3, BLK. 13 DON SEVERINO ST PHASE 2', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:01:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(59, 0, 0, '', 'ANTHONY JOSE PANGILINAN', 'CHRISTIAN SAN JUAN', 'LOT 9 BLK. 16 DON MARIANO ST PHASE 2', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:01:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(60, 0, 0, '', 'ANTONIO VEERSTEG', 'ANTONIO VEERSTEG', 'LOT.15-17, BLK.5 NEGRON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:02:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(61, 0, 0, '', 'ARLENE MARIANO', 'ARLENE MARIANO', 'LOT. 19, BLK. 6 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:02:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(62, 0, 0, '', 'YOUNG TAK LA', 'JON BOOG PARK', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 04:03:22', '2019-07-16 04:03:55', '0000-00-00 00:00:00', 2, NULL, 2, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(63, 0, 0, '', 'ARLYN VILLANUEVA', 'RAFAEL JESUS DEL ROSARIO', 'LOT. 5 BLK. 4 KANLAON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:03:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(64, 0, 0, '', 'BERNARDUS HUIRNE', 'BERNARDUS HUIRNE', 'LOT.18,19, BLK.5 NEGRON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:04:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(65, 0, 0, '', 'BIENVENIDO PATING', 'SHIN KOA', 'LOT 2 BLK. 2 APO ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:06:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(66, 0, 0, '', 'BRENDAN MECCHIA', 'MADEL CABRERA', 'LOT 5, BLK. 5 TAAL ST.', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:06:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(67, 0, 0, '', 'BRESDIN PHILIP', 'BRESDIN PHILIP', 'LOT 4, BLK. 5 TAAL ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(68, 0, 0, '', 'BUY 4 ANGELES CORP.', 'PARK SEUNG DUK', 'LOT 8,BLK. 3 KANLAON ST.', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:07:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(69, 0, 0, '', 'CATHY ALQUERO', 'CATHY ALQUERO', 'LOT 2 BLK 2 ARAYAT ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:08:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(70, 0, 0, '', 'CHON HYUN KIM', 'CHON HYUN KIM', 'LOT 4,5, BLK.1 TAAL ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 04:09:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(71, 0, 0, '', 'CHRISTINE ANGELA CONTE', 'CHRISTINE ANGELA CONTE', ' ', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', '', '0.00', '2019-07-16 04:10:15', '2019-07-16 04:13:08', '0000-00-00 00:00:00', 3, NULL, 3, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(72, 0, 0, '', 'CHUL WOO  JONG', 'HAHN DOK YUN', 'LOT 5 BLK. 2 DON MARIANO ST PHASE 2', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 06:45:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(73, 0, 0, '', 'CRESENCIA  DAVID', 'CRESENCIA  DAVID', 'LOT 1 C CN4 ST PHASE 3', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 06:46:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(74, 0, 0, '', 'DAE WOON LEE', 'DAE WOON LEE', 'LOT. 1-3, BLK. 7 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 06:46:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(75, 0, 0, '', 'DANIEL DIZON', 'DANIEL DIZON', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 06:47:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(76, 0, 0, '', 'EDGARDO TUQUERO', 'EDGARDO TUQUERO', 'LOT 4, BLK. 2 APO ST.', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:10:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(77, 0, 0, '', 'EDWARD ALQUERO', 'EDWARD ALQUERO', 'LOT 15 BLK 6 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:11:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(78, 0, 0, '', 'ELIZA YUEN', 'ELIZA YUEN', 'LOT.11-14, BLK.5 NEGRON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:12:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(79, 0, 0, '', 'ESTER B. CLARETE', 'ESTER B. CLARETE', 'LOT. 1, BLK. 2 PINATUBO ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:16:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(80, 0, 0, '', 'EUN SOOK KANG', 'EUN SOOK KANG', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:18:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(81, 0, 0, '', 'FIRST ANGLO-SCOT DEVT. INC', 'BALMORAL', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:22:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(82, 0, 0, '', 'FLORDELISA NEMOTO', 'FLORDELISA NEMOTO', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:24:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(83, 0, 0, '', 'FRANCIS DAVID', ' SONIA', 'LOT.13, BLK.6 MAYON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:25:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(84, 0, 0, '', 'FRIENDSHIP CLUB', 'FLORDELISA NEMOTO', 'LOT 1 - 2, BLK.5 TAAL ST.', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:26:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(85, 0, 0, '', 'GRACE DIZON', 'GRACE DIZON', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:27:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(86, 0, 0, '', 'GRACE TYLER', 'GRACE TYLER', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:29:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(87, 0, 0, '', 'HA SOOK YEON', 'KIM CHOON BOK', 'LOT. 4, BLK. 4 NEGRON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:31:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(88, 0, 0, '', 'HWA YEONG LEE', 'HWA YEONG LEE', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:31:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(89, 0, 0, '', 'HYUK BOO KWON', 'KIM CHON HYUN', 'LOT.2,3, BLK.1 TAAL ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:32:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(90, 0, 0, '', 'HYUN LEE', 'UNJIN BAEK', 'LOT 7, BLK. 4 KANLAON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:33:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(91, 0, 0, '', 'ICK SWIMMING POOL SHIN DONG', 'KIM CHON HYUN', 'LOT. 4, BLK.1 TAAL ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:34:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(92, 0, 0, '', 'IL KYU PARK', 'IL KYU PARK', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:37:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(93, 0, 0, '', 'IRISH CALAGUAS', 'REINA MANUEL', 'LOT 8, BLK. 2 ARAYAT ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(94, 0, 0, '', 'IRMINA LAI', 'IRMINA LAI', '', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:38:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(95, 0, 0, '', 'JAIME MALLARI', 'JAIME MALLARI', 'LOT.1, BLK.6 NEGRON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:40:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(96, 0, 0, '', 'JAMES FRANCIS GREER JR', 'JAMES FRANCIS GREER JR', 'LOT 1 BLK. 5 DONA FRANCISCA ST P2', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:40:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(97, 0, 0, '', 'JANICE CORRES', 'JANICE CORRES', 'LOT. 2, BLK. 3 KANLAON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:41:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(98, 0, 0, '', 'JEONG SEONG HO', 'JEONG SEONG HO', 'LAZATIN', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:42:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(99, 0, 0, '', 'JERALYN HICKEY', 'JERALYN HICKEY', 'LOT.9, BLK.5 NEGRON ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:42:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(100, 0, 0, '', 'JIN HONG KIM', 'JIN HONG KIM', 'LAZATIN  AREA', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:43:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(101, 0, 0, '', 'JOEL B. GUILLAR', 'JOEL B. GUILLAR', 'LOT 4, BLK. 2 ARAYAT ST', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:43:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(102, 0, 0, '', 'JOHN CC. TEE', 'GINA FERRER', 'LOT 1-E CN4 ST PHASE 3', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:44:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(103, 0, 0, '', 'JON BOOG PARK', 'JON BOOG PARK', 'LAZATIN', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:45:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(104, 0, 0, '', 'JONG CHUL WOO', 'HAHN DOK YUN', 'LOT 5 BLK. 2 DON MARIANO ST PHASE 2', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:45:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(105, 0, 0, '', 'JORDAN DAVID', 'DPHE FF WW', 'PHASE 2', '', '', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-07-16 07:46:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(106, 0, 0, '', 'DOK YUN HAHN', '', 'LOT 4 BLK. 2 DON MARIANO ST PHASE 2', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', 'assets/img/anonymous-icon.png', '0.00', '2019-09-16 14:20:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(107, 0, 0, '', 'LORDALYN SANTIAGO', '', 'LOT 6 BLK. 1 DONA MANUELA ST PHASE 2\r\n', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-09-16 14:23:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(108, 0, 0, '', 'BENJAMIN NARCISO', '', 'LOT 9 BLK. 2 DONA MANUELA ST PHASE 2\r\n', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-09-16 14:25:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(109, 0, 0, '', 'SUNJI AND GOO', '', 'LOT 9 BLK. 3 ARAYAT ST\r\n', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-09-16 14:26:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(110, 0, 0, '', 'IMELDA CHO', '', 'LOT 1 BLK. 7 DON ANGEL ST PHASE 2\r\n', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-09-16 14:27:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(111, 0, 0, '', 'Kim Moung Ho', '', 'Lazatin Phase 2\r\n', '', ' ', NULL, 0, 1, NULL, 0, NULL, '', NULL, '0.00', '2019-10-03 16:50:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', ''),
(112, 0, 0, '', 'VARIOUS CUSTOMERS', '', 'N/A', '', 'N/A', NULL, 0, 1, NULL, 0, NULL, '', 'assets/img/anonymous-icon.png', '0.00', '2019-10-04 11:03:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, NULL, 0, 0, b'0', b'0', b'1', '0.0000', 0, '', '', '1970-01-01', 1, 0, 0, '1970-01-01', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_account_type`
--

CREATE TABLE `customer_account_type` (
  `customer_account_type_id` int(12) NOT NULL,
  `customer_account_type_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_account_type`
--

INSERT INTO `customer_account_type` (`customer_account_type_id`, `customer_account_type_desc`, `is_deleted`, `is_active`) VALUES
(1, 'Individual', b'0', b'1'),
(2, 'Corporation', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_photos`
--

CREATE TABLE `customer_photos` (
  `photo_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT '0',
  `photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_photos`
--

INSERT INTO `customer_photos` (`photo_id`, `customer_id`, `photo_path`) VALUES
(1, 1, 'assets/img/anonymous-icon.png'),
(2, 2, 'assets/img/anonymous-icon.png'),
(3, 3, 'assets/img/anonymous-icon.png'),
(4, 4, 'assets/img/anonymous-icon.png'),
(6, 5, 'assets/img/anonymous-icon.png'),
(7, 6, 'assets/img/anonymous-icon.png'),
(8, 7, 'assets/img/anonymous-icon.png'),
(9, 8, 'assets/img/anonymous-icon.png'),
(10, 9, 'assets/img/anonymous-icon.png'),
(11, 10, 'assets/img/anonymous-icon.png'),
(12, 11, 'assets/img/anonymous-icon.png'),
(13, 12, 'assets/img/anonymous-icon.png'),
(14, 13, 'assets/img/anonymous-icon.png'),
(15, 14, 'assets/img/anonymous-icon.png'),
(17, 15, 'assets/img/anonymous-icon.png'),
(18, 16, 'assets/img/anonymous-icon.png'),
(20, 17, 'assets/img/anonymous-icon.png'),
(21, 18, 'assets/img/anonymous-icon.png'),
(24, 21, 'assets/img/anonymous-icon.png'),
(25, 22, 'assets/img/anonymous-icon.png'),
(26, 23, 'assets/img/anonymous-icon.png'),
(27, 24, 'assets/img/anonymous-icon.png'),
(28, 25, 'assets/img/anonymous-icon.png'),
(30, 27, 'assets/img/anonymous-icon.png'),
(31, 28, 'assets/img/anonymous-icon.png'),
(32, 29, 'assets/img/anonymous-icon.png'),
(33, 30, 'assets/img/anonymous-icon.png'),
(34, 31, 'assets/img/anonymous-icon.png'),
(35, 32, 'assets/img/anonymous-icon.png'),
(36, 33, 'assets/img/anonymous-icon.png'),
(37, 34, 'assets/img/anonymous-icon.png'),
(38, 35, 'assets/img/anonymous-icon.png'),
(39, 36, 'assets/img/anonymous-icon.png'),
(42, 38, 'assets/img/anonymous-icon.png'),
(43, 39, 'assets/img/anonymous-icon.png'),
(44, 40, 'assets/img/anonymous-icon.png'),
(45, 41, 'assets/img/anonymous-icon.png'),
(46, 42, 'assets/img/anonymous-icon.png'),
(47, 43, 'assets/img/anonymous-icon.png'),
(48, 44, 'assets/img/anonymous-icon.png'),
(49, 45, 'assets/img/anonymous-icon.png'),
(50, 46, 'assets/img/anonymous-icon.png'),
(51, 47, 'assets/img/anonymous-icon.png'),
(52, 48, 'assets/img/anonymous-icon.png'),
(53, 49, 'assets/img/anonymous-icon.png'),
(54, 50, 'assets/img/anonymous-icon.png'),
(55, 51, 'assets/img/anonymous-icon.png'),
(56, 52, 'assets/img/anonymous-icon.png'),
(57, 53, 'assets/img/anonymous-icon.png'),
(58, 54, 'assets/img/anonymous-icon.png'),
(59, 55, 'assets/img/anonymous-icon.png'),
(60, 56, 'assets/img/anonymous-icon.png'),
(61, 57, 'assets/img/anonymous-icon.png'),
(62, 58, 'assets/img/anonymous-icon.png'),
(63, 59, 'assets/img/anonymous-icon.png'),
(64, 60, 'assets/img/anonymous-icon.png'),
(65, 61, 'assets/img/anonymous-icon.png'),
(67, 63, 'assets/img/anonymous-icon.png'),
(68, 62, 'assets/img/anonymous-icon.png'),
(69, 64, 'assets/img/anonymous-icon.png'),
(70, 37, 'assets/img/anonymous-icon.png'),
(71, 26, 'assets/img/anonymous-icon.png'),
(72, 20, 'assets/img/anonymous-icon.png'),
(73, 65, 'assets/img/anonymous-icon.png'),
(74, 19, 'assets/img/anonymous-icon.png'),
(75, 66, 'assets/img/anonymous-icon.png'),
(76, 67, 'assets/img/anonymous-icon.png'),
(77, 68, 'assets/img/anonymous-icon.png'),
(78, 69, 'assets/img/anonymous-icon.png'),
(79, 70, 'assets/img/anonymous-icon.png'),
(81, 71, 'assets/img/anonymous-icon.png'),
(82, 72, 'assets/img/anonymous-icon.png'),
(83, 73, 'assets/img/anonymous-icon.png'),
(84, 74, 'assets/img/anonymous-icon.png'),
(85, 75, 'assets/img/anonymous-icon.png'),
(86, 76, 'assets/img/anonymous-icon.png'),
(87, 77, 'assets/img/anonymous-icon.png'),
(88, 78, 'assets/img/anonymous-icon.png'),
(89, 79, 'assets/img/anonymous-icon.png'),
(90, 80, 'assets/img/anonymous-icon.png'),
(91, 81, 'assets/img/anonymous-icon.png'),
(92, 82, 'assets/img/anonymous-icon.png'),
(93, 83, 'assets/img/anonymous-icon.png'),
(94, 84, 'assets/img/anonymous-icon.png'),
(95, 85, 'assets/img/anonymous-icon.png'),
(96, 86, 'assets/img/anonymous-icon.png'),
(97, 87, 'assets/img/anonymous-icon.png'),
(98, 88, 'assets/img/anonymous-icon.png'),
(99, 89, 'assets/img/anonymous-icon.png'),
(100, 90, 'assets/img/anonymous-icon.png'),
(101, 91, 'assets/img/anonymous-icon.png'),
(102, 92, 'assets/img/anonymous-icon.png'),
(103, 93, 'assets/img/anonymous-icon.png'),
(104, 94, 'assets/img/anonymous-icon.png'),
(105, 95, 'assets/img/anonymous-icon.png'),
(106, 96, 'assets/img/anonymous-icon.png'),
(107, 97, 'assets/img/anonymous-icon.png'),
(108, 98, 'assets/img/anonymous-icon.png'),
(109, 99, 'assets/img/anonymous-icon.png'),
(110, 100, 'assets/img/anonymous-icon.png'),
(111, 101, 'assets/img/anonymous-icon.png'),
(112, 102, 'assets/img/anonymous-icon.png'),
(113, 103, 'assets/img/anonymous-icon.png'),
(114, 104, 'assets/img/anonymous-icon.png'),
(115, 105, 'assets/img/anonymous-icon.png'),
(116, 106, 'assets/img/anonymous-icon.png'),
(117, 107, 'assets/img/anonymous-icon.png'),
(118, 108, 'assets/img/anonymous-icon.png'),
(119, 109, 'assets/img/anonymous-icon.png'),
(120, 110, 'assets/img/anonymous-icon.png'),
(121, 111, 'assets/img/anonymous-icon.png'),
(122, 112, 'assets/img/anonymous-icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `customer_type_id` bigint(20) NOT NULL,
  `customer_type_name` varchar(145) DEFAULT NULL,
  `customer_type_description` varchar(145) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`customer_type_id`, `customer_type_name`, `customer_type_description`, `is_active`, `is_deleted`) VALUES
(1, 'Wholesaler', 'Wholesaler', b'1', b'0'),
(2, 'Dealer', 'Dealer', b'1', b'0'),
(3, 'Distributor', 'Distributor', b'1', b'0'),
(4, 'Reseller', 'Reseller', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_invoice`
--

CREATE TABLE `delivery_invoice` (
  `dr_invoice_id` bigint(20) NOT NULL,
  `dr_invoice_no` varchar(75) DEFAULT '',
  `purchase_order_id` int(11) DEFAULT '0',
  `external_ref_no` varchar(75) DEFAULT '',
  `contact_person` varchar(155) DEFAULT '',
  `terms` varchar(55) DEFAULT '',
  `duration` varchar(75) DEFAULT '',
  `supplier_id` int(11) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `tax_type_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `remarks` varchar(555) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) NOT NULL,
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `date_due` date DEFAULT '0000-00-00',
  `date_delivered` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `batch_no` varchar(50) DEFAULT NULL,
  `closing_reason` varchar(445) DEFAULT '',
  `closed_by_user` bigint(20) DEFAULT '0',
  `is_closed` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_invoice_items`
--

CREATE TABLE `delivery_invoice_items` (
  `dr_invoice_item_id` bigint(20) NOT NULL,
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `dr_qty` decimal(20,2) DEFAULT '0.00',
  `dr_discount` decimal(20,4) DEFAULT '0.0000',
  `dr_price` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `dr_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `dr_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `dr_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` bigint(20) NOT NULL,
  `department_code` varchar(20) DEFAULT '',
  `department_name` varchar(255) DEFAULT '',
  `department_desc` varchar(255) DEFAULT '',
  `delivery_address` varchar(755) DEFAULT '',
  `default_cost` tinyint(4) DEFAULT '1' COMMENT '1=Purchase Cost 1, 2=Purchase Cost 2',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_code`, `department_name`, `department_desc`, `delivery_address`, `default_cost`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
(1, '', 'Admin', '', '', 1, '2019-07-15 12:05:02', '0000-00-00 00:00:00', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `depreciation_expense`
--

CREATE TABLE `depreciation_expense` (
  `de_id` bigint(20) NOT NULL,
  `de_date` date NOT NULL,
  `de_expense_total` decimal(20,4) NOT NULL,
  `de_remarks` text NOT NULL,
  `de_ref_no` varchar(75) NOT NULL,
  `date_posted` date NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_journal_posted` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disconnection_reason`
--

CREATE TABLE `disconnection_reason` (
  `disconnection_reason_id` int(12) NOT NULL,
  `reason_desc` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disconnection_reason`
--

INSERT INTO `disconnection_reason` (`disconnection_reason_id`, `reason_desc`, `is_active`, `is_deleted`) VALUES
(1, 'Automatic Disconnection', b'1', b'0'),
(2, 'Owners Discretion', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` bigint(100) NOT NULL,
  `discount_code` bigint(100) DEFAULT NULL,
  `discount_type` varchar(200) DEFAULT NULL,
  `discount_desc` varchar(200) DEFAULT NULL,
  `discount_percent` bigint(100) DEFAULT NULL,
  `discount_amount` bigint(100) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispatching_invoice`
--

CREATE TABLE `dispatching_invoice` (
  `dispatching_invoice_id` bigint(20) NOT NULL,
  `dispatching_inv_no` varchar(75) DEFAULT '',
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `sales_inv_no` varchar(245) DEFAULT '',
  `cash_invoice_id` bigint(20) DEFAULT '0',
  `cash_inv_no` varchar(245) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispatching_invoice_items`
--

CREATE TABLE `dispatching_invoice_items` (
  `dispatching_item_id` bigint(20) NOT NULL,
  `dispatching_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `email_id` int(11) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email_from` varchar(150) NOT NULL,
  `name_from` varchar(50) NOT NULL,
  `default_message` varchar(500) NOT NULL,
  `email_to` varchar(175) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`email_id`, `email_address`, `password`, `email_from`, `name_from`, `default_message`, `email_to`) VALUES
(1, 'example@gmail.com', 'example', '', 'JDEV IT BUSINESS SOLUTION', 'This is the Default message from the Accounting System of JDEV Office Solutions', NULL),
(2, 'example@gmail.com', 'example', '', 'JDEV OFFICE SOLUTION INC', 'This is a system generation report sent to you from the Accounting System of JDEV Office Solution Inc.', 'example@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets`
--

CREATE TABLE `fixed_assets` (
  `fixed_asset_id` bigint(20) NOT NULL,
  `asset_code` varchar(55) DEFAULT '',
  `asset_description` varchar(555) DEFAULT '',
  `serial_no` varchar(155) DEFAULT '',
  `location_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `acquisition_cost` decimal(20,4) DEFAULT '0.0000',
  `salvage_value` decimal(20,4) DEFAULT '0.0000',
  `life_years` int(11) DEFAULT '0',
  `asset_status_id` int(11) DEFAULT '0',
  `date_acquired` date DEFAULT '0000-00-00',
  `remarks` varchar(1000) DEFAULT NULL,
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form_2307`
--

CREATE TABLE `form_2307` (
  `form_2307_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) DEFAULT '0',
  `supplier_id` bigint(20) DEFAULT '0',
  `txn_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT '0000-00-00',
  `payee_tin` varchar(145) DEFAULT NULL,
  `payee_name` varchar(245) DEFAULT NULL,
  `payee_address` varchar(445) DEFAULT NULL,
  `payor_name` varchar(245) DEFAULT NULL,
  `payor_tin` varchar(145) DEFAULT NULL,
  `payor_address` varchar(445) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `gross_amount` decimal(20,2) DEFAULT '0.00',
  `deducted_amount` decimal(20,2) DEFAULT '0.00',
  `date_created` date DEFAULT '0000-00-00',
  `created_by_user` bigint(20) DEFAULT '0',
  `date_deleted` date DEFAULT '0000-00-00',
  `deleted_by_user` bigint(20) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `atc` varchar(255) DEFAULT NULL,
  `remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form_2551m`
--

CREATE TABLE `form_2551m` (
  `form_2551m_id` bigint(20) NOT NULL,
  `date` date DEFAULT '0000-00-00',
  `payor_tin` varchar(255) DEFAULT NULL,
  `payor_name` varchar(255) DEFAULT NULL,
  `payor_address` varchar(255) DEFAULT NULL,
  `rdo_no` varchar(255) DEFAULT NULL,
  `nature_of_business` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `month_id` int(11) DEFAULT '0',
  `year` bigint(20) DEFAULT '0',
  `taxable_amount` decimal(20,5) DEFAULT '0.00000',
  `tax_rate` decimal(20,5) DEFAULT '0.00000',
  `tax_due` decimal(20,5) DEFAULT '0.00000',
  `industry_classification` varchar(255) DEFAULT NULL,
  `atc` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT '0000-00-00',
  `date_modified` date DEFAULT '0000-00-00',
  `date_deleted` date DEFAULT '0000-00-00',
  `created_by_user` int(12) DEFAULT '0',
  `modified_by_user` int(12) DEFAULT '0',
  `deleted_by_user` int(12) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generics`
--

CREATE TABLE `generics` (
  `generic_id` bigint(20) NOT NULL,
  `generic_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `giftcards`
--

CREATE TABLE `giftcards` (
  `giftcard_id` bigint(20) NOT NULL,
  `giftcard_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_items`
--

CREATE TABLE `hotel_items` (
  `hotel_items_id` int(11) NOT NULL,
  `item_type` varchar(45) DEFAULT NULL,
  `department_id` bigint(45) DEFAULT '0',
  `sales_date` datetime DEFAULT '0000-00-00 00:00:00',
  `shift` varchar(45) DEFAULT '0',
  `adv_cash` decimal(20,5) DEFAULT '0.00000',
  `adv_check` decimal(20,5) DEFAULT '0.00000',
  `adv_card` decimal(20,5) DEFAULT '0.00000',
  `adv_charge` decimal(20,5) DEFAULT '0.00000',
  `adv_bank` decimal(20,5) DEFAULT '0.00000',
  `cash_amount` decimal(20,5) DEFAULT '0.00000',
  `check_amount` decimal(20,5) DEFAULT '0.00000',
  `card_amount` decimal(20,5) DEFAULT '0.00000',
  `charge_amount` decimal(20,5) DEFAULT '0.00000',
  `bank_amount` decimal(20,5) DEFAULT '0.00000',
  `room_sales` decimal(20,5) DEFAULT '0.00000',
  `bar_sales` decimal(20,5) DEFAULT '0.00000',
  `other_sales` decimal(20,5) DEFAULT '0.00000',
  `advance_sales` decimal(20,5) DEFAULT '0.00000',
  `is_posted` tinyint(1) DEFAULT '0',
  `posted_by` bigint(20) DEFAULT '0',
  `posted_date` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id` bigint(20) DEFAULT '0',
  `file_path` varchar(245) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_items`
--

INSERT INTO `hotel_items` (`hotel_items_id`, `item_type`, `department_id`, `sales_date`, `shift`, `adv_cash`, `adv_check`, `adv_card`, `adv_charge`, `adv_bank`, `cash_amount`, `check_amount`, `card_amount`, `charge_amount`, `bank_amount`, `room_sales`, `bar_sales`, `other_sales`, `advance_sales`, `is_posted`, `posted_by`, `posted_date`, `journal_id`, `file_path`) VALUES
(1, 'ADV', 2, '2018-03-20 00:00:00', '06 AM - 02 PM', '8700.00000', '2250.00000', '1000.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '11950.00000', 0, 0, '0000-00-00 00:00:00', 0, 'POLV-03202018.jdev'),
(2, 'ADV', 2, '2018-04-17 00:00:00', '06 AM - 02 PM', '10700.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '10700.00000', 1, 1, '2018-04-17 11:11:27', 1, 'POLV-04172018.jdev'),
(3, 'COUT', 2, '2018-04-17 00:00:00', '06 AM - 02 PM', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '1700.00000', '0.00000', '0.00000', '1700.00000', 1, 1, '2018-04-17 11:11:39', 3, 'POLV-04172018.jdev'),
(4, 'REV', 2, '2018-04-17 00:00:00', '06 AM - 02 PM', '1700.00000', '0.00000', '0.00000', '0.00000', '0.00000', '1700.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', 1, 1, '2018-04-17 11:11:32', 2, 'POLV-04172018.jdev');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_settings`
--

CREATE TABLE `hotel_settings` (
  `hotel_settings_id` int(11) NOT NULL,
  `adv_cash_id` bigint(20) DEFAULT '0',
  `adv_check_id` bigint(20) DEFAULT '0',
  `adv_card_id` bigint(20) DEFAULT '0',
  `adv_charge_id` bigint(20) DEFAULT '0',
  `adv_bank_id` bigint(20) DEFAULT '0',
  `cash_id` bigint(20) DEFAULT '0',
  `check_id` bigint(20) DEFAULT '0',
  `card_id` bigint(20) DEFAULT '0',
  `charge_id` bigint(20) DEFAULT '0',
  `bank_id` bigint(20) DEFAULT '0',
  `room_sales_id` bigint(20) DEFAULT '0',
  `bar_sales_id` bigint(20) DEFAULT '0',
  `other_sales_id` bigint(20) DEFAULT '0',
  `adv_sales_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_settings`
--

INSERT INTO `hotel_settings` (`hotel_settings_id`, `adv_cash_id`, `adv_check_id`, `adv_card_id`, `adv_charge_id`, `adv_bank_id`, `cash_id`, `check_id`, `card_id`, `charge_id`, `bank_id`, `room_sales_id`, `bar_sales_id`, `other_sales_id`, `adv_sales_id`, `customer_id`) VALUES
(2, 51, 51, 52, 50, 25, 4, 33, 50, 49, 52, 17, 19, 37, 38, 17),
(3, 1, 1, 1, 1, 1, 1, 2, 1, 5, 2, 1, 1, 1, 1, 5),
(4, NULL, NULL, NULL, NULL, NULL, 1, 2, 1, 5, 2, 1, 1, 1, NULL, 3),
(5, NULL, NULL, NULL, NULL, NULL, 1, 2, 1, 5, 2, 1, 1, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `initial_setup`
--

CREATE TABLE `initial_setup` (
  `initial_setup_id` int(11) NOT NULL,
  `setup_company_info` bit(1) DEFAULT NULL,
  `setup_general_configuration` bit(1) DEFAULT NULL,
  `setup_user_account` bit(1) DEFAULT NULL,
  `setup_complete` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `initial_setup`
--

INSERT INTO `initial_setup` (`initial_setup_id`, `setup_company_info`, `setup_general_configuration`, `setup_user_account`, `setup_complete`) VALUES
(1, b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_counter`
--

CREATE TABLE `invoice_counter` (
  `counter_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `counter_start` bigint(20) DEFAULT '0',
  `counter_end` bigint(20) DEFAULT '0',
  `last_invoice` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuance_department_info`
--

CREATE TABLE `issuance_department_info` (
  `issuance_department_id` bigint(20) NOT NULL,
  `trn_no` varchar(75) DEFAULT '',
  `to_department_id` bigint(20) DEFAULT '0',
  `from_department_id` bigint(20) DEFAULT '0',
  `date_issued` date DEFAULT '0000-00-00',
  `terms` varchar(50) DEFAULT NULL,
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted_from` bit(1) DEFAULT b'0',
  `posted_by_from` int(11) DEFAULT '0',
  `date_posted_from` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id_from` bigint(20) DEFAULT '0',
  `is_journal_posted_to` bit(1) DEFAULT b'0',
  `posted_by_to` int(11) DEFAULT '0',
  `date_posted_to` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id_to` bigint(20) DEFAULT '0',
  `closing_reason_from` varchar(445) DEFAULT '',
  `closed_by_user_from` bigint(20) DEFAULT '0',
  `is_closed_from` bit(1) DEFAULT b'0',
  `closing_reason_to` varchar(445) DEFAULT '',
  `closed_by_user_to` bigint(20) DEFAULT '0',
  `is_closed_to` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuance_department_items`
--

CREATE TABLE `issuance_department_items` (
  `issuance_department_item_id` bigint(20) NOT NULL,
  `issuance_department_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `issue_qty` decimal(20,2) DEFAULT '0.00',
  `issue_price` decimal(20,2) DEFAULT '0.00',
  `issue_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_rate` decimal(11,2) DEFAULT '0.00',
  `issue_line_total_price` decimal(20,2) DEFAULT '0.00',
  `issue_line_total_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_amount` decimal(20,2) DEFAULT '0.00',
  `issue_non_tax_amount` decimal(20,2) DEFAULT '0.00',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuance_info`
--

CREATE TABLE `issuance_info` (
  `issuance_id` bigint(20) NOT NULL,
  `slip_no` varchar(75) DEFAULT '',
  `issued_department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `issued_to_person` varchar(155) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `date_issued` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `terms` varchar(50) DEFAULT NULL,
  `is_for_pos` bit(1) DEFAULT b'0',
  `is_received` bit(1) DEFAULT b'0',
  `is_journal_posted` tinyint(1) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_info`
--

INSERT INTO `issuance_info` (`issuance_id`, `slip_no`, `issued_department_id`, `remarks`, `issued_to_person`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `date_issued`, `date_created`, `date_modified`, `date_deleted`, `modified_by_user`, `posted_by_user`, `deleted_by_user`, `is_active`, `is_deleted`, `customer_id`, `address`, `terms`, `is_for_pos`, `is_received`, `is_journal_posted`, `journal_id`) VALUES
(1, 'SLP-20180529-1', 4, '', '', '0.00', '3571.42', '428.58', '4000.00', '2018-05-29', '2018-05-29 16:37:54', '2018-05-29 08:38:40', '0000-00-00 00:00:00', 1, 1, 0, b'1', b'0', NULL, NULL, '12', b'0', b'0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `issuance_items`
--

CREATE TABLE `issuance_items` (
  `issuance_item_id` bigint(20) NOT NULL,
  `issuance_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `issue_qty` decimal(20,2) DEFAULT '0.00',
  `issue_price` decimal(20,2) DEFAULT '0.00',
  `issue_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_rate` decimal(11,2) DEFAULT '0.00',
  `issue_line_total_price` decimal(20,2) DEFAULT '0.00',
  `issue_line_total_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_amount` decimal(20,2) DEFAULT '0.00',
  `issue_non_tax_amount` decimal(20,2) DEFAULT '0.00',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_items`
--

INSERT INTO `issuance_items` (`issuance_item_id`, `issuance_id`, `product_id`, `is_parent`, `unit_id`, `issue_qty`, `issue_price`, `issue_discount`, `issue_tax_rate`, `issue_line_total_price`, `issue_line_total_discount`, `issue_tax_amount`, `issue_non_tax_amount`, `dr_invoice_id`, `exp_date`, `batch_no`) VALUES
(5, 1, 12, 1, 5, '1.00', '2000.00', '0.00', '12.00', '2000.00', '0.00', '214.29', '1785.71', 0, '0000-00-00', ''),
(6, 1, 12, 1, 5, '1.00', '2000.00', '0.00', '12.00', '2000.00', '0.00', '214.29', '1785.71', 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE `item_types` (
  `item_type_id` int(11) NOT NULL,
  `item_type_code` varchar(20) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`item_type_id`, `item_type_code`, `item_type`, `description`, `is_active`, `is_deleted`) VALUES
(1, 'IP', 'Inventory', '', b'1', b'0'),
(2, 'NP', 'Non-inventory', '', b'1', b'0'),
(3, 'CP', 'Services', '', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `journal_accounts`
--

CREATE TABLE `journal_accounts` (
  `journal_account_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `memo` varchar(700) DEFAULT '',
  `dr_amount` decimal(25,2) DEFAULT '0.00',
  `cr_amount` decimal(25,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry_templates`
--

CREATE TABLE `journal_entry_templates` (
  `entry_template_id` bigint(20) NOT NULL,
  `template_id` bigint(20) DEFAULT '0',
  `account_id` bigint(20) DEFAULT '0',
  `memo` varchar(1000) DEFAULT '',
  `dr_amount` decimal(20,4) DEFAULT '0.0000',
  `cr_amount` decimal(20,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_info`
--

CREATE TABLE `journal_info` (
  `journal_id` bigint(20) NOT NULL,
  `txn_no` varchar(55) DEFAULT '',
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `remarks` varchar(555) DEFAULT '',
  `book_type` varchar(20) DEFAULT '',
  `date_txn` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` int(11) DEFAULT '0',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `payment_method_id` int(11) DEFAULT '0',
  `bank` varchar(10) DEFAULT '',
  `check_no` varchar(20) DEFAULT '',
  `check_date` date DEFAULT '0000-00-00',
  `ref_type` varchar(4) DEFAULT '',
  `ref_no` varchar(25) DEFAULT '',
  `amount` decimal(10,2) DEFAULT '0.00',
  `or_no` varchar(50) DEFAULT '',
  `check_status` tinyint(4) DEFAULT '0',
  `accounting_period_id` bigint(20) DEFAULT '0',
  `is_replenished` tinyint(1) DEFAULT '0',
  `batch_id` int(11) DEFAULT '0',
  `bank_id` int(11) DEFAULT '0',
  `is_reconciled` tinyint(4) DEFAULT '0',
  `is_sales` tinyint(4) DEFAULT '0',
  `pos_integration_id` bigint(20) DEFAULT '0',
  `hotel_integration_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_templates_info`
--

CREATE TABLE `journal_templates_info` (
  `template_id` bigint(20) NOT NULL,
  `template_code` varchar(155) DEFAULT '',
  `payee` varchar(1000) DEFAULT '',
  `template_description` varchar(1000) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `method_id` bigint(20) DEFAULT '0',
  `amount` decimal(20,4) DEFAULT '0.0000',
  `remarks` varchar(1000) DEFAULT '',
  `posted_by` int(11) DEFAULT NULL,
  `book_type` varchar(5) DEFAULT '',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` bigint(20) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_commercial`
--

CREATE TABLE `matrix_commercial` (
  `matrix_commercial_id` int(11) NOT NULL,
  `description` varchar(145) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `other_details` varchar(445) DEFAULT '',
  `matrix_commercial_code` varchar(445) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matrix_commercial`
--

INSERT INTO `matrix_commercial` (`matrix_commercial_id`, `description`, `is_active`, `is_deleted`, `other_details`, `matrix_commercial_code`) VALUES
(1, 'Commercial Fare Matrix 2019', b'1', b'0', 'Commercial Fare Matrix 2019', 'MATRIX-COMM-2019-1');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_commercial_items`
--

CREATE TABLE `matrix_commercial_items` (
  `matrix_commercial_item_id` int(11) NOT NULL,
  `matrix_commercial_id` int(11) DEFAULT '0',
  `matrix_commercial_from` int(11) DEFAULT '0',
  `matrix_commercial_to` int(11) DEFAULT '0',
  `matrix_commercial_amount` decimal(20,2) DEFAULT '0.00',
  `is_fixed_amount` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matrix_commercial_items`
--

INSERT INTO `matrix_commercial_items` (`matrix_commercial_item_id`, `matrix_commercial_id`, `matrix_commercial_from`, `matrix_commercial_to`, `matrix_commercial_amount`, `is_fixed_amount`) VALUES
(1, 1, 0, 10, '200.00', b'1'),
(2, 1, 11, 20, '20.50', b'0'),
(3, 1, 21, 30, '20.75', b'0'),
(4, 1, 31, 40, '30.00', b'0'),
(5, 1, 41, 50, '30.50', b'0'),
(6, 1, 51, 1000, '31.00', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_residential`
--

CREATE TABLE `matrix_residential` (
  `matrix_residential_id` int(11) NOT NULL,
  `description` varchar(145) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `other_details` varchar(445) DEFAULT '',
  `matrix_residential_code` varchar(445) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matrix_residential`
--

INSERT INTO `matrix_residential` (`matrix_residential_id`, `description`, `is_active`, `is_deleted`, `other_details`, `matrix_residential_code`) VALUES
(1, 'Residential Fare Matrix 2019', b'1', b'0', 'Residential Fare Matrix 2019', 'MATRIX-RESI-2019-1');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_residential_items`
--

CREATE TABLE `matrix_residential_items` (
  `matrix_residential_item_id` int(11) NOT NULL,
  `matrix_residential_id` int(11) DEFAULT '0',
  `matrix_residential_from` int(11) DEFAULT '0',
  `matrix_residential_to` int(11) DEFAULT '0',
  `matrix_residential_amount` decimal(20,2) DEFAULT '0.00',
  `is_fixed_amount` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matrix_residential_items`
--

INSERT INTO `matrix_residential_items` (`matrix_residential_item_id`, `matrix_residential_id`, `matrix_residential_from`, `matrix_residential_to`, `matrix_residential_amount`, `is_fixed_amount`) VALUES
(19, 1, 0, 10, '200.00', b'1'),
(20, 1, 11, 20, '20.50', b'0'),
(21, 1, 21, 30, '20.75', b'0'),
(22, 1, 31, 40, '30.00', b'0'),
(23, 1, 41, 50, '30.50', b'0'),
(24, 1, 51, 1000, '31.00', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meter_inventory`
--

CREATE TABLE `meter_inventory` (
  `meter_inventory_id` int(12) NOT NULL,
  `meter_code` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `meter_description` text,
  `created_by` int(12) DEFAULT '0',
  `modified_by` int(12) DEFAULT '0',
  `date_created` date DEFAULT '0000-00-00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `meter_status_id` tinyint(1) DEFAULT '2',
  `is_new` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_inventory`
--

INSERT INTO `meter_inventory` (`meter_inventory_id`, `meter_code`, `serial_no`, `meter_description`, `created_by`, `modified_by`, `date_created`, `is_deleted`, `is_active`, `meter_status_id`, `is_new`) VALUES
(1, 'MC-20190611-1', '0619418', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(2, 'MC-20190611-2', '0619414', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(3, 'MC-20190611-3', '0700534', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(4, 'MC-20190611-4', '0619419', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(5, 'MC-20190611-5', '0701377', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(6, 'MC-20190611-6', '0700529', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(7, 'MC-20190611-7', '0720573', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(8, 'MC-20190611-8', '0720418', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(9, 'MC-20190611-9', '0720564', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(10, 'MC-20190611-10', '0720561', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(11, 'MC-20190611-11', '0720568', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(12, 'MC-20190611-12', '0720420', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(13, 'MC-20190611-13', '0720419', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(14, 'MC-20190611-14', '0720566', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(15, 'MC-20190611-15', '0700527', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(16, 'MC-20190611-16', '0700540', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(17, 'MC-20190611-17', '0700521', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(18, 'MC-20190611-18', '0700523', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(19, 'MC-20190611-19', '0720569', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(20, 'MC-20190611-20', '0720562', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(21, 'MC-20190611-21', '0720565', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(22, 'MC-20190611-22', '0619416', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(23, 'MC-20190611-23', '0619420', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(24, 'MC-20190611-24', '0700522', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(25, 'MC-20190611-25', '0619411', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(26, 'MC-20190611-26', '0619413', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(27, 'MC-20190611-27', '0700535', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(28, 'MC-20190611-28', '0619412', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(29, 'MC-20190611-29', '0720570', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(30, 'MC-20190611-30', '0700526', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(31, 'MC-20190611-31', '0720567', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(32, 'MC-20190611-32', '0700532', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(33, 'MC-20190611-33', '0700528', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(34, 'MC-20190611-34', '0700539', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(35, 'MC-20190611-35', '0700536', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(36, 'MC-20190611-36', '0701379', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(37, 'MC-20190611-37', '0700530', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(38, 'MC-20190611-38', '0700531', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(39, 'MC-20190611-39', '0700538', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(40, 'MC-20190611-40', '0700533', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(41, 'MC-20190611-41', '0700524', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(42, 'MC-20190611-42', '0700537', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(43, 'MC-20190611-43', '0720575', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(44, 'MC-20190611-44', '0720417', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(45, 'MC-20190611-45', '0700525', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(46, 'MC-20190611-46', '1234567', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(47, 'MC-20190611-47', '0720580', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(48, 'MC-20190611-48', '0720572', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(49, 'MC-20190611-49', '0720574', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(50, 'MC-20190611-50', '0720578', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(51, 'MC-20190611-51', '0701376', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(52, 'MC-20190611-52', '0619417', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(53, 'MC-20190611-53', '0720576', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(54, 'MC-20190611-54', '0720579', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(55, 'MC-20190611-55', '0720571', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(56, 'MC-20190611-56', '0720577', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(57, 'MC-20190611-57', '0701380', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(58, 'MC-20190611-58', '0836331', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(59, 'MC-20190611-59', '0836334', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(60, 'MC-20190611-60', '0619415', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(61, 'MC-20190611-61', '0836332', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(62, 'MC-20190611-62', '0836333', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(63, 'MC-20190611-63', '0836335', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(64, 'MC-20190611-64', '0836336', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(65, 'MC-20190611-65', '0836211', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(66, 'MC-20190611-66', '0836212', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(67, 'MC-20190611-67', '0836213', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(68, 'MC-20190611-68', '0836337', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(69, 'MC-20190611-69', '0836214', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(70, 'MC-20190611-70', '0836215', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(71, 'MC-20190611-71', '0836216', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(72, 'MC-20190611-72', '0836217', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(73, 'MC-20190611-73', '0836338', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(74, 'MC-20190611-74', '0836339', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(75, 'MC-20190611-75', '0836340', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(76, 'MC-20190611-76', '0836224', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(77, 'MC-20190611-77', '0836222', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(78, 'MC-20190611-78', '0836225', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(79, 'MC-20190611-79', '0836218', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(80, 'MC-20190611-80', '0836221', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(81, 'MC-20190611-81', '0836230', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(82, 'MC-20190611-82', '0836227', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(83, 'MC-20190611-83', '0836228', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(84, 'MC-20190611-84', '0836229', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(85, 'MC-20190611-85', '0836226', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(86, 'MC-20190611-86', '0836391', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(87, 'MC-20190611-87', '0836219', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(88, 'MC-20190611-88', '0836283', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(89, 'MC-20190611-89', '0836282', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(90, 'MC-20190611-90', '0836281', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(91, 'MC-20190611-91', '0836284', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(92, 'MC-20190611-92', '0836285', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(93, 'MC-20190611-93', '0836290', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(94, 'MC-20190611-94', '1104921', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(95, 'MC-20190611-95', '0836286', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(96, 'MC-20190611-96', '1104923', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(97, 'MC-20190611-97', '0836220', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(98, 'MC-20190611-98', '0836287', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(99, 'MC-20190611-99', '0836288', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(100, 'MC-20190611-100', '0836289', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(101, 'MC-20190611-101', '0836392', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(102, 'MC-20190611-102', '0836393', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(103, 'MC-20190611-103', '1104929', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(104, 'MC-20190611-104', '0836394', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(105, 'MC-20190611-105', '0836397', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(106, 'MC-20190611-106', '0836400', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(107, 'MC-20190611-107', '0836395', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(108, 'MC-20190611-108', '0836396', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(109, 'MC-20190611-109', '0836398', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(110, 'MC-20190611-110', '0836399', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(111, 'MC-20190611-111', '1104922', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(112, 'MC-20190611-112', '1104924', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(113, 'MC-20190611-113', '1104926', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(114, 'MC-20190611-114', '1104831', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(115, 'MC-20190611-115', '1104832', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(116, 'MC-20190611-116', '1104927', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(117, 'MC-20190611-117', '1104928', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(118, 'MC-20190611-118', '1104930', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(119, 'MC-20190611-119', '1104833', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(120, 'MC-20190611-120', '1104834', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(121, 'MC-20190611-121', '1104835', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(122, 'MC-20190611-122', '1104836', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(123, 'MC-20190611-123', '1104837', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(124, 'MC-20190611-124', '1104838', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(125, 'MC-20190611-125', '1104839', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(126, 'MC-20190611-126', '1105031', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(127, 'MC-20190611-127', '1104840', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(128, 'MC-20190611-128', '1105032', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(129, 'MC-20190611-129', '1105033', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(130, 'MC-20190611-130', '1105034', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(131, 'MC-20190611-131', '1105035', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(132, 'MC-20190611-132', '1105036', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(133, 'MC-20190611-133', '1105039', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(134, 'MC-20190611-134', '1104925', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(135, 'MC-20190611-135', '1105040', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(136, 'MC-20190611-136', '1105052', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(137, 'MC-20190611-137', '1105053', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(138, 'MC-20190611-138', '1105054', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(139, 'MC-20190611-139', '1105055', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(140, 'MC-20190611-140', '1105056', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(141, 'MC-20190611-141', '1105057', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(142, 'MC-20190611-142', '1105058', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(143, 'MC-20190611-143', '1105059', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(144, 'MC-20190611-144', '1105051', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(145, 'MC-20190611-145', '1105141', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(146, 'MC-20190611-146', '1105142', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(147, 'MC-20190611-147', '1105143', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(148, 'MC-20190611-148', '1105144', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(149, 'MC-20190611-149', '1105145', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(150, 'MC-20190611-150', '1105146', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(151, 'MC-20190611-151', '1105147', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(152, 'MC-20190611-152', '1105148', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(153, 'MC-20190611-153', '1105149', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(154, 'MC-20190611-154', '1105150', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(155, 'MC-20190611-155', '140922', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(156, 'MC-20190611-156', '140812', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(157, 'MC-20190611-157', '46902', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(158, 'MC-20190611-158', '140920', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(159, 'MC-20190611-159', '140926', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(160, 'MC-20190611-160', '140929', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(161, 'MC-20190611-161', '140927', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(162, 'MC-20190611-162', '140771', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(163, 'MC-20190611-163', '140850', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(164, 'MC-20190611-164', '140762', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(165, 'MC-20190611-165', '140868', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(166, 'MC-20190611-166', '140768', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(167, 'MC-20190611-167', '140809', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(168, 'MC-20190611-168', '140872', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(169, 'MC-20190611-169', '140811', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(170, 'MC-20190611-170', '140847', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(171, 'MC-20190611-171', '140810', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(172, 'MC-20190611-172', '46860', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(173, 'MC-20190611-173', '46858', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(174, 'MC-20190611-174', '46910', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(175, 'MC-20190611-175', '46906', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(176, 'MC-20190611-176', '46901', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(177, 'MC-20190611-177', '46070', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(178, 'MC-20190611-178', '46069', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(179, 'MC-20190611-179', '46062', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(180, 'MC-20190611-180', '46061', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(181, 'MC-20190611-181', '46066', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(182, 'MC-20190611-182', '46903', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(183, 'MC-20190611-183', '46904', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(184, 'MC-20190611-184', '46905', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(185, 'MC-20190611-185', '46907', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(186, 'MC-20190611-186', '46908', '', 1, 0, '2019-06-19', b'0', b'1', 2, 1),
(187, 'MC-20190611-187', '46909', '', 1, 0, '2019-06-19', b'0', b'1', 1, 0),
(188, 'MC-20190916-188', '46068', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(189, 'MC-20190916-189', '46067', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(190, 'MC-20190916-190', '46065', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(191, 'MC-20190916-191', '46064', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(192, 'MC-20190916-192', '46063', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(193, 'MC-20190916-193', '46857', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(194, 'MC-20190916-194', '46854', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(195, 'MC-20190916-195', '140845', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(196, 'MC-20190916-196', '140866', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(197, 'MC-20190916-197', '140854', '', 3, 0, '2019-09-16', b'0', b'1', 1, 0),
(198, 'MC-20191003-198', '46851', '', 3, 0, '2019-10-03', b'0', b'1', 1, 0),
(199, 'MC-20191003-199', '19858', '', 3, 0, '2019-10-03', b'0', b'1', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meter_reading_input`
--

CREATE TABLE `meter_reading_input` (
  `meter_reading_input_id` bigint(20) NOT NULL,
  `meter_reading_period_id` bigint(20) DEFAULT '0',
  `batch_no` varchar(145) DEFAULT '',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_input` date DEFAULT '0000-00-00',
  `posted_by_user` bigint(20) DEFAULT '0',
  `remarks` varchar(445) DEFAULT '',
  `is_processed` bit(1) DEFAULT b'0',
  `is_sent` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `batch_total_amount` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_reading_input`
--

INSERT INTO `meter_reading_input` (`meter_reading_input_id`, `meter_reading_period_id`, `batch_no`, `is_deleted`, `is_active`, `date_created`, `date_input`, `posted_by_user`, `remarks`, `is_processed`, `is_sent`, `is_journal_posted`, `journal_id`, `batch_total_amount`) VALUES
(1, 10, 'BCH-201910-1', b'0', b'1', '2019-11-05 14:30:18', '2019-10-01', 1, '15021 - 15046', b'1', b'1', b'0', 0, '26616.05'),
(2, 10, 'BCH-201910-2', b'0', b'1', '2019-11-05 14:35:20', '2019-11-05', 1, '15047 - 15071', b'1', b'1', b'0', 0, '19598.45'),
(3, 10, 'BCH-201910-3', b'0', b'1', '2019-11-05 14:42:14', '2019-10-01', 1, '15072 - 15098', b'1', b'1', b'0', 0, '36863.60'),
(4, 10, 'BCH-201910-4', b'0', b'1', '2019-11-05 14:47:14', '2019-10-01', 1, '15099 - 15125', b'1', b'1', b'0', 0, '16202.50'),
(5, 10, 'BCH-201910-5', b'0', b'1', '2019-11-05 14:52:13', '2019-10-01', 1, '15126 - 15152', b'1', b'1', b'0', 0, '28402.51'),
(6, 10, 'BCH-201910-6', b'0', b'1', '2019-11-05 15:00:27', '2019-10-01', 1, '15153 - 15179', b'1', b'1', b'0', 0, '22948.19'),
(7, 10, 'BCH-201910-7', b'0', b'1', '2019-11-05 15:06:38', '2019-10-01', 1, '15180 - 15202', b'1', b'1', b'0', 0, '23664.65');

-- --------------------------------------------------------

--
-- Table structure for table `meter_reading_input_items`
--

CREATE TABLE `meter_reading_input_items` (
  `meter_reading_input_item_id` bigint(20) NOT NULL,
  `meter_reading_input_id` bigint(20) DEFAULT '0',
  `connection_id` bigint(20) DEFAULT '0',
  `previous_reading` bigint(20) DEFAULT '0',
  `current_reading` bigint(20) DEFAULT '0',
  `total_consumption` bigint(20) DEFAULT '0',
  `previous_month` varchar(245) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_reading_input_items`
--

INSERT INTO `meter_reading_input_items` (`meter_reading_input_item_id`, `meter_reading_input_id`, `connection_id`, `previous_reading`, `current_reading`, `total_consumption`, `previous_month`) VALUES
(1, 1, 148, 2493, 2498, 5, 'Sep 2019'),
(2, 1, 166, 2070, 2088, 18, 'Sep 2019'),
(3, 1, 115, 2530, 2548, 18, 'Sep 2019'),
(4, 1, 114, 1825, 1859, 34, 'Sep 2019'),
(5, 1, 161, 2111, 2151, 40, 'Sep 2019'),
(6, 1, 17, 7324, 7609, 285, 'Sep 2019'),
(7, 1, 111, 1331, 1371, 40, 'Sep 2019'),
(8, 1, 116, 5206, 5224, 18, 'Sep 2019'),
(9, 1, 85, 2996, 3016, 20, 'Sep 2019'),
(10, 1, 83, 934, 938, 4, 'Sep 2019'),
(11, 1, 12, 245, 258, 13, 'Sep 2019'),
(12, 1, 13, 9471, 9527, 56, 'Sep 2019'),
(13, 1, 71, 3026, 3065, 39, 'Sep 2019'),
(14, 1, 90, 2278, 2290, 12, 'Sep 2019'),
(15, 1, 31, 8384, 8452, 68, 'Sep 2019'),
(16, 1, 110, 6547, 6568, 21, 'Sep 2019'),
(17, 1, 8, 12694, 12710, 16, 'Sep 2019'),
(18, 1, 93, 11616, 11649, 33, 'Sep 2019'),
(19, 1, 38, 1295, 1308, 13, 'Sep 2019'),
(20, 1, 1, 2302, 2336, 34, 'Sep 2019'),
(21, 1, 3, 2903, 2928, 25, 'Sep 2019'),
(22, 1, 2, 2490, 2528, 38, 'Sep 2019'),
(23, 1, 40, 5458, 5504, 46, 'Sep 2019'),
(24, 1, 37, 4805, 4854, 49, 'Sep 2019'),
(25, 1, 64, 3495, 3530, 35, 'Sep 2019'),
(26, 1, 63, 3026, 3057, 31, 'Sep 2019'),
(27, 2, 162, 3451, 3464, 13, 'Sep 2019'),
(28, 2, 164, 2235, 2244, 9, 'Sep 2019'),
(29, 2, 118, 3328, 3345, 17, 'Sep 2019'),
(30, 2, 119, 3686, 3703, 17, 'Sep 2019'),
(31, 2, 49, 757, 772, 15, 'Sep 2019'),
(32, 2, 48, 759, 766, 7, 'Sep 2019'),
(33, 2, 47, 540, 550, 10, 'Sep 2019'),
(34, 2, 46, 903, 915, 12, 'Sep 2019'),
(35, 2, 104, 1866, 1883, 17, 'Sep 2019'),
(36, 2, 108, 1611, 1633, 22, 'Sep 2019'),
(37, 2, 106, 2045, 2082, 37, 'Sep 2019'),
(38, 2, 103, 2772, 2814, 42, 'Sep 2019'),
(39, 2, 45, 482, 496, 14, 'Sep 2019'),
(40, 2, 117, 849, 901, 52, 'Sep 2019'),
(41, 2, 177, 5513, 5527, 14, 'Sep 2019'),
(42, 2, 42, 4217, 4254, 37, 'Sep 2019'),
(43, 2, 167, 5035, 5116, 81, 'Sep 2019'),
(44, 2, 54, 1862, 1886, 24, 'Sep 2019'),
(45, 2, 86, 1517, 1547, 30, 'Sep 2019'),
(46, 2, 98, 1585, 1625, 40, 'Sep 2019'),
(47, 2, 127, 8469, 8549, 80, 'Sep 2019'),
(48, 2, 149, 5529, 5567, 38, 'Sep 2019'),
(49, 2, 189, 65, 91, 26, 'Sep 2019'),
(50, 2, 5, 4259, 4264, 5, 'Sep 2019'),
(51, 2, 6, 4412, 4463, 51, 'Sep 2019'),
(52, 3, 151, 2202, 2210, 8, 'Sep 2019'),
(53, 3, 145, 27032, 27249, 217, 'Sep 2019'),
(54, 3, 97, 6125, 6175, 50, 'Sep 2019'),
(55, 3, 135, 3115, 3132, 17, 'Sep 2019'),
(56, 3, 68, 19427, 19590, 163, 'Sep 2019'),
(57, 3, 65, 544, 771, 227, 'Sep 2019'),
(58, 3, 66, 1441, 1509, 68, 'Sep 2019'),
(59, 3, 69, 9226, 9244, 18, 'Sep 2019'),
(60, 3, 73, 1966, 1991, 25, 'Sep 2019'),
(61, 3, 113, 1323, 1362, 39, 'Sep 2019'),
(62, 3, 67, 553, 576, 23, 'Sep 2019'),
(63, 3, 72, 6198, 6247, 49, 'Sep 2019'),
(64, 3, 70, 5916, 5918, 2, 'Sep 2019'),
(65, 3, 89, 1366, 1385, 19, 'Sep 2019'),
(66, 3, 132, 2411, 2456, 45, 'Sep 2019'),
(67, 3, 61, 1552, 1597, 45, 'Sep 2019'),
(68, 3, 53, 250, 295, 45, 'Sep 2019'),
(69, 3, 131, 3962, 3974, 12, 'Sep 2019'),
(70, 3, 43, 1924, 1945, 21, 'Sep 2019'),
(71, 3, 153, 2855, 2903, 48, 'Sep 2019'),
(72, 3, 152, 3515, 3547, 32, 'Sep 2019'),
(73, 3, 150, 2595, 2620, 25, 'Sep 2019'),
(74, 3, 11, 5655, 5699, 44, 'Sep 2019'),
(75, 3, 79, 8266, 8285, 19, 'Sep 2019'),
(76, 3, 160, 2786, 2832, 46, 'Sep 2019'),
(77, 3, 163, 12047, 12064, 17, 'Sep 2019'),
(78, 3, 18, 5367, 5417, 50, 'Sep 2019'),
(79, 4, 96, 3182, 3208, 26, 'Sep 2019'),
(80, 4, 7, 11139, 11212, 73, 'Sep 2019'),
(81, 4, 126, 7795, 7795, 0, 'Sep 2019'),
(82, 4, 107, 2003, 2029, 26, 'Sep 2019'),
(83, 4, 109, 922, 945, 23, 'Sep 2019'),
(84, 4, 120, 1247, 1256, 9, 'Sep 2019'),
(85, 4, 133, 545, 569, 24, 'Sep 2019'),
(86, 4, 100, 3304, 3311, 7, 'Sep 2019'),
(87, 4, 147, 1559, 1564, 5, 'Sep 2019'),
(88, 4, 87, 2617, 2621, 4, 'Sep 2019'),
(89, 4, 140, 2110, 2139, 29, 'Sep 2019'),
(90, 4, 139, 1726, 1734, 8, 'Sep 2019'),
(91, 4, 155, 10535, 10569, 34, 'Sep 2019'),
(92, 4, 81, 7582, 7689, 107, 'Sep 2019'),
(93, 4, 92, 771, 788, 17, 'Sep 2019'),
(94, 4, 88, 650, 665, 15, 'Sep 2019'),
(95, 4, 91, 1151, 1182, 31, 'Sep 2019'),
(96, 4, 94, 1426, 1446, 20, 'Sep 2019'),
(97, 4, 169, 1455, 1456, 1, 'Sep 2019'),
(98, 4, 170, 1762, 1772, 10, 'Sep 2019'),
(99, 4, 75, 2612, 2629, 17, 'Sep 2019'),
(100, 4, 77, 2721, 2730, 9, 'Sep 2019'),
(101, 4, 56, 5785, 5794, 9, 'Sep 2019'),
(102, 4, 44, 46, 47, 1, 'Sep 2019'),
(103, 4, 50, 190, 191, 1, 'Sep 2019'),
(104, 4, 52, 5501, 5532, 31, 'Sep 2019'),
(105, 4, 146, 6199, 6281, 82, 'Sep 2019'),
(106, 5, 136, 9930, 10019, 89, 'Sep 2019'),
(107, 5, 134, 11445, 11545, 100, 'Sep 2019'),
(108, 5, 138, 4033, 4068, 35, 'Sep 2019'),
(109, 5, 141, 4368, 4410, 42, 'Sep 2019'),
(110, 5, 105, 7486, 7519, 33, 'Sep 2019'),
(111, 5, 51, 5474, 5519, 45, 'Sep 2019'),
(112, 5, 20, 1949, 1954, 5, 'Sep 2019'),
(113, 5, 27, 988, 1015, 27, 'Sep 2019'),
(114, 5, 25, 1056, 1081, 25, 'Sep 2019'),
(115, 5, 24, 598, 605, 7, 'Sep 2019'),
(116, 5, 23, 985, 1047, 62, 'Sep 2019'),
(117, 5, 26, 1081, 1098, 17, 'Sep 2019'),
(118, 5, 22, 1034, 1061, 27, 'Sep 2019'),
(119, 5, 125, 191, 195, 4, 'Sep 2019'),
(120, 5, 154, 1042, 1065, 23, 'Sep 2019'),
(121, 5, 178, 1302, 1323, 21, 'Sep 2019'),
(122, 5, 78, 1478, 1526, 48, 'Sep 2019'),
(123, 5, 82, 3390, 3396, 6, 'Sep 2019'),
(124, 5, 80, 2698, 2794, 96, 'Sep 2019'),
(125, 5, 168, 612, 629, 17, 'Sep 2019'),
(126, 5, 99, 545, 604, 59, 'Sep 2019'),
(127, 5, 122, 722, 739, 17, 'Sep 2019'),
(128, 5, 121, 348, 370, 22, 'Sep 2019'),
(129, 5, 21, 2037, 2055, 18, 'Sep 2019'),
(130, 5, 144, 9973, 10065, 92, 'Sep 2019'),
(131, 5, 143, 4344, 4351, 7, 'Sep 2019'),
(132, 5, 142, 5869, 5951, 82, 'Sep 2019'),
(133, 6, 124, 98, 106, 8, 'Sep 2019'),
(134, 6, 180, 485, 509, 24, 'Sep 2019'),
(135, 6, 57, 496, 547, 51, 'Sep 2019'),
(136, 6, 59, 1599, 1652, 53, 'Sep 2019'),
(137, 6, 28, 711, 777, 66, 'Sep 2019'),
(138, 6, 172, 1112, 1147, 35, 'Sep 2019'),
(139, 6, 191, 1, 35, 34, 'Sep 2019'),
(140, 6, 123, 2131, 2161, 30, 'Sep 2019'),
(141, 6, 102, 674, 689, 15, 'Sep 2019'),
(142, 6, 101, 2248, 2282, 34, 'Sep 2019'),
(143, 6, 95, 848, 859, 11, 'Sep 2019'),
(144, 6, 55, 1972, 1986, 14, 'Sep 2019'),
(145, 6, 193, 0, 1, 1, 'Sep 2019'),
(146, 6, 159, 1488, 1500, 12, 'Sep 2019'),
(147, 6, 158, 1871, 1999, 128, 'Sep 2019'),
(148, 6, 16, 4116, 4159, 43, 'Sep 2019'),
(149, 6, 176, 4963, 4972, 9, 'Sep 2019'),
(150, 6, 10, 1772, 1778, 6, 'Sep 2019'),
(151, 6, 165, 1454, 1464, 10, 'Sep 2019'),
(152, 6, 174, 1204, 1213, 9, 'Sep 2019'),
(153, 6, 179, 2045, 2070, 25, 'Sep 2019'),
(154, 6, 41, 1663, 1687, 24, 'Sep 2019'),
(155, 6, 4, 11398, 11426, 28, 'Sep 2019'),
(156, 6, 157, 14948, 15021, 73, 'Sep 2019'),
(157, 6, 19, 8217, 8264, 47, 'Sep 2019'),
(158, 6, 175, 4599, 4650, 51, 'Sep 2019'),
(159, 6, 29, 2528, 2557, 29, 'Sep 2019'),
(160, 7, 36, 4335, 4339, 4, 'Sep 2019'),
(161, 7, 35, 3528, 3546, 18, 'Sep 2019'),
(162, 7, 34, 3615, 3637, 22, 'Sep 2019'),
(163, 7, 33, 8781, 8851, 70, 'Sep 2019'),
(164, 7, 32, 3261, 3281, 20, 'Sep 2019'),
(165, 7, 192, 0, 1, 1, 'Sep 2019'),
(166, 7, 128, 4034, 4038, 4, 'Sep 2019'),
(167, 7, 129, 3170, 3187, 17, 'Sep 2019'),
(168, 7, 130, 7051, 7075, 24, 'Sep 2019'),
(169, 7, 186, 219, 340, 121, 'Sep 2019'),
(170, 7, 185, 94, 123, 29, 'Sep 2019'),
(171, 7, 76, 316, 320, 4, 'Sep 2019'),
(172, 7, 190, 32, 48, 16, 'Sep 2019'),
(173, 7, 39, 295, 384, 89, 'Sep 2019'),
(174, 7, 182, 172, 199, 27, 'Sep 2019'),
(175, 7, 9, 207, 216, 9, 'Sep 2019'),
(176, 7, 187, 54, 80, 26, 'Sep 2019'),
(177, 7, 188, 42, 77, 35, 'Sep 2019'),
(178, 7, 15, 491, 510, 19, 'Sep 2019'),
(179, 7, 14, 2342, 2370, 28, 'Sep 2019'),
(180, 7, 60, 305, 336, 31, 'Sep 2019'),
(181, 7, 184, 8, 12, 4, 'Sep 2019'),
(182, 7, 183, 4, 10, 6, 'Sep 2019');

-- --------------------------------------------------------

--
-- Table structure for table `meter_reading_period`
--

CREATE TABLE `meter_reading_period` (
  `meter_reading_period_id` int(11) NOT NULL,
  `meter_reading_period_start` date DEFAULT '0000-00-00',
  `meter_reading_period_end` date DEFAULT '0000-00-00',
  `month_id` int(11) DEFAULT '0',
  `meter_reading_year` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_closed` bit(1) DEFAULT b'0',
  `created_by` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_reading_period`
--

INSERT INTO `meter_reading_period` (`meter_reading_period_id`, `meter_reading_period_start`, `meter_reading_period_end`, `month_id`, `meter_reading_year`, `is_active`, `is_deleted`, `is_closed`, `created_by`, `date_created`, `modified_by`, `date_modified`, `deleted_by`, `date_deleted`) VALUES
(1, '2018-12-01', '2018-12-31', 1, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(2, '2019-01-01', '2019-01-31', 2, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(3, '2019-02-01', '2019-02-28', 3, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(4, '2019-03-01', '2019-03-31', 4, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(5, '2019-04-01', '2019-04-30', 5, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(6, '2019-05-01', '2019-05-31', 6, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(7, '2019-06-01', '2019-06-30', 7, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(8, '2019-07-01', '2019-07-31', 8, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9, '2019-08-01', '2019-08-31', 9, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(10, '2019-09-01', '2019-09-30', 10, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(11, '2019-10-01', '2019-10-31', 11, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(12, '2019-11-01', '2019-11-30', 12, 2019, b'1', b'0', b'0', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(13, '2020-05-01', '2020-05-31', 12, 2020, b'1', b'1', b'1', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `meter_status`
--

CREATE TABLE `meter_status` (
  `meter_status_id` int(12) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_status`
--

INSERT INTO `meter_status` (`meter_status_id`, `status_name`, `is_deleted`, `is_active`) VALUES
(1, 'Active', 0, 1),
(2, 'Inactive', 0, 1),
(3, 'On Float', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_layout`
--

CREATE TABLE `module_layout` (
  `module_layout_id` int(11) NOT NULL,
  `layout_id` int(11) DEFAULT '0',
  `display_text` varchar(100) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `pos_top` decimal(10,0) DEFAULT NULL,
  `pos_bottom` decimal(10,0) DEFAULT NULL,
  `pos_left` decimal(10,0) DEFAULT NULL,
  `pos_right` decimal(10,0) DEFAULT NULL,
  `font` varchar(100) DEFAULT NULL,
  `font_color` varchar(45) DEFAULT NULL,
  `font_size` decimal(10,0) DEFAULT NULL,
  `is_bold` varchar(120) DEFAULT '0',
  `is_italic` varchar(120) DEFAULT '0',
  `height` decimal(10,0) DEFAULT NULL,
  `width` decimal(10,0) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `parent` varchar(50) DEFAULT 'header'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `month_id` int(12) NOT NULL,
  `month_name` varchar(255) DEFAULT NULL,
  `quarterly` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`month_id`, `month_name`, `quarterly`) VALUES
(1, 'January', 1),
(2, 'February', 1),
(3, 'March', 1),
(4, 'April', 2),
(5, 'May', 2),
(6, 'June', 2),
(7, 'July', 3),
(8, 'August', 3),
(9, 'September', 3),
(10, 'October', 4),
(11, 'November', 4),
(12, 'December', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `nationality_id` int(11) NOT NULL,
  `nationality_name` varchar(445) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`nationality_id`, `nationality_name`, `is_active`, `is_deleted`) VALUES
(1, 'Filipino', b'1', b'0'),
(2, 'Korean', b'1', b'0'),
(3, 'American', b'1', b'0'),
(4, 'Japanese', b'1', b'0'),
(5, 'Chinese', b'1', b'0'),
(6, 'Vietnamese', b'1', b'0'),
(7, 'Russian', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `order_source`
--

CREATE TABLE `order_source` (
  `order_source_id` bigint(20) NOT NULL,
  `order_source_name` varchar(145) DEFAULT '',
  `order_source_description` varchar(145) DEFAULT '',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_source`
--

INSERT INTO `order_source` (`order_source_id`, `order_source_name`, `order_source_description`, `is_deleted`, `is_active`) VALUES
(1, 'Walk In', 'Walk In', b'0', b'1'),
(2, 'Lazada', '', b'1', b'1'),
(3, 'Facebook', '', b'0', b'1'),
(4, 'Shoppee', '', b'0', b'1'),
(5, 'Alibaba', '', b'0', b'1'),
(6, 'edi', 'wow', b'1', b'1'),
(7, '11', '11', b'1', b'1'),
(8, 'aa', 'aa', b'1', b'1'),
(9, 'Viber', 'Viber', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `order_status` varchar(75) DEFAULT '',
  `order_description` varchar(555) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `order_status`, `order_description`, `is_active`, `is_deleted`) VALUES
(1, 'Open', '', b'1', b'0'),
(2, 'Closed', '', b'1', b'0'),
(3, 'Partially received', '', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `other_charges`
--

CREATE TABLE `other_charges` (
  `other_charge_id` bigint(20) NOT NULL,
  `other_charge_no` varchar(75) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_amount_after_discount` decimal(20,4) DEFAULT '0.0000',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_due` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `remarks` text,
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `contact_person` varchar(175) DEFAULT NULL,
  `connection_id` bigint(20) DEFAULT '0',
  `is_processed` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other_charges`
--

INSERT INTO `other_charges` (`other_charge_id`, `other_charge_no`, `department_id`, `customer_id`, `salesperson_id`, `address`, `total_amount`, `total_overall_discount`, `total_overall_discount_amount`, `total_amount_after_discount`, `date_invoice`, `date_due`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `deleted_by_user`, `modified_by_user`, `is_active`, `is_deleted`, `remarks`, `is_journal_posted`, `journal_id`, `contact_person`, `connection_id`, `is_processed`) VALUES
(1, 'OTH-CHR-20191106-1', 0, 0, 0, NULL, '355.30', '0.0000', '0.0000', '355.3000', '2019-11-06', '0000-00-00', '2019-11-06 12:37:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 85, 1),
(2, 'OTH-CHR-20191106-2', 0, 0, 0, NULL, '22.00', '0.0000', '0.0000', '22.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:37:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 41, 1),
(3, 'OTH-CHR-20191106-3', 0, 0, 0, NULL, '377.85', '0.0000', '0.0000', '377.8500', '2019-11-06', '0000-00-00', '2019-11-06 12:37:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 130, 1),
(5, 'OTH-CHR-20191106-5', 0, 0, 0, NULL, '22.00', '0.0000', '0.0000', '22.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:38:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 165, 1),
(6, 'OTH-CHR-20191106-6', 0, 0, 0, NULL, '46.84', '0.0000', '0.0000', '46.8380', '2019-11-06', '0000-00-00', '2019-11-06 12:38:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 179, 1),
(7, 'OTH-CHR-20191106-7', 0, 0, 0, NULL, '212.36', '0.0000', '0.0000', '212.3550', '2019-11-06', '0000-00-00', '2019-11-06 12:38:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 142, 1),
(8, 'OTH-CHR-20191106-8', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:39:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 184, 1),
(9, 'OTH-CHR-20191106-9', 0, 0, 0, NULL, '400.40', '0.0000', '0.0000', '400.4000', '2019-11-06', '0000-00-00', '2019-11-06 12:39:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 118, 1),
(10, 'OTH-CHR-20191106-10', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:39:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 183, 1),
(11, 'OTH-CHR-20191106-11', 0, 0, 0, NULL, '422.95', '0.0000', '0.0000', '422.9500', '2019-11-06', '0000-00-00', '2019-11-06 12:39:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 168, 1),
(12, 'OTH-CHR-20191106-12', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:39:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 191, 1),
(13, 'OTH-CHR-20191106-13', 0, 0, 0, NULL, '422.95', '0.0000', '0.0000', '422.9500', '2019-11-06', '0000-00-00', '2019-11-06 12:39:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 26, 1),
(14, 'OTH-CHR-20191106-14', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:39:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 56, 1),
(15, 'OTH-CHR-20191106-15', 0, 0, 0, NULL, '440.00', '0.0000', '0.0000', '440.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 62, 0),
(16, 'OTH-CHR-20191106-16', 0, 0, 0, NULL, '445.50', '0.0000', '0.0000', '445.5000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 187, 1),
(17, 'OTH-CHR-20191106-17', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 169, 1),
(18, 'OTH-CHR-20191106-18', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 170, 1),
(19, 'OTH-CHR-20191106-19', 0, 0, 0, NULL, '582.45', '0.0000', '0.0000', '582.4500', '2019-11-06', '0000-00-00', '2019-11-06 12:40:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 123, 1),
(20, 'OTH-CHR-20191106-20', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 164, 1),
(21, 'OTH-CHR-20191106-21', 0, 0, 0, NULL, '620.40', '0.0000', '0.0000', '620.4000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 76, 1),
(22, 'OTH-CHR-20191106-22', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 128, 1),
(23, 'OTH-CHR-20191106-23', 0, 0, 0, NULL, '628.10', '0.0000', '0.0000', '628.1000', '2019-11-06', '0000-00-00', '2019-11-06 12:40:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 122, 1),
(24, 'OTH-CHR-20191106-24', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:41:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 51, 1),
(25, 'OTH-CHR-20191106-25', 0, 0, 0, NULL, '628.10', '0.0000', '0.0000', '628.1000', '2019-11-06', '0000-00-00', '2019-11-06 12:41:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 32, 1),
(26, 'OTH-CHR-20191106-26', 0, 0, 0, NULL, '805.75', '0.0000', '0.0000', '805.7500', '2019-11-06', '0000-00-00', '2019-11-06 12:41:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 64, 1),
(27, 'OTH-CHR-20191106-27', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:41:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 83, 1),
(28, 'OTH-CHR-20191106-28', 0, 0, 0, NULL, '904.75', '0.0000', '0.0000', '904.7500', '2019-11-06', '0000-00-00', '2019-11-06 12:41:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 60, 1),
(29, 'OTH-CHR-20191106-29', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:41:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 20, 1),
(30, 'OTH-CHR-20191106-30', 0, 0, 0, NULL, '937.75', '0.0000', '0.0000', '937.7500', '2019-11-06', '0000-00-00', '2019-11-06 12:41:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 188, 1),
(31, 'OTH-CHR-20191106-31', 0, 0, 0, NULL, '220.00', '0.0000', '0.0000', '220.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:41:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 116, 1),
(32, 'OTH-CHR-20191106-32', 0, 0, 0, NULL, '970.75', '0.0000', '0.0000', '970.7500', '2019-11-06', '0000-00-00', '2019-11-06 12:41:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 39, 1),
(33, 'OTH-CHR-20191106-33', 0, 0, 0, NULL, '242.00', '0.0000', '0.0000', '242.0000', '2019-11-06', '0000-00-00', '2019-11-06 12:42:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 171, 0),
(34, 'OTH-CHR-20191106-34', 0, 0, 0, NULL, '1104.40', '0.0000', '0.0000', '1104.4000', '2019-11-06', '0000-00-00', '2019-11-06 12:42:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 4, 1),
(35, 'OTH-CHR-20191106-35', 0, 0, 0, NULL, '287.65', '0.0000', '0.0000', '287.6500', '2019-11-06', '0000-00-00', '2019-11-06 12:42:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 125, 1),
(36, 'OTH-CHR-20191106-36', 0, 0, 0, NULL, '1238.60', '0.0000', '0.0000', '1238.6000', '2019-11-06', '0000-00-00', '2019-11-06 12:42:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 113, 1),
(37, 'OTH-CHR-20191106-37', 0, 0, 0, NULL, '1509.75', '0.0000', '0.0000', '1509.7500', '2019-11-06', '0000-00-00', '2019-11-06 12:42:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 181, 0),
(38, 'OTH-CHR-20191106-38', 0, 0, 0, NULL, '332.75', '0.0000', '0.0000', '332.7500', '2019-11-06', '0000-00-00', '2019-11-06 12:42:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, b'1', b'0', '', b'0', 0, NULL, 21, 1),
(39, 'OTH-CHR-20191106-39', 0, 0, 0, NULL, '2464.55', '0.0000', '0.0000', '2464.5500', '2019-11-06', '0000-00-00', '2019-11-06 12:42:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 167, 1),
(40, 'OTH-CHR-20191106-40', 0, 0, 0, NULL, '2635.05', '0.0000', '0.0000', '2635.0500', '2019-11-06', '0000-00-00', '2019-11-06 12:42:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 0, 0, b'1', b'0', '', b'0', 0, NULL, 186, 1);

-- --------------------------------------------------------

--
-- Table structure for table `other_charges_items`
--

CREATE TABLE `other_charges_items` (
  `other_charge_item_id` bigint(25) NOT NULL,
  `other_charge_id` bigint(25) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `charge_unit_id` int(11) DEFAULT '0',
  `charge_amount` decimal(25,2) DEFAULT '0.00',
  `charge_qty` int(11) DEFAULT '0',
  `charge_line_total` decimal(25,2) DEFAULT '0.00',
  `charge_line_total_after_global` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other_charges_items`
--

INSERT INTO `other_charges_items` (`other_charge_item_id`, `other_charge_id`, `charge_id`, `charge_unit_id`, `charge_amount`, `charge_qty`, `charge_line_total`, `charge_line_total_after_global`) VALUES
(1, 1, 1, 1, '355.30', 1, '355.30', '355.3000'),
(2, 2, 1, 1, '22.00', 1, '22.00', '22.0000'),
(3, 3, 1, 1, '377.85', 1, '377.85', '377.8500'),
(5, 5, 1, 1, '22.00', 1, '22.00', '22.0000'),
(6, 6, 1, 1, '46.84', 1, '46.84', '46.8380'),
(7, 7, 1, 1, '212.36', 1, '212.36', '212.3550'),
(8, 8, 1, 1, '220.00', 1, '220.00', '220.0000'),
(9, 9, 1, 1, '400.40', 1, '400.40', '400.4000'),
(10, 10, 1, 1, '220.00', 1, '220.00', '220.0000'),
(11, 11, 1, 1, '422.95', 1, '422.95', '422.9500'),
(12, 12, 1, 1, '220.00', 1, '220.00', '220.0000'),
(13, 13, 1, 1, '422.95', 1, '422.95', '422.9500'),
(14, 14, 1, 1, '220.00', 1, '220.00', '220.0000'),
(15, 15, 1, 1, '440.00', 1, '440.00', '440.0000'),
(16, 16, 1, 1, '445.50', 1, '445.50', '445.5000'),
(17, 17, 1, 1, '220.00', 1, '220.00', '220.0000'),
(18, 18, 1, 1, '220.00', 1, '220.00', '220.0000'),
(19, 19, 1, 1, '582.45', 1, '582.45', '582.4500'),
(20, 20, 1, 1, '220.00', 1, '220.00', '220.0000'),
(21, 21, 1, 1, '620.40', 1, '620.40', '620.4000'),
(22, 22, 1, 1, '220.00', 1, '220.00', '220.0000'),
(23, 23, 1, 1, '628.10', 1, '628.10', '628.1000'),
(24, 24, 1, 1, '220.00', 1, '220.00', '220.0000'),
(25, 25, 1, 1, '628.10', 1, '628.10', '628.1000'),
(26, 26, 1, 1, '805.75', 1, '805.75', '805.7500'),
(27, 27, 1, 1, '220.00', 1, '220.00', '220.0000'),
(28, 28, 1, 1, '904.75', 1, '904.75', '904.7500'),
(29, 29, 1, 1, '220.00', 1, '220.00', '220.0000'),
(30, 30, 1, 1, '937.75', 1, '937.75', '937.7500'),
(31, 31, 1, 1, '220.00', 1, '220.00', '220.0000'),
(32, 32, 1, 1, '970.75', 1, '970.75', '970.7500'),
(33, 33, 1, 1, '242.00', 1, '242.00', '242.0000'),
(34, 34, 1, 1, '1104.40', 1, '1104.40', '1104.4000'),
(35, 35, 1, 1, '287.65', 1, '287.65', '287.6500'),
(36, 36, 1, 1, '1238.60', 1, '1238.60', '1238.6000'),
(37, 37, 1, 1, '1509.75', 1, '1509.75', '1509.7500'),
(38, 38, 1, 1, '332.75', 1, '332.75', '332.7500'),
(39, 39, 1, 1, '2464.55', 1, '2464.55', '2464.5500'),
(40, 40, 1, 1, '2635.05', 1, '2635.05', '2635.0500');

-- --------------------------------------------------------

--
-- Table structure for table `payable_payments`
--

CREATE TABLE `payable_payments` (
  `payment_id` bigint(20) NOT NULL,
  `receipt_no` varchar(75) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receipt_type` varchar(55) DEFAULT '',
  `department_id` bigint(20) DEFAULT '0',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date_type` tinyint(4) DEFAULT '1' COMMENT '1 is Date, 2 is PDC',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(100) DEFAULT '',
  `remarks` varchar(755) DEFAULT '',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_paid` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_posted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payable_payments_list`
--

CREATE TABLE `payable_payments_list` (
  `payment_list_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) DEFAULT '0',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `payable_amount` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL,
  `payment_method` varchar(100) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`payment_method_id`, `payment_method`, `is_active`, `is_deleted`) VALUES
(1, 'Cash', b'1', b'0'),
(2, 'Check', b'1', b'0'),
(3, 'Card', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `po_attachments`
--

CREATE TABLE `po_attachments` (
  `po_attachment_id` bigint(20) NOT NULL,
  `purchase_order_id` bigint(20) DEFAULT '0',
  `orig_file_name` varchar(255) DEFAULT '',
  `server_file_directory` varchar(800) DEFAULT '',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by_user` int(11) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_messages`
--

CREATE TABLE `po_messages` (
  `po_message_id` bigint(20) NOT NULL,
  `purchase_order_id` bigint(20) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `message` text,
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prime_hotel_integration`
--

CREATE TABLE `prime_hotel_integration` (
  `prime_hotel_integration_id` bigint(20) NOT NULL,
  `item_type` varchar(45) DEFAULT '',
  `shift_date` date DEFAULT '0000-00-00',
  `adv_cash_total` decimal(20,5) DEFAULT '0.00000',
  `adv_check_total` decimal(20,5) DEFAULT '0.00000',
  `adv_card_total` decimal(20,5) DEFAULT '0.00000',
  `adv_charge_total` decimal(20,5) DEFAULT '0.00000',
  `adv_bank_dep_total` decimal(20,5) DEFAULT '0.00000',
  `cash_sales` decimal(20,5) DEFAULT '0.00000',
  `check_sales` decimal(20,5) DEFAULT '0.00000',
  `card_sales` decimal(20,5) DEFAULT '0.00000',
  `charge_sales` decimal(20,5) DEFAULT '0.00000',
  `bank_dep_sales` decimal(20,5) DEFAULT '0.00000',
  `room_sales` decimal(20,5) DEFAULT '0.00000',
  `bar_sales` decimal(20,5) DEFAULT '0.00000',
  `other_sales` decimal(20,5) DEFAULT '0.00000',
  `adv_sales` decimal(20,5) DEFAULT '0.00000',
  `guest_id` bigint(20) DEFAULT '0',
  `guest_name` varchar(245) DEFAULT '',
  `ar_guest_id` bigint(20) DEFAULT '0',
  `ar_guest_name` varchar(245) DEFAULT '',
  `check_no` varchar(145) DEFAULT '',
  `check_date` date DEFAULT '0000-00-00',
  `check_type_id` bigint(20) DEFAULT '0',
  `check_type_name` varchar(145) DEFAULT '',
  `card_no` varchar(45) DEFAULT '',
  `card_type_name` varchar(45) DEFAULT '',
  `or_no` varchar(145) DEFAULT '',
  `folio_no` varchar(145) DEFAULT '',
  `receipt_no` varchar(145) DEFAULT '',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `posted_by_user` bigint(20) DEFAULT '0',
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prime_hotel_integration_settings`
--

CREATE TABLE `prime_hotel_integration_settings` (
  `prime_hotel_integration_settings_id` bigint(20) NOT NULL,
  `adv_cash_id` bigint(20) DEFAULT '0',
  `adv_check_id` bigint(20) DEFAULT '0',
  `adv_card_id` bigint(20) DEFAULT '0',
  `adv_charge_id` bigint(20) DEFAULT '0',
  `adv_bank_dep_id` bigint(20) DEFAULT '0',
  `cash_id` bigint(20) DEFAULT '0',
  `check_id` bigint(20) DEFAULT '0',
  `card_id` bigint(20) DEFAULT '0',
  `charge_id` bigint(20) DEFAULT '0',
  `bank_dep_id` bigint(20) DEFAULT '0',
  `room_sales_id` bigint(20) DEFAULT '0',
  `bar_sales_id` bigint(20) DEFAULT '0',
  `other_sales_id` bigint(20) DEFAULT '0',
  `adv_sales_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prime_hotel_integration_settings`
--

INSERT INTO `prime_hotel_integration_settings` (`prime_hotel_integration_settings_id`, `adv_cash_id`, `adv_check_id`, `adv_card_id`, `adv_charge_id`, `adv_bank_dep_id`, `cash_id`, `check_id`, `card_id`, `charge_id`, `bank_dep_id`, `room_sales_id`, `bar_sales_id`, `other_sales_id`, `adv_sales_id`, `customer_id`, `department_id`) VALUES
(1, 46, 47, 48, 49, 50, 1, 52, 53, 5, 54, 19, 21, 20, 51, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `print_layout`
--

CREATE TABLE `print_layout` (
  `layout_id` int(11) NOT NULL,
  `layout_name` varchar(755) NOT NULL,
  `layout_description` varchar(1000) DEFAULT NULL,
  `is_portrait` bit(1) NOT NULL DEFAULT b'1',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL,
  `product_code` varchar(255) DEFAULT '',
  `product_desc` varchar(255) DEFAULT '',
  `product_desc1` varchar(255) DEFAULT '',
  `is_bulk` tinyint(1) DEFAULT '0',
  `primary_unit` bit(1) DEFAULT b'1',
  `parent_unit_id` bigint(20) DEFAULT '0',
  `child_unit_desc` varchar(175) DEFAULT '0',
  `child_unit_id` bigint(20) DEFAULT '0',
  `size` varchar(255) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `tax_type_id` bigint(20) DEFAULT '0',
  `refproduct_id` int(10) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '2' COMMENT '1 - Hotel , 2 -  POS',
  `equivalent_points` decimal(20,2) DEFAULT '0.00',
  `product_warn` decimal(16,2) DEFAULT '0.00',
  `product_ideal` decimal(16,2) DEFAULT '0.00',
  `purchase_cost` decimal(20,4) DEFAULT '0.0000',
  `purchase_cost_2` decimal(20,4) DEFAULT '0.0000',
  `markup_percent` decimal(16,4) DEFAULT '0.0000',
  `sale_price` decimal(16,4) DEFAULT '0.0000',
  `whole_sale` decimal(16,4) DEFAULT '0.0000',
  `retailer_price` decimal(16,4) DEFAULT '0.0000',
  `special_disc` decimal(16,4) DEFAULT '0.0000',
  `discounted_price` decimal(16,4) DEFAULT '0.0000',
  `dealer_price` decimal(16,4) DEFAULT '0.0000',
  `distributor_price` decimal(16,4) DEFAULT '0.0000',
  `public_price` decimal(16,4) DEFAULT '0.0000',
  `valued_customer` decimal(16,4) DEFAULT '0.0000',
  `income_account_id` bigint(20) DEFAULT '0',
  `expense_account_id` bigint(20) DEFAULT '0',
  `on_hand` decimal(20,2) DEFAULT '0.00',
  `item_type_id` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_inventory` bit(1) DEFAULT b'1',
  `is_tax_exempt` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `brand_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_batch_inventory`
--

CREATE TABLE `product_batch_inventory` (
  `product_key` varchar(100) NOT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `batch_no` varchar(55) DEFAULT '',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_exp_on_hand` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proforma_invoice`
--

CREATE TABLE `proforma_invoice` (
  `proforma_invoice_id` bigint(20) NOT NULL,
  `proforma_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `customer_name` varchar(175) NOT NULL,
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proforma_invoice_items`
--

CREATE TABLE `proforma_invoice_items` (
  `proforma_item_id` bigint(20) NOT NULL,
  `proforma_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,0) DEFAULT '0',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `purchase_order_id` bigint(20) NOT NULL,
  `po_no` varchar(75) DEFAULT '',
  `terms` varchar(55) DEFAULT '',
  `duration` varchar(55) DEFAULT '',
  `deliver_to_address` varchar(755) DEFAULT '',
  `supplier_id` int(11) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `tax_type_id` int(11) DEFAULT '0',
  `contact_person` varchar(100) DEFAULT '',
  `remarks` varchar(775) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) NOT NULL,
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `approval_id` int(11) DEFAULT '2',
  `order_status_id` int(11) DEFAULT '1',
  `is_email_sent` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_approved` datetime DEFAULT '0000-00-00 00:00:00',
  `approved_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `po_item_id` bigint(20) NOT NULL,
  `purchase_order_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` int(11) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `po_price` decimal(20,4) DEFAULT '0.0000',
  `po_discount` decimal(20,4) DEFAULT '0.0000',
  `po_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `po_tax_rate` decimal(11,4) DEFAULT '0.0000',
  `po_qty` decimal(20,2) DEFAULT '0.00',
  `po_line_total` decimal(20,4) DEFAULT '0.0000',
  `tax_amount` decimal(20,4) DEFAULT '0.0000',
  `non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `po_line_total_after_global` decimal(20,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasing_integration`
--

CREATE TABLE `purchasing_integration` (
  `purchasing_integration_id` int(11) NOT NULL DEFAULT '0',
  `iss_supplier_id` bigint(20) DEFAULT '0',
  `iss_debit_id` bigint(20) DEFAULT '0',
  `iss_credit_id` bigint(20) DEFAULT '0',
  `adj_supplier_id` bigint(20) DEFAULT '0',
  `adj_debit_id` bigint(20) DEFAULT '0',
  `adj_credit_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchasing_integration`
--

INSERT INTO `purchasing_integration` (`purchasing_integration_id`, `iss_supplier_id`, `iss_debit_id`, `iss_credit_id`, `adj_supplier_id`, `adj_debit_id`, `adj_credit_id`) VALUES
(1, 1, 1, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate_types`
--

CREATE TABLE `rate_types` (
  `rate_type_id` int(11) NOT NULL,
  `rate_type_name` varchar(145) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_types`
--

INSERT INTO `rate_types` (`rate_type_id`, `rate_type_name`, `is_active`, `is_deleted`) VALUES
(1, 'Meter Reading', b'1', b'0'),
(2, 'Flat Rate', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `receivable_payments`
--

CREATE TABLE `receivable_payments` (
  `payment_id` bigint(20) NOT NULL,
  `receipt_no` varchar(20) DEFAULT '',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receipt_type` varchar(55) DEFAULT 'AR',
  `department_id` int(11) DEFAULT '0',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date_type` tinyint(4) DEFAULT '1' COMMENT '1 is Date, 2 is PDC',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(100) DEFAULT '',
  `remarks` varchar(755) DEFAULT '',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_paid` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `is_posted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receivable_payments_list`
--

CREATE TABLE `receivable_payments_list` (
  `payment_list_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) DEFAULT '0',
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `service_invoice_id` bigint(20) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receivable_amount` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refcustomertype`
--

CREATE TABLE `refcustomertype` (
  `refcustomertype_id` bigint(20) NOT NULL,
  `customer_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `modified_by_user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refdiscounttype`
--

CREATE TABLE `refdiscounttype` (
  `discount_type_id` int(11) NOT NULL,
  `discount_type_code` varchar(65) DEFAULT '',
  `discount_type_name` varchar(254) DEFAULT '',
  `discount_type_desc` varchar(500) DEFAULT '',
  `discount_percent` decimal(19,5) DEFAULT '0.00000',
  `sort_key` int(11) DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT '0',
  `modified_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT '0',
  `deleted_datetime` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `refdiscounttype`
--

INSERT INTO `refdiscounttype` (`discount_type_id`, `discount_type_code`, `discount_type_name`, `discount_type_desc`, `discount_percent`, `sort_key`, `created_by`, `created_datetime`, `modified_by`, `modified_datetime`, `deleted_by`, `deleted_datetime`, `is_deleted`) VALUES
(1, 'SC', 'Senior Citizen', 'Senior Citizen', '20.00000', -1, 0, NULL, 0, NULL, 1, NULL, 0),
(2, 'MD', 'Manual Discount', 'Manual Discount', '0.00000', 0, 0, NULL, 1, '2017-08-11 12:01:36', 1, '2017-08-11 12:01:42', 0),
(3, '5% Percent', '5% Percent', '5% Percent', '5.00000', 0, 1, '2017-08-11 12:02:10', 1, '2018-03-27 10:12:16', 0, NULL, 0),
(4, '10% Percent', '10% Percent', '10% Percent', '10.00000', 0, 1, '2018-03-27 10:12:32', 0, NULL, 0, NULL, 0),
(5, '15% Percent', '15% Percent', '15% Percent', '15.00000', 0, 1, '2018-03-27 10:12:49', 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `refproduct`
--

CREATE TABLE `refproduct` (
  `refproduct_id` int(10) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `modified_by_user_id` int(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refproduct`
--

INSERT INTO `refproduct` (`refproduct_id`, `product_type`, `description`, `created_by_user_id`, `modified_by_user_id`, `date_created`, `date_modified`, `is_deleted`) VALUES
(1, 'Companion Animals', 'Common house pets', 0, 0, '2017-07-05 11:51:47', '0000-00-00 00:00:00', 0),
(2, 'Livestock Animals', 'Farm animals', 0, 0, '2017-07-05 11:51:47', '0000-00-00 00:00:00', 0),
(3, 'All Product type', '', 0, 0, '2017-07-05 11:51:47', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rights_links`
--

CREATE TABLE `rights_links` (
  `link_id` int(11) NOT NULL,
  `parent_code` varchar(100) DEFAULT '',
  `link_code` varchar(20) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rights_links`
--

INSERT INTO `rights_links` (`link_id`, `parent_code`, `link_code`, `link_name`) VALUES
(1, '1', '1-1', 'General Journal'),
(2, '1', '1-2', 'Cash Disbursement'),
(3, '1', '1-3', 'Purchase Journal'),
(4, '1', '1-4', 'Sales Journal'),
(5, '1', '1-5', 'Cash Receipt'),
(6, '2', '2-1', 'Purchase Order'),
(7, '2', '2-2', 'Purchase Invoice'),
(8, '2', '2-3', 'Record Payment'),
(10, '15', '15-3', 'Item Adjustment'),
(11, '3', '3-1', 'Sales Order'),
(12, '3', '3-2', 'Sales Invoice'),
(13, '3', '3-3', 'Record Payment'),
(14, '4', '4-2', 'Category Management'),
(15, '4', '4-3', 'Department Management'),
(16, '4', '4-4', 'Unit Management'),
(17, '5', '5-1', 'Product Management'),
(18, '5', '5-2', 'Supplier Management'),
(19, '5', '5-3', 'Customer Management'),
(20, '6', '6-1', 'Setup Tax'),
(21, '6', '6-2', 'Setup Chart of Accounts'),
(22, '6', '6-3', 'Account Integration'),
(23, '6', '6-4', 'Setup User Group'),
(24, '6', '6-5', 'Create User Account'),
(25, '6', '6-6', 'Setup Company Info'),
(26, '7', '7-1', 'Purchase Order for Approval'),
(27, '9', '9-1', 'Balance Sheet Report'),
(28, '9', '9-2', 'Income Statement'),
(29, '4', '4-1', 'Account Classification'),
(30, '8', '8-1', 'Sales Report'),
(31, '15', '15-4', 'Inventory Report'),
(32, '5', '5-4', 'Salesperson Management'),
(33, '2', '2-6', 'Item Adjustment (Out)'),
(34, '8', '8-3', 'Export Sales Summary'),
(35, '9', '9-3', 'Export Trial Balance'),
(36, '6', '6-7', 'Setup Check Layout'),
(37, '9', '9-4', 'AR Schedule'),
(38, '9', '9-6', 'Customer Subsidiary'),
(39, '9', '9-8', 'Account Subsidiary'),
(40, '9', '9-7', 'Supplier Subsidiary'),
(41, '9', '9-5', 'AP Schedule'),
(42, '8', '8-4', 'Purchase Invoice Report'),
(43, '4', '4-5', 'Locations Management'),
(44, '10', '10-1', 'Fixed Asset Management'),
(45, '9', '9-9', 'Annual Income Statement'),
(46, '6', '6-8', 'Recurring Template'),
(47, '9', '9-10', 'VAT Relief Report'),
(48, '1', '1-6', 'Petty Cash Journal'),
(49, '9', '9-13', 'Replenishment Report'),
(50, '6', '6-9', 'Backup Database'),
(51, '9', '9-14', 'Book of Accounts'),
(52, '9', '9-16', 'Comparative Income'),
(53, '4', '4-6', 'Bank Reference Management'),
(54, '10', '10-2', 'Depreciation Expense Report'),
(55, '11', '11-1', 'Bank Reconciliation'),
(57, '12', '12-1', 'Voucher Registry Report'),
(58, '12', '12-2', 'Check Registry Report'),
(59, '12', '12-3', 'Collection List Report'),
(60, '12', '12-4', 'Open Purchase Report'),
(61, '12', '12-5', 'Open Sales Report'),
(62, '9', '9-11', 'Schedule of Expense'),
(63, '9', '9-15', 'AR Reports'),
(64, '9', '9-12', 'Cost of Goods'),
(65, '13', '13-1', 'Service Invoice'),
(66, '13', '13-2', 'Service Journal'),
(67, '13', '13-3', 'Service Unit Management'),
(68, '13', '13-4', 'Service Management'),
(69, '9', '9-17', 'Aging of Receivables'),
(70, '9', '9-18', 'Aging of Payables'),
(71, '9', '9-19', 'Statement of Account'),
(72, '6', '6-10', 'Email Settings'),
(73, '14', '14-1', 'Treasury'),
(74, '9', '9-20', 'Replenishment Batch Report'),
(75, '9', '9-21', 'General Ledger'),
(76, '6', '6-11', 'Email Report'),
(77, '12', '12-6', 'Product Reorder (Pick-list)'),
(78, '12', '12-7', 'Product List Report'),
(79, '2', '2-8', 'Purchase History'),
(80, '2', '2-7', 'Purchase Monitoring'),
(81, '6', '6-12', 'Puchasing Integration'),
(82, '15', '15-1', 'Product Management (Inventory Tab)'),
(83, '3', '3-4', 'Cash Invoice'),
(84, '6', '6-13', 'Audit Trail'),
(85, '15', '15-5', 'Item Transfer to Department'),
(86, '15', '15-6', 'Stock Card / Bin Card'),
(87, '3', '3-5', 'Warehouse Dispatching'),
(88, '4', '4-7', 'Brands'),
(89, '16', '16-1', 'Monthly Percentage Tax Return'),
(90, '16', '16-2', 'Quarterly Percentage Tax Return'),
(91, '16', '16-3', 'Certificate of Creditable Tax'),
(92, '6', '6-14', 'Statement of Accounts Settings'),
(93, '5', '5-5', 'Meter Inventory Management'),
(94, '17', '17-1', 'Service Connection'),
(95, '17', '17-2', 'Service Disconnection'),
(96, '17', '17-3', 'Service Reconnection'),
(97, '18', '18-1', 'Meter Reading Entry'),
(98, '18', '18-2', 'Process Billing'),
(99, '18', '18-3', 'Billing Payments'),
(100, '19', '19-1', 'Charges Management'),
(101, '19', '19-2', 'Charge Unit Management'),
(102, '19', '19-3', 'Other Charges'),
(103, '20', '20-1', 'Residential Rate Matrix'),
(104, '20', '20-2', 'Commercial Rate Matrix'),
(105, '20', '20-3', 'Meter Inventory'),
(106, '20', '20-4', 'Meter Reading Period'),
(107, '20', '20-5', 'Attendant Management'),
(108, '21', '21-1', 'Service Trail'),
(109, '21', '21-2', 'Consumption History'),
(110, '21', '21-3', 'Billing Statement'),
(111, '22', '22-1', 'Billing Sending'),
(112, '22', '22-2', 'Payment Sending'),
(113, '21', '21-4', 'Customer Billing Subsidiary'),
(114, '21', '21-5', 'Batch Payment Report'),
(115, '22', '22-3', 'Connection Deposits Sending'),
(116, '21', '21-6', 'Batch Connection Deposits Report'),
(117, '23', '23-1', 'Create Service Connection'),
(118, '23', '23-2', 'Edit Service Connection'),
(119, '23', '23-3', 'Delete Service Connection'),
(120, '24', '24-1', 'Create Service Disconnection'),
(121, '24', '24-2', 'Edit Service Disconnection'),
(122, '24', '24-3', 'Delete Service Disconnection'),
(123, '25', '25-1', 'Create Service Reconnection'),
(124, '25', '25-2', 'Edit Service Reconnection'),
(125, '25', '25-3', 'Delete Service Reconnection'),
(126, '26', '26-1', 'Create Meter Reading Entry'),
(127, '26', '26-2', 'Edit Meter Reading Entry'),
(128, '26', '26-3', 'Delete Meter Reading Entry'),
(129, '27', '27-1', 'Process Billing Statement'),
(130, '28', '28-1', 'Create Billing Payment'),
(131, '28', '28-2', 'Cancel Billing Payment'),
(132, '29', '29-1', 'Create Charges Management'),
(133, '29', '29-2', 'Edit Charges Management'),
(134, '29', '29-3', 'Delete Charges Management'),
(135, '30', '30-1', 'Create Charges Unit Management'),
(136, '30', '30-2', 'Edit Charges Unit Management'),
(137, '30', '30-3', 'Delete Charges Unit Management'),
(138, '31', '31-1', 'Create Other Charges'),
(139, '31', '31-2', 'Edit Other Charges'),
(140, '31', '31-3', 'Delete Other Charges'),
(141, '32', '32-1', 'Create Residential Rate Matrix'),
(142, '32', '32-2', 'Edit Residential Rate Matrix'),
(143, '32', '32-3', 'Delete Residential Rate Matrix'),
(144, '33', '33-1', 'Create Commercial Rate Matrix'),
(145, '33', '33-2', 'Edit Commercial Rate Matrix'),
(146, '33', '33-3', 'Delete Commercial Rate Matrix'),
(147, '34', '34-1', 'Create Meter Inventory'),
(148, '34', '34-2', 'Edit Meter Inventory'),
(149, '34', '34-3', 'Delete Meter Inventory'),
(150, '35', '35-1', 'Create Meter Reading Period'),
(151, '35', '35-2', 'Edit Meter Reading Period'),
(152, '35', '35-3', 'Delete Meter Reading Period'),
(153, '35', '35-4', 'Close Meter Reading Period'),
(154, '36', '36-1', 'Create Attendant Management'),
(155, '36', '36-2', 'Edit Attendant Management'),
(156, '36', '36-3', 'Delete Attendant Management'),
(157, '37', '37-1', 'Send to Accounting Connection Deposits'),
(158, '38', '38-1', 'Send to Accounting Billing'),
(159, '39', '39-1', 'Send to Accounting Payments'),
(160, '21', '21-7', 'Customer Billing Receivables'),
(161, '21', '21-8', 'Monthly Connection');

-- --------------------------------------------------------

--
-- Table structure for table `salesperson`
--

CREATE TABLE `salesperson` (
  `salesperson_id` int(11) NOT NULL,
  `salesperson_code` varchar(55) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `acr_name` varchar(10) DEFAULT NULL,
  `contact_no` varchar(100) NOT NULL,
  `department_id` int(2) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice`
--

CREATE TABLE `sales_invoice` (
  `sales_invoice_id` bigint(20) NOT NULL,
  `sales_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  `for_dispatching` bit(1) DEFAULT b'0',
  `closing_reason` varchar(445) DEFAULT '',
  `closed_by_user` bigint(20) DEFAULT '0',
  `is_closed` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_items`
--

CREATE TABLE `sales_invoice_items` (
  `sales_item_id` bigint(20) NOT NULL,
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `sales_order_id` bigint(20) NOT NULL,
  `so_no` varchar(75) DEFAULT '',
  `customer_id` bigint(20) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `order_status_id` int(11) DEFAULT '1',
  `date_order` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `salesperson_id` int(11) DEFAULT '0',
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_items`
--

CREATE TABLE `sales_order_items` (
  `sales_order_item_id` bigint(20) NOT NULL,
  `sales_order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '1',
  `so_qty` decimal(20,2) DEFAULT '0.00',
  `so_price` decimal(20,4) DEFAULT '0.0000',
  `so_discount` decimal(20,4) DEFAULT '0.0000',
  `so_gross` decimal(20,4) DEFAULT '0.0000',
  `so_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `so_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `so_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `so_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `so_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `dr_invoice_id` int(11) DEFAULT NULL,
  `batch_no` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sched_expense_integration`
--

CREATE TABLE `sched_expense_integration` (
  `sched_expense_id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT '0',
  `group_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` bigint(20) NOT NULL,
  `service_code` varchar(255) DEFAULT NULL,
  `service_desc` varchar(255) DEFAULT NULL,
  `service_unit` varchar(255) DEFAULT NULL,
  `income_account_id` bigint(20) DEFAULT '0',
  `expense_account_id` bigint(20) DEFAULT '0',
  `service_amount` decimal(25,2) DEFAULT '0.00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_connection`
--

CREATE TABLE `service_connection` (
  `connection_id` bigint(20) NOT NULL,
  `service_no` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT '0',
  `account_no` varchar(255) DEFAULT NULL,
  `contract_type_id` int(12) DEFAULT '0',
  `service_date` date DEFAULT NULL,
  `receipt_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `target_date` date DEFAULT '0000-00-00',
  `target_time` time DEFAULT '00:00:00',
  `rate_type_id` int(12) DEFAULT '0',
  `initial_meter_deposit` decimal(20,2) DEFAULT '0.00',
  `initial_meter_reading` bigint(20) DEFAULT '0',
  `attendant_id` int(12) DEFAULT '0',
  `date_created` date DEFAULT '0000-00-00',
  `created_by` int(12) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `status_id` int(12) DEFAULT '1',
  `current_id` bigint(20) DEFAULT '0',
  `meter_inventory_id` bigint(20) DEFAULT '0',
  `service_connection_batch_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='current_id  is the log for the current status id';

--
-- Dumping data for table `service_connection`
--

INSERT INTO `service_connection` (`connection_id`, `service_no`, `customer_id`, `account_no`, `contract_type_id`, `service_date`, `receipt_name`, `address`, `target_date`, `target_time`, `rate_type_id`, `initial_meter_deposit`, `initial_meter_reading`, `attendant_id`, `date_created`, `created_by`, `is_deleted`, `is_active`, `status_id`, `current_id`, `meter_inventory_id`, `service_connection_batch_id`) VALUES
(1, 'SCN-20190716-1', 1, 'ACN-20190716-1', 1, '2019-09-01', 'JOSE HUBERTO S. TAYAG', '2-2 VILLA MANUELA', '2012-03-15', '12:00:00', 1, '3800.00', 2302, 1, '2019-07-16', 2, b'0', b'1', 1, 1, 103, 0),
(2, 'SCN-20190716-2', 1, 'ACN-20190716-2', 1, '2019-09-01', 'JOSE HUBERTO S. TAYAG', '4 - 5 VILLA MANUELA', '2011-08-31', '12:00:00', 1, '3800.00', 2490, 1, '2019-07-16', 2, b'0', b'1', 1, 2, 97, 0),
(3, 'SCN-20190716-3', 1, 'ACN-20190716-3', 1, '2019-09-01', 'JOSE HUBERTO S. TAYAG', '4-3 VILLA MANUELA\r\n', '2011-08-15', '12:00:00', 1, '3800.00', 2903, 1, '2019-07-16', 2, b'0', b'1', 1, 3, 96, 0),
(4, 'SCN-20190716-4', 2, 'ACN-20190716-4', 1, '2019-09-01', 'JOSEPH PONCE MARLYN', 'LOT.8, BLK.4 NEGRON ST', '2006-11-07', '12:00:00', 1, '3800.00', 11398, 1, '2019-07-16', 2, b'0', b'1', 1, 4, 23, 0),
(5, 'SCN-20190716-5', 3, 'ACN-20190716-5', 1, '2019-09-01', 'JOSIE NAVARRO', 'LOT11B, BLK3 ARAYAT ST', '2007-02-14', '12:00:00', 1, '3800.00', 4259, 1, '2019-07-16', 2, b'0', b'1', 1, 5, 30, 0),
(6, 'SCN-20190716-6', 3, 'ACN-20190716-6', 1, '2019-09-01', 'JOSIE NAVARRO', 'LOT. 11 BLK 3 ARAYAT ST\r\n', '2008-02-29', '12:00:00', 1, '3800.00', 4412, 1, '2019-07-16', 2, b'0', b'1', 1, 6, 29, 0),
(7, 'SCN-20190716-7', 4, 'ACN-20190716-7', 1, '2019-09-01', 'JUN KIM', 'LOT.1-3, BLK.7 MAYON ST', '1970-01-01', '12:00:00', 1, '3800.00', 11139, 1, '2019-07-16', 2, b'0', b'1', 1, 7, 13, 0),
(8, 'SCN-20190716-8', 5, 'ACN-20190716-8', 1, '2019-09-01', 'JUNG WOO CHUL', 'LOT 2 BLK 5 TAAL ST.', '2007-01-15', '12:00:00', 1, '3800.00', 12694, 1, '2019-07-16', 2, b'0', b'1', 1, 8, 25, 0),
(9, 'SCN-20190716-9', 7, 'ACN-20190716-9', 1, '2019-09-01', 'KATHERINE GRACE ALFONSO', 'LOT 7 BLK. 3 DON PEPE ST PHASE 2\r\n', '2015-02-12', '12:00:00', 1, '5000.00', 207, 1, '2019-07-16', 2, b'0', b'1', 1, 9, 157, 0),
(10, 'SCN-20190716-10', 8, 'ACN-20190716-10', 1, '2019-09-01', 'KIM JIN HONG ', 'LAZATIN\r\n', '2011-07-04', '12:00:00', 1, '3800.00', 1772, 1, '2019-07-16', 2, b'0', b'1', 1, 10, 95, 0),
(11, 'SCN-20190716-11', 9, 'ACN-20190716-11', 1, '2019-09-01', 'KYO KIM YOUNG', 'LOT 19, BLK.2 APO ST', '2010-04-23', '12:00:00', 1, '3800.00', 5655, 1, '2019-07-16', 2, b'0', b'1', 1, 11, 64, 0),
(12, 'SCN-20190716-12', 10, 'ACN-20190716-12', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'LOT 13 BLK. 3 KANLAON ST', '2017-03-01', '12:00:00', 1, '3800.00', 245, 1, '2019-07-16', 2, b'0', b'1', 1, 12, 163, 0),
(13, 'SCN-20190716-13', 10, 'ACN-20190716-13', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'LOT.13, BLK.3 KANLAON ST', '2007-01-09', '12:00:00', 1, '3800.00', 9471, 1, '2019-07-16', 2, b'0', b'1', 1, 13, 28, 0),
(14, 'SCN-20190716-14', 11, 'ACN-20190716-14', 1, '2019-09-01', 'LAURA MALONZO', 'LOT 10 BLK. 2 DON PEPE ST PHASE 2', '2014-11-24', '12:00:00', 1, '3800.00', 2342, 1, '2019-07-16', 2, b'0', b'1', 1, 14, 140, 0),
(15, 'SCN-20190716-15', 11, 'ACN-20190716-15', 1, '2019-09-01', 'LAURA MALONZO', 'LOT 10 BLK. 2 DON PEPE ST PHASE 2', '2015-09-04', '12:00:00', 1, '5000.00', 491, 1, '2019-07-16', 2, b'0', b'1', 1, 15, 151, 0),
(16, 'SCN-20190716-16', 12, 'ACN-20190716-16', 1, '2019-09-01', 'LEE HWA YOUNG', 'LAZATIN PHASE 2', '2014-01-17', '12:00:00', 1, '3800.00', 4116, 1, '2019-07-16', 2, b'0', b'1', 1, 16, 118, 0),
(17, 'SCN-20190716-17', 13, 'ACN-20190716-17', 1, '2019-09-01', 'LEE HYUN BAEK UNJIN', 'LOT 7, BLJ. 4 KANLAON ST', '2011-09-19', '12:00:00', 1, '3800.00', 7324, 1, '2019-07-16', 2, b'0', b'1', 1, 17, 98, 0),
(18, 'SCN-20190716-18', 14, 'ACN-20190716-18', 1, '2019-09-01', 'LEE YOUNG HEUNG', 'LOT.2,3, BLK.1 TAAL ST', '2007-07-19', '12:00:00', 1, '3800.00', 5367, 1, '2019-07-16', 2, b'0', b'1', 1, 18, 38, 0),
(19, 'SCN-20190716-19', 15, 'ACN-20190716-19', 1, '2019-09-01', 'LITO LAPID', 'LOT.3, BLK.4 NEGRON ST', '2009-08-26', '12:00:00', 1, '3800.00', 8217, 1, '2019-07-16', 2, b'0', b'1', 1, 19, 22, 0),
(20, 'SCN-20190716-20', 10, 'ACN-20190716-20', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "G", LOT 1H NEGRON ST PHASE 3', '2015-04-23', '12:00:00', 1, '3800.00', 1949, 1, '2019-07-16', 2, b'0', b'1', 1, 20, 100, 0),
(21, 'SCN-20190716-21', 10, 'ACN-20190716-21', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'LOT 6A, CN 2 ST. PHASE 3', '2016-03-09', '12:00:00', 1, '5000.00', 2037, 1, '2019-07-16', 2, b'0', b'1', 1, 21, 138, 0),
(22, 'SCN-20190716-22', 10, 'ACN-20190716-22', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "A", LOT 1H NEGRON ST PHASE 3', '2015-04-23', '12:00:00', 1, '3800.00', 1034, 1, '2019-07-16', 2, b'0', b'1', 1, 22, 109, 0),
(23, 'SCN-20190716-23', 10, 'ACN-20190716-23', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "C" LOT 1G NEGRON ST PHASE 3', '2015-04-23', '12:00:00', 1, '3800.00', 985, 1, '2019-07-16', 2, b'0', b'1', 1, 23, 111, 0),
(24, 'SCN-20190716-24', 10, 'ACN-20190716-24', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "J", CN4 ST PHASE 3', '2015-04-23', '12:00:00', 1, '0.00', 598, 1, '2019-07-16', 2, b'0', b'1', 1, 24, 119, 0),
(25, 'SCN-20190716-25', 10, 'ACN-20190716-25', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "E", LOT 1-G CN 4 ST PHASE 3', '2015-04-23', '12:00:00', 1, '3800.00', 1056, 1, '2019-07-16', 2, b'0', b'1', 1, 25, 122, 0),
(26, 'SCN-20190716-26', 10, 'ACN-20190716-26', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "B", LOT. 1-G NEGON ST PHASE 3', '2015-04-23', '12:00:00', 1, '3800.00', 1081, 1, '2019-07-16', 2, b'0', b'1', 1, 26, 113, 0),
(27, 'SCN-20190716-27', 10, 'ACN-20190716-27', 1, '2019-09-01', 'L.M HICKEY PROPERTIES', 'UNIT "F", CN4 ST PHASE 3', '2015-04-23', '12:00:00', 1, '3800.00', 988, 1, '2019-07-16', 2, b'0', b'1', 1, 27, 117, 0),
(28, 'SCN-20190716-28', 16, 'ACN-20190716-28', 1, '2019-09-01', 'LORETA NARCISCO', 'LOT 1 BLK.4 DON PEPE HENSON ST PHASE 2', '2017-10-03', '12:00:00', 1, '5000.00', 711, 1, '2019-07-16', 2, b'0', b'1', 1, 28, 171, 0),
(29, 'SCN-20190716-29', 17, 'ACN-20190716-29', 1, '2019-09-01', 'LOUIE NEPOMUCENO', 'LOT.2, BLK.6 NEGRON ST', '2010-11-18', '12:00:00', 1, '3800.00', 2528, 1, '2019-07-16', 2, b'0', b'1', 1, 29, 19, 0),
(30, 'SCN-20190716-30', 18, 'ACN-20190716-30', 1, '2019-09-01', 'LUKE LEE', 'LOT.4, BLK.1 APO ST', '2007-11-06', '12:00:00', 1, '0.00', 0, 1, '2019-07-16', 2, b'1', b'1', 1, 30, 44, 0),
(31, 'SCN-20190716-31', 19, 'ACN-20190716-31', 1, '2019-09-01', 'M.J. MASAYA CORPORATION', 'LOT 6, BLK. 5 TAAL ST', '2007-06-25', '12:00:00', 1, '3800.00', 8384, 1, '2019-07-16', 2, b'0', b'1', 1, 31, 27, 0),
(32, 'SCN-20190716-32', 20, 'ACN-20190716-32', 1, '2019-09-01', 'MANUEL SUAREZ', '2 - 6 VILLA MANUELA COMPOUND', '2010-01-25', '12:00:00', 1, '3800.00', 3261, 1, '2019-07-16', 2, b'0', b'1', 1, 32, 65, 0),
(33, 'SCN-20190716-33', 20, 'ACN-20190716-33', 1, '2019-09-01', 'MANUEL SUAREZ', '2 - 7 VILLA MANUELA COMPOUND', '2015-10-09', '12:00:00', 1, '5000.00', 8781, 1, '2019-07-16', 2, b'0', b'1', 1, 33, 66, 0),
(34, 'SCN-20190716-34', 20, 'ACN-20190716-34', 1, '2019-09-01', 'MANUEL SUAREZ', '2 - 9 VILLA MANUELA COMPOUND', '2010-01-25', '12:00:00', 1, '3800.00', 3615, 1, '2019-07-16', 2, b'0', b'1', 1, 34, 67, 0),
(35, 'SCN-20190716-35', 20, 'ACN-20190716-35', 1, '2019-09-01', 'MANUEL SUAREZ', '2 - 8 VILLA MANUELA COMPOUND', '2010-05-25', '12:00:00', 1, '3800.00', 3528, 1, '2019-07-16', 2, b'0', b'1', 1, 35, 69, 0),
(36, 'SCN-20190716-36', 20, 'ACN-20190716-36', 1, '2019-09-01', 'MANUEL SUAREZ', '4 - 4 VILLA MANUELA COMPOUND', '2012-05-28', '12:00:00', 1, '3800.00', 4335, 1, '2019-07-16', 2, b'0', b'1', 1, 36, 70, 0),
(37, 'SCN-20190716-37', 20, 'ACN-20190716-37', 1, '2019-09-01', 'MANUEL SUAREZ', '2-4 VILLA MANUELA', '2011-09-12', '12:00:00', 1, '3800.00', 4805, 1, '2019-07-16', 2, b'0', b'1', 1, 37, 79, 0),
(38, 'SCN-20190716-38', 20, 'ACN-20190716-38', 1, '2019-09-01', 'MANUEL SUAREZ', '2 - 1 VILLA MANUELA', '2014-11-11', '12:00:00', 1, '3800.00', 1295, 1, '2019-07-16', 2, b'0', b'1', 1, 38, 114, 0),
(39, 'SCN-20190716-39', 21, 'ACN-20190716-39', 1, '2019-09-01', 'MELISSA ANGELA HENSON', 'LOT 1 BLK. 8 DONA ROSALIA ST PHASE 2', '2018-11-16', '12:00:00', 1, '5000.00', 295, 1, '2019-07-16', 2, b'0', b'1', 1, 39, 183, 0),
(40, 'SCN-20190716-40', 22, 'ACN-20190716-40', 1, '2019-09-01', 'MELODY REYES', '2 - 5 VILLA MANUELA COMPOUND', '2017-03-03', '12:00:00', 1, '5000.00', 5458, 1, '2019-07-16', 2, b'0', b'1', 1, 40, 87, 0),
(41, 'SCN-20190716-41', 23, 'ACN-20190716-41', 1, '2019-09-01', 'MOO SEUNG LIM', 'LAZATIN', '2010-12-14', '12:00:00', 1, '3800.00', 1663, 1, '2019-07-16', 2, b'0', b'1', 1, 41, 84, 0),
(42, 'SCN-20190716-42', 24, 'ACN-20190716-42', 1, '2019-09-01', 'NANCY BURKE', 'LOT 6,BLK.2 ARAYAT ST', '2008-03-26', '12:00:00', 1, '3800.00', 4217, 1, '2019-07-16', 2, b'0', b'1', 1, 42, 31, 0),
(43, 'SCN-20190716-43', 25, 'ACN-20190716-43', 1, '2019-09-01', 'NARCISO BARBARRA', 'LOT 9, BLK. 2 APO ST', '2013-02-13', '12:00:00', 1, '3800.00', 1924, 1, '2019-07-16', 2, b'0', b'1', 1, 43, 112, 0),
(44, 'SCN-20190716-44', 26, 'ACN-20190716-44', 1, '2019-09-01', 'NUMERIANO PANGILINAN', 'LOT 1-2 BLK. 6 PINATUBO ST', '2018-02-15', '12:00:00', 1, '5000.00', 46, 1, '2019-07-16', 2, b'0', b'1', 1, 44, 173, 0),
(45, 'SCN-20190716-45', 26, 'ACN-20190716-45', 1, '2019-09-01', 'NUMERIANO PANGILINAN', 'LOT 2 BLK. 3 ARAYAT ST', '2018-02-15', '12:00:00', 1, '5000.00', 482, 1, '2019-07-16', 2, b'0', b'1', 1, 45, 172, 0),
(46, 'SCN-20190716-46', 27, 'ACN-20190716-46', 1, '2019-09-01', 'OK KWANG', 'LOT 1 BLK. 3 ARAYAT ST', '2014-11-27', '12:00:00', 1, '3800.00', 903, 1, '2019-07-16', 2, b'0', b'1', 1, 46, 144, 0),
(47, 'SCN-20190716-47', 27, 'ACN-20190716-47', 1, '2019-09-01', 'OK KWANG', 'LOT 1 BLK. 3 ARAYAT ST', '2014-11-27', '12:00:00', 1, '3800.00', 540, 1, '2019-07-16', 2, b'0', b'1', 1, 47, 141, 0),
(48, 'SCN-20190716-48', 27, 'ACN-20190716-48', 1, '2019-09-01', 'OK KWANG', 'LOT 1 BLK. 3 ARAYAT ST', '2014-11-27', '12:00:00', 1, '3800.00', 759, 1, '2019-07-16', 2, b'0', b'1', 1, 48, 142, 0),
(49, 'SCN-20190716-49', 27, 'ACN-20190716-49', 1, '2019-09-01', 'OK KWANG', 'LOT 1 BLK. 3 ARAYAT ST', '2014-11-27', '12:00:00', 1, '3800.00', 757, 1, '2019-07-16', 2, b'0', b'1', 1, 49, 143, 0),
(50, 'SCN-20190716-50', 28, 'ACN-20190716-50', 1, '2019-09-01', 'ORLEANS MALONES', 'LOT 5 BLK. 3 KANLAON ST', '2017-04-01', '12:00:00', 1, '5000.00', 190, 1, '2019-07-16', 2, b'0', b'1', 1, 50, 164, 0),
(51, 'SCN-20190716-51', 28, 'ACN-20190716-51', 1, '2019-09-01', 'ORLEANS MALONES', 'LOT.18-19, BLK. 5 NEGRON ST', '2008-08-01', '12:00:00', 1, '3800.00', 5474, 1, '2019-07-16', 2, b'0', b'1', 1, 51, 48, 0),
(52, 'SCN-20190716-52', 28, 'ACN-20190716-52', 1, '2019-09-01', 'ORLEANS MALONES', 'LOT. 3, BLK. 3 PINATUBO ST', '2009-11-12', '12:00:00', 1, '3800.00', 5501, 1, '2019-07-16', 2, b'0', b'1', 1, 52, 61, 0),
(53, 'SCN-20190716-53', 6, 'ACN-20190716-53', 1, '2019-09-01', 'A.V CONSTRUCTION', 'LOT 3 BLK. 2 APO ST', '2018-07-24', '12:00:00', 1, '5000.00', 250, 1, '2019-07-16', 3, b'0', b'1', 1, 53, 180, 0),
(54, 'SCN-20190716-54', 29, 'ACN-20190716-54', 1, '2019-09-01', 'PATRICIA NARCISO', 'LOT. 10, BLJ. 2 ARAYAT ST', '2014-08-05', '12:00:00', 1, '3800.00', 1862, 1, '2019-07-16', 2, b'0', b'1', 1, 54, 136, 0),
(55, 'SCN-20190716-55', 30, 'ACN-20190716-55', 1, '2019-09-01', 'ABEL DIZON', 'LOT 2-3 BLK. 16 DON PEPE ST', '2013-01-15', '12:00:00', 1, '3800.00', 1972, 1, '2019-07-16', 3, b'0', b'1', 1, 55, 110, 0),
(56, 'SCN-20190716-56', 31, 'ACN-20190716-56', 1, '2019-09-01', 'PATRICIA RATHMELL', 'LOT.24, BLK.6 MAYON ST', '2006-01-19', '12:00:00', 1, '3800.00', 5785, 1, '2019-07-16', 2, b'0', b'1', 1, 56, 2, 0),
(57, 'SCN-20190716-57', 32, 'ACN-20190716-57', 1, '2019-09-01', 'RAFAEL JESUS DEL ROSARIO', 'LOT 7 BLK. 2 DON MARIANO ST PHASE 2', '2018-11-15', '12:00:00', 1, '5000.00', 496, 1, '2019-07-16', 2, b'0', b'1', 1, 57, 182, 0),
(58, 'SCN-20190716-58', 32, 'ACN-20190716-58', 1, '2019-09-01', 'RAFAEL JESUS DEL ROSARIO', 'LOT 6 BLK. 8 DON PEPE ST PHASE 2', '2019-01-16', '12:00:00', 1, '5000.00', 0, 1, '2019-07-16', 2, b'1', b'1', 1, 58, 186, 0),
(59, 'SCN-20190716-59', 32, 'ACN-20190716-59', 1, '2019-09-01', 'RAFAEL JESUS DEL ROSARIO', 'LOT 1 BLK. 2 DON MARIANO ST PHASE 2', '2017-09-18', '12:00:00', 1, '5000.00', 1599, 1, '2019-07-16', 2, b'0', b'1', 1, 59, 170, 0),
(60, 'SCN-20190716-60', 33, 'ACN-20190716-60', 1, '2019-09-01', 'RAMON FRANCISCO KATIGBAK MD', 'LOT 6 BLK. 4 DON PEPE ST PHASE 2', '2018-07-04', '12:00:00', 1, '5000.00', 305, 1, '2019-07-16', 2, b'0', b'1', 1, 60, 178, 0),
(61, 'SCN-20190716-61', 34, 'ACN-20190716-61', 1, '2019-09-01', 'RAOUL PAOLO HENSON', 'LOT 1, BLK. 2 APO ST', '2012-07-09', '12:00:00', 1, '3800.00', 1552, 1, '2019-07-16', 2, b'0', b'1', 1, 61, 106, 0),
(62, 'SCN-20190716-62', 35, 'ACN-20190716-62', 1, '2019-09-01', 'RAUL NARCISO', 'LOT 8 BLK. 3 DON PEPE ST PHASE 2', '2018-02-27', '12:00:00', 1, '5000.00', 807, 1, '2019-07-16', 2, b'0', b'1', 1, 62, 174, 0),
(63, 'SCN-20190716-63', 36, 'ACN-20190716-63', 1, '2019-09-01', 'RAYMOND SUAREZ', 'RAYMOND SUAREZ RAYMOND SUAREZ 4 - 8 VILLA MANUELA COMPOUND', '2010-05-25', '12:00:00', 1, '3800.00', 3026, 1, '2019-07-16', 2, b'0', b'1', 1, 63, 71, 0),
(64, 'SCN-20190716-64', 36, 'ACN-20190716-64', 1, '2019-09-01', 'RAYMOND SUAREZ', '4 - 9 VILLA MANUELA COMPOUND', '2010-05-25', '12:00:00', 1, '3800.00', 3495, 1, '2019-07-16', 2, b'0', b'1', 1, 64, 72, 0),
(65, 'SCN-20190716-65', 37, 'ACN-20190716-65', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT 2 BLK. 1 APO ST', '2019-03-11', '12:00:00', 1, '5000.00', 544, 1, '2019-07-16', 2, b'0', b'1', 1, 65, 187, 0),
(66, 'SCN-20190716-66', 37, 'ACN-20190716-66', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT 2 BLK. 1 APO ST', '2017-05-29', '12:00:00', 1, '5000.00', 1441, 1, '2019-07-16', 2, b'0', b'1', 1, 66, 166, 0),
(67, 'SCN-20190716-67', 37, 'ACN-20190716-67', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT 3 BLK. 1 APO ST', '2017-09-15', '12:00:00', 1, '5000.00', 553, 1, '2019-07-16', 2, b'0', b'1', 1, 67, 169, 0),
(68, 'SCN-20190716-68', 37, 'ACN-20190716-68', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT.1, BLK.1 APO ST', '2007-02-26', '12:00:00', 1, '3800.00', 19427, 1, '2019-07-16', 2, b'0', b'1', 1, 68, 45, 0),
(69, 'SCN-20190716-69', 37, 'ACN-20190716-69', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT.3 BLK.1 APO ST', '2008-10-20', '12:00:00', 1, '3800.00', 9226, 1, '2019-07-16', 2, b'0', b'1', 1, 69, 51, 0),
(70, 'SCN-20190716-70', 37, 'ACN-20190716-70', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT.5, BLK.1 APO ST', '2008-05-24', '12:00:00', 1, '3800.00', 5916, 1, '2019-07-16', 2, b'0', b'1', 1, 70, 43, 0),
(71, 'SCN-20190716-71', 37, 'ACN-20190716-71', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT 9A, BLK. 4 TAAL ST', '2008-11-25', '12:00:00', 1, '3800.00', 3026, 1, '2019-07-16', 2, b'0', b'1', 1, 71, 53, 0),
(72, 'SCN-20190716-72', 37, 'ACN-20190716-72', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT  4, BLK. 1 APO ST(REPLACEMENT 0720417)', '2008-10-20', '12:00:00', 1, '3800.00', 6198, 1, '2019-07-16', 2, b'0', b'1', 1, 72, 77, 0),
(73, 'SCN-20190716-73', 37, 'ACN-20190716-73', 1, '2019-09-01', 'REENCHA CORPORATION', 'LOT 2, BLK. 1 APO ST', '2010-07-08', '12:00:00', 1, '3800.00', 1966, 1, '2019-07-16', 2, b'0', b'1', 1, 73, 78, 0),
(74, 'SCN-20190716-74', 38, 'ACN-20190716-74', 1, '2019-09-01', 'REY CARILLO', 'LOT.8, BLK.5 NEGRON ST', '2008-11-20', '12:00:00', 1, '3800.00', 0, 1, '2019-07-16', 2, b'0', b'1', 1, 74, 52, 0),
(75, 'SCN-20190716-75', 39, 'ACN-20190716-75', 1, '2019-09-01', 'ROMMEL YUSON', 'LOT.22, BLK.6 MAYON ST', '2006-12-07', '12:00:00', 1, '3800.00', 2612, 1, '2019-07-16', 2, b'0', b'1', 1, 75, 4, 0),
(76, 'SCN-20190716-76', 40, 'ACN-20190716-76', 1, '2019-09-01', 'ROMULO POLICARPIO', 'LOY 11 BLK. 15 DON PEPE ST PHASE 2', '2019-01-14', '12:00:00', 1, '5000.00', 316, 1, '2019-07-16', 2, b'0', b'1', 1, 76, 185, 0),
(77, 'SCN-20190716-77', 41, 'ACN-20190716-77', 1, '2019-09-01', 'ADRIAN RATHMELL', 'LOT.23, BLK.6 MAYON ST', '2007-01-24', '12:00:00', 1, '3800.00', 2721, 1, '2019-07-16', 3, b'0', b'1', 1, 77, 3, 0),
(78, 'SCN-20190716-78', 41, 'ACN-20190716-78', 1, '2019-09-01', 'ADRIAN RATHMELL', 'LOT 1F CN 4 PHASE 3', '2016-05-03', '12:00:00', 1, '3800.00', 1478, 1, '2019-07-16', 3, b'0', b'1', 1, 78, 108, 0),
(79, 'SCN-20190716-79', 42, 'ACN-20190716-79', 1, '2019-09-01', 'SANG MI HAN', 'LOT.1, BLK.1 TAAL ST', '2007-02-06', '12:00:00', 1, '3800.00', 8266, 1, '2019-07-16', 2, b'0', b'1', 1, 79, 41, 0),
(80, 'SCN-20190716-80', 41, 'ACN-20190716-80', 1, '2019-09-01', 'ADRIAN RATHMELL', 'LOT 1F-1 CN 4 ST PHASE 3', '2013-07-13', '12:00:00', 1, '3800.00', 2698, 1, '2019-07-16', 3, b'0', b'1', 1, 80, 123, 0),
(81, 'SCN-20190716-81', 43, 'ACN-20190716-81', 1, '2019-09-01', 'SEE MIN PARK', 'LOT.7, BLK.7 MAYON ST', '2008-04-08', '12:00:00', 1, '3800.00', 7582, 1, '2019-07-16', 2, b'0', b'1', 1, 81, 7, 0),
(82, 'SCN-20190716-82', 41, 'ACN-20190716-82', 1, '2019-09-01', 'ADRIAN RATHMELL', 'LOT 1F RESIDENCE CN 4 ST. PHASE 3', '2013-07-26', '12:00:00', 1, '3800.00', 3390, 1, '2019-07-16', 3, b'0', b'1', 1, 82, 124, 0),
(83, 'SCN-20190716-83', 44, 'ACN-20190716-83', 1, '2019-09-01', 'SELL 4 ANGELES CORPORATION', 'LOT.10, BLK. 3 KANLAON ST', '2010-10-27', '12:00:00', 1, '3800.00', 934, 1, '2019-07-16', 2, b'0', b'1', 1, 83, 80, 0),
(84, 'SCN-20190716-84', 41, 'ACN-20190716-84', 1, '2019-09-01', 'ADRIAN RATHMELL', 'LOT 1F CN4 ST P3  (REPLACEMENT 1104839)', '2016-02-01', '12:00:00', 1, '3800.00', 0, 1, '2019-07-16', 3, b'1', b'1', 1, 84, 153, 0),
(85, 'SCN-20190716-85', 44, 'ACN-20190716-85', 1, '2019-09-01', 'SELL 4 ANGELES CORPORATION', 'LOT.10, BLK.3 KANLAON ST', '2010-10-27', '12:00:00', 1, '3800.00', 2996, 1, '2019-07-16', 2, b'0', b'1', 1, 85, 81, 0),
(86, 'SCN-20190716-86', 45, 'ACN-20190716-86', 1, '2019-09-01', 'SIRIN SUAT', 'LOT 12 BLK. 2 ARAYAT ST', '2015-11-12', '12:00:00', 1, '5000.00', 1517, 1, '2019-07-16', 2, b'0', b'1', 1, 86, 152, 0),
(87, 'SCN-20190716-87', 46, 'ACN-20190716-87', 1, '2019-09-01', 'SONIA / PETER STUBLEY', 'LOT.12, BLK.6 MAYON ST', '2007-12-28', '12:00:00', 1, '3800.00', 2617, 1, '2019-07-16', 2, b'0', b'1', 1, 87, 10, 0),
(88, 'SCN-20190716-88', 47, 'ACN-20190716-88', 1, '2019-09-01', 'AHN AND CHUN CORPORATION " A "', 'LOT 1 BLK. 7 MAYON ST', '2015-07-09', '12:00:00', 1, '5000.00', 650, 1, '2019-07-16', 3, b'0', b'1', 1, 88, 149, 0),
(89, 'SCN-20190716-89', 48, 'ACN-20190716-89', 1, '2019-09-01', 'SOTERO SUNGA', 'LOT. 1-2, BLK. 1, APO ST', '2014-08-22', '12:00:00', 1, '3800.00', 1366, 1, '2019-07-16', 2, b'0', b'1', 1, 89, 137, 0),
(90, 'SCN-20190716-90', 49, 'ACN-20190716-90', 1, '2019-09-01', 'SUNG KYU CHOI', 'LOT 9, BLK. 4 TAAL ST', '2008-06-17', '12:00:00', 1, '3800.00', 2278, 1, '2019-07-16', 2, b'0', b'1', 1, 90, 33, 0),
(91, 'SCN-20190716-91', 47, 'ACN-20190716-91', 1, '2019-09-01', 'AHN AND CHUN CORPORATION " B "', 'LOT 1 BLK. 7 MAYON ST', '2015-07-09', '12:00:00', 1, '5000.00', 1151, 1, '2019-07-16', 3, b'0', b'1', 1, 91, 148, 0),
(92, 'SCN-20190716-92', 47, 'ACN-20190716-92', 1, '2019-09-01', 'AHN AND CHUN CORPORATION " C "', 'LOT 1 BLK. 7 MAYON ST', '2015-07-09', '12:00:00', 1, '5000.00', 771, 1, '2019-07-16', 3, b'0', b'1', 1, 92, 150, 0),
(93, 'SCN-20190716-93', 50, 'ACN-20190716-93', 1, '2019-09-01', 'SUNG KYU WOO ', 'LOT 1 BLK 5 TAAL ST.', '2007-03-29', '12:00:00', 1, '3800.00', 11616, 1, '2019-07-16', 2, b'0', b'1', 1, 93, 24, 0),
(94, 'SCN-20190716-94', 47, 'ACN-20190716-94', 1, '2019-09-01', 'AHN AND CHUN CORPORATION " D "', 'LOT 1 BLK. 7 MAYON ST', '2015-07-09', '12:00:00', 1, '5000.00', 1426, 1, '2019-07-16', 3, b'0', b'1', 1, 94, 139, 0),
(95, 'SCN-20190716-95', 51, 'ACN-20190716-95', 1, '2019-09-01', 'TRIXIE HENSON', 'LOT 7 BLK. 16 DON PEPE ST PHASE 2', '2017-07-18', '12:00:00', 1, '5000.00', 848, 1, '2019-07-16', 2, b'0', b'1', 1, 95, 168, 0),
(96, 'SCN-20190716-96', 52, 'ACN-20190716-96', 1, '2019-09-01', 'AMANDO A. GOMEZ', 'LOT.9, BLK.6 MAYON ST', '2008-03-19', '12:00:00', 1, '3800.00', 3182, 1, '2019-07-16', 3, b'0', b'1', 1, 96, 14, 0),
(97, 'SCN-20190716-97', 53, 'ACN-20190716-97', 1, '2019-09-01', 'VENCIO MACATANGAY', 'LOT 3 BLK. 2 PINATUBO ST', '2011-02-25', '12:00:00', 1, '3800.00', 6125, 1, '2019-07-16', 2, b'0', b'1', 1, 97, 92, 0),
(98, 'SCN-20190716-98', 54, 'ACN-20190716-98', 1, '2019-09-01', 'AMIRAY TOMER', 'LOT 14 BLK. 2 ARAYAT ST', '2015-07-01', '12:00:00', 1, '5000.00', 1585, 1, '2019-07-16', 3, b'0', b'1', 1, 98, 147, 0),
(99, 'SCN-20190716-99', 55, 'ACN-20190716-99', 1, '2019-09-01', 'WURI CONSTRUCTION', 'LOT 5G CN3 ST PHASE 3', '2018-05-24', '12:00:00', 1, '5000.00', 545, 1, '2019-07-16', 2, b'0', b'1', 1, 99, 177, 0),
(100, 'SCN-20190716-100', 56, 'ACN-20190716-100', 1, '2019-09-01', 'ANNA MARIA TINIO', 'LOT.14, BLK.6 MAYON ST', '2008-03-15', '12:00:00', 1, '3800.00', 3304, 1, '2019-07-16', 3, b'0', b'1', 1, 100, 11, 0),
(101, 'SCN-20190716-101', 58, 'ACN-20190716-101', 1, '2019-09-01', 'ANNESTER MAXWELL', 'LOT 3, BLK. 13 DON SEVERINO ST PHASE 2', '2013-11-06', '12:00:00', 1, '3800.00', 2248, 1, '2019-07-16', 3, b'0', b'1', 1, 101, 130, 0),
(102, 'SCN-20190716-102', 59, 'ACN-20190716-102', 1, '2019-09-01', 'ANTHONY JOSE PANGILINAN', 'LOT 9 BLK. 16 DON MARIANO ST PHASE 2', '2018-07-10', '12:00:00', 1, '5000.00', 674, 1, '2019-07-16', 3, b'0', b'1', 1, 102, 179, 0),
(103, 'SCN-20190716-103', 57, 'ACN-20190716-103', 1, '2019-09-01', 'YOUNG CHANG INC LEE HYUN JOUNG "A"', 'LOT 4 BLK. 3 ARAYAT ST', '2013-11-25', '12:00:00', 1, '3800.00', 2772, 1, '2019-07-16', 2, b'0', b'1', 1, 103, 134, 0),
(104, 'SCN-20190716-104', 57, 'ACN-20190716-104', 1, '2019-09-01', 'YOUNG CHANG INC LEE HYUN JOUNG  "B"\r\n', 'LOT 4 BLK. 3 ARAYAT ST', '2013-11-25', '12:00:00', 1, '3800.00', 1866, 1, '2019-07-16', 2, b'0', b'1', 1, 104, 133, 0),
(105, 'SCN-20190716-105', 60, 'ACN-20190716-105', 1, '2019-09-01', 'ANTONIO VEERSTEG', 'LOT.15-17, BLK.5 NEGRON ST', '2007-10-24', '12:00:00', 1, '3800.00', 7486, 1, '2019-07-16', 3, b'0', b'1', 1, 105, 16, 0),
(106, 'SCN-20190716-106', 57, 'ACN-20190716-106', 1, '2019-09-01', 'YOUNG CHANG INC LEE HYUN JOUNG  "C"\r\n', 'LOT 4 BLK. 3 ARAYAT ST', '2013-11-25', '12:00:00', 1, '3800.00', 2045, 1, '2019-07-16', 2, b'0', b'1', 1, 106, 131, 0),
(107, 'SCN-20190716-107', 61, 'ACN-20190716-107', 1, '2019-09-01', 'ARLENE MARIANO', 'LOT. 19, BLK. 6 MAYON ST', '2009-09-14', '12:00:00', 1, '3800.00', 2003, 1, '2019-07-16', 3, b'0', b'1', 1, 107, 58, 0),
(108, 'SCN-20190716-108', 57, 'ACN-20190716-108', 1, '2019-09-01', 'YOUNG CHANG INC LEE HYUN JOUNG  "D"\r\n', 'LOT 4 BLK. 3 ARAYAT ST', '2013-11-25', '12:00:00', 1, '3800.00', 1611, 1, '2019-07-16', 2, b'0', b'1', 1, 108, 132, 0),
(109, 'SCN-20190716-109', 61, 'ACN-20190716-109', 1, '2019-09-01', 'ARLENE MARIANO', 'LOT. 19, BLK. 6 MAYON ST', '2016-01-22', '12:00:00', 1, '5000.00', 922, 1, '2019-07-16', 3, b'0', b'1', 1, 109, 145, 0),
(110, 'SCN-20190716-110', 62, 'ACN-20190716-110', 1, '2019-09-01', 'YOUNG TAK LA', 'LOT 7 BLK 5 TAAL ST.', '2007-01-16', '12:00:00', 1, '3800.00', 6547, 1, '2019-07-16', 2, b'0', b'1', 1, 110, 26, 0),
(111, 'SCN-20190716-111', 63, 'ACN-20190716-111', 1, '2019-09-01', 'ARLYN VILLANUEVA', 'LOT. 5 BLK. 4 KANLAON ST', '2017-05-09', '12:00:00', 1, '5000.00', 1331, 1, '2019-07-16', 3, b'0', b'1', 1, 111, 165, 0),
(112, 'SCN-20190716-112', 64, 'ACN-20190716-112', 1, '2019-09-01', 'BERNARDUS HUIRNE', 'LOT.18,19, BLK.5 NEGRON ST', '2007-02-06', '12:00:00', 1, '0.00', 0, 1, '2019-07-16', 3, b'1', b'1', 1, 112, 15, 0),
(113, 'SCN-20190716-113', 65, 'ACN-20190716-113', 1, '2019-09-01', 'BIENVENIDO PATING', 'LOT 2 BLK. 2 APO ST', '2016-12-02', '12:00:00', 1, '5000.00', 1323, 1, '2019-07-16', 3, b'0', b'1', 1, 113, 158, 0),
(114, 'SCN-20190716-114', 66, 'ACN-20190716-114', 1, '2019-09-01', 'BRENDAN MECCHIA', 'LOT 5, BLK. 5 TAAL ST.', '2012-06-13', '12:00:00', 1, '3800.00', 1825, 1, '2019-07-16', 3, b'0', b'1', 1, 114, 105, 0),
(115, 'SCN-20190716-115', 67, 'ACN-20190716-115', 1, '2019-09-01', 'BRESDIN PHILIP', 'LOT 4, BLK. 5 TAAL ST', '2013-04-06', '12:00:00', 1, '3800.00', 2530, 1, '2019-07-16', 3, b'0', b'1', 1, 115, 116, 0),
(116, 'SCN-20190716-116', 68, 'ACN-20190716-116', 1, '2019-09-01', 'BUY 4 ANGELES CORP.', 'LOT 8,BLK. 3 KANLAON ST.', '2010-03-18', '12:00:00', 1, '3800.00', 5206, 1, '2019-07-16', 3, b'0', b'1', 1, 116, 63, 0),
(117, 'SCN-20190716-117', 69, 'ACN-20190716-117', 1, '2019-09-01', 'CATHY ALQUERO', 'LOT 2 BLK 2 ARAYAT ST', '2018-03-02', '12:00:00', 1, '5000.00', 849, 1, '2019-07-16', 3, b'0', b'1', 1, 117, 175, 0),
(118, 'SCN-20190716-118', 70, 'ACN-20190716-118', 1, '2019-09-01', 'CHON HYUN KIM', 'LOT 4,5, BLK.1 TAAL ST', '2007-07-19', '12:00:00', 1, '3800.00', 3328, 1, '2019-07-16', 3, b'0', b'1', 1, 118, 35, 0),
(119, 'SCN-20190716-119', 70, 'ACN-20190716-119', 1, '2019-09-01', 'CHON HYUN KIM', 'LOT 4,5, BLK.1 TAAL ST', '2007-07-19', '12:00:00', 1, '3800.00', 3686, 1, '2019-07-16', 3, b'0', b'1', 1, 119, 34, 0),
(120, 'SCN-20190716-120', 71, 'ACN-20190716-120', 1, '2019-09-01', 'CHRISTINE ANGELA CONTE', 'LOT 17 BLK. 6 MAYON ST', '2013-04-18', '12:00:00', 1, '3800.00', 1247, 1, '2019-07-16', 3, b'0', b'1', 1, 120, 115, 0),
(121, 'SCN-20190716-121', 71, 'ACN-20190716-121', 1, '2019-09-01', 'CHRISTINE ANGELA CONTE', ' LOT 5- I CN 2 ST PHASE 3 UNIT A ', '2017-09-12', '12:00:00', 1, '5000.00', 348, 1, '2019-07-16', 3, b'0', b'1', 1, 121, 156, 0),
(122, 'SCN-20190716-122', 71, 'ACN-20190716-122', 1, '2019-09-01', 'CHRISTINE ANGELA CONTE', ' LOT 5 - I CN 2 ST  PHASE 3 UNIT B', '2017-02-08', '12:00:00', 1, '5000.00', 722, 1, '2019-07-16', 3, b'0', b'1', 1, 122, 161, 0),
(123, 'SCN-20190716-123', 71, 'ACN-20190716-123', 1, '2019-09-01', 'CHRISTINE ANGELA CONTE', ' LOT 2 BLK 5 DONA FRANCISCA ST PHASE 2', '2014-03-06', '12:00:00', 1, '3800.00', 2131, 1, '2019-07-16', 3, b'0', b'1', 1, 123, 135, 0),
(124, 'SCN-20190716-124', 72, 'ACN-20190716-124', 1, '2019-09-01', 'CHUL WOO  JONG', 'LOT 5 BLK. 2 DON MARIANO ST PHASE 2', '2018-08-09', '12:00:00', 1, '5000.00', 98, 1, '2019-07-16', 3, b'0', b'1', 1, 124, 181, 0),
(125, 'SCN-20190716-125', 73, 'ACN-20190716-125', 1, '2019-09-01', 'CRESENCIA  DAVID', 'LOT 1 C CN4 ST PHASE 3', '2018-12-19', '12:00:00', 1, '5000.00', 191, 1, '2019-07-16', 3, b'0', b'1', 1, 125, 184, 0),
(126, 'SCN-20190716-126', 74, 'ACN-20190716-126', 1, '2019-09-01', 'DAE WOON LEE', 'LOT. 1-3, BLK. 7 MAYON ST', '2007-11-05', '12:00:00', 1, '3800.00', 7795, 1, '2019-07-16', 3, b'0', b'1', 1, 126, 12, 0),
(127, 'SCN-20190716-127', 75, 'ACN-20190716-127', 1, '2019-09-01', 'DANIEL DIZON', 'LOT 20, BLK. 2 ARAYAT ST', '2012-09-21', '12:00:00', 1, '3800.00', 8469, 1, '2019-07-16', 3, b'0', b'1', 1, 127, 107, 0),
(128, 'SCN-20190716-128', 75, 'ACN-20190716-128', 1, '2019-09-01', 'DANIEL DIZON', 'LOT. 3, HOUSE C FRIENDSHIP HI-WAY', '2009-02-19', '12:00:00', 1, '3800.00', 4034, 1, '2019-07-16', 3, b'0', b'1', 1, 128, 55, 0),
(129, 'SCN-20190716-129', 75, 'ACN-20190716-129', 1, '2019-09-01', 'DANIEL DIZON', 'LOT 3, HOUSE B FRIENDSHIP HI-WAY', '2009-02-19', '12:00:00', 1, '3800.00', 3170, 1, '2019-07-16', 3, b'0', b'1', 1, 129, 56, 0),
(130, 'SCN-20190716-130', 75, 'ACN-20190716-130', 1, '2019-09-01', 'DANIEL DIZON', 'LOT. 3, HOUSE A FRIENDSHIP HI-WAY', '2009-02-19', '12:00:00', 1, '3800.00', 7051, 1, '2019-07-16', 3, b'0', b'1', 1, 130, 54, 0),
(131, 'SCN-20190716-131', 75, 'ACN-20190716-131', 1, '2019-09-01', 'DANIEL DIZON', 'LOT.7, BLK.2 APO ST', '2007-06-19', '12:00:00', 1, '3800.00', 3962, 1, '2019-07-16', 3, b'0', b'1', 1, 131, 42, 0),
(132, 'SCN-20190716-132', 76, 'ACN-20190716-132', 1, '2019-09-01', 'EDGARDO TUQUERO', 'LOT 4, BLK. 2 APO ST.', '2016-03-02', '12:00:00', 1, '5000.00', 2411, 1, '2019-07-16', 3, b'0', b'1', 1, 132, 154, 0),
(133, 'SCN-20190716-133', 77, 'ACN-20190716-133', 1, '2019-09-01', 'EDWARD ALQUERO', 'LOT 15 BLK 6 MAYON ST', '2018-03-02', '12:00:00', 1, '5000.00', 545, 1, '2019-07-16', 3, b'0', b'1', 1, 133, 176, 0),
(134, 'SCN-20190716-134', 78, 'ACN-20190716-134', 1, '2019-09-01', 'ELIZA YUEN', 'LOT.11-14, BLK.5 NEGRON ST', '2007-03-29', '12:00:00', 1, '3800.00', 11445, 1, '2019-07-16', 3, b'0', b'1', 1, 134, 17, 0),
(135, 'SCN-20190716-135', 79, 'ACN-20190716-135', 1, '2019-09-01', 'ESTER B. CLARETE', 'LOT. 1, BLK. 2 PINATUBO ST', '2011-12-20', '12:00:00', 1, '3800.00', 3115, 1, '2019-07-16', 3, b'0', b'1', 1, 135, 102, 0),
(136, 'SCN-20190716-136', 80, 'ACN-20190716-136', 1, '2019-09-01', 'EUN SOOK KANG', 'LOT.10, BLK.5 NEGRON ST', '2007-02-21', '12:00:00', 1, '3800.00', 9930, 1, '2019-07-16', 3, b'0', b'1', 1, 136, 18, 0),
(137, 'SCN-20190716-137', 80, 'ACN-20190716-137', 1, '2019-09-01', 'EUN SOOK KANG', 'LOT 11-14, BLOCK 5 NEGRON ST.', '2008-07-10', '12:00:00', 1, '2000.00', 0, 1, '2019-07-16', 3, b'0', b'1', 1, 137, 47, 0),
(138, 'SCN-20190716-138', 80, 'ACN-20190716-138', 1, '2019-09-01', 'EUN SOOK KANG', 'LOT 6, BLK. 6 NEGRON ST', '2010-11-30', '12:00:00', 1, '3800.00', 4033, 1, '2019-07-16', 3, b'0', b'1', 1, 138, 85, 0),
(139, 'SCN-20190716-139', 80, 'ACN-20190716-139', 1, '2019-09-01', 'EUN SOOK KANG', 'LOT 10, BLK. 6 MAYON ST', '2010-12-10', '12:00:00', 1, '3800.00', 1726, 1, '2019-07-16', 3, b'0', b'1', 1, 139, 82, 0),
(140, 'SCN-20190716-140', 80, 'ACN-20190716-140', 1, '2019-09-01', 'EUN SOOK KANG', 'LOT 11, BLK. 6 MAYON ST', '2010-12-10', '12:00:00', 1, '3800.00', 2110, 1, '2019-07-16', 3, b'0', b'1', 1, 140, 83, 0),
(141, 'SCN-20190716-141', 80, 'ACN-20190716-141', 1, '2019-09-01', 'EUN SOOK KANG', 'LOT 6 BLK. 6 NEGRON ST', '2010-05-21', '12:00:00', 1, '3800.00', 4368, 1, '2019-07-16', 3, b'0', b'1', 1, 141, 68, 0),
(142, 'SCN-20190716-142', 81, 'ACN-20190716-142', 1, '2019-09-01', 'FIRST ANGLO-SCOT DEVT. INC', 'LOT 6D - 6C NEGRON ST FRIENDSHIP PLAZA 3', '2011-12-06', '12:00:00', 1, '3800.00', 5869, 1, '2019-07-16', 3, b'0', b'1', 1, 142, 101, 0),
(143, 'SCN-20190716-143', 81, 'ACN-20190716-143', 1, '2019-09-01', 'FIRST ANGLO-SCOT DEVT. INC', 'LOT 6B CN1 ST PHASE 3', '2013-05-23', '12:00:00', 1, '3800.00', 4344, 1, '2019-07-16', 3, b'0', b'1', 1, 143, 120, 0),
(144, 'SCN-20190716-144', 81, 'ACN-20190716-144', 1, '2019-09-01', 'FIRST ANGLO-SCOT DEVT. INC', 'LOT 6E CN2 ST PHASE 3', '2013-05-23', '12:00:00', 1, '3800.00', 9973, 1, '2019-07-16', 3, b'0', b'1', 1, 144, 121, 0),
(145, 'SCN-20190716-145', 82, 'ACN-20190716-145', 1, '2019-09-01', 'FLORDELISA NEMOTO', 'LOT 3-5, BLK.6 PINATUBO ST', '2011-01-03', '12:00:00', 1, '3800.00', 27032, 1, '2019-07-16', 3, b'0', b'1', 1, 145, 86, 0),
(146, 'SCN-20190716-146', 82, 'ACN-20190716-146', 1, '2019-09-01', 'FLORDELISA NEMOTO', 'LOT 1 BLK. 3 ARAYAT ST', '2011-05-21', '12:00:00', 1, '3800.00', 6199, 1, '2019-07-16', 3, b'0', b'1', 1, 146, 94, 0),
(147, 'SCN-20190716-147', 83, 'ACN-20190716-147', 1, '2019-09-01', 'FRANCIS DAVID', 'LOT.13, BLK.6 MAYON ST', '2007-12-28', '12:00:00', 1, '3800.00', 1559, 1, '2019-07-16', 3, b'0', b'1', 1, 147, 9, 0),
(148, 'SCN-20190716-148', 84, 'ACN-20190716-148', 1, '2019-09-01', 'FRIENDSHIP CLUB', 'LOT 1 - 2, BLK.5 TAAL ST.', '2015-05-04', '12:00:00', 1, '5000.00', 2493, 1, '2019-07-16', 3, b'0', b'1', 1, 148, 146, 0),
(149, 'SCN-20190716-149', 85, 'ACN-20190716-149', 1, '2019-09-01', 'GRACE DIZON', 'LOT. 18, BLK.2 ARAYAT ST', '2008-10-13', '12:00:00', 1, '3800.00', 5529, 1, '2019-07-16', 3, b'0', b'1', 1, 149, 49, 0),
(150, 'SCN-20190716-150', 85, 'ACN-20190716-150', 1, '2019-09-01', 'GRACE DIZON', 'LOT. 17, BLK. 2 APO ST', '2009-12-14', '12:00:00', 1, '3800.00', 2595, 1, '2019-07-16', 3, b'0', b'1', 1, 150, 62, 0),
(151, 'SCN-20190716-151', 85, 'ACN-20190716-151', 1, '2019-09-01', 'GRACE DIZON', 'LOT. 17, BLK. 2 APO ST.', '2010-05-29', '12:00:00', 1, '3800.00', 2202, 1, '2019-07-16', 3, b'0', b'1', 1, 151, 73, 0),
(152, 'SCN-20190716-152', 85, 'ACN-20190716-152', 1, '2019-09-01', 'GRACE DIZON', 'LOT. 15, BLK. 2 APO ST', '2010-05-29', '12:00:00', 1, '3800.00', 3515, 1, '2019-07-16', 3, b'0', b'1', 1, 152, 74, 0),
(153, 'SCN-20190716-153', 85, 'ACN-20190716-153', 1, '2019-09-01', 'GRACE DIZON', 'LOT. 15, BLK. 2 APO ST', '2010-05-29', '12:00:00', 1, '3800.00', 2855, 1, '2019-07-16', 3, b'0', b'1', 1, 153, 75, 0),
(154, 'SCN-20190716-154', 86, 'ACN-20190716-154', 1, '2019-09-01', 'GRACE TYLER', 'LOT 1D CN 4 ST PHASE 3', '2016-07-28', '12:00:00', 1, '5000.00', 1042, 1, '2019-07-16', 3, b'0', b'1', 1, 154, 155, 0),
(155, 'SCN-20190716-155', 86, 'ACN-20190716-155', 1, '2019-09-01', 'GRACE TYLER', 'LOT.4-6, BLK.7 MAYON ST', '2007-11-14', '12:00:00', 1, '3800.00', 10535, 1, '2019-07-16', 3, b'0', b'1', 1, 155, 8, 0),
(156, 'SCN-20190716-156', 86, 'ACN-20190716-156', 1, '2019-09-01', 'GRACE TYLER', 'LOT.4-6, BLK. 7 MAYON ST', '2009-03-02', '12:00:00', 1, '3800.00', 0, 1, '2019-07-16', 3, b'0', b'1', 1, 156, 59, 0),
(157, 'SCN-20190716-157', 87, 'ACN-20190716-157', 1, '2019-09-01', 'HA SOOK YEON', 'LOT. 4, BLK. 4 NEGRON ST', '2009-09-24', '12:00:00', 1, '3800.00', 14948, 1, '2019-07-16', 3, b'0', b'1', 1, 157, 60, 0),
(158, 'SCN-20190716-158', 88, 'ACN-20190716-158', 1, '2019-09-01', 'HWA YEONG LEE', 'LEE HWA YEONG CONDO LAZATIN P2', '2013-10-17', '12:00:00', 1, '3800.00', 1871, 1, '2019-07-16', 3, b'0', b'1', 1, 158, 128, 0),
(159, 'SCN-20190716-159', 88, 'ACN-20190716-159', 1, '2019-09-01', 'HWA YEONG LEE', 'LEE HWA CONDO LAZATIN PHASE 2', '2013-10-17', '12:00:00', 1, '3800.00', 1488, 1, '2019-07-16', 3, b'0', b'1', 1, 159, 129, 0),
(160, 'SCN-20190716-160', 89, 'ACN-20190716-160', 1, '2019-09-01', 'HYUK BOO KWON', 'LOT.2,3, BLK.1 TAAL ST', '2007-07-19', '12:00:00', 1, '3800.00', 2786, 1, '2019-07-16', 3, b'0', b'1', 1, 160, 40, 0),
(161, 'SCN-20190716-161', 90, 'ACN-20190716-161', 1, '2019-09-01', 'HYUN LEE', 'LOT 7, BLK. 4 KANLAON ST', '2012-03-19', '12:00:00', 1, '3800.00', 2111, 1, '2019-07-16', 3, b'0', b'1', 1, 161, 104, 0),
(162, 'SCN-20190716-162', 91, 'ACN-20190716-162', 1, '2019-09-01', 'ICK SWIMMING POOL SHIN DONG', 'LOT. 4, BLK.1 TAAL ST', '2007-02-13', '12:00:00', 1, '3800.00', 3451, 1, '2019-07-16', 3, b'0', b'1', 1, 162, 37, 0),
(163, 'SCN-20190716-163', 70, 'ACN-20190716-163', 1, '2019-09-01', 'ICK UNIT B SHIN DONG', 'LOT.2,3, BLK. 1 TAAL ST', '2007-07-19', '12:00:00', 1, '3800.00', 12047, 1, '2019-07-16', 3, b'0', b'1', 1, 163, 39, 0),
(164, 'SCN-20190716-164', 70, 'ACN-20190716-164', 1, '2019-09-01', 'ICK UNIT D SHIN DONG', 'LOT.4,5, BLK.1 TAAL ST', '2007-07-19', '12:00:00', 1, '3800.00', 2235, 1, '2019-07-16', 3, b'0', b'1', 1, 164, 36, 0),
(165, 'SCN-20190716-165', 92, 'ACN-20190716-165', 1, '2019-09-01', 'IL KYU PARK', 'LAZATIN', '2011-02-10', '12:00:00', 1, '3800.00', 1454, 1, '2019-07-16', 3, b'0', b'1', 1, 165, 91, 0),
(166, 'SCN-20190716-166', 92, 'ACN-20190716-166', 1, '2019-09-01', 'IL KYU PARK', 'LOT 3, BLK. 5 TAAL ST', '2011-10-04', '12:00:00', 1, '3800.00', 2070, 1, '2019-07-16', 3, b'0', b'1', 1, 166, 99, 0),
(167, 'SCN-20190716-167', 93, 'ACN-20190716-167', 1, '2019-09-01', 'IRISH CALAGUAS', 'LOT 8, BLK. 2 ARAYAT ST', '2010-06-22', '12:00:00', 1, '3800.00', 5035, 1, '2019-07-16', 3, b'0', b'1', 1, 167, 76, 0),
(168, 'SCN-20190716-168', 94, 'ACN-20190716-168', 1, '2019-09-01', 'IRMINA LAI', 'LOT 5 A NEGRON ST PHASE 3', '2017-03-16', '12:00:00', 1, '5000.00', 612, 1, '2019-07-16', 3, b'0', b'1', 1, 168, 162, 0),
(169, 'SCN-20190716-169', 94, 'ACN-20190716-169', 1, '2019-09-01', 'IRMINA LAI', 'LOT.20,BLK.6 MAYON ST', '2007-01-30', '12:00:00', 1, '3800.00', 1455, 1, '2019-07-16', 3, b'0', b'1', 1, 169, 6, 0),
(170, 'SCN-20190716-170', 94, 'ACN-20190716-170', 1, '2019-09-01', 'IRMINA LAI', 'LOT. 21, BLK. 6 MAYON ST', '2007-07-11', '12:00:00', 1, '3800.00', 1762, 1, '2019-07-16', 3, b'0', b'1', 1, 170, 5, 0),
(171, 'SCN-20190716-171', 95, 'ACN-20190716-171', 1, '2019-09-01', 'JAIME MALLARI', 'LOT.1, BLK.6 NEGRON ST', '2008-03-31', '12:00:00', 1, '3800.00', 0, 1, '2019-07-16', 3, b'0', b'1', 1, 171, 20, 0),
(172, 'SCN-20190716-172', 96, 'ACN-20190716-172', 1, '2019-09-01', 'JAMES FRANCIS GREER JR', 'LOT 1 BLK. 5 DONA FRANCISCA ST P2', '2017-11-02', '12:00:00', 1, '5000.00', 1112, 1, '2019-07-16', 3, b'0', b'1', 1, 172, 160, 0),
(173, 'SCN-20190716-173', 97, 'ACN-20190716-173', 1, '2019-09-01', 'JANICE CORRES', 'LOT. 2, BLK. 3 KANLAON ST', '2008-09-05', '12:00:00', 1, '3800.00', 0, 1, '2019-07-16', 3, b'0', b'1', 1, 173, 50, 0),
(174, 'SCN-20190716-174', 98, 'ACN-20190716-174', 1, '2019-09-01', 'JEONG SEONG HO', 'LAZATIN', '2011-02-10', '12:00:00', 1, '3800.00', 1204, 1, '2019-07-16', 3, b'0', b'1', 1, 174, 89, 0),
(175, 'SCN-20190716-175', 99, 'ACN-20190716-175', 1, '2019-09-01', 'JERALYN HICKEY', 'LOT.9, BLK.5 NEGRON ST', '2008-02-27', '12:00:00', 1, '3800.00', 4599, 1, '2019-07-16', 3, b'0', b'1', 1, 175, 21, 0),
(176, 'SCN-20190716-176', 100, 'ACN-20190716-176', 1, '2019-09-01', 'JIN HONG KIM', 'LAZATIN  AREA', '2013-04-17', '12:00:00', 1, '3800.00', 4963, 1, '2019-07-16', 3, b'0', b'1', 1, 176, 57, 0),
(177, 'SCN-20190716-177', 101, 'ACN-20190716-177', 1, '2019-09-01', 'JOEL B. GUILLAR', 'LOT 4, BLK. 2 ARAYAT ST', '2007-05-21', '12:00:00', 1, '3800.00', 5513, 1, '2019-07-16', 3, b'0', b'1', 1, 177, 32, 0),
(178, 'SCN-20190716-178', 102, 'ACN-20190716-178', 1, '2019-09-01', 'JOHN CC. TEE', 'LOT 1-E CN4 ST PHASE 3', '2013-08-21', '12:00:00', 1, '3800.00', 1302, 1, '2019-07-16', 3, b'0', b'1', 1, 178, 127, 0),
(179, 'SCN-20190716-179', 103, 'ACN-20190716-179', 1, '2019-09-01', 'JON BOOG PARK', 'LAZATIN', '2011-02-10', '12:00:00', 1, '3800.00', 2045, 1, '2019-07-16', 3, b'0', b'1', 1, 179, 90, 0),
(180, 'SCN-20190716-180', 104, 'ACN-20190716-180', 1, '2019-09-01', 'JONG CHUL WOO', 'LOT 5 BLK. 2 DON MARIANO ST PHASE 2', '2017-08-01', '12:00:00', 1, '5000.00', 485, 1, '2019-07-16', 3, b'0', b'1', 1, 180, 167, 0),
(181, 'SCN-20190716-181', 105, 'ACN-20190716-181', 1, '2019-09-01', 'JORDAN DAVID', 'PHASE 2', '2011-04-30', '12:00:00', 1, '3800.00', 0, 1, '2019-07-16', 3, b'0', b'1', 1, 181, 93, 0),
(182, 'SCN-20190916-182', 35, 'ACN-20190916-182', 1, '2019-09-01', 'RAUL NARCISO', 'LOT 9 BLK. 3 DON PEPE ST PHASE 2\r\n', '2019-05-04', '00:00:00', 1, '5000.00', 172, 1, '2019-09-16', 3, b'0', b'1', 1, 182, 188, 0),
(183, 'SCN-20190916-183', 106, 'ACN-20190916-183', 1, '2019-09-01', 'DOK YUN HAHN', 'LOT 4 BLK. 2 DON MARIANO ST PHASE 2', '2019-05-09', '00:00:00', 1, '5000.00', 4, 1, '2019-09-16', 3, b'0', b'1', 1, 183, 189, 0),
(184, 'SCN-20190916-184', 106, 'ACN-20190916-184', 1, '2019-09-01', 'DOK YUN HAHN', 'LOT 4 BLK. 2 DON MARIANO ST PHASE 2', '2019-05-09', '00:00:00', 1, '5000.00', 8, 1, '2019-09-16', 3, b'0', b'1', 1, 184, 190, 0),
(185, 'SCN-20190916-185', 34, 'ACN-20190916-185', 1, '2019-09-01', 'RAOUL PAOLO HENSON', 'LOT 10 BLK. 15 DON PEPE ST PHASE 2\r\n', '2019-05-14', '00:00:00', 1, '5000.00', 94, 1, '2019-09-16', 3, b'0', b'1', 1, 185, 191, 0),
(186, 'SCN-20190916-186', 32, 'ACN-20190916-186', 1, '2019-09-01', 'RAFAEL JESUS DEL ROSARIO', 'LOT 6 BLK. 8 DON PEPE ST PHASE 2', '2019-05-31', '00:00:00', 1, '3000.00', 219, 1, '2019-09-16', 3, b'0', b'1', 1, 186, 192, 0),
(187, 'SCN-20190916-187', 107, 'ACN-20190916-187', 1, '2019-09-01', 'LORDALYN SANTIAGO', 'LOT 6 BLK. 1 DONA MANUELA ST PHASE 2\r\n', '2019-06-07', '00:00:00', 1, '5000.00', 54, 1, '2019-09-16', 3, b'0', b'1', 1, 187, 193, 0),
(188, 'SCN-20190916-188', 108, 'ACN-20190916-188', 1, '2019-09-01', 'BENJAMIN NARCISO', 'LOT 9 BLK. 2 DONA MANUELA ST PHASE 2\r\n', '2019-07-06', '00:00:00', 1, '5000.00', 42, 1, '2019-09-16', 3, b'0', b'1', 1, 188, 194, 0),
(189, 'SCN-20190916-189', 109, 'ACN-20190916-189', 1, '2019-09-01', 'SUNJI AND GOO', 'LOT 9 BLK. 3 ARAYAT ST\r\n', '2019-07-08', '00:00:00', 1, '5000.00', 65, 1, '2019-09-16', 3, b'0', b'1', 1, 189, 195, 0),
(190, 'SCN-20190916-190', 110, 'ACN-20190916-190', 1, '2019-09-01', 'IMELDA CHO', 'LOT 1 BLK. 7 DON ANGEL ST PHASE 2\r\n', '2019-07-15', '00:00:00', 1, '5000.00', 32, 1, '2019-09-16', 3, b'0', b'1', 1, 190, 196, 0),
(191, 'SCN-20190916-191', 71, 'ACN-20190916-191', 1, '2019-09-01', 'CHRISTINE ANGELA CONTE', ' LOT 3 BLK. 5 DON MARIANO ST PHASE 2\r\n', '2019-08-17', '00:00:00', 1, '5000.00', 1, 1, '2019-09-16', 3, b'0', b'1', 1, 191, 197, 0),
(192, 'SCN-20191003-192', 32, 'ACN-20191003-192', 1, '2019-09-01', 'RAFAEL JESUS DEL ROSARIO', 'Lot 6 Blk 8 Don Pepe St. Phase 2', '1970-01-01', '00:00:00', 1, '0.00', 0, 1, '2019-10-03', 3, b'0', b'1', 1, 192, 199, 0),
(193, 'SCN-20191003-193', 111, 'ACN-20191003-193', 1, '2019-09-01', 'Kim Moung Ho', 'Lazatin Phase 2\r\n', '1970-01-01', '00:00:00', 1, '0.00', 0, 1, '2019-10-03', 3, b'0', b'1', 1, 193, 198, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_connection_batch`
--

CREATE TABLE `service_connection_batch` (
  `service_connection_batch_id` bigint(20) NOT NULL,
  `start_date` date DEFAULT '0000-00-00',
  `end_date` date DEFAULT '0000-00-00',
  `batch_code` varchar(145) DEFAULT '',
  `batch_total_deposit` decimal(20,2) DEFAULT '0.00',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `posted_by_user_id` bigint(20) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_disconnection`
--

CREATE TABLE `service_disconnection` (
  `disconnection_id` bigint(20) NOT NULL,
  `disconnection_code` varchar(445) DEFAULT '',
  `connection_id` bigint(20) DEFAULT '0',
  `service_date` date DEFAULT '0000-00-00',
  `due_date` date DEFAULT '0000-00-00',
  `date_disconnection_date` date DEFAULT '0000-00-00',
  `disconnection_reason_id` int(11) DEFAULT '0',
  `disconnection_notes` varchar(45) DEFAULT '',
  `date_created` date DEFAULT '0000-00-00',
  `created_by` int(12) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `service_no` varchar(255) DEFAULT NULL,
  `previous_id` bigint(20) DEFAULT '0',
  `previous_status_id` bigint(20) DEFAULT '0',
  `previous_month` varchar(145) DEFAULT '0',
  `previous_reading` bigint(20) DEFAULT '0',
  `last_meter_reading` bigint(20) DEFAULT '0',
  `total_consumption` bigint(20) DEFAULT '0',
  `rate_amount` decimal(20,2) DEFAULT '0.00',
  `meter_amount_due` decimal(20,2) DEFAULT '0.00',
  `penalty_amount` decimal(20,2) DEFAULT '0.00',
  `charges_amount` decimal(20,2) DEFAULT '0.00',
  `grand_total_amount` decimal(20,2) DEFAULT '0.00',
  `default_matrix_id` bigint(20) DEFAULT '0',
  `is_fixed` bit(1) DEFAULT b'0',
  `arrears_amount` decimal(20,2) DEFAULT '0.00',
  `arrears_penalty_amount` decimal(20,2) DEFAULT '0.00',
  `remaining_deposit` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_disconnection_charges`
--

CREATE TABLE `service_disconnection_charges` (
  `service_disconnection_charge_id` bigint(20) NOT NULL,
  `disconnection_id` bigint(20) DEFAULT '0',
  `other_charge_id` int(12) DEFAULT '0',
  `other_charge_item_id` int(12) DEFAULT '0',
  `charge_id` int(12) DEFAULT '0',
  `charge_unit_id` int(12) DEFAULT '0',
  `charge_amount` decimal(20,2) DEFAULT '0.00',
  `charge_qty` decimal(20,2) DEFAULT '0.00',
  `charge_line_total` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_invoice`
--

CREATE TABLE `service_invoice` (
  `service_invoice_id` bigint(20) NOT NULL,
  `service_invoice_no` varchar(75) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_amount_after_discount` decimal(20,4) DEFAULT '0.0000',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_due` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `remarks` text,
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `contact_person` varchar(175) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_invoice_items`
--

CREATE TABLE `service_invoice_items` (
  `service_item_id` bigint(25) NOT NULL,
  `service_invoice_id` bigint(25) DEFAULT '0',
  `service_id` int(11) DEFAULT '0',
  `service_unit` int(11) DEFAULT '0',
  `service_price` decimal(25,2) DEFAULT '0.00',
  `service_qty` int(11) DEFAULT '0',
  `service_line_total` decimal(25,2) DEFAULT '0.00',
  `service_line_total_after_global` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_reconnection`
--

CREATE TABLE `service_reconnection` (
  `reconnection_id` bigint(20) NOT NULL,
  `reconnection_code` varchar(255) DEFAULT NULL,
  `service_date` date DEFAULT '0000-00-00',
  `disconnection_id` bigint(20) DEFAULT '0',
  `date_connection_target` date DEFAULT '0000-00-00',
  `time_connection_target` varchar(255) DEFAULT NULL,
  `rate_type_id` int(12) DEFAULT '0',
  `date_created` date DEFAULT '0000-00-00',
  `created_by` int(12) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_unit`
--

CREATE TABLE `service_unit` (
  `service_unit_id` int(11) NOT NULL,
  `service_unit_name` varchar(255) DEFAULT NULL,
  `service_unit_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL,
  `sex_name` varchar(45) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`sex_id`, `sex_name`, `is_active`, `is_deleted`) VALUES
(1, 'Male', b'1', b'0'),
(2, 'Female', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `soa_settings`
--

CREATE TABLE `soa_settings` (
  `soa_settings_id` bigint(20) NOT NULL,
  `soa_account_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soa_settings`
--

INSERT INTO `soa_settings` (`soa_settings_id`, `soa_account_id`) VALUES
(1, 5),
(2, 6),
(3, 59);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(12) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`, `is_active`, `is_deleted`) VALUES
(1, 'New Meter', b'1', b'0'),
(2, 'Connected', b'1', b'0'),
(3, 'Disconnected', b'1', b'0'),
(4, 'Reconnected', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` bigint(20) NOT NULL,
  `supplier_code` varchar(125) DEFAULT '',
  `supplier_name` varchar(255) DEFAULT '',
  `contact_name` varchar(255) DEFAULT '',
  `contact_person` varchar(155) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email_address` varchar(255) DEFAULT '',
  `contact_no` varchar(255) DEFAULT '',
  `tin_no` varchar(255) DEFAULT '',
  `term` varchar(255) DEFAULT '',
  `tax_type_id` int(11) DEFAULT '1',
  `photo_path` varchar(500) DEFAULT '',
  `total_payable_amount` decimal(19,2) DEFAULT '0.00',
  `posted_by_user` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `credit_limit` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `deleted_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `tax_output` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_code`, `supplier_name`, `contact_name`, `contact_person`, `address`, `email_address`, `contact_no`, `tin_no`, `term`, `tax_type_id`, `photo_path`, `total_payable_amount`, `posted_by_user`, `date_created`, `date_modified`, `credit_limit`, `is_deleted`, `is_active`, `deleted_by_user`, `date_deleted`, `tax_output`) VALUES
(1, 'N/A', 'N/A', '', '', '', '', '', '', '', 1, '', '0.00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, b'0', b'1', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_photos`
--

CREATE TABLE `supplier_photos` (
  `photo_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT '0',
  `photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax_types`
--

CREATE TABLE `tax_types` (
  `tax_type_id` int(11) NOT NULL,
  `tax_type` varchar(155) DEFAULT '',
  `tax_rate` decimal(11,2) DEFAULT '0.00',
  `description` varchar(555) DEFAULT '',
  `is_default` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax_types`
--

INSERT INTO `tax_types` (`tax_type_id`, `tax_type`, `tax_rate`, `description`, `is_default`, `is_deleted`) VALUES
(1, 'Non-vat', '0.00', '', b'0', b'0'),
(2, 'Vatted', '12.00', '', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `trans_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT '0',
  `trans_key_id` bigint(20) DEFAULT NULL,
  `trans_type_id` bigint(20) DEFAULT NULL,
  `trans_log` varchar(745) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`trans_id`, `user_id`, `trans_key_id`, `trans_type_id`, `trans_log`, `trans_date`) VALUES
(1, 1, 1, 43, 'Created User: jamiesigua', '2019-10-04 11:10:45'),
(2, 1, 1, 43, 'Created User: jeromeaquino', '2019-10-04 11:11:18'),
(3, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-07 10:25:07'),
(4, 0, 10, 43, 'Login Attempt using username: admin', '2019-10-07 16:20:08'),
(5, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-07 16:20:10'),
(6, 1, 2, 43, 'Change the Password of : Jerome Aquino ID(5)', '2019-10-07 16:30:32'),
(7, 1, 2, 43, 'Updated User : jeromeroque ID(5)', '2019-10-07 16:30:49'),
(8, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-10 14:08:42'),
(9, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-10 14:09:42'),
(10, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 08:43:09'),
(11, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:07:17'),
(12, 0, 10, 43, 'Login Attempt using username: jdev', '2019-10-22 10:10:25'),
(13, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 10:10:29'),
(14, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:10:58'),
(15, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 10:12:30'),
(16, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:12:34'),
(17, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 10:12:49'),
(18, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:12:56'),
(19, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 10:14:34'),
(20, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:14:41'),
(21, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 10:15:36'),
(22, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:15:46'),
(23, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 10:17:44'),
(24, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 10:17:49'),
(25, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 10:18:43'),
(26, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 13:08:00'),
(27, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 13:08:03'),
(28, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:08:29'),
(29, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 13:08:34'),
(30, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 13:08:44'),
(31, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:08:45'),
(32, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:08:46'),
(33, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:08:55'),
(34, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 13:10:00'),
(35, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:30:23'),
(36, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:30:25'),
(37, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:30:31'),
(38, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 13:30:35'),
(39, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:30:53'),
(40, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:54:59'),
(41, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:55:31'),
(42, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 13:55:43'),
(43, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-10-22 13:55:52'),
(44, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:56:44'),
(45, 0, 10, 43, 'Login Attempt using username: ', '2019-10-22 13:58:06'),
(46, 0, 10, 43, 'Login Attempt using username: admin', '2019-10-22 13:58:11'),
(47, 1, 6, 43, 'User Log in: System Administrator  ', '2019-10-22 17:51:09'),
(48, 4, 6, 43, 'User Log in: Jamie  Sigua', '2019-11-05 09:47:34'),
(49, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-05 10:31:29'),
(50, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-05 13:59:13'),
(51, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-1', '2019-11-05 14:30:18'),
(52, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-2', '2019-11-05 14:35:20'),
(53, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-3', '2019-11-05 14:42:14'),
(54, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-4', '2019-11-05 14:47:14'),
(55, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-5', '2019-11-05 14:52:14'),
(56, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-6', '2019-11-05 15:00:27'),
(57, 1, 1, 79, 'Created New Batch Meter Reading: BCH-201910-7', '2019-11-05 15:06:38'),
(58, 1, 11, 80, 'Process Billing (October 2019)', '2019-11-05 15:12:49'),
(59, 0, 10, 43, 'Login Attempt using username: joash', '2019-11-05 16:39:21'),
(60, 1, 2, 73, 'Updated Residential Rate Matrix: ID(1)', '2019-11-05 17:03:22'),
(61, 1, 2, 73, 'Updated Residential Rate Matrix: ID(1)', '2019-11-05 17:04:26'),
(62, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-11-05 17:05:05'),
(63, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-06 09:38:41'),
(64, 0, 10, 43, 'Login Attempt using username: admin', '2019-11-06 11:33:34'),
(65, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-06 11:33:38'),
(66, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-11-06 11:38:43'),
(67, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 14:20:10'),
(68, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 14:20:13'),
(69, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 14:20:22'),
(70, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 14:20:24'),
(71, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-06 14:22:50'),
(72, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-11-06 14:24:06'),
(73, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-06 14:24:11'),
(74, 1, 11, 80, 'Process Billing (October 2019)', '2019-11-06 14:26:12'),
(75, 1, 1, 81, 'Created New Billing Payment: (1)', '2019-11-06 14:27:27'),
(76, 1, 2, 73, 'Updated Residential Rate Matrix: ID(1)', '2019-11-06 14:35:01'),
(77, 1, 11, 80, 'Process Billing (October 2019)', '2019-11-06 14:35:30'),
(78, 1, 1, 81, 'Created New Billing Payment: (1)', '2019-11-06 14:37:59'),
(79, 1, 1, 81, 'Created New Billing Payment: (2)', '2019-11-06 14:38:14'),
(80, 1, 1, 81, 'Created New Billing Payment: (3)', '2019-11-06 14:38:32'),
(81, 1, 1, 81, 'Created New Billing Payment: (4)', '2019-11-06 14:38:49'),
(82, 1, 1, 81, 'Created New Billing Payment: (5)', '2019-11-06 14:39:46'),
(83, 1, 1, 81, 'Created New Billing Payment: (6)', '2019-11-06 14:40:01'),
(84, 1, 1, 81, 'Created New Billing Payment: (7)', '2019-11-06 14:40:15'),
(85, 1, 1, 81, 'Created New Billing Payment: (8)', '2019-11-06 14:41:14'),
(86, 1, 1, 81, 'Created New Billing Payment: (9)', '2019-11-06 14:45:28'),
(87, 1, 1, 81, 'Created New Billing Payment: (10)', '2019-11-06 14:46:10'),
(88, 1, 1, 81, 'Created New Billing Payment: (11)', '2019-11-06 14:47:51'),
(89, 1, 1, 81, 'Created New Billing Payment: (12)', '2019-11-06 14:48:17'),
(90, 1, 1, 81, 'Created New Billing Payment: (13)', '2019-11-06 14:48:34'),
(91, 1, 1, 81, 'Created New Billing Payment: (14)', '2019-11-06 14:48:50'),
(92, 1, 1, 81, 'Created New Billing Payment: (15)', '2019-11-06 14:49:10'),
(93, 1, 1, 81, 'Created New Billing Payment: (16)', '2019-11-06 14:49:21'),
(94, 1, 1, 81, 'Created New Billing Payment: (17)', '2019-11-06 14:49:34'),
(95, 1, 1, 81, 'Created New Billing Payment: (18)', '2019-11-06 14:50:07'),
(96, 1, 1, 81, 'Created New Billing Payment: (19)', '2019-11-06 14:50:27'),
(97, 1, 1, 81, 'Created New Billing Payment: (20)', '2019-11-06 14:50:45'),
(98, 1, 1, 81, 'Created New Billing Payment: (21)', '2019-11-06 14:51:07'),
(99, 1, 1, 81, 'Created New Billing Payment: (22)', '2019-11-06 14:51:18'),
(100, 1, 1, 81, 'Created New Billing Payment: (23)', '2019-11-06 14:51:53'),
(101, 1, 1, 81, 'Created New Billing Payment: (24)', '2019-11-06 14:52:52'),
(102, 1, 1, 81, 'Created New Billing Payment: (25)', '2019-11-06 14:56:42'),
(103, 1, 1, 81, 'Created New Billing Payment: (26)', '2019-11-06 14:57:47'),
(104, 1, 1, 81, 'Created New Billing Payment: (27)', '2019-11-06 14:58:08'),
(105, 1, 1, 81, 'Created New Billing Payment: (28)', '2019-11-06 14:58:31'),
(106, 1, 1, 81, 'Created New Billing Payment: (29)', '2019-11-06 14:58:51'),
(107, 1, 1, 81, 'Created New Billing Payment: (30)', '2019-11-06 14:59:10'),
(108, 1, 1, 81, 'Created New Billing Payment: (31)', '2019-11-06 14:59:23'),
(109, 1, 1, 81, 'Created New Billing Payment: (32)', '2019-11-06 14:59:53'),
(110, 1, 1, 81, 'Created New Billing Payment: (33)', '2019-11-06 15:02:40'),
(111, 1, 1, 81, 'Created New Billing Payment: (34)', '2019-11-06 15:02:56'),
(112, 1, 1, 81, 'Created New Billing Payment: (35)', '2019-11-06 15:03:19'),
(113, 1, 1, 81, 'Created New Billing Payment: (36)', '2019-11-06 15:03:34'),
(114, 1, 1, 81, 'Created New Billing Payment: (37)', '2019-11-06 15:03:48'),
(115, 1, 1, 81, 'Created New Billing Payment: (38)', '2019-11-06 15:03:59'),
(116, 1, 1, 81, 'Created New Billing Payment: (39)', '2019-11-06 15:04:14'),
(117, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 16:36:35'),
(118, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 16:36:44'),
(119, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 16:36:51'),
(120, 0, 10, 43, 'Login Attempt using username: joashnoble', '2019-11-06 16:36:54'),
(121, 1, 1, 43, 'Created User: joashnoble', '2019-11-06 16:37:29'),
(122, 6, 6, 43, 'User Log in: Joash  Noble', '2019-11-06 16:37:33'),
(123, 6, 1, 81, 'Created New Billing Payment: (40)', '2019-11-06 16:40:44'),
(124, 6, 1, 81, 'Created New Billing Payment: (41)', '2019-11-06 16:41:59'),
(125, 6, 1, 81, 'Created New Billing Payment: (42)', '2019-11-06 16:42:19'),
(126, 6, 1, 81, 'Created New Billing Payment: (43)', '2019-11-06 16:43:45'),
(127, 6, 1, 81, 'Created New Billing Payment: (44)', '2019-11-06 16:44:20'),
(128, 6, 1, 81, 'Created New Billing Payment: (45)', '2019-11-06 16:44:53'),
(129, 1, 1, 81, 'Created New Billing Payment: (46)', '2019-11-06 16:45:38'),
(130, 6, 1, 81, 'Created New Billing Payment: (47)', '2019-11-06 16:45:44'),
(131, 1, 1, 81, 'Created New Billing Payment: (48)', '2019-11-06 16:45:58'),
(132, 6, 1, 81, 'Created New Billing Payment: (49)', '2019-11-06 16:46:00'),
(133, 1, 1, 81, 'Created New Billing Payment: (50)', '2019-11-06 16:46:10'),
(134, 1, 1, 81, 'Created New Billing Payment: (51)', '2019-11-06 16:46:42'),
(135, 1, 1, 81, 'Created New Billing Payment: (52)', '2019-11-06 16:47:22'),
(136, 1, 1, 81, 'Created New Billing Payment: (53)', '2019-11-06 16:47:37'),
(137, 1, 1, 81, 'Created New Billing Payment: (54)', '2019-11-06 16:48:08'),
(138, 1, 1, 81, 'Created New Billing Payment: (55)', '2019-11-06 16:48:22'),
(139, 6, 1, 81, 'Created New Billing Payment: (56)', '2019-11-06 16:48:34'),
(140, 1, 1, 81, 'Created New Billing Payment: (57)', '2019-11-06 16:48:38'),
(141, 1, 1, 81, 'Created New Billing Payment: (58)', '2019-11-06 16:48:53'),
(142, 6, 1, 81, 'Created New Billing Payment: (59)', '2019-11-06 16:48:59'),
(143, 1, 1, 81, 'Created New Billing Payment: (60)', '2019-11-06 16:49:10'),
(144, 6, 1, 81, 'Created New Billing Payment: (61)', '2019-11-06 16:49:13'),
(145, 6, 1, 81, 'Created New Billing Payment: (62)', '2019-11-06 16:49:24'),
(146, 6, 1, 81, 'Created New Billing Payment: (63)', '2019-11-06 16:49:38'),
(147, 1, 1, 81, 'Created New Billing Payment: (64)', '2019-11-06 16:49:44'),
(148, 6, 1, 81, 'Created New Billing Payment: (65)', '2019-11-06 16:50:00'),
(149, 1, 1, 81, 'Created New Billing Payment: (66)', '2019-11-06 16:50:07'),
(150, 6, 1, 81, 'Created New Billing Payment: (67)', '2019-11-06 16:50:21'),
(151, 1, 1, 81, 'Created New Billing Payment: (68)', '2019-11-06 16:50:24'),
(152, 1, 1, 81, 'Created New Billing Payment: (69)', '2019-11-06 16:50:41'),
(153, 6, 1, 81, 'Created New Billing Payment: (70)', '2019-11-06 16:50:44'),
(154, 6, 1, 81, 'Created New Billing Payment: (71)', '2019-11-06 16:51:04'),
(155, 1, 1, 81, 'Created New Billing Payment: (72)', '2019-11-06 16:51:08'),
(156, 6, 1, 81, 'Created New Billing Payment: (73)', '2019-11-06 16:51:29'),
(157, 1, 1, 81, 'Created New Billing Payment: (74)', '2019-11-06 16:51:40'),
(158, 6, 1, 81, 'Created New Billing Payment: (75)', '2019-11-06 16:51:52'),
(159, 1, 1, 81, 'Created New Billing Payment: (76)', '2019-11-06 16:52:04'),
(160, 1, 1, 81, 'Created New Billing Payment: (77)', '2019-11-06 16:52:23'),
(161, 1, 1, 81, 'Created New Billing Payment: (78)', '2019-11-06 16:53:16'),
(162, 6, 1, 81, 'Created New Billing Payment: (79)', '2019-11-06 16:53:25'),
(163, 1, 1, 81, 'Created New Billing Payment: (80)', '2019-11-06 16:53:29'),
(164, 6, 1, 81, 'Created New Billing Payment: (81)', '2019-11-06 16:53:40'),
(165, 1, 1, 81, 'Created New Billing Payment: (82)', '2019-11-06 16:53:43'),
(166, 1, 1, 81, 'Created New Billing Payment: (83)', '2019-11-06 16:53:58'),
(167, 6, 1, 81, 'Created New Billing Payment: (84)', '2019-11-06 16:54:04'),
(168, 1, 1, 81, 'Created New Billing Payment: (85)', '2019-11-06 16:54:16'),
(169, 1, 1, 81, 'Created New Billing Payment: (86)', '2019-11-06 16:54:41'),
(170, 1, 1, 81, 'Created New Billing Payment: (87)', '2019-11-06 16:55:00'),
(171, 1, 1, 81, 'Created New Billing Payment: (88)', '2019-11-06 16:55:13'),
(172, 1, 1, 81, 'Created New Billing Payment: (89)', '2019-11-06 16:55:23'),
(173, 1, 1, 81, 'Created New Billing Payment: (90)', '2019-11-06 16:55:34'),
(174, 6, 1, 81, 'Created New Billing Payment: (91)', '2019-11-06 16:55:37'),
(175, 6, 1, 81, 'Created New Billing Payment: (92)', '2019-11-06 16:55:54'),
(176, 6, 1, 81, 'Created New Billing Payment: (93)', '2019-11-06 16:56:08'),
(177, 1, 1, 81, 'Created New Billing Payment: (94)', '2019-11-06 16:56:18'),
(178, 6, 1, 81, 'Created New Billing Payment: (95)', '2019-11-06 16:56:21'),
(179, 1, 1, 81, 'Created New Billing Payment: (96)', '2019-11-06 16:56:34'),
(180, 1, 1, 81, 'Created New Billing Payment: (97)', '2019-11-06 16:56:46'),
(181, 1, 1, 81, 'Created New Billing Payment: (98)', '2019-11-06 16:57:03'),
(182, 1, 1, 81, 'Created New Billing Payment: (99)', '2019-11-06 16:57:15'),
(183, 6, 1, 81, 'Created New Billing Payment: (100)', '2019-11-06 16:57:16'),
(184, 1, 1, 81, 'Created New Billing Payment: (101)', '2019-11-06 16:57:32'),
(185, 1, 1, 81, 'Created New Billing Payment: (102)', '2019-11-06 16:57:47'),
(186, 1, 1, 81, 'Created New Billing Payment: (103)', '2019-11-06 16:57:58'),
(187, 1, 1, 81, 'Created New Billing Payment: (104)', '2019-11-06 16:58:13'),
(188, 1, 1, 81, 'Created New Billing Payment: (105)', '2019-11-06 16:58:42'),
(189, 6, 1, 81, 'Created New Billing Payment: (106)', '2019-11-06 16:58:47'),
(190, 1, 1, 81, 'Created New Billing Payment: (107)', '2019-11-06 16:58:57'),
(191, 6, 1, 81, 'Created New Billing Payment: (108)', '2019-11-06 16:59:01'),
(192, 1, 1, 81, 'Created New Billing Payment: (109)', '2019-11-06 16:59:07'),
(193, 6, 1, 81, 'Created New Billing Payment: (110)', '2019-11-06 16:59:16'),
(194, 6, 1, 81, 'Created New Billing Payment: (111)', '2019-11-06 16:59:27'),
(195, 1, 1, 81, 'Created New Billing Payment: (112)', '2019-11-06 16:59:36'),
(196, 6, 1, 81, 'Created New Billing Payment: (113)', '2019-11-06 16:59:44'),
(197, 1, 1, 81, 'Created New Billing Payment: (114)', '2019-11-06 16:59:46'),
(198, 1, 1, 81, 'Created New Billing Payment: (115)', '2019-11-06 16:59:57'),
(199, 6, 1, 81, 'Created New Billing Payment: (116)', '2019-11-06 17:00:00'),
(200, 1, 1, 81, 'Created New Billing Payment: (117)', '2019-11-06 17:00:07'),
(201, 1, 1, 81, 'Created New Billing Payment: (118)', '2019-11-06 17:00:24'),
(202, 6, 1, 81, 'Created New Billing Payment: (119)', '2019-11-06 17:00:26'),
(203, 1, 1, 81, 'Created New Billing Payment: (120)', '2019-11-06 17:00:34'),
(204, 1, 1, 81, 'Created New Billing Payment: (121)', '2019-11-06 17:00:45'),
(205, 1, 1, 81, 'Created New Billing Payment: (122)', '2019-11-06 17:00:56'),
(206, 6, 1, 81, 'Created New Billing Payment: (123)', '2019-11-06 17:01:02'),
(207, 1, 1, 81, 'Created New Billing Payment: (124)', '2019-11-06 17:01:06'),
(208, 6, 1, 81, 'Created New Billing Payment: (125)', '2019-11-06 17:01:14'),
(209, 1, 1, 81, 'Created New Billing Payment: (126)', '2019-11-06 17:01:17'),
(210, 1, 1, 81, 'Created New Billing Payment: (127)', '2019-11-06 17:01:32'),
(211, 1, 1, 81, 'Created New Billing Payment: (128)', '2019-11-06 17:01:44'),
(212, 6, 1, 81, 'Created New Billing Payment: (129)', '2019-11-06 17:01:53'),
(213, 6, 1, 81, 'Created New Billing Payment: (130)', '2019-11-06 17:02:03'),
(214, 6, 1, 81, 'Created New Billing Payment: (131)', '2019-11-06 17:02:22'),
(215, 6, 1, 81, 'Created New Billing Payment: (132)', '2019-11-06 17:02:39'),
(216, 6, 1, 81, 'Created New Billing Payment: (133)', '2019-11-06 17:02:52'),
(217, 6, 1, 81, 'Created New Billing Payment: (134)', '2019-11-06 17:03:53'),
(218, 6, 1, 81, 'Created New Billing Payment: (135)', '2019-11-06 17:04:08'),
(219, 6, 1, 81, 'Created New Billing Payment: (136)', '2019-11-06 17:04:21'),
(220, 6, 1, 81, 'Created New Billing Payment: (137)', '2019-11-06 17:04:38'),
(221, 6, 1, 81, 'Created New Billing Payment: (138)', '2019-11-06 17:05:57'),
(222, 6, 1, 81, 'Created New Billing Payment: (139)', '2019-11-06 17:06:09'),
(223, 6, 1, 81, 'Created New Billing Payment: (140)', '2019-11-06 17:06:21'),
(224, 6, 1, 81, 'Created New Billing Payment: (141)', '2019-11-06 17:06:31'),
(225, 6, 1, 81, 'Created New Billing Payment: (142)', '2019-11-06 17:06:43'),
(226, 6, 1, 81, 'Created New Billing Payment: (143)', '2019-11-06 17:07:02'),
(227, 6, 1, 81, 'Created New Billing Payment: (144)', '2019-11-06 17:07:28'),
(228, 6, 1, 81, 'Created New Billing Payment: (145)', '2019-11-06 17:07:54'),
(229, 6, 1, 81, 'Created New Billing Payment: (146)', '2019-11-06 17:08:05'),
(230, 6, 1, 81, 'Created New Billing Payment: (147)', '2019-11-06 17:23:10'),
(231, 6, 1, 81, 'Created New Billing Payment: (148)', '2019-11-06 17:23:43'),
(232, 6, 1, 81, 'Created New Billing Payment: (149)', '2019-11-06 17:23:54'),
(233, 6, 1, 81, 'Created New Billing Payment: (150)', '2019-11-06 17:24:28'),
(234, 6, 1, 81, 'Created New Billing Payment: (151)', '2019-11-06 17:24:41'),
(235, 6, 1, 81, 'Created New Billing Payment: (152)', '2019-11-06 17:24:56'),
(236, 6, 1, 81, 'Created New Billing Payment: (153)', '2019-11-06 17:25:06'),
(237, 6, 1, 81, 'Created New Billing Payment: (154)', '2019-11-06 17:25:22'),
(238, 6, 1, 81, 'Created New Billing Payment: (155)', '2019-11-06 17:25:32'),
(239, 6, 1, 81, 'Created New Billing Payment: (156)', '2019-11-06 17:25:46'),
(240, 6, 1, 81, 'Created New Billing Payment: (157)', '2019-11-06 17:25:59'),
(241, 6, 1, 81, 'Created New Billing Payment: (158)', '2019-11-06 17:26:10'),
(242, 6, 1, 81, 'Created New Billing Payment: (159)', '2019-11-06 17:26:29'),
(243, 6, 1, 81, 'Created New Billing Payment: (160)', '2019-11-06 17:26:40'),
(244, 6, 1, 81, 'Created New Billing Payment: (161)', '2019-11-06 17:26:55'),
(245, 6, 1, 81, 'Created New Billing Payment: (162)', '2019-11-06 17:27:11'),
(246, 6, 1, 81, 'Created New Billing Payment: (163)', '2019-11-06 17:27:37'),
(247, 6, 1, 81, 'Created New Billing Payment: (164)', '2019-11-06 17:27:49'),
(248, 6, 1, 81, 'Created New Billing Payment: (165)', '2019-11-06 17:28:04'),
(249, 6, 1, 81, 'Created New Billing Payment: (166)', '2019-11-06 17:28:16'),
(250, 6, 1, 81, 'Created New Billing Payment: (167)', '2019-11-06 17:28:32'),
(251, 6, 1, 81, 'Created New Billing Payment: (168)', '2019-11-06 17:28:41'),
(252, 6, 1, 81, 'Created New Billing Payment: (169)', '2019-11-06 17:28:53'),
(253, 6, 1, 81, 'Created New Billing Payment: (170)', '2019-11-06 17:29:05'),
(254, 6, 1, 81, 'Created New Billing Payment: (171)', '2019-11-06 17:29:29'),
(255, 6, 1, 81, 'Created New Billing Payment: (172)', '2019-11-06 17:29:41'),
(256, 6, 1, 81, 'Created New Billing Payment: (173)', '2019-11-06 17:29:53'),
(257, 6, 1, 81, 'Created New Billing Payment: (174)', '2019-11-06 17:30:53'),
(258, 6, 1, 81, 'Created New Billing Payment: (175)', '2019-11-06 17:31:12'),
(259, 6, 1, 81, 'Created New Billing Payment: (176)', '2019-11-06 17:31:29'),
(260, 6, 1, 81, 'Created New Billing Payment: (177)', '2019-11-06 17:31:41'),
(261, 6, 1, 81, 'Created New Billing Payment: (178)', '2019-11-06 17:31:56'),
(262, 6, 1, 81, 'Created New Billing Payment: (179)', '2019-11-06 17:34:34'),
(263, 6, 1, 81, 'Created New Billing Payment: (180)', '2019-11-06 17:34:55'),
(264, 6, 1, 81, 'Created New Billing Payment: (181)', '2019-11-06 17:36:31'),
(265, 6, 1, 81, 'Created New Billing Payment: (182)', '2019-11-06 17:37:02'),
(266, 6, 1, 81, 'Created New Billing Payment: (183)', '2019-11-06 17:37:13'),
(267, 1, 1, 81, 'Created New Billing Payment: (184)', '2019-11-06 17:46:44'),
(268, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-07 09:11:32'),
(269, 1, 1, 81, 'Created New Billing Payment: (185)', '2019-11-07 09:18:31'),
(270, 1, 1, 81, 'Created New Billing Payment: (186)', '2019-11-07 09:30:27'),
(271, 1, 1, 81, 'Created New Billing Payment: (187)', '2019-11-07 09:35:15'),
(272, 1, 1, 81, 'Created New Billing Payment: (188)', '2019-11-07 09:38:03'),
(273, 1, 1, 81, 'Created New Billing Payment: (189)', '2019-11-07 09:40:22'),
(274, 1, 1, 81, 'Created New Billing Payment: (190)', '2019-11-07 09:44:11'),
(275, 1, 1, 81, 'Created New Billing Payment: (191)', '2019-11-07 09:49:49'),
(276, 1, 1, 81, 'Created New Billing Payment: (192)', '2019-11-07 10:05:42'),
(277, 1, 1, 81, 'Created New Billing Payment: (193)', '2019-11-07 10:25:24'),
(278, 1, 1, 81, 'Created New Billing Payment: (194)', '2019-11-07 10:27:08'),
(279, 1, 2, 76, 'Updated Charge: ID(1)', '2019-11-07 10:38:47'),
(280, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-11-07 12:00:40'),
(281, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-07 12:00:52'),
(282, 4, 6, 43, 'User Log in: Jamie  Sigua', '2019-11-11 11:05:35'),
(283, 0, 10, 43, 'Login Attempt using username: jamiesigua', '2019-11-11 16:15:26'),
(284, 4, 6, 43, 'User Log in: Jamie  Sigua', '2019-11-11 16:15:33'),
(285, 4, 6, 43, 'User Log in: Jamie  Sigua', '2019-11-14 11:28:34'),
(286, 0, 10, 43, 'Login Attempt using username: admin', '2019-11-15 14:33:05'),
(287, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-15 14:33:11'),
(288, 1, 7, 43, 'User Log Out :System Administrator  ', '2019-11-15 14:36:42'),
(289, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-15 14:37:58'),
(290, 1, 2, 76, 'Updated Charge: ID(1)', '2019-11-15 14:38:57'),
(291, 1, 2, 57, 'Updated Water Billing System Configuration', '2019-11-15 14:39:08'),
(292, 4, 6, 43, 'User Log in: Jamie  Sigua', '2019-11-18 09:43:53'),
(293, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-18 10:44:13'),
(294, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-19 10:19:09'),
(295, 4, 6, 43, 'User Log in: Jamie  Sigua', '2019-11-20 14:26:26'),
(296, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-1)', '2019-11-20 14:32:01'),
(297, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-2)', '2019-11-20 14:32:05'),
(298, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-3)', '2019-11-20 14:32:09'),
(299, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-4)', '2019-11-20 14:32:12'),
(300, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-5)', '2019-11-20 14:32:15'),
(301, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-6)', '2019-11-20 14:32:18'),
(302, 4, 12, 82, 'Transfered Batch Meter Reading to Accounting: (BCH-201910-7)', '2019-11-20 14:32:22'),
(303, 1, 6, 43, 'User Log in: System Administrator  ', '2019-11-20 15:15:18'),
(304, 1, 6, 43, 'User Log in: System Administrator  ', '2019-12-05 10:29:14'),
(305, 1, 6, 43, 'User Log in: System Administrator  ', '2019-12-05 16:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `trans_key`
--

CREATE TABLE `trans_key` (
  `trans_key_id` bigint(20) NOT NULL,
  `trans_key_desc` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_key`
--

INSERT INTO `trans_key` (`trans_key_id`, `trans_key_desc`) VALUES
(1, 'Create'),
(2, 'Update'),
(3, 'Delete'),
(4, 'Cancel'),
(6, 'Log In'),
(7, 'Log Out'),
(8, 'Finalize'),
(9, 'Uncancel'),
(10, 'Login Attempts'),
(11, 'Process'),
(12, 'Transfer'),
(13, 'Close');

-- --------------------------------------------------------

--
-- Table structure for table `trans_key_services`
--

CREATE TABLE `trans_key_services` (
  `trans_key_id` int(11) NOT NULL,
  `trans_key_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_key_services`
--

INSERT INTO `trans_key_services` (`trans_key_id`, `trans_key_desc`) VALUES
(1, 'Create'),
(2, 'Delete');

-- --------------------------------------------------------

--
-- Table structure for table `trans_services`
--

CREATE TABLE `trans_services` (
  `trans_id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT '0',
  `trans_key_id` int(12) DEFAULT '0',
  `trans_type_id` int(12) DEFAULT '0',
  `connection_id` int(12) DEFAULT '0',
  `trans_log` varchar(255) DEFAULT NULL,
  `trans_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_type`
--

CREATE TABLE `trans_type` (
  `trans_type_id` bigint(20) NOT NULL,
  `trans_type_desc` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_type`
--

INSERT INTO `trans_type` (`trans_type_id`, `trans_type_desc`) VALUES
(1, 'General Journal'),
(2, 'Cash Disbursement'),
(3, 'Purchase Journal'),
(4, 'Sales Journal'),
(5, 'Petty Cash Journal'),
(6, 'Cash Receipt Journal'),
(7, 'Service Invoice'),
(8, 'Service Journal'),
(9, 'Service Unit'),
(10, 'Services'),
(11, 'Purchase Order'),
(12, 'Purchase Invoice'),
(13, 'Record Payment'),
(14, 'Item Issuance'),
(15, 'Item Adjustment'),
(16, 'Sales Order'),
(17, 'Sales Invoice'),
(18, 'Collection Entry'),
(43, 'User Accounts'),
(44, 'Account Classification'),
(45, 'Category Management'),
(46, 'Department Management'),
(47, 'Unit Management'),
(48, 'Locations Management'),
(49, 'Bank Management'),
(50, 'Product Management'),
(51, 'Supplier Management'),
(52, 'Customer Management'),
(53, 'Salesperson Management'),
(54, 'Fixed Asset Management'),
(55, 'Setup Tax'),
(56, 'Setup Chart of Accounts'),
(57, 'General Configuration'),
(58, 'Purchasing Configuration'),
(59, 'User Rights'),
(60, 'Company Info'),
(61, 'Check Layout'),
(62, 'Recurring Template'),
(63, 'Email Settings'),
(64, 'Email Report Settings'),
(65, 'Cash Invoice'),
(66, 'Issuance to Department'),
(67, 'Order Source'),
(68, 'Meter Inventory Management'),
(69, 'Service Connection'),
(70, 'Service Disconnection'),
(71, 'Service Reconnection'),
(72, 'Attendant Management'),
(73, 'Residential Rate Matrix'),
(74, 'Commercial Rate Matrix'),
(75, 'Meter Reading Period'),
(76, 'Charges Management'),
(77, 'Charge Unit Management'),
(78, 'Other Charges'),
(79, 'Meter Reading Entry'),
(80, 'Process Billing'),
(81, 'Billing Payments'),
(82, 'Meter Entry Batch'),
(83, 'Billing Batch Payment'),
(84, 'Billing Batch Deposits');

-- --------------------------------------------------------

--
-- Table structure for table `trans_type_services`
--

CREATE TABLE `trans_type_services` (
  `trans_type_id` bigint(20) NOT NULL,
  `trans_type_desc` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_type_services`
--

INSERT INTO `trans_type_services` (`trans_type_id`, `trans_type_desc`) VALUES
(1, 'Service Connection'),
(2, 'Service Disconnection'),
(3, 'Service Reconnection');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` bigint(20) NOT NULL,
  `unit_code` bigint(20) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `unit_desc` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_code`, `unit_name`, `unit_desc`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
(1, NULL, 'Pcs', '', NULL, '0000-00-00 00:00:00', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT '',
  `user_pword` varchar(500) DEFAULT '',
  `user_lname` varchar(100) DEFAULT '',
  `user_fname` varchar(100) DEFAULT '',
  `user_mname` varchar(100) DEFAULT '',
  `user_address` varchar(155) DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_mobile` varchar(100) DEFAULT '',
  `user_telephone` varchar(100) DEFAULT '',
  `user_bdate` date DEFAULT '0000-00-00',
  `user_group_id` int(11) DEFAULT '0',
  `photo_path` varchar(555) DEFAULT '',
  `file_directory` varchar(666) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_online` tinyint(4) DEFAULT '0',
  `last_seen` datetime DEFAULT NULL,
  `token_id` text NOT NULL,
  `user_department` bigint(20) DEFAULT '0',
  `journal_prepared_by` varchar(145) DEFAULT '',
  `journal_approved_by` varchar(145) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`user_id`, `user_name`, `user_pword`, `user_lname`, `user_fname`, `user_mname`, `user_address`, `user_email`, `user_mobile`, `user_telephone`, `user_bdate`, `user_group_id`, `photo_path`, `file_directory`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `date_deleted`, `modified_by_user`, `posted_by_user`, `deleted_by_user`, `is_online`, `last_seen`, `token_id`, `user_department`, `journal_prepared_by`, `journal_approved_by`) VALUES
(1, 'admin', '47b4fc9be4e05deb697b109001519b4b2f96455f', ' ', 'System', 'Administrator', 'Angeles City, Pampanga', 'jdevtechsolution@gmail.com', '0955-283-3018', '', '1970-01-01', 1, 'assets/img/anonymous-icon.png', NULL, b'1', b'0', NULL, '2019-12-05 08:36:20', 0, 1, 0, 0, 1, '2019-12-05 16:36:20', '7906639a33154a2f18e2d349f67da5ed', 0, '', ''),
(2, 'raf', '3cc95b3704d4ac1c0d7712092f1b60c7f2e53a75', 'Manalo', 'Rafael', '', '', '', '', '', '2019-07-15', 1, 'assets/img/anonymous-icon.png', NULL, b'1', b'1', '2019-07-15 12:07:04', '2019-10-04 03:09:17', 2147483647, 0, 1, 1, 1, '2019-10-03 16:33:26', '07c8ee481d65dd44487692a40de06d78', 0, '', ''),
(3, 'ash', 'cb101192dff2cc1ddd0272f73de307c89bebc181', 'Noble', 'Joash', '', '', '', '', '', '1970-01-01', 1, 'assets/img/anonymous-icon.png', NULL, b'1', b'1', '2019-07-15 12:07:20', '2019-10-04 03:09:19', 2147483647, 0, 1, 1, 1, '2019-10-03 17:28:48', '172c712c979184b024bdd2003340d033', 0, '', ''),
(4, 'jamiesigua', '9e60ef9ca4a6822bbd0c9c3012f355cc22e6113e', 'Sigua', 'Jamie', '', '', '', '', '', '2019-10-04', 1, 'assets/img/anonymous-icon.png', NULL, b'1', b'0', '2019-10-04 11:10:45', '2019-11-20 07:07:27', 0, 0, 1, 0, 1, '2019-11-20 15:07:27', 'f0ddc51f633df3278215c83f2f81280f', 0, '', ''),
(5, 'jeromeroque', '1494080584f8027b38578c3c9bfd46dbabe363b8', 'Roque', 'Jerome', '', '', '', '', '', '1970-01-01', 1, 'assets/img/anonymous-icon.png', NULL, b'1', b'0', '2019-10-04 11:11:18', '2019-10-07 08:30:49', 0, 1, 1, 0, 0, NULL, '', 0, '', ''),
(6, 'joashnoble', '6e09684dc5b0d378db3291119eaa87c3724d102a', 'Noble', 'Joash', '', '', '', '', '', '2019-11-06', 1, 'assets/img/anonymous-icon.png', NULL, b'1', b'0', '2019-11-06 16:37:29', '2019-11-06 08:39:43', 0, 0, 1, 0, 1, '2019-11-06 16:39:43', 'ac8014f3f4f296f99f7c4b78130c01b4', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `user_group_id` int(11) NOT NULL,
  `user_group` varchar(135) DEFAULT '',
  `user_group_desc` varchar(500) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `user_group`, `user_group_desc`, `is_active`, `is_deleted`, `date_created`, `date_modified`) VALUES
(1, 'System Administrator', 'Can access all features.', b'1', b'0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_rights`
--

CREATE TABLE `user_group_rights` (
  `user_rights_id` bigint(20) NOT NULL,
  `user_group_id` int(11) DEFAULT '0',
  `link_code` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group_rights`
--

INSERT INTO `user_group_rights` (`user_rights_id`, `user_group_id`, `link_code`) VALUES
(1, 1, '1-1'),
(2, 1, '1-2'),
(3, 1, '1-3'),
(4, 1, '1-4'),
(5, 1, '1-5'),
(6, 1, '2-1'),
(7, 1, '2-2'),
(8, 1, '2-3'),
(10, 1, '15-3'),
(11, 1, '3-1'),
(12, 1, '3-2'),
(13, 1, '3-3'),
(14, 1, '4-2'),
(15, 1, '4-3'),
(16, 1, '4-4'),
(17, 1, '5-1'),
(18, 1, '5-2'),
(19, 1, '5-3'),
(20, 1, '6-1'),
(21, 1, '6-2'),
(22, 1, '6-3'),
(23, 1, '6-4'),
(24, 1, '6-5'),
(25, 1, '6-6'),
(26, 1, '7-1'),
(27, 1, '9-1'),
(28, 1, '9-2'),
(29, 1, '4-1'),
(30, 1, '8-1'),
(31, 1, '15-4'),
(32, 1, '5-4'),
(33, 1, '2-6'),
(34, 1, '8-3'),
(35, 1, '9-3'),
(36, 1, '6-7'),
(37, 1, '9-4'),
(38, 1, '9-6'),
(39, 1, '9-8'),
(40, 1, '9-7'),
(41, 1, '9-5'),
(42, 1, '8-4'),
(43, 1, '4-5'),
(44, 1, '10-1'),
(45, 1, '9-9'),
(46, 1, '6-8'),
(47, 1, '9-10'),
(48, 1, '1-6'),
(49, 1, '9-13'),
(50, 1, '6-9'),
(51, 1, '9-14'),
(52, 1, '9-16'),
(53, 1, '4-6'),
(54, 1, '10-2'),
(55, 1, '11-1'),
(57, 1, '12-1'),
(58, 1, '12-2'),
(59, 1, '12-3'),
(60, 1, '12-4'),
(61, 1, '12-5'),
(62, 1, '9-11'),
(63, 1, '9-15'),
(64, 1, '9-12'),
(65, 1, '13-1'),
(66, 1, '13-2'),
(67, 1, '13-3'),
(68, 1, '13-4'),
(69, 1, '9-17'),
(70, 1, '9-18'),
(71, 1, '9-19'),
(72, 1, '6-10'),
(73, 1, '14-1'),
(74, 1, '9-20'),
(75, 1, '9-21'),
(76, 1, '6-11'),
(77, 1, '12-6'),
(78, 1, '12-7'),
(79, 1, '2-8'),
(80, 1, '2-7'),
(81, 1, '6-12'),
(82, 1, '15-1'),
(83, 1, '3-4'),
(84, 1, '6-13'),
(85, 1, '15-5'),
(86, 1, '15-6'),
(87, 1, '3-5'),
(88, 1, '4-7'),
(89, 1, '16-1'),
(90, 1, '16-2'),
(91, 1, '16-3'),
(92, 1, '6-14'),
(93, 1, '5-5'),
(94, 1, '17-1'),
(95, 1, '17-2'),
(96, 1, '17-3'),
(97, 1, '18-1'),
(98, 1, '18-2'),
(99, 1, '18-3'),
(100, 1, '19-1'),
(101, 1, '19-2'),
(102, 1, '19-3'),
(103, 1, '20-1'),
(104, 1, '20-2'),
(105, 1, '20-3'),
(106, 1, '20-4'),
(107, 1, '20-5'),
(108, 1, '21-1'),
(109, 1, '21-2'),
(110, 1, '21-3'),
(111, 1, '22-1'),
(112, 1, '22-2'),
(113, 1, '21-4'),
(114, 1, '21-5'),
(115, 1, '22-3'),
(116, 1, '21-6'),
(117, 1, '23-1'),
(118, 1, '23-2'),
(119, 1, '23-3'),
(120, 1, '24-1'),
(121, 1, '24-2'),
(122, 1, '24-3'),
(123, 1, '25-1'),
(124, 1, '25-2'),
(125, 1, '25-3'),
(126, 1, '26-1'),
(127, 1, '26-2'),
(128, 1, '26-3'),
(129, 1, '27-1'),
(130, 1, '28-1'),
(131, 1, '28-2'),
(132, 1, '29-1'),
(133, 1, '29-2'),
(134, 1, '29-3'),
(135, 1, '30-1'),
(136, 1, '30-2'),
(137, 1, '30-3'),
(138, 1, '31-1'),
(139, 1, '31-2'),
(140, 1, '31-3'),
(141, 1, '32-1'),
(142, 1, '32-2'),
(143, 1, '32-3'),
(144, 1, '33-1'),
(145, 1, '33-2'),
(146, 1, '33-3'),
(147, 1, '34-1'),
(148, 1, '34-2'),
(149, 1, '34-3'),
(150, 1, '35-1'),
(151, 1, '35-2'),
(152, 1, '35-3'),
(153, 1, '35-4'),
(154, 1, '36-1'),
(155, 1, '36-2'),
(156, 1, '36-3'),
(157, 1, '37-1'),
(158, 1, '38-1'),
(159, 1, '39-1'),
(160, 1, '21-7'),
(161, 1, '21-8'),
(200, 3, '1-1'),
(201, 3, '1-2'),
(202, 3, '1-3'),
(203, 3, '1-4'),
(204, 3, '1-5'),
(205, 3, '1-6'),
(206, 3, '5-3'),
(207, 3, '6-1'),
(208, 3, '6-2'),
(209, 3, '6-3'),
(210, 3, '6-4'),
(211, 3, '6-5'),
(212, 3, '6-6'),
(213, 3, '6-7'),
(214, 3, '6-8'),
(215, 3, '6-9'),
(216, 3, '6-10'),
(217, 3, '6-11'),
(218, 3, '6-13'),
(219, 3, '6-14'),
(220, 3, '9-1'),
(221, 3, '9-2'),
(222, 3, '9-3'),
(223, 3, '9-4'),
(224, 3, '9-5'),
(225, 3, '9-6'),
(226, 3, '9-7'),
(227, 3, '9-8'),
(228, 3, '9-9'),
(229, 3, '9-13'),
(230, 3, '9-14'),
(231, 3, '9-15'),
(232, 3, '9-16'),
(233, 3, '9-17'),
(234, 3, '9-18'),
(235, 3, '9-19'),
(236, 3, '9-20'),
(237, 3, '9-21'),
(238, 3, '10-1'),
(239, 3, '10-2'),
(240, 3, '16-1'),
(241, 3, '16-2'),
(242, 3, '16-3'),
(243, 3, '17-1'),
(244, 3, '17-2'),
(245, 3, '17-3'),
(246, 3, '18-1'),
(247, 3, '18-2'),
(248, 3, '18-3'),
(249, 3, '19-1'),
(250, 3, '19-2'),
(251, 3, '19-3'),
(252, 3, '20-1'),
(253, 3, '20-2'),
(254, 3, '20-3'),
(255, 3, '20-4'),
(256, 3, '20-5'),
(257, 3, '21-1'),
(258, 3, '21-2'),
(259, 3, '21-3'),
(260, 3, '22-1'),
(261, 3, '22-2'),
(293, 5, '17-1'),
(294, 5, '17-2'),
(295, 5, '17-3'),
(296, 5, '18-1'),
(297, 5, '23-1'),
(298, 5, '23-2'),
(299, 5, '24-1'),
(300, 5, '24-2'),
(301, 5, '25-2'),
(302, 5, '25-3'),
(303, 5, '26-1'),
(304, 5, '26-2'),
(353, 6, '5-3'),
(354, 6, '17-1'),
(355, 6, '17-2'),
(356, 6, '17-3'),
(357, 6, '18-1'),
(358, 6, '18-2'),
(359, 6, '18-3'),
(360, 6, '19-1'),
(361, 6, '19-2'),
(362, 6, '19-3'),
(363, 6, '20-3'),
(364, 6, '21-3'),
(365, 6, '21-4'),
(366, 6, '21-5'),
(367, 6, '22-1'),
(368, 6, '22-2'),
(369, 6, '22-3'),
(370, 6, '23-1'),
(371, 6, '23-2'),
(372, 6, '23-3'),
(373, 6, '24-1'),
(374, 6, '24-2'),
(375, 6, '24-3'),
(376, 6, '25-1'),
(377, 6, '25-2'),
(378, 6, '25-3'),
(379, 6, '26-1'),
(380, 6, '26-2'),
(381, 6, '26-3'),
(382, 6, '27-1'),
(383, 6, '28-1'),
(384, 6, '28-2'),
(385, 6, '29-1'),
(386, 6, '29-2'),
(387, 6, '29-3'),
(388, 6, '30-1'),
(389, 6, '30-2'),
(390, 6, '31-1'),
(391, 6, '31-2'),
(392, 6, '31-3'),
(393, 6, '34-1'),
(394, 6, '34-2'),
(395, 6, '34-3'),
(396, 6, '36-1'),
(397, 6, '36-2'),
(398, 6, '36-3'),
(399, 6, '37-1'),
(400, 6, '38-1'),
(401, 6, '39-1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting_period`
--
ALTER TABLE `accounting_period`
  ADD PRIMARY KEY (`accounting_period_id`) USING BTREE;

--
-- Indexes for table `account_classes`
--
ALTER TABLE `account_classes`
  ADD PRIMARY KEY (`account_class_id`) USING BTREE;

--
-- Indexes for table `account_integration`
--
ALTER TABLE `account_integration`
  ADD PRIMARY KEY (`integration_id`) USING BTREE;

--
-- Indexes for table `account_titles`
--
ALTER TABLE `account_titles`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`account_type_id`) USING BTREE;

--
-- Indexes for table `account_year`
--
ALTER TABLE `account_year`
  ADD PRIMARY KEY (`account_year_id`) USING BTREE;

--
-- Indexes for table `adjustment_info`
--
ALTER TABLE `adjustment_info`
  ADD PRIMARY KEY (`adjustment_id`) USING BTREE;

--
-- Indexes for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  ADD PRIMARY KEY (`adjustment_item_id`) USING BTREE;

--
-- Indexes for table `approval_status`
--
ALTER TABLE `approval_status`
  ADD PRIMARY KEY (`approval_id`) USING BTREE;

--
-- Indexes for table `asset_property_status`
--
ALTER TABLE `asset_property_status`
  ADD PRIMARY KEY (`asset_status_id`) USING BTREE,
  ADD UNIQUE KEY `asset_property_id` (`asset_status_id`) USING BTREE;

--
-- Indexes for table `attendant`
--
ALTER TABLE `attendant`
  ADD PRIMARY KEY (`attendant_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `bank_reconciliation`
--
ALTER TABLE `bank_reconciliation`
  ADD PRIMARY KEY (`bank_recon_id`);

--
-- Indexes for table `bank_reconciliation_details`
--
ALTER TABLE `bank_reconciliation_details`
  ADD PRIMARY KEY (`bank_recon_item_id`);

--
-- Indexes for table `batch_info`
--
ALTER TABLE `batch_info`
  ADD PRIMARY KEY (`batch_id`) USING BTREE,
  ADD UNIQUE KEY `batch_id` (`batch_id`) USING BTREE;

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billing_id`);

--
-- Indexes for table `billing_charges`
--
ALTER TABLE `billing_charges`
  ADD PRIMARY KEY (`billing_charge_id`);

--
-- Indexes for table `billing_payments`
--
ALTER TABLE `billing_payments`
  ADD PRIMARY KEY (`billing_payment_id`);

--
-- Indexes for table `billing_payment_batch`
--
ALTER TABLE `billing_payment_batch`
  ADD PRIMARY KEY (`billing_payment_batch_id`);

--
-- Indexes for table `billing_payment_items`
--
ALTER TABLE `billing_payment_items`
  ADD PRIMARY KEY (`billing_payment_item_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`) USING BTREE;

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`card_id`) USING BTREE;

--
-- Indexes for table `cash_invoice`
--
ALTER TABLE `cash_invoice`
  ADD PRIMARY KEY (`cash_invoice_id`) USING BTREE,
  ADD UNIQUE KEY `cash_inv_no` (`cash_inv_no`) USING BTREE;

--
-- Indexes for table `cash_invoice_items`
--
ALTER TABLE `cash_invoice_items`
  ADD PRIMARY KEY (`cash_item_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`charge_id`);

--
-- Indexes for table `charge_unit`
--
ALTER TABLE `charge_unit`
  ADD PRIMARY KEY (`charge_unit_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`) USING BTREE;

--
-- Indexes for table `check_layout`
--
ALTER TABLE `check_layout`
  ADD PRIMARY KEY (`check_layout_id`) USING BTREE;

--
-- Indexes for table `civil_status`
--
ALTER TABLE `civil_status`
  ADD PRIMARY KEY (`civil_status_id`);

--
-- Indexes for table `company_info`
--
ALTER TABLE `company_info`
  ADD PRIMARY KEY (`company_id`) USING BTREE;

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`contract_type_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`) USING BTREE;

--
-- Indexes for table `customer_account_type`
--
ALTER TABLE `customer_account_type`
  ADD PRIMARY KEY (`customer_account_type_id`);

--
-- Indexes for table `customer_photos`
--
ALTER TABLE `customer_photos`
  ADD PRIMARY KEY (`photo_id`) USING BTREE;

--
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
  ADD PRIMARY KEY (`customer_type_id`);

--
-- Indexes for table `delivery_invoice`
--
ALTER TABLE `delivery_invoice`
  ADD PRIMARY KEY (`dr_invoice_id`) USING BTREE,
  ADD UNIQUE KEY `dr_invoice_no` (`dr_invoice_no`) USING BTREE;

--
-- Indexes for table `delivery_invoice_items`
--
ALTER TABLE `delivery_invoice_items`
  ADD PRIMARY KEY (`dr_invoice_item_id`) USING BTREE;

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`) USING BTREE;

--
-- Indexes for table `depreciation_expense`
--
ALTER TABLE `depreciation_expense`
  ADD PRIMARY KEY (`de_id`);

--
-- Indexes for table `disconnection_reason`
--
ALTER TABLE `disconnection_reason`
  ADD PRIMARY KEY (`disconnection_reason_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`) USING BTREE;

--
-- Indexes for table `dispatching_invoice`
--
ALTER TABLE `dispatching_invoice`
  ADD PRIMARY KEY (`dispatching_invoice_id`) USING BTREE,
  ADD UNIQUE KEY `dispatching_inv_no` (`dispatching_inv_no`) USING BTREE;

--
-- Indexes for table `dispatching_invoice_items`
--
ALTER TABLE `dispatching_invoice_items`
  ADD PRIMARY KEY (`dispatching_item_id`) USING BTREE;

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  ADD PRIMARY KEY (`fixed_asset_id`) USING BTREE;

--
-- Indexes for table `form_2307`
--
ALTER TABLE `form_2307`
  ADD PRIMARY KEY (`form_2307_id`);

--
-- Indexes for table `form_2551m`
--
ALTER TABLE `form_2551m`
  ADD PRIMARY KEY (`form_2551m_id`);

--
-- Indexes for table `generics`
--
ALTER TABLE `generics`
  ADD PRIMARY KEY (`generic_id`) USING BTREE;

--
-- Indexes for table `giftcards`
--
ALTER TABLE `giftcards`
  ADD PRIMARY KEY (`giftcard_id`) USING BTREE;

--
-- Indexes for table `hotel_items`
--
ALTER TABLE `hotel_items`
  ADD PRIMARY KEY (`hotel_items_id`);

--
-- Indexes for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  ADD PRIMARY KEY (`hotel_settings_id`);

--
-- Indexes for table `initial_setup`
--
ALTER TABLE `initial_setup`
  ADD PRIMARY KEY (`initial_setup_id`);

--
-- Indexes for table `invoice_counter`
--
ALTER TABLE `invoice_counter`
  ADD PRIMARY KEY (`counter_id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `issuance_department_info`
--
ALTER TABLE `issuance_department_info`
  ADD PRIMARY KEY (`issuance_department_id`) USING BTREE;

--
-- Indexes for table `issuance_department_items`
--
ALTER TABLE `issuance_department_items`
  ADD PRIMARY KEY (`issuance_department_item_id`) USING BTREE;

--
-- Indexes for table `issuance_info`
--
ALTER TABLE `issuance_info`
  ADD PRIMARY KEY (`issuance_id`) USING BTREE;

--
-- Indexes for table `issuance_items`
--
ALTER TABLE `issuance_items`
  ADD PRIMARY KEY (`issuance_item_id`) USING BTREE;

--
-- Indexes for table `item_types`
--
ALTER TABLE `item_types`
  ADD PRIMARY KEY (`item_type_id`) USING BTREE;

--
-- Indexes for table `journal_accounts`
--
ALTER TABLE `journal_accounts`
  ADD PRIMARY KEY (`journal_account_id`) USING BTREE;

--
-- Indexes for table `journal_entry_templates`
--
ALTER TABLE `journal_entry_templates`
  ADD PRIMARY KEY (`entry_template_id`) USING BTREE;

--
-- Indexes for table `journal_info`
--
ALTER TABLE `journal_info`
  ADD PRIMARY KEY (`journal_id`) USING BTREE;

--
-- Indexes for table `journal_templates_info`
--
ALTER TABLE `journal_templates_info`
  ADD PRIMARY KEY (`template_id`) USING BTREE;

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`) USING BTREE;

--
-- Indexes for table `matrix_commercial`
--
ALTER TABLE `matrix_commercial`
  ADD PRIMARY KEY (`matrix_commercial_id`);

--
-- Indexes for table `matrix_commercial_items`
--
ALTER TABLE `matrix_commercial_items`
  ADD PRIMARY KEY (`matrix_commercial_item_id`);

--
-- Indexes for table `matrix_residential`
--
ALTER TABLE `matrix_residential`
  ADD PRIMARY KEY (`matrix_residential_id`);

--
-- Indexes for table `matrix_residential_items`
--
ALTER TABLE `matrix_residential_items`
  ADD PRIMARY KEY (`matrix_residential_item_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`chat_id`) USING BTREE;

--
-- Indexes for table `meter_inventory`
--
ALTER TABLE `meter_inventory`
  ADD PRIMARY KEY (`meter_inventory_id`);

--
-- Indexes for table `meter_reading_input`
--
ALTER TABLE `meter_reading_input`
  ADD PRIMARY KEY (`meter_reading_input_id`);

--
-- Indexes for table `meter_reading_input_items`
--
ALTER TABLE `meter_reading_input_items`
  ADD PRIMARY KEY (`meter_reading_input_item_id`);

--
-- Indexes for table `meter_reading_period`
--
ALTER TABLE `meter_reading_period`
  ADD PRIMARY KEY (`meter_reading_period_id`);

--
-- Indexes for table `meter_status`
--
ALTER TABLE `meter_status`
  ADD PRIMARY KEY (`meter_status_id`);

--
-- Indexes for table `module_layout`
--
ALTER TABLE `module_layout`
  ADD PRIMARY KEY (`module_layout_id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`nationality_id`);

--
-- Indexes for table `order_source`
--
ALTER TABLE `order_source`
  ADD PRIMARY KEY (`order_source_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`) USING BTREE;

--
-- Indexes for table `other_charges`
--
ALTER TABLE `other_charges`
  ADD PRIMARY KEY (`other_charge_id`);

--
-- Indexes for table `other_charges_items`
--
ALTER TABLE `other_charges_items`
  ADD PRIMARY KEY (`other_charge_item_id`);

--
-- Indexes for table `payable_payments`
--
ALTER TABLE `payable_payments`
  ADD PRIMARY KEY (`payment_id`) USING BTREE;

--
-- Indexes for table `payable_payments_list`
--
ALTER TABLE `payable_payments_list`
  ADD PRIMARY KEY (`payment_list_id`) USING BTREE;

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`payment_method_id`) USING BTREE;

--
-- Indexes for table `po_attachments`
--
ALTER TABLE `po_attachments`
  ADD PRIMARY KEY (`po_attachment_id`) USING BTREE;

--
-- Indexes for table `po_messages`
--
ALTER TABLE `po_messages`
  ADD PRIMARY KEY (`po_message_id`) USING BTREE;

--
-- Indexes for table `prime_hotel_integration`
--
ALTER TABLE `prime_hotel_integration`
  ADD PRIMARY KEY (`prime_hotel_integration_id`);

--
-- Indexes for table `prime_hotel_integration_settings`
--
ALTER TABLE `prime_hotel_integration_settings`
  ADD PRIMARY KEY (`prime_hotel_integration_settings_id`);

--
-- Indexes for table `print_layout`
--
ALTER TABLE `print_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`) USING BTREE;

--
-- Indexes for table `product_batch_inventory`
--
ALTER TABLE `product_batch_inventory`
  ADD PRIMARY KEY (`product_key`) USING BTREE,
  ADD UNIQUE KEY `product_key` (`product_key`) USING BTREE;

--
-- Indexes for table `proforma_invoice`
--
ALTER TABLE `proforma_invoice`
  ADD PRIMARY KEY (`proforma_invoice_id`) USING BTREE,
  ADD UNIQUE KEY `proforma_inv_no` (`proforma_inv_no`) USING BTREE;

--
-- Indexes for table `proforma_invoice_items`
--
ALTER TABLE `proforma_invoice_items`
  ADD PRIMARY KEY (`proforma_item_id`) USING BTREE;

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`purchase_order_id`) USING BTREE,
  ADD UNIQUE KEY `po_no` (`po_no`) USING BTREE,
  ADD UNIQUE KEY `po_no_2` (`po_no`) USING BTREE;

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`po_item_id`) USING BTREE;

--
-- Indexes for table `purchasing_integration`
--
ALTER TABLE `purchasing_integration`
  ADD PRIMARY KEY (`purchasing_integration_id`);

--
-- Indexes for table `rate_types`
--
ALTER TABLE `rate_types`
  ADD PRIMARY KEY (`rate_type_id`);

--
-- Indexes for table `receivable_payments`
--
ALTER TABLE `receivable_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `receivable_payments_list`
--
ALTER TABLE `receivable_payments_list`
  ADD PRIMARY KEY (`payment_list_id`);

--
-- Indexes for table `refcustomertype`
--
ALTER TABLE `refcustomertype`
  ADD PRIMARY KEY (`refcustomertype_id`) USING BTREE;

--
-- Indexes for table `refdiscounttype`
--
ALTER TABLE `refdiscounttype`
  ADD PRIMARY KEY (`discount_type_id`) USING BTREE;

--
-- Indexes for table `refproduct`
--
ALTER TABLE `refproduct`
  ADD PRIMARY KEY (`refproduct_id`) USING BTREE;

--
-- Indexes for table `rights_links`
--
ALTER TABLE `rights_links`
  ADD PRIMARY KEY (`link_id`) USING BTREE;

--
-- Indexes for table `salesperson`
--
ALTER TABLE `salesperson`
  ADD PRIMARY KEY (`salesperson_id`) USING BTREE;

--
-- Indexes for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  ADD PRIMARY KEY (`sales_invoice_id`) USING BTREE,
  ADD UNIQUE KEY `sales_inv_no` (`sales_inv_no`) USING BTREE;

--
-- Indexes for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  ADD PRIMARY KEY (`sales_item_id`) USING BTREE;

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`sales_order_id`) USING BTREE;

--
-- Indexes for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  ADD PRIMARY KEY (`sales_order_item_id`) USING BTREE;

--
-- Indexes for table `sched_expense_integration`
--
ALTER TABLE `sched_expense_integration`
  ADD PRIMARY KEY (`sched_expense_id`) USING BTREE,
  ADD UNIQUE KEY `account_id` (`account_id`) USING BTREE;

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_connection`
--
ALTER TABLE `service_connection`
  ADD PRIMARY KEY (`connection_id`);

--
-- Indexes for table `service_connection_batch`
--
ALTER TABLE `service_connection_batch`
  ADD PRIMARY KEY (`service_connection_batch_id`);

--
-- Indexes for table `service_disconnection`
--
ALTER TABLE `service_disconnection`
  ADD PRIMARY KEY (`disconnection_id`);

--
-- Indexes for table `service_disconnection_charges`
--
ALTER TABLE `service_disconnection_charges`
  ADD PRIMARY KEY (`service_disconnection_charge_id`);

--
-- Indexes for table `service_invoice`
--
ALTER TABLE `service_invoice`
  ADD PRIMARY KEY (`service_invoice_id`);

--
-- Indexes for table `service_invoice_items`
--
ALTER TABLE `service_invoice_items`
  ADD PRIMARY KEY (`service_item_id`);

--
-- Indexes for table `service_reconnection`
--
ALTER TABLE `service_reconnection`
  ADD PRIMARY KEY (`reconnection_id`);

--
-- Indexes for table `service_unit`
--
ALTER TABLE `service_unit`
  ADD PRIMARY KEY (`service_unit_id`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`);

--
-- Indexes for table `soa_settings`
--
ALTER TABLE `soa_settings`
  ADD PRIMARY KEY (`soa_settings_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`) USING BTREE;

--
-- Indexes for table `supplier_photos`
--
ALTER TABLE `supplier_photos`
  ADD PRIMARY KEY (`photo_id`) USING BTREE;

--
-- Indexes for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`tax_type_id`) USING BTREE;

--
-- Indexes for table `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `trans_key`
--
ALTER TABLE `trans_key`
  ADD PRIMARY KEY (`trans_key_id`);

--
-- Indexes for table `trans_key_services`
--
ALTER TABLE `trans_key_services`
  ADD PRIMARY KEY (`trans_key_id`);

--
-- Indexes for table `trans_services`
--
ALTER TABLE `trans_services`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `trans_type`
--
ALTER TABLE `trans_type`
  ADD PRIMARY KEY (`trans_type_id`);

--
-- Indexes for table `trans_type_services`
--
ALTER TABLE `trans_type_services`
  ADD PRIMARY KEY (`trans_type_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`) USING BTREE;

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_group_id`) USING BTREE;

--
-- Indexes for table `user_group_rights`
--
ALTER TABLE `user_group_rights`
  ADD PRIMARY KEY (`user_rights_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounting_period`
--
ALTER TABLE `accounting_period`
  MODIFY `accounting_period_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_classes`
--
ALTER TABLE `account_classes`
  MODIFY `account_class_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `account_titles`
--
ALTER TABLE `account_titles`
  MODIFY `account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `account_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `account_year`
--
ALTER TABLE `account_year`
  MODIFY `account_year_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adjustment_info`
--
ALTER TABLE `adjustment_info`
  MODIFY `adjustment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  MODIFY `adjustment_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `approval_status`
--
ALTER TABLE `approval_status`
  MODIFY `approval_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `asset_property_status`
--
ALTER TABLE `asset_property_status`
  MODIFY `asset_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `attendant`
--
ALTER TABLE `attendant`
  MODIFY `attendant_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bank_reconciliation`
--
ALTER TABLE `bank_reconciliation`
  MODIFY `bank_recon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bank_reconciliation_details`
--
ALTER TABLE `bank_reconciliation_details`
  MODIFY `bank_recon_item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `batch_info`
--
ALTER TABLE `batch_info`
  MODIFY `batch_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billing_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;
--
-- AUTO_INCREMENT for table `billing_charges`
--
ALTER TABLE `billing_charges`
  MODIFY `billing_charge_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `billing_payments`
--
ALTER TABLE `billing_payments`
  MODIFY `billing_payment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `billing_payment_batch`
--
ALTER TABLE `billing_payment_batch`
  MODIFY `billing_payment_batch_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_payment_items`
--
ALTER TABLE `billing_payment_items`
  MODIFY `billing_payment_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `card_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cash_invoice`
--
ALTER TABLE `cash_invoice`
  MODIFY `cash_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cash_invoice_items`
--
ALTER TABLE `cash_invoice_items`
  MODIFY `cash_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `charge_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `charge_unit`
--
ALTER TABLE `charge_unit`
  MODIFY `charge_unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `check_layout`
--
ALTER TABLE `check_layout`
  MODIFY `check_layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `civil_status`
--
ALTER TABLE `civil_status`
  MODIFY `civil_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `company_info`
--
ALTER TABLE `company_info`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `contract_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `customer_account_type`
--
ALTER TABLE `customer_account_type`
  MODIFY `customer_account_type_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customer_photos`
--
ALTER TABLE `customer_photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `customer_type`
--
ALTER TABLE `customer_type`
  MODIFY `customer_type_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `delivery_invoice`
--
ALTER TABLE `delivery_invoice`
  MODIFY `dr_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delivery_invoice_items`
--
ALTER TABLE `delivery_invoice_items`
  MODIFY `dr_invoice_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `depreciation_expense`
--
ALTER TABLE `depreciation_expense`
  MODIFY `de_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disconnection_reason`
--
ALTER TABLE `disconnection_reason`
  MODIFY `disconnection_reason_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` bigint(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dispatching_invoice`
--
ALTER TABLE `dispatching_invoice`
  MODIFY `dispatching_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dispatching_invoice_items`
--
ALTER TABLE `dispatching_invoice_items`
  MODIFY `dispatching_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  MODIFY `fixed_asset_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_2307`
--
ALTER TABLE `form_2307`
  MODIFY `form_2307_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_2551m`
--
ALTER TABLE `form_2551m`
  MODIFY `form_2551m_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `generics`
--
ALTER TABLE `generics`
  MODIFY `generic_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `giftcards`
--
ALTER TABLE `giftcards`
  MODIFY `giftcard_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel_items`
--
ALTER TABLE `hotel_items`
  MODIFY `hotel_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  MODIFY `hotel_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `invoice_counter`
--
ALTER TABLE `invoice_counter`
  MODIFY `counter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `issuance_department_info`
--
ALTER TABLE `issuance_department_info`
  MODIFY `issuance_department_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `issuance_department_items`
--
ALTER TABLE `issuance_department_items`
  MODIFY `issuance_department_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `issuance_info`
--
ALTER TABLE `issuance_info`
  MODIFY `issuance_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `issuance_items`
--
ALTER TABLE `issuance_items`
  MODIFY `issuance_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
  MODIFY `item_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `journal_accounts`
--
ALTER TABLE `journal_accounts`
  MODIFY `journal_account_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journal_entry_templates`
--
ALTER TABLE `journal_entry_templates`
  MODIFY `entry_template_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journal_info`
--
ALTER TABLE `journal_info`
  MODIFY `journal_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journal_templates_info`
--
ALTER TABLE `journal_templates_info`
  MODIFY `template_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `matrix_commercial`
--
ALTER TABLE `matrix_commercial`
  MODIFY `matrix_commercial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `matrix_commercial_items`
--
ALTER TABLE `matrix_commercial_items`
  MODIFY `matrix_commercial_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `matrix_residential`
--
ALTER TABLE `matrix_residential`
  MODIFY `matrix_residential_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `matrix_residential_items`
--
ALTER TABLE `matrix_residential_items`
  MODIFY `matrix_residential_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `meter_inventory`
--
ALTER TABLE `meter_inventory`
  MODIFY `meter_inventory_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `meter_reading_input`
--
ALTER TABLE `meter_reading_input`
  MODIFY `meter_reading_input_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `meter_reading_input_items`
--
ALTER TABLE `meter_reading_input_items`
  MODIFY `meter_reading_input_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;
--
-- AUTO_INCREMENT for table `meter_reading_period`
--
ALTER TABLE `meter_reading_period`
  MODIFY `meter_reading_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `meter_status`
--
ALTER TABLE `meter_status`
  MODIFY `meter_status_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `module_layout`
--
ALTER TABLE `module_layout`
  MODIFY `module_layout_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `month_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `nationality_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order_source`
--
ALTER TABLE `order_source`
  MODIFY `order_source_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `other_charges`
--
ALTER TABLE `other_charges`
  MODIFY `other_charge_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `other_charges_items`
--
ALTER TABLE `other_charges_items`
  MODIFY `other_charge_item_id` bigint(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `payable_payments`
--
ALTER TABLE `payable_payments`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payable_payments_list`
--
ALTER TABLE `payable_payments_list`
  MODIFY `payment_list_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `po_attachments`
--
ALTER TABLE `po_attachments`
  MODIFY `po_attachment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `po_messages`
--
ALTER TABLE `po_messages`
  MODIFY `po_message_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prime_hotel_integration`
--
ALTER TABLE `prime_hotel_integration`
  MODIFY `prime_hotel_integration_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prime_hotel_integration_settings`
--
ALTER TABLE `prime_hotel_integration_settings`
  MODIFY `prime_hotel_integration_settings_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `print_layout`
--
ALTER TABLE `print_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proforma_invoice`
--
ALTER TABLE `proforma_invoice`
  MODIFY `proforma_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proforma_invoice_items`
--
ALTER TABLE `proforma_invoice_items`
  MODIFY `proforma_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `purchase_order_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `po_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rate_types`
--
ALTER TABLE `rate_types`
  MODIFY `rate_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `receivable_payments`
--
ALTER TABLE `receivable_payments`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receivable_payments_list`
--
ALTER TABLE `receivable_payments_list`
  MODIFY `payment_list_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `refcustomertype`
--
ALTER TABLE `refcustomertype`
  MODIFY `refcustomertype_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `refdiscounttype`
--
ALTER TABLE `refdiscounttype`
  MODIFY `discount_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `refproduct`
--
ALTER TABLE `refproduct`
  MODIFY `refproduct_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rights_links`
--
ALTER TABLE `rights_links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `salesperson`
--
ALTER TABLE `salesperson`
  MODIFY `salesperson_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  MODIFY `sales_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_invoice_items`
--
ALTER TABLE `sales_invoice_items`
  MODIFY `sales_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `sales_order_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  MODIFY `sales_order_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sched_expense_integration`
--
ALTER TABLE `sched_expense_integration`
  MODIFY `sched_expense_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_connection`
--
ALTER TABLE `service_connection`
  MODIFY `connection_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `service_connection_batch`
--
ALTER TABLE `service_connection_batch`
  MODIFY `service_connection_batch_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_disconnection`
--
ALTER TABLE `service_disconnection`
  MODIFY `disconnection_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_disconnection_charges`
--
ALTER TABLE `service_disconnection_charges`
  MODIFY `service_disconnection_charge_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_invoice`
--
ALTER TABLE `service_invoice`
  MODIFY `service_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_invoice_items`
--
ALTER TABLE `service_invoice_items`
  MODIFY `service_item_id` bigint(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_reconnection`
--
ALTER TABLE `service_reconnection`
  MODIFY `reconnection_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_unit`
--
ALTER TABLE `service_unit`
  MODIFY `service_unit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `sex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `soa_settings`
--
ALTER TABLE `soa_settings`
  MODIFY `soa_settings_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supplier_photos`
--
ALTER TABLE `supplier_photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `tax_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `trans`
--
ALTER TABLE `trans`
  MODIFY `trans_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;
--
-- AUTO_INCREMENT for table `trans_key_services`
--
ALTER TABLE `trans_key_services`
  MODIFY `trans_key_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `trans_services`
--
ALTER TABLE `trans_services`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trans_type_services`
--
ALTER TABLE `trans_type_services`
  MODIFY `trans_type_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_group_rights`
--
ALTER TABLE `user_group_rights`
  MODIFY `user_rights_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
