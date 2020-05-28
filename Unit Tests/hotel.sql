-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2020 at 10:46 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BILL_ID` bigint(20) UNSIGNED NOT NULL,
  `AMOUNT` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DATE` date NOT NULL,
  `PH_NO` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BILL_ID`, `AMOUNT`, `NAME`, `DATE`, `PH_NO`, `CUSTOMER_ID`) VALUES
(1, 1000, 'varun', '2020-04-07', 5564231789, 10),
(4, 1400, 'ganesh', '2020-04-07', 5566448899, 3),
(5, 2800, 'huk', '2020-04-10', 5652545851, 11),
(3, 2000, 'ram', '2020-04-08', 7539518282, 2),
(2, 1000, 'shiv', '2020-04-09', 8526547391, 1);

-- --------------------------------------------------------

--
-- Table structure for table `convention_hall`
--

CREATE TABLE `convention_hall` (
  `HALL_NO` int(11) NOT NULL,
  `CATEGORY` varchar(10) NOT NULL,
  `CAPACITY` int(11) NOT NULL,
  `AC` tinyint(1) NOT NULL,
  `CUST_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `convention_hall`
--

INSERT INTO `convention_hall` (`HALL_NO`, `CATEGORY`, `CAPACITY`, `AC`, `CUST_ID`) VALUES
(1, 'Big', 1000, 1, NULL),
(2, 'Small', 500, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `AADHAR_NO` bigint(20) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `MINIT` char(2) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `PH_NO` bigint(20) DEFAULT NULL,
  `ASTATE` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `COUNTRY` varchar(20) DEFAULT NULL,
  `GUEST_ID` bigint(20) UNSIGNED NOT NULL,
  `VISIT` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`AADHAR_NO`, `FNAME`, `MINIT`, `LNAME`, `PH_NO`, `ASTATE`, `CITY`, `COUNTRY`, `GUEST_ID`, `VISIT`) VALUES
(123456789, 'shiv', 'sh', 'shiv', 8526547391, 'Karnataka', 'Banglore', NULL, 1, 1),
(56485236, 'ram', 'ra', 'ram', 7539518282, 'madhya pradesh', 'indore', NULL, 2, 1),
(752856, 'ganesh', 'ga', 'ganesh', 5566448899, 'london', 'london', NULL, 3, 1),
(5645645, 'mahesh', 'ma', 'mahesh', 3322114477, 'Delhi', 'Delhi', NULL, 4, 1),
(78546321, 'Navneet', 'R', 'R', 8866221100, 'Punjab', 'ludhiana', NULL, 9, 1),
(89647231, 'varun', 's', 'g', 5564231789, 'Karnataka', 'Banglore', NULL, 10, 1),
(83314596, 's', 'n', 'huk', 5652545851, 'karnataka', 'hubli', NULL, 11, 1),
(7551751, 'prash', 'a', 'p', 1122554411, 'Karnataka', 'Banglore', NULL, 12, 1),
(858569745, 'venky', 'v', 'v', 6587321987, 'maharashtra', 'mumbai', NULL, 13, 1),
(74563214, 'vishnu', 'a', 'v', 8536957214, 'Maharashtra', 'pune', NULL, 14, 1),
(84410147, 'harsh', 'a', 'harsh', 2028985864, 'Karnataka', 'Banglore', NULL, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SALARY` int(11) DEFAULT NULL,
  `FNAME` varchar(25) NOT NULL,
  `MINIT` char(2) DEFAULT NULL,
  `LNAME` varchar(25) DEFAULT NULL,
  `JOIN_DATE` date DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `EMP_ID` int(11) NOT NULL,
  `PHONE` int(12) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SALARY`, `FNAME`, `MINIT`, `LNAME`, `JOIN_DATE`, `DOB`, `EMP_ID`, `PHONE`, `gender`) VALUES
