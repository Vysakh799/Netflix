/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - seat_map
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`seat_map` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `seat_map`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `Dept_name` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `department` */

insert  into `department`(`dept_id`,`Dept_name`) values 
(1,'Computer Software'),
(2,'Electronics'),
(3,'Electrical'),
(4,'Civil'),
(5,'Architecture'),
(6,'Mechanical'),
(7,'Hardware'),
(8,'Automobile');

/*Table structure for table `exam_staff_allocate` */

DROP TABLE IF EXISTS `exam_staff_allocate`;

CREATE TABLE `exam_staff_allocate` (
  `allocate_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`allocate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `exam_staff_allocate` */

/*Table structure for table `examcell` */

DROP TABLE IF EXISTS `examcell`;

CREATE TABLE `examcell` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `examcell` */

insert  into `examcell`(`eid`,`lid`,`name`,`dept_id`) values 
(4,98,'Prathyush',1),
(5,99,'dijith',1);

/*Table structure for table `hall` */

DROP TABLE IF EXISTS `hall`;

CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` int(11) DEFAULT NULL,
  `no.of_studs` int(11) DEFAULT NULL,
  PRIMARY KEY (`hall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `hall` */

insert  into `hall`(`hall_id`,`room_no`,`no.of_studs`) values 
(14,401,30),
(15,402,30),
(16,403,30),
(17,404,30),
(18,405,30);

/*Table structure for table `hod` */

DROP TABLE IF EXISTS `hod`;

CREATE TABLE `hod` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `emailid` varchar(90) DEFAULT NULL,
  `ph_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `hod` */

insert  into `hod`(`hid`,`lid`,`name`,`dept_id`,`emailid`,`ph_no`) values 
(1,2,'vibin',1,'vibin@gmail.com',9895531092),
(2,3,'dijith ',3,'dijith@gmail.com',9895531093),
(3,4,'Irfad',2,'irfad@gmail.com',9876543210),
(4,5,'salman',4,'salman@gmail.com',9876543210),
(5,6,'nihal',5,'nihal@gmail.com',9876543210),
(6,7,'jasim',6,'jasim@gmail.com',9876543210),
(7,8,'vyshak',7,'vyshak@gmail.com',9876543210),
(8,9,'vishnu',8,'vishnu@gmail.com',8974561230);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(90) DEFAULT NULL,
  `password` varchar(90) DEFAULT NULL,
  `type` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(2,'computer','Comp@1001','hod'),
(3,'electrical','Elect@1002','hod'),
(4,'electronics','Elect@1003','hod'),
(5,'civil','Civil@1004','hod'),
(6,'architecture','Archi@1005','hod'),
(7,'mechanical','Mech@1006','hod'),
(8,'hardware','Hard@1007','hod'),
(9,'automobile','Auto@1008','hod'),
(11,'20131100','1100','student'),
(12,'20131101','1101','student'),
(13,'20131600','1600','student'),
(14,'20131601','1601','student'),
(15,'20131602','1602','student'),
(16,'20131300','1300','student'),
(17,'20131301','1301','student'),
(18,'20131302','1302','student'),
(19,'20131200','1200','student'),
(20,'20131201','1201','student'),
(21,'20131202','1202','student'),
(22,'20131400','1400','student'),
(23,'20131401','1401','student'),
(24,'20131402','1402','student'),
(25,'20131500','1500','student'),
(26,'20131501','1501','student'),
(28,'20131102','1102','student'),
(29,'20131700','1700','student'),
(30,'20131701','1701','student'),
(31,'20131702','1702','student'),
(32,'20131800','1800','student'),
(33,'20131801','1801','student'),
(34,'20131802','1802','student'),
(35,'20131103','1103','student'),
(36,'20131104','1104','student'),
(37,'20131105','1105','student'),
(38,'20131106','1106','student'),
(39,'20131107','1107','student'),
(40,'20131107','1108','student'),
(41,'20131109','1109','student'),
(42,'20131110','1110','student'),
(43,'20131111','1111','student'),
(44,'20131112','1112','student'),
(45,'20131113','1113','student'),
(46,'20131114','1114','student'),
(47,'20131303','1303','student'),
(48,'20131304','1304','student'),
(49,'20131305','1305','student'),
(50,'20131306','1306','student'),
(51,'20131307','1307','student'),
(52,'20131308','1308','student'),
(53,'20131309','1309','student'),
(54,'20131310','1310','student'),
(55,'20131311','1311','student'),
(56,'20131312','1312','student'),
(57,'20131313','1313','student'),
(58,'20131314','1314','student'),
(59,'20131203','1203','student'),
(60,'20131204','1204','student'),
(61,'20131205','1205','student'),
(62,'20131206','1206','student'),
(63,'20131207','1207','student'),
(64,'20131208','1208','student'),
(65,'20131209','1209','student'),
(66,'20131210','1210','student'),
(67,'20131211','1211','student'),
(68,'20131212','1212','student'),
(69,'20131213','1213','student'),
(70,'20131214','1214','student'),
(71,'20131403','1403','student'),
(72,'20131404','1404','student'),
(73,'20131405','1405','student'),
(74,'20131406','1406','student'),
(75,'20131407','1407','student'),
(76,'20131408','1408','student'),
(77,'20131409','1409','student'),
(78,'20131410','1410','student'),
(79,'20131411','1411','student'),
(80,'20131412','1412','student'),
(81,'20131413','1413','student'),
(82,'20131411','1414','student'),
(83,'20131503','1503','student'),
(85,'20131504','1504','student'),
(86,'20131505','1505','student'),
(88,'20131506','1506','student'),
(89,'20131507','1507','student'),
(90,'20131508','1508','student'),
(91,'20131509','1509','student'),
(92,'20131510','1510','student'),
(93,'20131511','1511','student'),
(94,'20131512','1512','student'),
(95,'20131513','1513','student'),
(96,'20131514','1514','student'),
(98,'examcell','prathyu','examcell'),
(99,'examcell','456','examcell'),
(100,'20131603','1603','student'),
(101,'20131604','1604','student'),
(102,'20131605','1605','student'),
(103,'20131606','1606','student'),
(104,'20131607','1607','student'),
(105,'20131608','1608','student'),
(106,'20131609','1609','student'),
(107,'20131610','1610','student'),
(108,'20131611','1611','student'),
(109,'20131611','1612','student'),
(110,'20131613','1613','student'),
(111,'20131614','1614','student'),
(112,'20131703','1703','student'),
(113,'20131704','1704','student'),
(114,'20131705','1705','student'),
(115,'20131706','1706','student'),
(116,'20131707','1707','student'),
(117,'20131708','1708','student'),
(118,'20131709','1709','student'),
(119,'20131710','1710','student'),
(120,'20131711','1711','student'),
(121,'20131712','1712','student'),
(122,'20131713','1713','student'),
(123,'20131714','1714','student'),
(124,'20131803','1803','student'),
(125,'20131804','1804','student'),
(126,'20131805','1805','student'),
(127,'20131806','1806','student'),
(128,'20131807','1807','student'),
(129,'20131808','1808','student'),
(130,'20121809','1809','student'),
(131,'20131810','1810','student'),
(132,'20121811','1811','student'),
(133,'20121812','1812','student'),
(134,'20131813','1813','student'),
(135,'20131814','1814','student');

/*Table structure for table `seat_arrangement` */

DROP TABLE IF EXISTS `seat_arrangement`;

CREATE TABLE `seat_arrangement` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  `seat_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4;

/*Data for the table `seat_arrangement` */

insert  into `seat_arrangement`(`seat_id`,`hall_id`,`tid`,`st_id`,`seat_no`) values 
(1,14,1,11,1),
(2,14,5,19,2),
(3,14,1,12,3),
(4,14,5,20,4),
(5,14,1,28,5),
(6,14,5,21,6),
(7,14,1,35,7),
(8,14,5,59,8),
(9,14,1,36,9),
(10,14,5,60,10),
(11,14,1,37,11),
(12,14,5,61,12),
(13,14,1,38,13),
(14,14,5,62,14),
(15,14,1,39,15),
(16,14,5,63,16),
(17,14,1,40,17),
(18,14,5,64,18),
(19,14,1,41,19),
(20,14,5,65,20),
(21,14,1,42,21),
(22,14,5,66,22),
(23,14,1,43,23),
(24,14,5,67,24),
(25,14,1,44,25),
(26,14,5,68,26),
(27,14,1,45,27),
(28,14,5,69,28),
(29,14,1,46,29),
(30,14,5,70,30),
(31,15,11,16,1),
(32,15,14,22,2),
(33,15,11,17,3),
(34,15,14,23,4),
(35,15,11,18,5),
(36,15,14,24,6),
(37,15,11,47,7),
(38,15,14,71,8),
(39,15,11,48,9),
(40,15,14,72,10),
(41,15,11,49,11),
(42,15,14,73,12),
(43,15,11,50,13),
(44,15,14,74,14),
(45,15,11,51,15),
(46,15,14,75,16),
(47,15,11,52,17),
(48,15,14,76,18),
(49,15,11,53,19),
(50,15,14,77,20),
(51,15,11,54,21),
(52,15,14,78,22),
(53,15,11,55,23),
(54,15,14,79,24),
(55,15,11,56,25),
(56,15,14,80,26),
(57,15,11,57,27),
(58,15,14,81,28),
(59,15,11,58,29),
(60,15,14,82,30),
(61,16,17,25,1),
(62,16,20,13,2),
(63,16,17,26,3),
(64,16,20,14,4),
(65,16,17,27,5),
(66,16,20,15,6),
(67,16,17,83,7),
(68,16,20,101,8),
(69,16,17,85,9),
(70,16,20,102,10),
(71,16,17,86,11),
(72,16,20,103,12),
(73,16,17,88,13),
(74,16,20,104,14),
(75,16,17,89,15),
(76,16,20,105,16),
(77,16,17,90,17),
(78,16,20,106,18),
(79,16,17,91,19),
(80,16,20,107,20),
(81,16,17,92,21),
(82,16,20,108,22),
(83,16,17,93,23),
(84,16,20,109,24),
(85,16,17,94,25),
(86,16,20,110,26),
(87,16,17,95,27),
(88,16,20,111,28),
(89,16,17,96,29),
(90,16,26,32,30),
(91,17,23,29,1),
(92,17,26,33,2),
(93,17,23,30,3),
(94,17,26,34,4),
(95,17,23,31,5),
(96,17,26,124,6),
(97,17,23,112,7),
(98,17,26,125,8),
(99,17,23,113,9),
(100,17,26,126,10),
(101,17,23,114,11),
(102,17,26,127,12),
(103,17,23,115,13),
(104,17,26,128,14),
(105,17,23,116,15),
(106,17,26,129,16),
(107,17,23,117,17),
(108,17,26,130,18),
(109,17,23,118,19),
(110,17,26,131,20),
(111,17,23,119,21),
(112,17,26,132,22),
(113,17,23,120,23),
(114,17,26,133,24),
(115,17,23,121,25),
(116,17,26,134,26),
(117,17,23,122,27),
(118,17,26,135,28),
(119,17,23,123,29),
(120,14,2,11,1),
(121,14,6,19,2),
(122,14,2,12,3),
(123,14,6,20,4),
(124,14,2,28,5),
(125,14,6,21,6),
(126,14,2,35,7),
(127,14,6,59,8),
(128,14,2,36,9),
(129,14,6,60,10),
(130,14,2,37,11),
(131,14,6,61,12),
(132,14,2,38,13),
(133,14,6,62,14),
(134,14,2,39,15),
(135,14,6,63,16),
(136,14,2,40,17),
(137,14,6,64,18),
(138,14,2,41,19),
(139,14,6,65,20),
(140,14,2,42,21),
(141,14,6,66,22),
(142,14,2,43,23),
(143,14,6,67,24),
(144,14,2,44,25),
(145,14,6,68,26),
(146,14,2,45,27),
(147,14,6,69,28),
(148,14,2,46,29),
(149,14,6,70,30),
(150,15,12,16,1),
(151,15,15,22,2),
(152,15,12,17,3),
(153,15,15,23,4),
(154,15,12,18,5),
(155,15,15,24,6),
(156,15,12,47,7),
(157,15,15,71,8),
(158,15,12,48,9),
(159,15,15,72,10),
(160,15,12,49,11),
(161,15,15,73,12),
(162,15,12,50,13),
(163,15,15,74,14),
(164,15,12,51,15),
(165,15,15,75,16),
(166,15,12,52,17),
(167,15,15,76,18),
(168,15,12,53,19),
(169,15,15,77,20),
(170,15,12,54,21),
(171,15,15,78,22),
(172,15,12,55,23),
(173,15,15,79,24),
(174,15,12,56,25),
(175,15,15,80,26),
(176,15,12,57,27),
(177,15,15,81,28),
(178,15,12,58,29),
(179,15,15,82,30),
(180,16,18,25,1),
(181,16,21,13,2),
(182,16,18,26,3),
(183,16,21,14,4),
(184,16,18,27,5),
(185,16,21,15,6),
(186,16,18,83,7),
(187,16,21,101,8),
(188,16,18,85,9),
(189,16,21,102,10),
(190,16,18,86,11),
(191,16,21,103,12),
(192,16,18,88,13),
(193,16,21,104,14),
(194,16,18,89,15),
(195,16,21,105,16),
(196,16,18,90,17),
(197,16,21,106,18),
(198,16,18,91,19),
(199,16,21,107,20),
(200,16,18,92,21),
(201,16,21,108,22),
(202,16,18,93,23),
(203,16,21,109,24),
(204,16,18,94,25),
(205,16,21,110,26),
(206,16,18,95,27),
(207,16,21,111,28),
(208,16,18,96,29),
(209,16,27,32,30),
(210,17,24,29,1),
(211,17,27,33,2),
(212,17,24,30,3),
(213,17,27,34,4),
(214,17,24,31,5),
(215,17,27,124,6),
(216,17,24,112,7),
(217,17,27,125,8),
(218,17,24,113,9),
(219,17,27,126,10),
(220,17,24,114,11),
(221,17,27,127,12),
(222,17,24,115,13),
(223,17,27,128,14),
(224,17,24,116,15),
(225,17,27,129,16),
(226,17,24,117,17),
(227,17,27,130,18),
(228,17,24,118,19),
(229,17,27,131,20),
(230,17,24,119,21),
(231,17,27,132,22),
(232,17,24,120,23),
(233,17,27,133,24),
(234,17,24,121,25),
(235,17,27,134,26),
(236,17,24,122,27),
(237,17,27,135,28),
(238,17,24,123,29);

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `ph_no` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`name`,`dept_id`,`email`,`ph_no`) values 
(1,'Vysakh E',1,'vysakh@gmail.com','7994634647'),
(2,'Muneeb',1,'muneeb@gmail.com','9895362482'),
(3,'nihal',1,'nihal@gmail.com','9895072339'),
(4,'roshan',3,'roshan@gmail.com','9895362488'),
(5,'salman',1,'salu@gmail.com','7994646446'),
(6,'Jasim',3,'jasim@gmail.com','7896542365'),
(7,'Anamika',3,'anu@gmail.com','8896547236'),
(8,'Aju',3,'aju@gmail.com','9685742536'),
(9,'Hashif',2,'hashi@gmail.com','7994644647'),
(10,'Sunil',2,'sunil@gmail.com','8523697412'),
(11,'Anilkumar',2,'anil@gmail.com','9632587412'),
(12,'Shabeena',2,'shabee@gmail.com','7632587545'),
(13,'Saanthakumari',4,'saan@gmail.com','8956231478'),
(14,'Haaris',4,'haaris@gmail.com','8654236578'),
(15,'Abdhulla',4,'abhdhu@gmail.com','8654786985'),
(16,'Hari',4,'hari@gmail.com','8569824563'),
(17,'Shaijal',5,'shai@gmail.com','9654782314'),
(18,'Aswani',5,'aswani@gmail.com','8569745214'),
(19,'Raamankartha',5,'kartha@gmail.com','8569745214'),
(20,'Sundharan',5,'sundharan@gmail.com','9456321456'),
(21,'John',6,'john@gmail.com','8654759623'),
(22,'Jolly',6,'jolly@gmail.com','8965745236'),
(23,'Amalsankar',6,'amal@gmail.com','8321456987'),
(24,'Hussain',6,'hussain@gmail.com','8564759321'),
(25,'Hamsa',7,'hamsa@gmail.com','9654238712'),
(26,'Koya',7,'koya@gmail.com','8653247896'),
(27,'Lisha',7,'lisha@gmail.com','9654231987'),
(28,'Rasheedh',7,'rashee@gmail.com','7569845236'),
(29,'Sajidh',8,'saji@gmail.com','8564973214'),
(30,'Hariharan',8,'haran@gmail.com','9564874563'),
(31,'sneha',8,'sneha@gmail.com','8974563214'),
(32,'Aseem',8,'aseem@gmail.com','9564782363');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `st_name` varchar(90) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `adm_no` int(11) DEFAULT NULL,
  `Reg_no` int(11) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `Ph_no` bigint(11) DEFAULT NULL,
  `year` int(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4;

/*Data for the table `student` */

insert  into `student`(`st_id`,`lid`,`st_name`,`dept_id`,`adm_no`,`Reg_no`,`sem`,`Ph_no`,`year`,`email`) values 
(1,11,'shahan febin',1,1100,20131100,6,2147483647,3,'shahana@gmail.com'),
(2,12,'vysakh',1,1101,20131101,6,2147483647,3,'vysak@gmail.com'),
(3,13,'muneeb ',6,1600,20131600,6,2147483647,3,'muneeb@gmail.com'),
(4,14,'afsal razeen',6,1601,20131601,6,2147483647,3,'afsal@gmail.com'),
(5,15,'nasrin',6,1602,20131602,6,2147483647,3,'muneeb@gmail.com'),
(6,16,'jasim',3,1300,20131300,6,2147483647,3,'vishnu@gmail.com'),
(7,17,'salman',3,1301,20131301,6,2147483647,3,'shahana@gmail.com'),
(8,18,'amal',3,1302,20131302,6,2147483647,3,'shahana@gmail.com'),
(9,19,'jasim',2,1200,20131200,6,2147483647,3,'salman@gmail.com'),
(10,20,'nihal',2,1201,20131201,6,2147483647,3,'vishnu@gmail.com'),
(11,21,'amal',2,1202,20131202,6,2147483647,3,'salmanfarispp.ct.jdt2@gmail.com'),
(12,22,'jasim',4,1400,20131400,6,2147483647,3,'shahana@gmail.com'),
(13,23,'salman',4,1401,20131401,6,2147483647,3,'shahana@gmail.com'),
(14,24,'afsal',4,1402,20131402,6,2147483647,3,'shahana@gmail.com'),
(15,25,'salu',5,1500,20131500,6,2147483647,3,'muneeb@gmail.com'),
(16,26,'vyshak',5,1501,20131501,6,2147483647,3,'salman@gmail.com'),
(17,27,'salu',5,1502,20131502,6,2147483647,3,'salu@gmail.com'),
(18,28,'vysakh',1,1102,20131102,6,2147483647,3,'vishnu@gmail.com'),
(19,29,'ayisha',7,1700,20131700,6,2147483647,3,'salmanfarispp.ct.jdt2@gmail.com'),
(20,30,'amal',7,1701,20131701,6,2147483647,3,'salman@gmail.com'),
(21,31,'nesrin',7,1702,20131702,6,2147483647,3,'tharathila@gmail.com'),
(22,32,'jumana',8,1800,20131800,6,2147483647,3,'tharathila@gmail.com'),
(23,33,'hameed',8,1801,20131801,6,2147483647,3,'nokkininno@gmail.com'),
(24,34,'safana',8,1802,20131802,6,2147483647,3,'uvauva@gmail.com'),
(26,35,'ranna',1,1103,20131103,6,2147483647,3,'ranna@gmail.com'),
(27,36,'dulkar',1,1104,20131104,6,943251658,3,'dulkar@gmail.com'),
(28,37,'finu',1,1105,20131105,6,2147483647,3,'finu@gmail.com'),
(29,38,'shuhaib',1,1106,20131106,6,2147483647,3,'shuhaib@gmail.com'),
(30,39,'fayika',1,1107,20131107,6,2147483647,3,'fayika@gmail.com'),
(31,40,'thalhath',1,1108,20131108,6,2147483647,3,'thalhath@gmail.com'),
(32,41,'rishan',1,1109,20131109,6,787676643,3,'rishan@gmail.com'),
(33,42,'noora',1,1110,20131110,6,2147483647,3,'noora@gmail.com'),
(34,43,'hadi',1,1111,20131111,6,2147483647,3,'hadi@gmail.com'),
(35,44,'shahul',1,1112,20131112,6,2147483647,3,'shalu@gmail.com'),
(36,45,'ameekha',1,1113,20131113,6,2147483647,3,'amee@gamil.com'),
(37,46,'aman',1,1114,20131114,6,2147483647,3,'aman@gmail.com'),
(38,47,'shahana',3,1303,20131303,6,2147483647,3,'shahana@gmail.com'),
(39,48,'zayan',3,1304,20131304,6,2147483647,3,'zayan@gmail.com'),
(40,49,'riyan',3,1305,20131305,6,2147483647,3,'riyan@gmail.com'),
(41,50,'fidha',3,1306,20131306,6,2147483647,3,'fidha@gmail.com'),
(42,51,'amnu',3,1307,20131307,6,9654752135,3,'amnu@gmail.com'),
(43,52,'minha',3,1308,20131308,6,9654752135,3,'minha@gmail.com'),
(44,53,'thanha',3,1309,20131309,6,8957469851,3,'thanha@gmail.com'),
(45,54,'ponnu',3,1310,20131310,6,95874125634,3,'ponnu@gmail.com'),
(46,55,'zishan',3,1311,20131311,6,9685472570,3,'zishan@gmail.com'),
(47,56,'misri',3,1312,20131312,6,9521302654,3,'misri@gmail.com'),
(48,57,'sajeena',3,1313,20131313,6,9023500254,3,'sajeena@gmail.com'),
(49,58,'rasheed',3,1314,20131314,6,9857412564,3,'rasheed@gmail.com'),
(50,59,'shahana',2,1203,20131203,6,95487625436,3,'shahana@gmail.com'),
(51,60,'adil',2,1204,20131204,6,98720003469,3,'adi@gmail.com'),
(52,61,'suhara',2,1205,20131205,6,9365214780,3,'suhara@gmail.com'),
(53,62,'salam',2,1206,20131206,6,9519563247,3,'salam@gmail.com'),
(54,63,'hafsa',2,1207,20131207,6,9874563210,3,'hafsa@gmail.com'),
(55,64,'zeena',2,1208,20131208,6,8979658752,3,'zeena@gmail.com'),
(56,65,'anamika',2,1209,20131209,6,9856974632,3,'anu@gmail.com'),
(57,66,'malu',2,1210,20131210,6,9321456870,3,'malu@gmail.com'),
(58,67,'lakshmi',2,1211,20131211,6,9856321475,3,'lakshmi@gmail.com'),
(59,68,'rizwan',2,1212,20131212,6,8654217589,3,'rizwan@gmail.com'),
(60,69,'rizwa',2,1213,20131213,6,9658742568,3,'rizwa@gmail.com'),
(61,70,'shamila',2,1214,20131214,6,8547562145,3,'shamila@gmail.com'),
(62,71,'shalu',4,1403,20131403,6,9657842154,3,'shalu@gmail.com'),
(63,72,'shana',4,1404,20131404,6,8974586214,3,'shany@gmail.com'),
(64,73,'thalhath',4,1405,20131405,6,9687203654,3,'thalhath@gmail.com'),
(65,74,'shahala',4,1406,20131406,6,8579621463,3,'shahala@gmail.com'),
(66,75,'muhammad',4,1407,20131407,6,8750036514,3,'muhammad@gmail.com'),
(67,76,'rifa',4,1408,20131408,6,8743698745,3,'rifa@gmail.com'),
(68,77,'aysha',4,1409,20131409,6,7589478595,3,'aysha@gmail.com'),
(69,78,'hiba',4,1410,20131410,6,7854965874,3,'hiba@gmail.com'),
(70,79,'afi',4,1411,20131411,6,8652341788,3,'afi@gmail.com'),
(71,80,'adhila',4,1412,20131412,6,9895531090,3,'adhila@gmail.com'),
(72,81,'manu',4,1413,20131413,6,9654752136,3,'manu@gmail.com'),
(73,82,'ashwin',4,1414,20131411,6,9313165478,3,'ashwin@gmail.com'),
(74,83,'neha',5,1503,20131503,6,8652341780,3,'neha@gmail.com'),
(76,85,'dilu',5,1504,20131504,6,6532564821,3,'dhilu@gamil.com'),
(77,86,'thanku',5,1505,20131505,6,3526412538,3,'thanku@gmail.com'),
(79,88,'clara',5,1506,20131506,6,8652341781,3,'clara@gmail.com'),
(80,89,'mariya',5,1507,20131507,6,8652341782,3,'mariya@gmail.com'),
(81,90,'fathima',5,1508,20131508,6,7598485621,3,'fathima@gmail.com'),
(82,91,'ameer',5,1509,20131509,6,9895531090,3,'ameer@gmail.com'),
(83,92,'saja',5,1510,20131510,6,7584621456,3,'saja@gmail.com'),
(84,93,'salman',5,1511,20131511,6,7845987456,3,'salman@gmail.com'),
(85,94,'thahif',5,1512,20131512,6,7259843541,3,'thahif@gmail.com'),
(86,95,'anwar',5,1513,20131513,6,7854964875,3,'anwar@gmail.com'),
(87,96,'shahabas',5,1514,20131514,6,9854632145,3,'shahabas@gmail.com'),
(88,100,'baalan',6,1603,20131603,3,4569852361,3,'baal@gmail.com'),
(89,101,'devika',6,1604,20131604,6,7698452364,3,'devika@gmail.com'),
(90,102,'Fuadh',6,1605,20131605,6,6325412587,3,'fuadh@gmail.com'),
(91,103,'Aswin',6,1606,20131606,6,8956231478,3,'aswin@gmail.com'),
(92,104,'Shaijal',6,1607,20131607,6,7528745632,3,'shaijal@gmail.com'),
(93,105,'Shedha',6,1608,20131608,6,2587463159,3,'shedha@gmail.com'),
(94,106,'amal',6,1609,20131609,6,4569871236,3,'amal@gmail.com'),
(95,107,'shibu',6,1610,20131610,6,4569871236,3,'shibu@gmail.com'),
(96,108,'shamna',6,1611,20131611,6,3216549874,3,'shamna@gmail.com'),
(97,109,'salman faris',6,1612,20131611,6,4569874563,3,'faris@gmail.com'),
(98,110,'aadhil',6,1613,20131613,6,2589631475,3,'aadhil@gmail.com'),
(99,111,'yaseen',6,1614,20131614,6,7458963214,3,'yaseen@gmail.com'),
(100,112,'Navaneeth',7,1703,20131703,6,7994644647,3,'nav@gmail.com'),
(101,113,'vysh',7,1704,20131704,6,7896541236,3,'vysh@gmail.com'),
(102,114,'Anamika',7,1705,20131705,6,7536984123,3,'anu@gmail.com'),
(103,115,'Rahul',7,1706,20131706,6,7896541236,3,'rahul@gmail.com'),
(104,116,'nadha',7,1707,20131707,6,7895641235,3,'nadha@gmail.com'),
(105,117,'fathima',7,1708,20131708,6,7859463214,3,'fathima@gmail.com'),
(106,118,'Paathu',7,1709,20131709,6,9856745632,3,'paathu@gmail.com'),
(107,119,'Ayisha',7,1710,20131710,6,8956894567,3,'ayi@gmail.com'),
(108,120,'baalu',7,1711,20131711,6,7946134698,3,'baalu@gmail.com'),
(109,121,'vyga',7,1712,20131712,6,7994644637,3,'vyga@gmail.com'),
(110,122,'anuragh',7,1713,20131713,6,7946132589,3,'anu@gmail.com'),
(111,123,'mansoor',7,1714,20131714,6,7946135624,3,'mansoor@gmail.com'),
(112,124,'unais',8,1803,20131803,6,9587642587,3,'unais@gmail.com'),
(113,125,'abbas',8,1804,20131804,6,6895472594,3,'abbas@gmail.com'),
(114,126,'shareefa',8,1805,20131805,6,785496245,3,'shareefa@gmail.com'),
(115,127,'krishna',8,1806,20131806,6,98745876210,3,'krish@gmail.com'),
(116,128,'febin',8,1807,20131807,6,9587236410,3,'febi@gmail.com'),
(117,129,'raju',8,1808,20131808,6,95647821301,3,'raju@gmail.com'),
(118,130,'shiva',8,1809,20121809,6,7896541245,3,'shiva@gmail.com'),
(119,131,'sherin',8,1810,20131810,6,9895531031,3,'sherin@gmail.com'),
(120,132,'ali',8,1811,20121811,6,9895537841,3,'ali@gmail.com'),
(121,133,'unnimaya',8,1812,20121812,6,8574256314,3,'unnimaya@gmail.com'),
(122,134,'shanu',8,1813,20131813,6,7589654821,3,'shanu@gmail.com'),
(123,135,'kunju',8,1814,20131814,6,9856412547,3,'kunju@gmail.com');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `sub_code` int(11) DEFAULT NULL,
  `sub_name` varchar(90) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `subject` */

insert  into `subject`(`sub_id`,`dept_id`,`sub_code`,`sub_name`,`sem`,`revision`) values 
(1,1,1000,'oop',6,2015),
(2,1,1001,'sdp',6,2015),
(3,1,1003,'dcp',6,2015),
(4,6,6000,'workshop',6,2015),
(5,6,6001,'spaner',6,2015),
(6,6,6002,'engine',6,2015),
(7,3,3000,'wiring',6,2015),
(8,3,3001,'bulb',6,2015),
(9,3,3002,'dcp',6,2015),
(10,2,2000,'led',6,2015),
(11,2,2001,'rgb',6,2015),
(12,2,2002,'robotics',6,2015),
(13,4,4000,'centering',6,2015),
(14,4,4001,'flooring',6,2015),
(15,4,4002,'site eng',6,2015),
(16,5,5000,'building',6,2015),
(17,5,5001,'arc eng',6,2015),
(18,5,5002,'site eng',6,2015),
(19,7,7000,'smps',6,2015),
(20,7,7001,'cpu',6,2015),
(21,7,7002,'NIC',6,2015),
(22,8,8000,'setup',6,2015),
(23,8,8001,'settings',6,2015),
(24,8,8002,'user manual',6,2015),
(25,1,1003,'comp',3,2015);

/*Table structure for table `timetable` */

DROP TABLE IF EXISTS `timetable`;

CREATE TABLE `timetable` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `sub_id` int(11) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `date` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

/*Data for the table `timetable` */

insert  into `timetable`(`tid`,`dept_id`,`sub_id`,`time`,`date`) values 
(1,1,1,'AN','2023-05-08'),
(2,1,2,'AN','2023-05-09'),
(3,1,3,'FN','2023-05-10'),
(5,2,10,'AN','2023-05-08'),
(6,2,11,'AN','2023-05-09'),
(7,2,12,'FN','2023-05-10'),
(11,3,7,'AN','2023-05-08'),
(12,3,8,'AN','2023-05-09'),
(13,3,9,'FN','2023-05-10'),
(14,4,13,'AN','2023-05-08'),
(15,4,14,'AN','2023-05-09'),
(16,4,15,'FN','2023-05-10'),
(17,5,16,'AN','2023-05-08'),
(18,5,17,'AN','2023-05-09'),
(19,5,18,'FN','2023-05-10'),
(20,6,4,'AN','2023-05-08'),
(21,6,5,'AN','2023-05-09'),
(22,6,6,'FN','2023-05-10'),
(23,7,19,'AN','2023-05-08'),
(24,7,20,'AN','2023-05-09'),
(25,7,21,'FN','2023-05-10'),
(26,8,22,'AN','2023-05-08'),
(27,8,23,'AN','2023-05-09'),
(28,8,24,'FN','2023-05-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
