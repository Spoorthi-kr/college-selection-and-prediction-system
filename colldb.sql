-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 03, 2017 at 11:52 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `colldb`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `avg_rating`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_rating` (IN `cids` INT(5), IN `camp` INT(1), IN `plac` INT(1), IN `infr` INT(1), IN `facl` INT(1))  NO SQL
BEGIN
UPDATE COLL_INFO P SET no_of_ratings=no_of_ratings+1;
UPDATE coll_info p set avg_campus=((avg_campus*(no_of_ratings-1))+camp)/no_of_ratings where p.cid=cids;
UPDATE coll_info p set avg_placements=((avg_placements*(no_of_ratings-1))+plac)/no_of_ratings where p.cid=cids;
UPDATE coll_info p set avg_infrastructure=((avg_infrastructure*(no_of_ratings-1))+infr)/no_of_ratings where p.cid=cids;
UPDATE coll_info p set avg_faculty=((avg_faculty*(no_of_ratings-1))+facl)/no_of_ratings where p.cid=cids;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `alogin`
--

DROP TABLE IF EXISTS `alogin`;
CREATE TABLE IF NOT EXISTS `alogin` (
  `admin_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alogin`
--

INSERT INTO `alogin` (`admin_name`, `password`) VALUES
('spoo', 'spoo');

-- --------------------------------------------------------

--
-- Table structure for table `cettable`
--

DROP TABLE IF EXISTS `cettable`;
CREATE TABLE IF NOT EXISTS `cettable` (
  `cid` int(5) NOT NULL,
  `branch` varchar(3) NOT NULL,
  `1` int(8) NOT NULL,
  `2` int(8) NOT NULL,
  `3` int(8) NOT NULL,
  `gm` int(8) NOT NULL,
  `sc` int(8) NOT NULL,
  `st` int(8) NOT NULL,
  PRIMARY KEY (`cid`,`branch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cettable`
--

INSERT INTO `cettable` (`cid`, `branch`, `1`, `2`, `3`, `gm`, `sc`, `st`) VALUES
(65, 'civ', 13008, 14214, 11250, 9537, 19638, 15892),
(65, 'cse', 4194, 4130, 2949, 1805, 9128, 3843),
(65, 'ece', 3123, 4130, 2575, 2316, 7154, 4800),
(65, 'eee', 7653, 8822, 6393, 5280, 19737, 10939),
(65, 'ise', 4632, 5499, 3310, 2990, 16989, 10939),
(65, 'me', 12819, 11888, 7189, 8914, 23478, 12874),
(66, 'civ', 9578, 8488, 6103, 5719, 20854, 6129),
(66, 'cse', 770, 1768, 681, 434, 5365, 2162),
(66, 'ece', 850, 711, 1365, 532, 6715, 2790),
(66, 'ise', 1583, 2531, 2033, 656, 10128, 9384),
(66, 'me', 5793, 3896, 3303, 1709, 18707, 4812),
(67, 'cse', 9230, 16034, 6110, 5767, 27395, 10435),
(67, 'ece', 15048, 12754, 9277, 7703, 28139, 11444),
(67, 'me', 18892, 22967, 17544, 15713, 35493, 21394),
(68, 'civ', 2558, 5595, 2884, 1988, 14988, 14000),
(68, 'cse', 466, 500, 357, 1653, 14042, 14373),
(68, 'ece', 334, 576, 267, 121, 1874, 1836),
(68, 'me', 572, 1948, 636, 538, 2621, 2192),
(69, 'cse', 4620, 5697, 3359, 3020, 23184, 13038),
(69, 'ece', 6705, 7698, 3913, 3253, 20987, 12988);

-- --------------------------------------------------------

--
-- Table structure for table `coll_info`
--

DROP TABLE IF EXISTS `coll_info`;
CREATE TABLE IF NOT EXISTS `coll_info` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cetcode` varchar(4) DEFAULT NULL,
  `comedkcode` varchar(5) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `ph` bigint(13) DEFAULT NULL,
  `naac` varchar(5) DEFAULT NULL,
  `no_of_ratings` int(3) NOT NULL DEFAULT '0',
  `avg_campus` float(2,1) NOT NULL DEFAULT '0.0',
  `avg_placements` float(2,1) NOT NULL DEFAULT '0.0',
  `avg_infrastructure` float(2,1) NOT NULL DEFAULT '0.0',
  `avg_faculty` float(2,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coll_info`
--

INSERT INTO `coll_info` (`cid`, `name`, `cetcode`, `comedkcode`, `city`, `type`, `ph`, `naac`, `no_of_ratings`, `avg_campus`, `avg_placements`, `avg_infrastructure`, `avg_faculty`) VALUES
(65, 'UVCE', 'E001', 'E005', 'BANGALORE', 'GOVT', 22961803, 'B', 18, 1.0, 2.0, 1.9, 2.9),
(66, 'BMS', 'E003', 'E017', 'BANGALORE', 'PA', 26622135, NULL, 18, 0.0, 0.0, 0.0, 0.0),
(67, 'AIT', 'E005', 'E027', 'BANGALORE', 'PA/PUA', 23237789, NULL, 18, 0.1, 0.4, 0.3, 0.4),
(68, 'RVCE', 'E008', 'E061', 'BANGALORE', 'PUA', 67178164, 'A', 18, 0.0, 0.0, 0.0, 0.0),
(69, 'SIDDAGANGA INSTITUTE OF TECHNOLOGY', 'E016', 'E076', 'TUMKUR', 'PUA', 2631868, NULL, 18, 0.2, 0.3, 0.1, 0.3),
(70, 'SRI JAYACHAMARAJENDRA COLLEGE', 'E021', 'E037', 'MYSORE', 'PA', 802125482, NULL, 18, 0.2, 0.3, 0.3, 0.2),
(71, 'SDM COLLEGE OF ENGINEERING', 'E034', 'E073', 'DHARVAD', 'ML', 2464638, NULL, 18, 0.8, 1.0, 0.5, 1.0),
(73, 'NITTE MEENAKSHI INSTITUTE OF  TECHNOLOGY', 'E105', 'E054', 'BANGALORE', 'PUA', 802216780, NULL, 18, 0.0, 0.0, 0.0, 0.0),
(74, 'RNS INSTITUTE OF TECHNOLOGY', 'E118', 'E066', 'BANGALORE', 'PUA', 8028611881, NULL, 18, 2.0, 1.5, 0.5, 2.0),
(75, 'ST.JOSEPH ENGINEERING COLLEGE', 'E129', 'E067', 'MANGALORE', 'MR', 8242263753, NULL, 18, 0.1, 0.4, 0.3, 0.2),
(76, 'BGS INSTITUTE OF TECHNOLOGY', 'E142', 'E008', 'MANDYA', 'PUA', 8234288418, NULL, 18, 0.1, 0.1, 0.2, 0.3),
(77, 'GOVT ENGINEERING COLLEGE', 'E154', 'E026', 'CHAMARAJANAGARA', 'GOVT', 822623005, NULL, 18, 0.0, 0.0, 0.0, 0.0),
(78, 'ALVAS INSTITUTE OF TECHNOLOGY', 'E169', 'E040', 'MOODABIDRI', 'PUA', 8258262742, 'A', 18, 0.0, 0.0, 0.0, 0.0),
(79, 'KSSEM', 'E203', 'E009', 'BANGALORE', 'PUA', 8028425103, NULL, 18, 0.0, 0.0, 0.0, 0.0),
(80, 'JYOTHI INSTITUTE OF TECHNOLOGY', 'E209', 'E222', 'BANGALORE', 'PUA', 9742859408, NULL, 18, 0.0, 0.0, 0.0, 0.0),
(82, 'JSS', 'E126', 'E178', 'Bangalore', 'PA', 222919865, 'A', 11, 0.0, 0.0, 0.0, 0.0),
(83, 'BNM', 'E200', 'E179', 'Bangalore', 'PA', 8026654783, 'A', 3, 3.0, 4.0, 3.0, 4.0);

-- --------------------------------------------------------

--
-- Table structure for table `comedk`
--

DROP TABLE IF EXISTS `comedk`;
CREATE TABLE IF NOT EXISTS `comedk` (
  `cid` int(5) NOT NULL,
  `branch` varchar(3) NOT NULL,
  `gm` int(8) DEFAULT NULL,
  `hk` int(8) DEFAULT NULL,
  PRIMARY KEY (`cid`,`branch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comedk`
--

INSERT INTO `comedk` (`cid`, `branch`, `gm`, `hk`) VALUES
(66, 'civ', 10882, 13641),
(66, 'cse', 1047, 5126),
(66, 'ece', 1392, 4825),
(66, 'eie', 5589, 12982),
(66, 'ise', 1548, 7974),
(66, 'me', 3298, 7538),
(67, 'civ', 28410, 23579),
(67, 'cse', 17473, 37801),
(67, 'ece', 26654, NULL),
(67, 'ise', 27645, 21511),
(67, 'me', 36741, 30786),
(74, 'civ', 23783, 29598),
(74, 'cse', 5605, 22598),
(74, 'ece', 9318, 28565),
(74, 'eie', 27000, NULL),
(74, 'ise', 9050, 42579),
(74, 'me', 17000, 27000),
(76, 'cse', 37573, NULL),
(76, 'ece', 39452, NULL),
(76, 'ise', 42631, NULL),
(76, 'me', 34889, 40919);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `cid` int(5) NOT NULL,
  `cse` char(1) NOT NULL DEFAULT 'Y',
  `ece` char(1) DEFAULT NULL,
  `ise` char(1) DEFAULT NULL,
  `eie` char(1) DEFAULT NULL,
  `eee` char(1) DEFAULT NULL,
  `me` char(1) DEFAULT NULL,
  `civ` char(1) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`cid`, `cse`, `ece`, `ise`, `eie`, `eee`, `me`, `civ`) VALUES
(65, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(66, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(67, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(68, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(69, 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y'),
(70, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(71, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(73, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(74, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(75, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(76, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(77, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(78, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(79, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(80, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(82, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE IF NOT EXISTS `facilities` (
  `cid` int(5) NOT NULL,
  `hostel` char(1) NOT NULL,
  `library` char(1) NOT NULL,
  `wifi` char(1) NOT NULL,
  `gym` char(1) NOT NULL,
  `transport` char(1) NOT NULL,
  `caffeteria` char(1) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`cid`, `hostel`, `library`, `wifi`, `gym`, `transport`, `caffeteria`) VALUES
(65, 'Y', 'Y', 'N', 'N', 'Y', 'N'),
(66, 'Y', 'Y', 'Y', 'N', 'Y', 'Y'),
(67, 'Y', 'Y', 'Y', 'N', 'Y', 'Y'),
(68, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(69, 'Y', 'Y', 'N', 'N', 'Y', 'Y'),
(70, 'N', 'Y', 'N', 'N', 'Y', 'Y'),
(71, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(73, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(74, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(75, 'N', 'Y', 'N', 'N', 'N', 'Y'),
(77, 'N', 'Y', 'N', 'N', 'N', 'N'),
(82, 'Y', 'Y', 'Y', 'N', 'N', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `placements`
--

DROP TABLE IF EXISTS `placements`;
CREATE TABLE IF NOT EXISTS `placements` (
  `cid` int(5) NOT NULL,
  `no_of_offers` int(4) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `maxpkg` int(8) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placements`
--

INSERT INTO `placements` (`cid`, `no_of_offers`, `percent`, `maxpkg`) VALUES
(65, 650, 85.77, 1000),
(66, 900, 97, 2000000),
(67, 450, 77, 1200000),
(68, 950, 98, 2500000),
(69, 430, 66, 900000),
(71, 350, 65, 1000000),
(73, 600, 87, 1200000),
(74, 608, 96, 1400000),
(76, 366, 76, 500000),
(77, 0, 0, 0),
(80, 350, 55, 900000),
(82, 551, 85, 1300000),
(83, 450, 80, 1700000);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `cid` int(5) NOT NULL,
  `campus` int(1) DEFAULT NULL,
  `placements` int(1) DEFAULT NULL,
  `infrastructure` int(1) DEFAULT NULL,
  `faculty` int(1) DEFAULT NULL,
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`cid`, `campus`, `placements`, `infrastructure`, `faculty`) VALUES
(65, 1, 3, 1, 4),
(74, 4, 3, 1, 4),
(65, 1, 1, 3, 5),
(71, 3, 4, 1, 4),
(65, 1, 1, 1, 4),
(65, 1, 1, 3, 1),
(65, 1, 5, 1, 1),
(65, 1, 1, 4, 1),
(67, 1, 4, 3, 4),
(69, 2, 3, 1, 3),
(75, 1, 4, 3, 2),
(71, 1, 1, 4, 1),
(70, 3, 4, 4, 3),
(76, 2, 2, 3, 4),
(83, 3, 4, 3, 4),
(83, 3, 4, 3, 4),
(65, 1, 1, 1, 1);

