-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2016 at 09:29 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wasteline`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_control_list`
--

CREATE TABLE IF NOT EXISTS `access_control_list` (
`ID` int(11) NOT NULL,
  `module_ID` int(11) NOT NULL,
  `account_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
`ID` int(10) unsigned NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `account_type_ID` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 - deleted, 1 - ok, 2 - draft, 3 - not confirmed'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `username`, `password`, `account_type_ID`, `status`) VALUES
(28, 'johnenrick', '7c33109462910f92e6fe204c549d8c94a3bc8a46', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_address`
--

CREATE TABLE IF NOT EXISTS `account_address` (
`ID` int(11) NOT NULL,
  `account_ID` int(11) NOT NULL,
  `barangay_ID` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 - deleted, 1 - ok'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `account_address`
--

INSERT INTO `account_address` (`ID`, `account_ID`, `barangay_ID`, `description`, `status`) VALUES
(2, 28, 2, 's2ss2', 1),
(3, 3, 2, '123', 2),
(4, 28, 2, 's', 1),
(5, 28, 2, 's', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_basic_information`
--

CREATE TABLE IF NOT EXISTS `account_basic_information` (
`ID` int(10) unsigned NOT NULL,
  `account_ID` int(10) unsigned NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `account_basic_information`
--

INSERT INTO `account_basic_information` (`ID`, `account_ID`, `first_name`, `middle_name`, `last_name`) VALUES
(27, 28, 'John Enrick', 'Retubado', 'Plenos');

-- --------------------------------------------------------

--
-- Table structure for table `account_contact_information`
--

CREATE TABLE IF NOT EXISTS `account_contact_information` (
`ID` int(10) unsigned NOT NULL,
  `account_ID` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'cell number, email',
  `detail` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `account_contact_information`
--

INSERT INTO `account_contact_information` (`ID`, `account_ID`, `type`, `detail`) VALUES
(40, 28, 1, 'plenosj2ohn@yahoo.com'),
(41, 28, 3, '09275835504');

-- --------------------------------------------------------

--
-- Table structure for table `account_contact_type`
--

CREATE TABLE IF NOT EXISTS `account_contact_type` (
`ID` int(10) unsigned NOT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `account_contact_type`
--

INSERT INTO `account_contact_type` (`ID`, `type`) VALUES
(1, 'Email Address'),
(2, 'F.A.X'),
(3, 'Telephone No.');

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE IF NOT EXISTS `account_type` (
`ID` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`ID`, `description`) VALUES
(1, 'Administrator'),
(2, 'User'),
(3, 'LGU');

-- --------------------------------------------------------

--
-- Table structure for table `action_log`
--

CREATE TABLE IF NOT EXISTS `action_log` (
`ID` int(11) NOT NULL,
  `account_ID` int(11) NOT NULL,
  `api_controller_ID` int(11) NOT NULL,
  `access_number_ID` int(11) NOT NULL,
  `detail` text NOT NULL,
  `datetime` double NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=618 ;

--
-- Dumping data for table `action_log`
--

INSERT INTO `action_log` (`ID`, `account_ID`, `api_controller_ID`, `access_number_ID`, `detail`, `datetime`) VALUES
(1, 0, 1, 0, '5', 1449244502),
(2, 0, 1, 0, '[]', 1449245201),
(3, 0, 1, 0, '[]', 1449245254),
(4, 0, 1, 0, '[]', 1449245309),
(5, 0, 1, 0, '[]', 1449245323),
(6, 0, 1, 0, '{"account_basic_information__address":"ewq"}', 1449245463),
(7, 0, 1, 0, '{"account_basic_information__address":"ewq"}', 1449245506),
(8, 0, 1, 0, '{"condition":{"account_basic_information__address":"ewq"}}', 1449245534),
(9, 0, 1, 0, '{"condition":{"account_basic_information__address":"ewq"}}', 1449245549),
(10, 0, 1, 0, '{"condition":{"like__account_basic_information__address":"ew"}}', 1449245567),
(11, 5, 2, 0, '4', 1449250207),
(12, 5, 2, 0, '5', 1449250216),
(13, 5, 2, 0, '{"type":"1","detail":"test2"}', 1449250227),
(14, 5, 2, 0, '{"condition":{"account_contact_information__type":"1"},"updated_data":{"detail":"testra"}}', 1449250304),
(15, 5, 2, 0, '{"condition":{"account_contact_information__type":"1"},"updated_data":{"detail":"testra1"}}', 1449250314),
(16, 5, 2, 0, '{"condition":{"account_contact_information__type":"1"},"updated_data":{"detail":"testra1"}}', 1449977907),
(17, 5, 2, 0, '{"condition":{"account_contact_information__type":"1"},"updated_data":{"detail":"testra3213"}}', 1449977957),
(18, 5, 1, 0, '4', 1450092715),
(19, 5, 1, 0, '6', 1450092779),
(20, 5, 1, 0, '7', 1450092890),
(21, 5, 1, 0, '8', 1450092901),
(22, 5, 1, 0, '9', 1450092916),
(23, 5, 1, 0, '10', 1450092936),
(24, 5, 1, 0, '11', 1450092950),
(25, 5, 1, 0, '12', 1450092969),
(26, 5, 1, 0, '15', 1450093673),
(27, 5, 1, 0, '{"ID":"15"}', 1450093828),
(28, 5, 1, 0, '[]', 1450093834),
(29, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092715"}}', 1450093905),
(30, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"}}', 1450093925),
(31, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450093970),
(32, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"desc"}}', 1450093980),
(33, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450094000),
(34, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"desc"}}', 1450094005),
(35, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"desc"}}', 1450094041),
(36, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"desc"}}', 1450094055),
(37, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"desc"}}', 1450094114),
(38, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450094128),
(39, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450094839),
(40, 6, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450094865),
(41, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450094872),
(42, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450094879),
(43, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450095004),
(44, 5, 1, 0, '{"condition":{"greater__report__datetime":"1450092750"},"sort":{"report__datetime":"asc"}}', 1450095121),
(45, 5, 1, 0, '16', 1450095178),
(46, 5, 1, 0, '{"associated_ID":"3","report_type_ID":"2","detail":"daghang tae"}', 1450095186),
(47, 5, 1, 0, '18', 1450095227),
(48, 5, 1, 0, '{"associated_ID":"3","report_type_ID":"3","detail":"daghang tae","longitude":"231","latitude":"3"}', 1450095233),
(49, 5, 1, 0, '{"associated_ID":"3","report_type_ID":"3","detail":"daghang tae","longitude":"231","latitude":"3","condition":{"report_type_ID":"3"}}', 1450095263),
(50, 5, 1, 0, '6', 1452712059),
(51, 5, 1, 0, '7', 1452712097),
(52, 5, 1, 0, '8', 1452712136),
(53, 5, 1, 0, '9', 1452712191),
(54, 5, 1, 0, '10', 1452717791),
(55, 5, 1, 0, '11', 1452717998),
(56, 5, 1, 0, '12', 1452746511),
(57, 5, 1, 0, '13', 1452746555),
(58, 5, 1, 0, '14', 1452746753),
(59, 5, 1, 0, '15', 1452746775),
(60, 5, 1, 0, '16', 1452746819),
(61, 5, 1, 0, '17', 1453219960),
(62, 0, 1, 0, '18', 1453295196),
(63, 0, 1, 0, '19', 1453296207),
(64, 0, 1, 0, '20', 1453296342),
(65, 0, 1, 0, '21', 1453296540),
(66, 0, 1, 0, '22', 1453296854),
(67, 0, 1, 0, '23', 1453297315),
(68, 0, 1, 0, '24', 1453297346),
(69, 0, 1, 0, '25', 1453297419),
(70, 0, 1, 0, '26', 1453794027),
(71, 0, 1, 0, '[]', 1453878075),
(72, 0, 1, 0, '{"all_information":"true"}', 1453878270),
(73, 0, 1, 0, '1', 1453902928),
(74, 0, 1, 0, '{"updated_data":{"description":"3","status":"4"},"ID":"1"}', 1453903310),
(75, 0, 1, 0, '{"updated_data":{"description":"3","status":"5"},"ID":"1"}', 1453903317),
(76, 0, 1, 0, '{"updated_data":{"description":"3","status":"5"},"ID":"1"}', 1453904130),
(77, 0, 1, 0, '{"updated_data":{"description":"3","status":"5"},"ID":"1"}', 1453904151),
(78, 0, 1, 0, '{"updated_data":{"description":"3","status":"5"},"ID":"1"}', 1453904165),
(79, 0, 1, 0, '{"updated_data":{"description":"3","status":"5"},"ID":"1"}', 1453904648),
(80, 0, 1, 0, '{"updated_data":{"description":"test","status":"7"},"ID":"1"}', 1453904657),
(81, 0, 1, 0, '{"updated_data":{"description":"test","status":"7","tobol":"231"},"ID":"1"}', 1453905212),
(82, 0, 1, 0, '{"updated_data":{"description":"test1","status":"72","tobol":"231"},"ID":"1"}', 1453905217),
(83, 0, 1, 0, '{"ID":"1"}', 1453905414),
(84, 0, 1, 0, '{"ID":"1"}', 1453905441),
(85, 0, 1, 0, '{"ID":"1"}', 1453905599),
(86, 0, 1, 0, '{"ID":"1"}', 1453905811),
(87, 0, 1, 0, '{"ID":"1"}', 1453905956),
(88, 0, 1, 0, '{"ID":"1"}', 1453906027),
(89, 0, 1, 0, '{"updated_data":{"description":"test","status":"7","tobol":"231"},"ID":"1"}', 1453906410),
(90, 0, 1, 0, '{"updated_data":{"description":"test","status":"7","tobol":"231s"},"ID":"1"}', 1453906416),
(91, 0, 1, 0, '{"updated_data":{"description":"test","status":"7","tobol":"231s"},"ID":"1"}', 1453906426),
(92, 0, 1, 0, '{"updated_data":{"description":"test","status":"7","tobol":"231s"},"ID":"1"}', 1453907187),
(93, 0, 1, 0, '{"updated_data":{"description":"test","status":"7","tobol":"231s"},"ID":"1"}', 1453908536),
(94, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7s","tobol":"231s"},"ID":"1"}', 1453908539),
(95, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd","tobol":"231s"},"ID":"1"}', 1453908552),
(96, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908566),
(97, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908587),
(98, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908589),
(99, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908601),
(100, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908652),
(101, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908666),
(102, 0, 1, 0, '{"updated_data":{"description":"tests","status":"7sd"},"ID":"1"}', 1453908675),
(103, 0, 1, 0, '{"updated_data":{"description":"testssd","status":"3"},"ID":"1"}', 1453908686),
(104, 0, 1, 0, '{"updated_data":{"description":"testssd","status":"3"},"condition":{"barangay_ID":"2"}}', 1453908906),
(105, 0, 1, 0, '{"updated_data":{"description":"testssd","status":"3"},"condition":{"barangay_ID":"2"}}', 1453908935),
(106, 0, 1, 0, '{"updated_data":{"description":"testssd","status":"31"},"condition":{"barangay_ID":"2"}}', 1453908942),
(107, 0, 1, 0, '{"updated_data":{"description":"testssde","status":"31"},"condition":{"barangay_ID":"2"}}', 1453908947),
(108, 0, 1, 0, '{"updated_data":{"description":"testssde","status":"31"},"condition":{"barangay_ID":"2"}}', 1453908982),
(109, 0, 1, 0, '{"updated_data":{"description":"testssde","status":"31"},"condition":{"barangay_ID":"2"}}', 1453912315),
(110, 0, 1, 0, '[]', 1454421797),
(111, 0, 1, 0, '{"account_ID":"s"}', 1454421913),
(112, 25, 1, 0, '[]', 1454422413),
(113, 25, 1, 0, '[]', 1454423284),
(114, 25, 1, 0, '[]', 1454423293),
(115, 25, 1, 0, '[]', 1454423295),
(116, 25, 1, 0, '[]', 1454423296),
(117, 25, 1, 0, '[]', 1454423507),
(118, 25, 1, 0, '[]', 1454423508),
(119, 25, 1, 0, '[]', 1454423509),
(120, 25, 1, 0, '[]', 1454423517),
(121, 25, 1, 0, '[]', 1454423558),
(122, 25, 1, 0, '[]', 1454423559),
(123, 25, 1, 0, '[]', 1454423561),
(124, 25, 1, 0, '[]', 1454423610),
(125, 25, 1, 0, '[]', 1454423618),
(126, 25, 1, 0, '[]', 1454423620),
(127, 25, 1, 0, '[]', 1454423620),
(128, 25, 1, 0, '[]', 1454423636),
(129, 25, 1, 0, '[]', 1454423637),
(130, 25, 1, 0, '[]', 1454423639),
(131, 25, 1, 0, '[]', 1454423640),
(132, 25, 1, 0, '[]', 1454423685),
(133, 25, 1, 0, '[]', 1454423686),
(134, 25, 1, 0, '[]', 1454423687),
(135, 25, 1, 0, '[]', 1454423748),
(136, 25, 1, 0, '[]', 1454423755),
(137, 25, 1, 0, '[]', 1454423768),
(138, 25, 1, 0, '[]', 1454423800),
(139, 25, 1, 0, '[]', 1454423805),
(140, 25, 1, 0, '[]', 1454423810),
(141, 25, 1, 0, '[]', 1454423852),
(142, 25, 1, 0, '[]', 1454423852),
(143, 25, 1, 0, '[]', 1454423854),
(144, 25, 1, 0, '[]', 1454423856),
(145, 25, 1, 0, '[]', 1454424012),
(146, 25, 1, 0, '[]', 1454424012),
(147, 25, 1, 0, '[]', 1454424015),
(148, 25, 1, 0, '[]', 1454424060),
(149, 25, 1, 0, '[]', 1454424060),
(150, 25, 1, 0, '[]', 1454424071),
(151, 25, 1, 0, '[]', 1454424071),
(152, 25, 1, 0, '[]', 1454424210),
(153, 25, 1, 0, '[]', 1454424210),
(154, 25, 1, 0, '[]', 1454424267),
(155, 25, 1, 0, '[]', 1454424692),
(156, 25, 1, 0, '[]', 1454424723),
(157, 25, 1, 0, '[]', 1454424723),
(158, 25, 1, 0, '[]', 1454425776),
(159, 25, 1, 0, '[]', 1454425776),
(160, 25, 1, 0, '[]', 1454425978),
(161, 25, 1, 0, '[]', 1454425978),
(162, 25, 1, 0, '[]', 1454426158),
(163, 25, 1, 0, '[]', 1454426158),
(164, 25, 1, 0, '[]', 1454426400),
(165, 25, 1, 0, '[]', 1454426401),
(166, 25, 1, 0, '[]', 1454426417),
(167, 25, 1, 0, '[]', 1454426417),
(168, 25, 1, 0, '[]', 1454426432),
(169, 25, 1, 0, '[]', 1454426432),
(170, 25, 1, 0, '[]', 1454427480),
(171, 25, 1, 0, '[]', 1454427480),
(172, 25, 1, 0, '[]', 1454428684),
(173, 25, 1, 0, '[]', 1454428684),
(174, 25, 1, 0, '[]', 1454428717),
(175, 25, 1, 0, '[]', 1454428717),
(176, 25, 1, 0, '[]', 1454428742),
(177, 25, 1, 0, '[]', 1454428742),
(178, 25, 1, 0, '[]', 1454429861),
(179, 25, 1, 0, '[]', 1454429861),
(180, 25, 1, 0, '[]', 1454429988),
(181, 25, 1, 0, '[]', 1454429988),
(182, 25, 1, 0, '[]', 1454430002),
(183, 25, 1, 0, '[]', 1454430002),
(184, 25, 1, 0, '[]', 1454430043),
(185, 25, 1, 0, '[]', 1454430043),
(186, 25, 1, 0, '[]', 1454430077),
(187, 25, 1, 0, '[]', 1454430077),
(188, 25, 1, 0, '[]', 1454430084),
(189, 25, 1, 0, '[]', 1454430084),
(190, 25, 1, 0, '[]', 1454430138),
(191, 25, 1, 0, '[]', 1454430138),
(192, 25, 1, 0, '[]', 1454430182),
(193, 25, 1, 0, '[]', 1454430182),
(194, 25, 1, 0, '[]', 1454430423),
(195, 25, 1, 0, '[]', 1454430423),
(196, 25, 1, 0, '[]', 1454430466),
(197, 25, 1, 0, '[]', 1454430466),
(198, 25, 1, 0, '[]', 1454435541),
(199, 25, 1, 0, '[]', 1454435542),
(200, 25, 1, 0, '[]', 1454436082),
(201, 25, 1, 0, '[]', 1454436082),
(202, 25, 1, 0, '[]', 1454436094),
(203, 25, 1, 0, '[]', 1454436094),
(204, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado"}}', 1454436095),
(205, 25, 1, 0, '[]', 1454436111),
(206, 25, 1, 0, '[]', 1454436111),
(207, 25, 1, 0, '[]', 1454436156),
(208, 25, 1, 0, '[]', 1454436156),
(209, 25, 1, 0, '[]', 1454436194),
(210, 25, 1, 0, '[]', 1454436194),
(211, 25, 1, 0, '[]', 1454436224),
(212, 25, 1, 0, '[]', 1454436224),
(213, 25, 1, 0, '[]', 1454436238),
(214, 25, 1, 0, '[]', 1454436238),
(215, 25, 1, 0, '[]', 1454436273),
(216, 25, 1, 0, '[]', 1454436273),
(217, 25, 1, 0, '[]', 1454436323),
(218, 25, 1, 0, '[]', 1454436323),
(219, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email":"plenosjohn@yahoo.com","username":"johnenrick","password":""}}', 1454436377),
(220, 25, 1, 0, '[]', 1454436510),
(221, 25, 1, 0, '[]', 1454436510),
(222, 25, 1, 0, '[]', 1454436528),
(223, 25, 1, 0, '[]', 1454436528),
(224, 25, 1, 0, '[]', 1454436716),
(225, 25, 1, 0, '[]', 1454436716),
(226, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email":"plenosjohn@yahoo.com","username":"johnenrick","password":""}}', 1454436718),
(227, 25, 1, 0, '[]', 1454436741),
(228, 25, 1, 0, '[]', 1454436741),
(229, 25, 1, 0, '[]', 1454436760),
(230, 25, 1, 0, '[]', 1454436760),
(231, 25, 1, 0, '[]', 1454436830),
(232, 25, 1, 0, '[]', 1454436830),
(233, 25, 1, 0, '[]', 1454436851),
(234, 25, 1, 0, '[]', 1454436851),
(235, 25, 1, 0, '[]', 1454436875),
(236, 25, 1, 0, '[]', 1454436875),
(237, 25, 1, 0, '[]', 1454436888),
(238, 25, 1, 0, '[]', 1454436888),
(239, 25, 1, 0, '[]', 1454437340),
(240, 25, 1, 0, '[]', 1454437340),
(241, 25, 1, 0, '[]', 1454437351),
(242, 25, 1, 0, '[]', 1454437351),
(243, 25, 1, 0, '[]', 1454437366),
(244, 25, 1, 0, '[]', 1454437366),
(245, 25, 1, 0, '[]', 1454437378),
(246, 25, 1, 0, '[]', 1454437378),
(247, 25, 1, 0, '[]', 1454437392),
(248, 25, 1, 0, '[]', 1454437392),
(249, 25, 1, 0, '[]', 1454437462),
(250, 25, 1, 0, '[]', 1454437462),
(251, 25, 1, 0, '[]', 1454437477),
(252, 25, 1, 0, '[]', 1454437477),
(253, 25, 1, 0, '[]', 1454437500),
(254, 25, 1, 0, '[]', 1454437500),
(255, 25, 1, 0, '[]', 1454437648),
(256, 25, 1, 0, '[]', 1454437648),
(257, 25, 1, 0, '[]', 1454437686),
(258, 25, 1, 0, '[]', 1454437686),
(259, 25, 1, 0, '[]', 1454437696),
(260, 25, 1, 0, '[]', 1454437696),
(261, 25, 1, 0, '[]', 1454437756),
(262, 25, 1, 0, '[]', 1454437756),
(263, 25, 1, 0, '[]', 1454437782),
(264, 25, 1, 0, '[]', 1454437782),
(265, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454437784),
(266, 25, 1, 0, '{"updated_data":{"first_name":"John Enricks","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454437788),
(267, 25, 1, 0, '[]', 1454437790),
(268, 25, 1, 0, '[]', 1454437790),
(269, 25, 1, 0, '{"updated_data":{"first_name":"John Enricks","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454437793),
(270, 25, 1, 0, '{"updated_data":{"first_name":"John Enricks","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454437878),
(271, 25, 1, 0, '[]', 1454437884),
(272, 25, 1, 0, '[]', 1454437884),
(273, 25, 1, 0, '{"updated_data":{"first_name":"John Enricks","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454437887),
(274, 25, 1, 0, '[]', 1454437907),
(275, 25, 1, 0, '[]', 1454437907),
(276, 25, 1, 0, '{"updated_data":{"first_name":"John Enricks","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454437909),
(277, 25, 1, 0, '[]', 1454438147),
(278, 25, 1, 0, '[]', 1454438147),
(279, 25, 1, 0, '{"updated_data":{"first_name":"John Enricks","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454438149),
(280, 25, 1, 0, '[]', 1454438151),
(281, 25, 1, 0, '[]', 1454438151),
(282, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubados","last_name":"Plenoss","username":"johnenrick","password":""}}', 1454438159),
(283, 25, 1, 0, '[]', 1454438161),
(284, 25, 1, 0, '[]', 1454438161),
(285, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubados","last_name":"Plenoss","email":"plenosjohns@yahoo.com","username":"johnenrick","password":""}}', 1454438169),
(286, 25, 1, 0, '[]', 1454438171),
(287, 25, 1, 0, '[]', 1454438171),
(288, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubados","last_name":"Plenoss","email":"plenosjohns@yahoo.com","username":"johnenrick","password":""}}', 1454438174),
(289, 25, 1, 0, '[]', 1454438176),
(290, 25, 1, 0, '[]', 1454438176),
(291, 25, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubados","last_name":"Plenoss","email":"plenosjohsn@yahoo.com","username":"johnenrick","password":""}}', 1454438180),
(292, 0, 1, 0, '27', 1454499492),
(293, 0, 1, 0, '28', 1454500064),
(294, 28, 1, 0, '[]', 1454500070),
(295, 28, 1, 0, '[]', 1454500070),
(296, 28, 1, 0, '[]', 1454500097),
(297, 28, 1, 0, '[]', 1454500097),
(298, 28, 1, 0, '[]', 1454500103),
(299, 28, 1, 0, '[]', 1454500103),
(300, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454500105),
(301, 28, 1, 0, '[]', 1454500223),
(302, 28, 1, 0, '[]', 1454500223),
(303, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454500226),
(304, 28, 1, 0, '[]', 1454500250),
(305, 28, 1, 0, '[]', 1454500250),
(306, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454500252),
(307, 28, 1, 0, '[]', 1454500278),
(308, 28, 1, 0, '[]', 1454500278),
(309, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":""}}', 1454500279),
(310, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email":"plenosjohsn@yahoo.com","username":"johnenrick","password":""}}', 1454500310),
(311, 28, 1, 0, '[]', 1454500359),
(312, 28, 1, 0, '[]', 1454500359),
(313, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","confirm_password":""}}', 1454500361),
(314, 28, 1, 0, '[]', 1454500375),
(315, 28, 1, 0, '[]', 1454500375),
(316, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick"}}', 1454500377),
(317, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":"johnenrick","confirm_password":"johnenrick"}}', 1454500742),
(318, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":"johnenrick","confirm_password":"johnenrick"}}', 1454500747),
(319, 28, 1, 0, '[]', 1454500749),
(320, 28, 1, 0, '[]', 1454500749),
(321, 28, 1, 0, '[]', 1454509554),
(322, 28, 1, 0, '[]', 1454509554),
(323, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick"}}', 1454509557),
(324, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick"}}', 1454509558),
(325, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick"}}', 1454509558),
(326, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":"johnenrick1","confirm_password":"johnenrick1"}}', 1454509574),
(327, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","username":"johnenrick","password":"johnenrick","confirm_password":"johnenrick"}}', 1454509581),
(328, 28, 1, 0, '[]', 1454509595),
(329, 28, 1, 0, '[]', 1454509595),
(330, 28, 1, 0, '[]', 1454510040),
(331, 28, 1, 0, '[]', 1454510040),
(332, 28, 1, 0, '[]', 1454510079),
(333, 28, 1, 0, '[]', 1454510079),
(334, 28, 1, 0, '[]', 1454510163),
(335, 28, 1, 0, '[]', 1454510163),
(336, 28, 1, 0, '[]', 1454510176),
(337, 28, 1, 0, '[]', 1454510176),
(338, 28, 1, 0, '[]', 1454510204),
(339, 28, 1, 0, '[]', 1454510204),
(340, 28, 1, 0, '[]', 1454510212),
(341, 28, 1, 0, '[]', 1454510212),
(342, 28, 1, 0, '[]', 1454510219),
(343, 28, 1, 0, '[]', 1454510219),
(344, 28, 1, 0, '[]', 1454510225),
(345, 28, 1, 0, '[]', 1454510225),
(346, 28, 1, 0, '[]', 1454510254),
(347, 28, 1, 0, '[]', 1454510254),
(348, 28, 1, 0, '[]', 1454510266),
(349, 28, 1, 0, '[]', 1454510266),
(350, 28, 1, 0, '[]', 1454510277),
(351, 28, 1, 0, '[]', 1454510277),
(352, 28, 1, 0, '[]', 1454510281),
(353, 28, 1, 0, '[]', 1454510281),
(354, 28, 1, 0, '[]', 1454510289),
(355, 28, 1, 0, '[]', 1454510289),
(356, 28, 1, 0, '[]', 1454510298),
(357, 28, 1, 0, '[]', 1454510298),
(358, 28, 1, 0, '[]', 1454512277),
(359, 28, 1, 0, '[]', 1454512278),
(360, 28, 1, 0, '[]', 1454512281),
(361, 28, 1, 0, '[]', 1454512281),
(362, 28, 1, 0, '[]', 1454552262),
(363, 28, 1, 0, '[]', 1454552262),
(364, 28, 1, 0, '[]', 1454552300),
(365, 28, 1, 0, '[]', 1454553593),
(366, 28, 1, 0, '[]', 1454553650),
(367, 28, 1, 0, '[]', 1454553650),
(368, 28, 1, 0, '[]', 1454558848),
(369, 28, 1, 0, '[]', 1454558848),
(370, 28, 1, 0, '[]', 1454588644),
(371, 28, 1, 0, '[]', 1454588644),
(372, 28, 1, 0, '[]', 1454588688),
(373, 28, 1, 0, '[]', 1454588688),
(374, 28, 1, 0, '[]', 1454588850),
(375, 28, 1, 0, '[]', 1454588851),
(376, 28, 1, 0, '[]', 1454588852),
(377, 28, 1, 0, '[]', 1454588852),
(378, 28, 1, 0, '[]', 1454588885),
(379, 28, 1, 0, '[]', 1454588885),
(380, 28, 1, 0, '[]', 1454590143),
(381, 28, 1, 0, '[]', 1454590144),
(382, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590148),
(383, 28, 1, 0, '[]', 1454590159),
(384, 28, 1, 0, '[]', 1454590159),
(385, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590160),
(386, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590330),
(387, 28, 1, 0, '[]', 1454590357),
(388, 28, 1, 0, '[]', 1454590357),
(389, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590392),
(390, 28, 1, 0, '[]', 1454590407),
(391, 28, 1, 0, '[]', 1454590407),
(392, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590408),
(393, 28, 1, 0, '[]', 1454590422),
(394, 28, 1, 0, '[]', 1454590422),
(395, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590424),
(396, 28, 1, 0, '[]', 1454590458),
(397, 28, 1, 0, '[]', 1454590458),
(398, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","username":"johnenrick","password":"","confirm_password":""}}', 1454590461),
(399, 28, 1, 0, '[]', 1454590472),
(400, 28, 1, 0, '[]', 1454590472),
(401, 28, 1, 0, '[]', 1454590491),
(402, 28, 1, 0, '[]', 1454590491),
(403, 28, 1, 0, '[]', 1454590512),
(404, 28, 1, 0, '[]', 1454590512),
(405, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","password":"","confirm_password":""}}', 1454590515),
(406, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","password":"","confirm_password":""}}', 1454590526),
(407, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","password":"","confirm_password":""}}', 1454590531),
(408, 28, 1, 0, '[]', 1454590555),
(409, 28, 1, 0, '[]', 1454590555),
(410, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","password":"","confirm_password":""}}', 1454590559),
(411, 28, 1, 0, '[]', 1454590586),
(412, 28, 1, 0, '[]', 1454590586),
(413, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","password":"","confirm_password":""}}', 1454590595),
(414, 28, 1, 0, '[]', 1454590636),
(415, 28, 1, 0, '[]', 1454590636),
(416, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"asdsad2@sd","contact_number_ID":"","contact_number_detail":"","username":"johnenrick","password":"","confirm_password":""}}', 1454590641),
(417, 28, 1, 0, '[]', 1454590673),
(418, 28, 1, 0, '[]', 1454590673),
(419, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","0":"3","email_detail":"plenosjohn@yahoo.com","contact_number_ID":"","contact_number_detail":"","username":"johnenrick","password":"","confirm_password":""}}', 1454590676),
(420, 28, 1, 0, '[]', 1454590695),
(421, 28, 1, 0, '[]', 1454590695),
(422, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"25","email_detail":"plenosjohn@yahoo.com","contact_number_ID":"","contact_number_detail":"","username":"johnenrick","password":"","confirm_password":""}}', 1454590696),
(423, 28, 1, 0, '[]', 1454590696),
(424, 28, 1, 0, '[]', 1454590776),
(425, 28, 1, 0, '[]', 1454590776),
(426, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"25","contact_number_ID":"","contact_number_detail":"","username":"johnenrick","confirm_password":""}}', 1454590778),
(427, 28, 1, 0, '[]', 1454590815),
(428, 28, 1, 0, '[]', 1454590815),
(429, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","contact_number_detail":"","username":"johnenrick","confirm_password":""}}', 1454590817),
(430, 28, 1, 0, '[]', 1454590878),
(431, 28, 1, 0, '[]', 1454590878),
(432, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","contact_number_detail":"","username":"johnenrick","confirm_password":""}}', 1454590882),
(433, 28, 1, 0, '[]', 1454590882),
(434, 28, 1, 0, '[]', 1454590949),
(435, 28, 1, 0, '[]', 1454590949),
(436, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","contact_number_detail":"","username":"johnenrick","confirm_password":""}}', 1454590951),
(437, 28, 1, 0, '[]', 1454590951),
(438, 28, 1, 0, '[]', 1454590963),
(439, 28, 1, 0, '[]', 1454590963),
(440, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_detail":"plenosjohn@yahoo.com","contact_number_detail":"","username":"johnenrick","confirm_password":""}}', 1454590964),
(441, 28, 1, 0, '[]', 1454590964),
(442, 28, 1, 0, '[]', 1454591201),
(443, 28, 1, 0, '[]', 1454591201),
(444, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591204),
(445, 28, 1, 0, '[]', 1454591204),
(446, 28, 1, 0, '[]', 1454591211),
(447, 28, 1, 0, '[]', 1454591211),
(448, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591214),
(449, 28, 1, 0, '[]', 1454591214),
(450, 28, 1, 0, '[]', 1454591217),
(451, 28, 1, 0, '[]', 1454591217),
(452, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591220),
(453, 28, 1, 0, '[]', 1454591220),
(454, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591251),
(455, 28, 1, 0, '[]', 1454591251),
(456, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591280),
(457, 28, 1, 0, '[]', 1454591280),
(458, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591286),
(459, 28, 1, 0, '[]', 1454591286),
(460, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591293),
(461, 28, 1, 0, '[]', 1454591294),
(462, 28, 1, 0, '[]', 1454591322),
(463, 28, 1, 0, '[]', 1454591322),
(464, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591324),
(465, 28, 1, 0, '[]', 1454591324),
(466, 28, 1, 0, '[]', 1454591474),
(467, 28, 1, 0, '[]', 1454591474),
(468, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591478),
(469, 28, 1, 0, '[]', 1454591478),
(470, 28, 1, 0, '[]', 1454591524),
(471, 28, 1, 0, '[]', 1454591525),
(472, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591528),
(473, 28, 1, 0, '[]', 1454591528),
(474, 28, 1, 0, '[]', 1454591586),
(475, 28, 1, 0, '[]', 1454591586),
(476, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick","password":"","confirm_password":""}}', 1454591587),
(477, 28, 1, 0, '[]', 1454591587),
(478, 28, 1, 0, '[]', 1454591609),
(479, 28, 1, 0, '[]', 1454591609),
(480, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"25","email_detail":"plenosjohn@yahoo.com","contact_number_ID":"","contact_number_detail":"","username":"johnenrick","password":"","confirm_password":""}}', 1454591612),
(481, 28, 1, 0, '[]', 1454591612),
(482, 28, 1, 0, '[]', 1454591628),
(483, 28, 1, 0, '[]', 1454591628),
(484, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"25","email_detail":"plenosjohn@yahoo.com","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591629),
(485, 28, 1, 0, '[]', 1454591629),
(486, 28, 1, 0, '[]', 1454591668),
(487, 28, 1, 0, '[]', 1454591668),
(488, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"25","email_detail":"plenosjoshn@yahoo.com","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591671),
(489, 28, 1, 0, '[]', 1454591671),
(490, 28, 1, 0, '[]', 1454591708),
(491, 28, 1, 0, '[]', 1454591708),
(492, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591718),
(493, 28, 1, 0, '[]', 1454591718),
(494, 28, 1, 0, '[]', 1454591722),
(495, 28, 1, 0, '[]', 1454591722),
(496, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"25","email_detail":"plenosjohn@yahoo.com","contact_number_ID":"","contact_number_detail":"","username":"johnenrick"}}', 1454591725),
(497, 28, 1, 0, '[]', 1454591725),
(498, 28, 1, 0, '[]', 1454591727),
(499, 28, 1, 0, '[]', 1454591727),
(500, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"1254","username":"johnenrick"}}', 1454592054),
(501, 28, 1, 0, '[]', 1454592054),
(502, 28, 1, 0, '[]', 1454592095),
(503, 28, 1, 0, '[]', 1454592095),
(504, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"1232","username":"johnenrick"}}', 1454592099),
(505, 28, 1, 0, '[]', 1454592099),
(506, 28, 1, 0, '[]', 1454592194),
(507, 28, 1, 0, '[]', 1454592194),
(508, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"s","username":"johnenrick"}}', 1454592196),
(509, 28, 1, 0, '[]', 1454592197),
(510, 28, 1, 0, '[]', 1454592216),
(511, 28, 1, 0, '[]', 1454592216),
(512, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"2","username":"johnenrick"}}', 1454592218),
(513, 28, 1, 0, '[]', 1454592218),
(514, 28, 1, 0, '[]', 1454592233),
(515, 28, 1, 0, '[]', 1454592233),
(516, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"","contact_number_detail":"2","username":"johnenrick"}}', 1454592235),
(517, 28, 1, 0, '[]', 1454592235),
(518, 28, 1, 0, '[]', 1454592316),
(519, 28, 1, 0, '[]', 1454592316),
(520, 28, 1, 0, '[]', 1454592376),
(521, 28, 1, 0, '[]', 1454592376),
(522, 28, 1, 0, '[]', 1454592398),
(523, 28, 1, 0, '[]', 1454592398),
(524, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"","email_detail":"plenosjohn@yahoo.com","contact_number_ID":"","contact_number_detail":"09275835504","username":"johnenrick"}}', 1454592408),
(525, 28, 1, 0, '[]', 1454592408),
(526, 28, 1, 0, '[]', 1454592463),
(527, 28, 1, 0, '[]', 1454592463),
(528, 28, 1, 0, '[]', 1454594169),
(529, 28, 1, 0, '[]', 1454594169),
(530, 28, 1, 0, '[]', 1454594197),
(531, 28, 1, 0, '[]', 1454594197),
(532, 28, 1, 0, '[]', 1454595658),
(533, 28, 1, 0, '[]', 1454595658),
(534, 28, 1, 0, '[]', 1454595692),
(535, 28, 1, 0, '[]', 1454595692),
(536, 28, 1, 0, '[]', 1454595701),
(537, 28, 1, 0, '[]', 1454595701),
(538, 28, 1, 0, '[]', 1454595824),
(539, 28, 1, 0, '[]', 1454595824),
(540, 28, 1, 0, '[]', 1454602100),
(541, 28, 1, 0, '[]', 1454602100),
(542, 28, 1, 0, '[]', 1454604777),
(543, 28, 1, 0, '[]', 1454604777),
(544, 28, 1, 0, '[]', 1454605243),
(545, 28, 1, 0, '[]', 1454605243),
(546, 28, 1, 0, '[]', 1454605321),
(547, 28, 1, 0, '[]', 1454605321),
(548, 28, 1, 0, '[]', 1454605338),
(549, 28, 1, 0, '[]', 1454605338),
(550, 28, 1, 0, '[]', 1454605399),
(551, 28, 1, 0, '[]', 1454605399),
(552, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","acount_address_ID":"0","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"test"}}', 1454605404),
(553, 28, 1, 0, '[]', 1454605404),
(554, 28, 1, 0, '[]', 1454605407),
(555, 28, 1, 0, '[]', 1454605407),
(556, 28, 1, 0, '[]', 1454605448),
(557, 28, 1, 0, '[]', 1454605448),
(558, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","acount_address_ID":"0","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"sa"}}', 1454605452),
(559, 28, 1, 0, '[]', 1454605452),
(560, 28, 1, 0, '[]', 1454605482),
(561, 28, 1, 0, '[]', 1454605482),
(562, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","acount_address_ID":"0","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"s"}}', 1454605485),
(563, 28, 1, 0, '[]', 1454605485),
(564, 28, 1, 0, '[]', 1454605543),
(565, 28, 1, 0, '[]', 1454605543),
(566, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","acount_address_ID":"0","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"3"}}', 1454605545),
(567, 28, 1, 0, '[]', 1454605546),
(568, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","acount_address_ID":"0","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"3"}}', 1454606758),
(569, 28, 1, 0, '[]', 1454606758),
(570, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","acount_address_ID":"0","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"3"}}', 1454606774),
(571, 28, 1, 0, '[]', 1454606774),
(572, 28, 1, 0, '[]', 1454606827),
(573, 28, 1, 0, '[]', 1454606827),
(574, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"","account_address_longitude":"","account_address_latitude":"","account_address_map_marker_ID":"0","account_address_description":"s"}}', 1454606830),
(575, 28, 1, 0, '[]', 1454606830),
(576, 28, 1, 0, '[]', 1454606836),
(577, 28, 1, 0, '[]', 1454606836),
(578, 28, 1, 0, '[]', 1454606872),
(579, 28, 1, 0, '[]', 1454606872),
(580, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s"}}', 1454606878),
(581, 28, 1, 0, '[]', 1454606878),
(582, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s"}}', 1454606885),
(583, 28, 1, 0, '[]', 1454606885),
(584, 28, 1, 0, '[]', 1454606950),
(585, 28, 1, 0, '[]', 1454606950),
(586, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2"}}', 1454607000),
(587, 28, 1, 0, '[]', 1454607000),
(588, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2ss"}}', 1454607007),
(589, 28, 1, 0, '[]', 1454607007),
(590, 28, 1, 0, '[]', 1454607018),
(591, 28, 1, 0, '[]', 1454607018),
(592, 28, 1, 0, '[]', 1454607091),
(593, 28, 1, 0, '[]', 1454607091),
(594, 28, 1, 0, '[]', 1454610776),
(595, 28, 1, 0, '[]', 1454610776),
(596, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2ss"}}', 1454610778),
(597, 28, 1, 0, '[]', 1454610778),
(598, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","email_ID":"40","email_detail":"plenosj2ohn@yahoo.com","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2ss2"}}', 1454610787),
(599, 28, 1, 0, '[]', 1454610787),
(600, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","password":"johnenrick","confirm_password":"johnenrick","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2ss2"}}', 1454610800),
(601, 28, 1, 0, '[]', 1454610800),
(602, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","password":"johnenrick1","confirm_password":"johnenrick1","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2ss2"}}', 1454610810),
(603, 28, 1, 0, '[]', 1454610810),
(604, 28, 1, 0, '{"updated_data":{"first_name":"John Enrick","middle_name":"Retubado","last_name":"Plenos","contact_number_ID":"41","contact_number_detail":"09275835504","username":"johnenrick","password":"johnenrick","confirm_password":"johnenrick","account_address_ID":"2","account_address_longitude":"0","account_address_latitude":"0","account_address_map_marker_ID":"4","account_address_description":"s2ss2"}}', 1454610816),
(605, 28, 1, 0, '[]', 1454610816),
(606, 28, 1, 0, '[]', 1454610854),
(607, 28, 1, 0, '[]', 1454610854),
(608, 28, 1, 0, '[]', 1454611053),
(609, 28, 1, 0, '[]', 1454611053),
(610, 28, 1, 0, '[]', 1454611116),
(611, 28, 1, 0, '[]', 1454611372),
(612, 28, 1, 0, '[]', 1454650176),
(613, 28, 1, 0, '[]', 1454650176),
(614, 28, 1, 0, '[]', 1454650193),
(615, 28, 1, 0, '[]', 1454651427),
(616, 28, 1, 0, '[]', 1454657987),
(617, 28, 1, 0, '[]', 1454657988);

-- --------------------------------------------------------

--
-- Table structure for table `api_controller`
--

CREATE TABLE IF NOT EXISTS `api_controller` (
`ID` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `barangay`
--

CREATE TABLE IF NOT EXISTS `barangay` (
`ID` int(10) unsigned NOT NULL,
  `name` text,
  `boundary` text,
  `address` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `barangay`
--

INSERT INTO `barangay` (`ID`, `name`, `boundary`, `address`) VALUES
(1, 'talamban', '5', '2');

-- --------------------------------------------------------

--
-- Table structure for table `dumping_location`
--

CREATE TABLE IF NOT EXISTS `dumping_location` (
  `ID` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_access_control_list`
--

CREATE TABLE IF NOT EXISTS `group_access_control_list` (
`ID` int(11) NOT NULL,
  `module_ID` int(11) NOT NULL,
  `group_ID` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `group_access_control_list`
--

INSERT INTO `group_access_control_list` (`ID`, `module_ID`, `group_ID`) VALUES
(1, 1, 2),
(2, 4, 2),
(3, 3, 2),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
`ID` int(10) unsigned NOT NULL,
  `barangay_ID` int(10) unsigned NOT NULL,
  `type_ID` int(10) unsigned NOT NULL,
  `detail` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `information_type`
--

CREATE TABLE IF NOT EXISTS `information_type` (
`ID` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `information_type`
--

INSERT INTO `information_type` (`ID`, `description`) VALUES
(1, 'Articles'),
(2, 'Guidelines');

-- --------------------------------------------------------

--
-- Table structure for table `map_marker`
--

CREATE TABLE IF NOT EXISTS `map_marker` (
`ID` int(10) unsigned NOT NULL,
  `associated_ID` int(11) NOT NULL,
  `map_marker_type_ID` int(11) NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `map_marker`
--

INSERT INTO `map_marker` (`ID`, `associated_ID`, `map_marker_type_ID`, `longitude`, `latitude`) VALUES
(4, 2, 1, 0, 0),
(5, 4, 1, 0, 0),
(6, 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `map_marker_type`
--

CREATE TABLE IF NOT EXISTS `map_marker_type` (
`ID` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `map_marker_type`
--

INSERT INTO `map_marker_type` (`ID`, `description`) VALUES
(1, 'User Address'),
(2, 'Dumping Location'),
(3, 'report');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
`ID` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `parent_ID` int(11) NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ID`, `description`, `parent_ID`, `link`) VALUES
(1, 'Home', 0, 'portal'),
(2, 'Waste Map', 0, 'wastemap'),
(3, 'Information', 0, 'information_page'),
(4, 'Profile', 0, 'profile_management');

-- --------------------------------------------------------

--
-- Table structure for table `module_api_controller`
--

CREATE TABLE IF NOT EXISTS `module_api_controller` (
`ID` int(11) NOT NULL,
  `module_ID` int(11) NOT NULL,
  `api_controller_ID` int(11) NOT NULL,
  `privilege_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
`ID` int(10) unsigned NOT NULL,
  `associated_ID` int(11) NOT NULL,
  `report_type_ID` int(10) unsigned NOT NULL,
  `reporter_account_ID` int(11) NOT NULL,
  `detail` text,
  `datetime` double DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1 - ongoing, 2 - done'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ID`, `associated_ID`, `report_type_ID`, `reporter_account_ID`, `detail`, `datetime`, `status`) VALUES
(4, 2, 2, 5, 'testing', 1450092715, 1),
(5, 2, 3, 5, 'testing', 1450092747, 1),
(6, 2, 3, 5, 'testing', 1450092779, 1),
(7, 2, 3, 5, 'testing', 1450092890, 1),
(8, 2, 3, 5, 'testing', 1450092901, 1),
(9, 2, 3, 5, 'testing', 1450092916, 1),
(10, 2, 3, 5, 'testing', 1450092936, 1),
(11, 2, 3, 5, 'testing', 1450092950, 1),
(12, 2, 3, 5, 'testing', 1450092969, 1),
(13, 2, 3, 5, 'testing', 1450092981, 1),
(14, 2, 3, 5, 'testing', 1450093031, 1),
(15, 2, 3, 5, 'testing', 1450093673, 1),
(16, 3, 2, 5, 'daghang tae', 1450095178, 1),
(17, 3, 3, 5, 'daghang tae', 1450095215, 1),
(18, 3, 3, 5, 'daghang tae', 1450095227, 1),
(19, 3, 3, 5, 'tobol', 1450095340, 1),
(20, 3, 3, 5, 'tobol', 1450095362, 1),
(21, 3, 3, 5, 'tobol', 1450095432, 1),
(22, 3, 3, 5, 'tobol', 1450095436, 1),
(23, 3, 3, 5, 'tobol', 1450095461, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE IF NOT EXISTS `report_type` (
`ID` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `report_type`
--

INSERT INTO `report_type` (`ID`, `description`) VALUES
(1, 'Marker'),
(2, 'Article'),
(3, 'Illegal Dumping');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
`ID` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`ID`, `description`) VALUES
(1, 'Collected'),
(2, 'Not Collected');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
`ID` int(10) unsigned NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`ID`, `unit`, `description`) VALUES
(1, 'Kg', 'Kilogram'),
(2, 'PhP', 'Peso');

-- --------------------------------------------------------

--
-- Table structure for table `waste_category`
--

CREATE TABLE IF NOT EXISTS `waste_category` (
`ID` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `waste_category`
--

INSERT INTO `waste_category` (`ID`, `description`) VALUES
(1, 'Biodegradable'),
(2, 'Non-Biodegradable'),
(3, 'Hazardous');

-- --------------------------------------------------------

--
-- Table structure for table `waste_post`
--

CREATE TABLE IF NOT EXISTS `waste_post` (
`ID` int(10) unsigned NOT NULL,
  `account_ID` int(10) unsigned NOT NULL,
  `waste_category_ID` int(10) unsigned NOT NULL,
  `description` text,
  `quantity` double DEFAULT NULL,
  `quantity_unit_ID` int(10) unsigned NOT NULL COMMENT 'change quantity unit int to varchar 20',
  `price` double DEFAULT NULL,
  `datetime` double DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `waste_post_type`
--

CREATE TABLE IF NOT EXISTS `waste_post_type` (
`ID` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `waste_post_type`
--

INSERT INTO `waste_post_type` (`ID`, `description`) VALUES
(1, 'Own Waste'),
(2, 'Waste Accepted'),
(3, 'Waste Services');

-- --------------------------------------------------------

--
-- Table structure for table `waste_service`
--

CREATE TABLE IF NOT EXISTS `waste_service` (
`ID` int(10) unsigned NOT NULL,
  `account_ID` int(10) unsigned NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_control_list`
--
ALTER TABLE `access_control_list`
 ADD PRIMARY KEY (`ID`), ADD KEY `access_control_list_account_ID` (`account_ID`), ADD KEY `access_control_list_module_ID` (`module_ID`);

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `username` (`username`), ADD KEY `account_account_type_ID_idx` (`account_type_ID`);

--
-- Indexes for table `account_address`
--
ALTER TABLE `account_address`
 ADD PRIMARY KEY (`ID`), ADD KEY `account_ID` (`account_ID`,`barangay_ID`);

--
-- Indexes for table `account_basic_information`
--
ALTER TABLE `account_basic_information`
 ADD PRIMARY KEY (`ID`), ADD KEY `account_basic_information_account_ID_idx` (`account_ID`);

--
-- Indexes for table `account_contact_information`
--
ALTER TABLE `account_contact_information`
 ADD PRIMARY KEY (`ID`), ADD KEY `account_contact_information_account_ID_idx` (`account_ID`), ADD KEY `account_contact_infotmation_type_idx` (`type`);

--
-- Indexes for table `account_contact_type`
--
ALTER TABLE `account_contact_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `action_log`
--
ALTER TABLE `action_log`
 ADD PRIMARY KEY (`ID`), ADD KEY `api_controller_ID` (`api_controller_ID`,`access_number_ID`), ADD KEY `account_ID` (`account_ID`);

--
-- Indexes for table `api_controller`
--
ALTER TABLE `api_controller`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `barangay`
--
ALTER TABLE `barangay`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `group_access_control_list`
--
ALTER TABLE `group_access_control_list`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
 ADD PRIMARY KEY (`ID`), ADD KEY `information_detail_barangay_ID_idx` (`barangay_ID`), ADD KEY `information_detail_type_ID_idx` (`type_ID`);

--
-- Indexes for table `information_type`
--
ALTER TABLE `information_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `map_marker`
--
ALTER TABLE `map_marker`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `map_marker_type`
--
ALTER TABLE `map_marker_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `module_api_controller`
--
ALTER TABLE `module_api_controller`
 ADD PRIMARY KEY (`ID`), ADD KEY `module_api_controller_module_ID` (`module_ID`) COMMENT 'foreign for module', ADD KEY `module_api_controller_api_controller_ID` (`api_controller_ID`) COMMENT 'foreign key of api controller';

--
-- Indexes for table `report`
--
ALTER TABLE `report`
 ADD PRIMARY KEY (`ID`), ADD KEY `report_report_type_ID_idx` (`report_type_ID`), ADD KEY `entry_ID` (`associated_ID`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `waste_category`
--
ALTER TABLE `waste_category`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `waste_post`
--
ALTER TABLE `waste_post`
 ADD PRIMARY KEY (`ID`), ADD KEY `waste_post_waste_category_ID_idx` (`waste_category_ID`), ADD KEY `waste_post_quantity_unit_idx` (`quantity_unit_ID`), ADD KEY `waste_post_status_ID_idx` (`status`), ADD KEY `waste_post_type_ID_idx` (`type`), ADD KEY `waste_post_account_ID_idx` (`account_ID`);

--
-- Indexes for table `waste_post_type`
--
ALTER TABLE `waste_post_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `waste_service`
--
ALTER TABLE `waste_service`
 ADD PRIMARY KEY (`ID`), ADD KEY `waste_service_account_ID_idx` (`account_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_control_list`
--
ALTER TABLE `access_control_list`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `account_address`
--
ALTER TABLE `account_address`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `account_basic_information`
--
ALTER TABLE `account_basic_information`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `account_contact_information`
--
ALTER TABLE `account_contact_information`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `account_contact_type`
--
ALTER TABLE `account_contact_type`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `action_log`
--
ALTER TABLE `action_log`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=618;
--
-- AUTO_INCREMENT for table `api_controller`
--
ALTER TABLE `api_controller`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `barangay`
--
ALTER TABLE `barangay`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_access_control_list`
--
ALTER TABLE `group_access_control_list`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `information_type`
--
ALTER TABLE `information_type`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `map_marker`
--
ALTER TABLE `map_marker`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `map_marker_type`
--
ALTER TABLE `map_marker_type`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `module_api_controller`
--
ALTER TABLE `module_api_controller`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `waste_category`
--
ALTER TABLE `waste_category`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `waste_post`
--
ALTER TABLE `waste_post`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `waste_post_type`
--
ALTER TABLE `waste_post_type`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `waste_service`
--
ALTER TABLE `waste_service`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
ADD CONSTRAINT `account_account_type_ID` FOREIGN KEY (`account_type_ID`) REFERENCES `account_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_basic_information`
--
ALTER TABLE `account_basic_information`
ADD CONSTRAINT `account_basic_information_account_ID` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_contact_information`
--
ALTER TABLE `account_contact_information`
ADD CONSTRAINT `account_contact_information_account_ID` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `account_contact_infotmation_type` FOREIGN KEY (`type`) REFERENCES `account_contact_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `information`
--
ALTER TABLE `information`
ADD CONSTRAINT `information_barangay_ID` FOREIGN KEY (`barangay_ID`) REFERENCES `barangay` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `information_type_ID` FOREIGN KEY (`type_ID`) REFERENCES `information_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
ADD CONSTRAINT `report_report_type_ID` FOREIGN KEY (`report_type_ID`) REFERENCES `report_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waste_post`
--
ALTER TABLE `waste_post`
ADD CONSTRAINT `waste_post_account_ID` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `waste_post_quantity_unit_ID` FOREIGN KEY (`quantity_unit_ID`) REFERENCES `unit` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `waste_post_status_ID` FOREIGN KEY (`status`) REFERENCES `status` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `waste_post_type_ID` FOREIGN KEY (`type`) REFERENCES `waste_post_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `waste_post_waste_category_ID` FOREIGN KEY (`waste_category_ID`) REFERENCES `waste_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waste_service`
--
ALTER TABLE `waste_service`
ADD CONSTRAINT `waste_service_account_ID` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