(25000, 'harshith', 'a', 'au', '2020-04-06', '2000-08-02', 25, 2147483647, 'female'),
(35000, 'kiran', 'a', 'a', '2020-04-07', '1985-12-02', 26, 1234567891, 'female'),
(5000, 'punjabi', 'a', 'l', '2020-04-07', '2002-02-20', 27, 2147483647, 'female'),
(20000, 'veeresh', 'a', 'a', '2020-04-07', '1998-08-05', 28, 2147483647, 'Male'),
(18000, 'anand', 'a', 'singh', '2020-04-07', '2002-02-02', 29, 2147483647, 'Male'),
(35000, 'mahesh', 'q', 'a', '2020-04-07', '1996-02-02', 30, 2147483647, 'Male'),
(22000, 'harshey', 'a', 'l', '2020-04-07', '1998-05-02', 31, 2147483647, 'female'),
(30000, 'manny', 'a', 'l', '2020-04-07', '1995-07-06', 32, 2147483647, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `housekeeps`
--

CREATE TABLE `housekeeps` (
  `EMP_NUMBER` int(11) DEFAULT NULL,
  `ROOM_NUM` int(11) DEFAULT NULL,
  `HID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `housekeeps`
--

INSERT INTO `housekeeps` (`EMP_NUMBER`, `ROOM_NUM`, `HID`) VALUES
(NULL, 105, 1),
(NULL, 106, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `INVOICE_NUMBER` bigint(20) UNSIGNED NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `INVOICE_DESCRIPTION` varchar(300) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`INVOICE_NUMBER`, `STATUS`, `INVOICE_DESCRIPTION`, `CUSTOMER_ID`) VALUES
(1, 'PAYMENT PE', NULL, 10),
(2, 'PAYMENT PE', NULL, 1),
(3, 'PAYMENT PE', NULL, 2),
(4, 'PAYMENT PE', NULL, 3),
(5, 'PAYMENT PE', NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `GUEST_NUM` bigint(20) UNSIGNED DEFAULT NULL,
  `PAY_DATE` date NOT NULL,
  `INVOICE_NUMBER` bigint(20) UNSIGNED NOT NULL,
  `PAYMENT_METHODS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`GUEST_NUM`, `PAY_DATE`, `INVOICE_NUMBER`, `PAYMENT_METHODS`) VALUES
(10, '2020-04-07', 1, 'cash'),
(10, '2020-04-07', 1, 'cash'),
(1, '2020-04-07', 2, 'card'),
(1, '2020-04-07', 2, 'wallets'),
(1, '2020-04-07', 2, 'wallets'),
(1, '2020-04-07', 2, 'cash'),
(2, '2020-04-07', 3, 'card'),
(2, '2020-04-07', 3, 'cash'),
(3, '2020-04-07', 4, 'cash'),
(11, '2020-04-07', 5, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `CATEGORY` varchar(40) NOT NULL,
  `PRICE_PER_DAY` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`CATEGORY`, `PRICE_PER_DAY`) VALUES
('Superior room', 1400),
('Deluxe room', 1000),
('Guest house', 2500),
('Single room', 850),
('Big', 7500),
('Small', 3900);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `GST_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `CHECKIN_DATE` date NOT NULL,
  `CHECKOUT_DATE` date NOT NULL,
  `PERIOD_STAY` int(11) DEFAULT NULL,
  `HALL_NUMBER` int(11) DEFAULT NULL,
  `ROOM_NUMBER` int(11) DEFAULT NULL,
  `CATEGORY` varchar(30) DEFAULT NULL,
  `RID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`GST_ID`, `CHECKIN_DATE`, `CHECKOUT_DATE`, `PERIOD_STAY`, `HALL_NUMBER`, `ROOM_NUMBER`, `CATEGORY`, `RID`) VALUES
(4, '2020-04-10', '2020-04-13', 3, NULL, 501, 'Superior room', 4),
(9, '2020-04-18', '2020-04-20', 2, NULL, 404, 'Deluxe room', 5),
(12, '2020-05-17', '2020-05-20', 3, NULL, 108, 'Single room', 8),
(13, '2020-04-21', '2020-04-23', 2, NULL, 504, 'Superior room', 9),
(14, '2020-05-05', '2020-05-09', 4, NULL, 103, 'Guest house', 10),
(15, '2020-04-28', '2020-04-30', 2, NULL, 307, 'Deluxe room', 11);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOM_NO` int(11) NOT NULL,
  `CATEGORY` varchar(40) NOT NULL,
  `NO_OF_BEDS` int(11) NOT NULL,
  `AIR_COND` tinyint(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOM_NO`, `CATEGORY`, `NO_OF_BEDS`, `AIR_COND`, `CUSTOMER_ID`) VALUES