--
-- Triggers `reviews`
--
DROP TRIGGER IF EXISTS `trig1`;
DELIMITER $$
CREATE TRIGGER `trig1` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
call avg_rating(new.cid,new.campus,new.placements,new.infrastructure,new.faculty);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ulogin`
--

DROP TABLE IF EXISTS `ulogin`;
CREATE TABLE IF NOT EXISTS `ulogin` (
  `uname` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ulogin`
--

INSERT INTO `ulogin` (`uname`, `pass`) VALUES
('1', '1'),
('aaa', 'aaa'),
('bbb', 'bbb'),
('NIKI', 'niki'),
('RAJATH', 'RAJA'),
('ranjitha', '1235'),
('sharanya', 'sharu'),
('sindhu', 'sin'),
('smruthi', 'smru2003'),
('Smruthi.K.R', 'Karnataka'),
('spoo', 'spoo'),
('ss', 'ss');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cettable`
--
ALTER TABLE `cettable`
  ADD CONSTRAINT `cettable_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coll_info` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comedk`
--
ALTER TABLE `comedk`
  ADD CONSTRAINT `comedk_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coll_info` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coll_info` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `facilities_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coll_info` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `placements`
--
ALTER TABLE `placements`
  ADD CONSTRAINT `placements_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coll_info` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `coll_info` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