(101, 'Superior room', 1, 1, NULL),
(102, 'Deluxe room', 2, 0, NULL),
(103, 'Guest house', 3, 1, 14),
(104, 'Single room', 1, 0, NULL),
(105, 'Superior room', 2, 1, NULL),
(106, 'Deluxe room', 3, 0, NULL),
(107, 'Guest house', 1, 1, NULL),
(108, 'Single room', 2, 0, 12),
(109, 'Superior room', 3, 1, NULL),
(110, 'Deluxe room', 1, 0, NULL),
(201, 'Deluxe room', 3, 0, NULL),
(202, 'Deluxe room', 3, 0, NULL),
(203, 'Deluxe room', 3, 0, NULL),
(301, 'Deluxe room', 2, 1, NULL),
(302, 'Deluxe room', 2, 1, NULL),
(303, 'Deluxe room', 2, 1, NULL),
(304, 'Deluxe room', 2, 1, NULL),
(306, 'Deluxe room', 2, 1, NULL),
(307, 'Deluxe room', 2, 1, 15),
(308, 'Deluxe room', 2, 1, NULL),
(309, 'Deluxe room', 2, 1, NULL),
(310, 'Deluxe room', 2, 1, NULL),
(401, 'Deluxe room', 2, 1, NULL),
(402, 'Deluxe room', 2, 1, NULL),
(403, 'Deluxe room', 2, 1, NULL),
(404, 'Deluxe room', 2, 1, 9),
(501, 'Superior room', 2, 1, 4),
(502, 'Superior room', 2, 1, NULL),
(503, 'Superior room', 2, 1, NULL),
(504, 'Superior room', 2, 1, 13),
(505, 'Superior room', 2, 1, NULL),
(506, 'Superior room', 2, 1, NULL),
(507, 'Superior room', 2, 1, NULL),
(508, 'Superior room', 2, 1, NULL),
(509, 'Superior room', 2, 1, NULL),
(510, 'Superior room', 2, 1, NULL),
(601, 'Superior room', 2, 1, NULL),
(602, 'Superior room', 2, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`PH_NO`),
  ADD UNIQUE KEY `BILL_ID` (`BILL_ID`),
  ADD KEY `PERSONID` (`CUSTOMER_ID`);

--
-- Indexes for table `convention_hall`
--
ALTER TABLE `convention_hall`
  ADD PRIMARY KEY (`HALL_NO`),
  ADD KEY `CUSTHALL` (`CUST_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`GUEST_ID`),
  ADD UNIQUE KEY `GUEST_ID` (`GUEST_ID`),
  ADD UNIQUE KEY `AADHAR_NO` (`AADHAR_NO`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMP_ID`);

--
-- Indexes for table `housekeeps`
--
ALTER TABLE `housekeeps`
  ADD PRIMARY KEY (`HID`),
  ADD KEY `HOUSE_EMP` (`EMP_NUMBER`),
  ADD KEY `HOUSE_ROOM` (`ROOM_NUM`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`INVOICE_NUMBER`),
  ADD UNIQUE KEY `INVOICE_NUMBER` (`INVOICE_NUMBER`),
  ADD KEY `INVOCUST` (`CUSTOMER_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `PAY_GUEST` (`GUEST_NUM`),
  ADD KEY `PAY_INVOICE` (`INVOICE_NUMBER`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD KEY `CATEGORY` (`CATEGORY`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`RID`),
  ADD KEY `RESERVING` (`GST_ID`),
  ADD KEY `RESERVING_ROOM` (`ROOM_NUMBER`),
  ADD KEY `RESERVING_HALL` (`HALL_NUMBER`),
  ADD KEY `CATEGORY_PRICE` (`CATEGORY`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ROOM_NO`),
  ADD KEY `CUST` (`CUSTOMER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `BILL_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `GUEST_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EMP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `housekeeps`
--
ALTER TABLE `housekeeps`
  MODIFY `HID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `INVOICE_NUMBER` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `RID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `PERSONID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`GUEST_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `convention_hall`
--
ALTER TABLE `convention_hall`
  ADD CONSTRAINT `CUSTHALL` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`GUEST_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `housekeeps`
--
ALTER TABLE `housekeeps`
  ADD CONSTRAINT `HOUSE_EMP` FOREIGN KEY (`EMP_NUMBER`) REFERENCES `employee` (`EMP_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `HOUSE_ROOM` FOREIGN KEY (`ROOM_NUM`) REFERENCES `room` (`ROOM_NO`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `INVOCUST` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`GUEST_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `PAY_GUEST` FOREIGN KEY (`GUEST_NUM`) REFERENCES `customer` (`GUEST_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PAY_INVOICE` FOREIGN KEY (`INVOICE_NUMBER`) REFERENCES `invoice` (`INVOICE_NUMBER`) ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `CATEGORY_PRICE` FOREIGN KEY (`CATEGORY`) REFERENCES `price_list` (`CATEGORY`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RESERVING` FOREIGN KEY (`GST_ID`) REFERENCES `customer` (`GUEST_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `RESERVING_HALL` FOREIGN KEY (`HALL_NUMBER`) REFERENCES `convention_hall` (`HALL_NO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RESERVING_ROOM` FOREIGN KEY (`ROOM_NUMBER`) REFERENCES `room` (`ROOM_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `CUST` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`GUEST_ID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
