
show databases;
# drop database  if exists dbdesign;
# create database dbdesign;
use dbdesign;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `booking_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_client` (
  `cid` varchar(255) NOT NULL,-- client id
  `rid` varchar(255) NOT NULL,-- room id
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `booking_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`,`rid`),
  KEY `rid` (`rid`),
  CONSTRAINT `booking_client_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`),
  CONSTRAINT `booking_client_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


-- 上写锁
LOCK TABLES `booking_client` WRITE;
/*!40000 ALTER TABLE `booking_client` DISABLE KEYS */;
INSERT INTO `booking_client` VALUES ('131989238123991309','203','2020-01-06','2020-01-08','2020-01-06 00:49:02','不错');
/*!40000 ALTER TABLE `booking_client` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `booking_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_team` (
  `tid` varchar(255) NOT NULL,
  `rid` varchar(255) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `booking_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`,`rid`),
  KEY `rid` (`rid`),
  CONSTRAINT `booking_team_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `team` (`tid`),
  CONSTRAINT `booking_team_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `booking_team` WRITE;
/*!40000 ALTER TABLE `booking_team` DISABLE KEYS */;
INSERT INTO `booking_team` VALUES ('55','303','2020-01-06','2020-01-10','2020-01-06 00:52:27','新客户'),('55','305','2020-01-06','2020-01-10','2020-01-06 00:52:23','新客户'),('7','301','2020-01-10','2020-01-15','2020-01-04 09:19:22','可能晚一些'),('7','303','2020-01-10','2020-01-15','2020-01-04 09:19:36',NULL);
/*!40000 ALTER TABLE `booking_team` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `checkin_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkin_client` (
  `rid` varchar(255) NOT NULL,
  `cid` varchar(255) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `check_in_sid` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`,`cid`),
  KEY `cid` (`cid`),
  KEY `check_in_sid` (`check_in_sid`),
  CONSTRAINT `checkin_client_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  CONSTRAINT `checkin_client_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`),
  CONSTRAINT `checkin_client_ibfk_3` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `checkin_client` WRITE;
/*!40000 ALTER TABLE `checkin_client` DISABLE KEYS */;
INSERT INTO `checkin_client` VALUES ('201','189322199312262232','2020-01-06','2020-01-07','208','1','新客');
/*!40000 ALTER TABLE `checkin_client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_individual_times` AFTER INSERT ON `checkin_client`

FOR EACH ROW update client set accomodation_times=accomodation_times+1 where cid=new.cid */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



DROP TABLE IF EXISTS `checkin_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkin_team` (
  `rid` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `check_in_sid` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`,`tid`),
  KEY `teamsid` (`check_in_sid`),
  KEY `teamtid` (`tid`),
  CONSTRAINT `teamrid` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  CONSTRAINT `teamsid` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`),
  CONSTRAINT `teamtid` FOREIGN KEY (`tid`) REFERENCES `team` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `checkin_team` WRITE;
/*!40000 ALTER TABLE `checkin_team` DISABLE KEYS */;
INSERT INTO `checkin_team` VALUES ('404','30','2020-01-05','2020-01-06','2940','8',NULL),('406','30','2020-01-05','2020-01-06','2940','8','团队入住');
/*!40000 ALTER TABLE `checkin_team` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_team_times` AFTER INSERT ON `checkin_team`

FOR EACH ROW update team set accomodation_times=accomodation_times+1 where tid=new.tid */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;


DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `cname` varchar(255) NOT NULL,
  `cid` varchar(255) NOT NULL,
  `cphone` varchar(255) DEFAULT NULL,
  `cage` varchar(255) NOT NULL,
  `csex` varchar(255) DEFAULT NULL,
  `register_sid` varchar(255) DEFAULT NULL,
  `accomodation_times` int(11) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `sid` (`register_sid`),
  KEY `cid` (`cid`,`register_sid`),
  CONSTRAINT `sid` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('吴超梦','130898199212233434','13898322223','28','女','4',1,'2020-01-04 10:48:42'),('黄荣','131989238123991309','13123323212','52','男','7',1,'2020-01-04 09:24:48'),('王潇','189322199312262232','13098722343','27','男','4',1,'2020-01-06 00:17:20'),('柯镇恶','289193212393128999','13310913888','50','男','6',0,'2020-01-04 09:16:01'),('段深','290389199412280303','13898767890','26','男','5',0,'2020-01-04 09:15:32'),('黄晓让','320198199812243456','13789098789','21','女','5',3,'2020-01-04 10:06:33'),('赵超','320222199102036712','13821322312','23','男','8',2,'2020-01-04 09:24:42'),('赵重样','320678199012243333','13765434212','30','男','2',0,'2020-01-04 09:12:44'),('黄穰','320876196510200099','13876534543','55','女','1',0,'2020-01-04 09:12:26'),('黄晓让','320897189722334567','13987667890','30','男','2',1,'2020-01-04 10:09:29'),('西羊羊','320987199012234444','19876556789','30','女','3',3,'2020-01-04 09:24:50');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `hotelorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelorder` (
  `id` varchar(255) NOT NULL,
  `ordertype` varchar(255) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `rid` varchar(255) NOT NULL,
  `pay_type` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_sid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`start_time`,`end_time`,`rid`,`ordertype`),
  KEY `rid` (`rid`),
  KEY `register_sid` (`register_sid`),
  CONSTRAINT `hotelorder_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  CONSTRAINT `hotelorder_ibfk_2` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `hotelorder` WRITE;
/*!40000 ALTER TABLE `hotelorder` DISABLE KEYS */;
INSERT INTO `hotelorder` VALUES ('1','团队','2020-01-06','2020-01-09','307','微信','624','','2020-01-08 14:15:32','2'),('1','团队','2020-01-06','2020-01-09','308','微信','2064','','2020-01-08 14:15:33','2'),('130898199212233434','个人','2020-01-04','2020-01-07','201','微信','624','垃圾','2020-01-04 11:57:54','1'),('30','团队','2019-12-21','2019-12-31','406','支付宝','5555','好评','2020-01-04 09:23:38','2'),('30','团队','2019-12-30','2020-01-01','203','支付宝','221','好评','2020-01-04 09:23:44','2'),('30','团队','2020-01-03','2020-01-03','201','支付宝','231','好评','2020-01-04 09:23:42','1'),('320222199102036712','个人','2020-01-02','2020-01-03','406','微信','1176','好评','2020-01-04 09:23:34','4'),('320222199102036788','个人','2020-01-03','2020-01-03','201','微信','5616','好评','2020-01-04 09:23:01','3'),('320897189722334567','个人','2020-01-04','2020-01-05','404','微信','1764','打赏','2020-01-06 00:52:11','1'),('330987126376589900','个人','2020-01-05','2020-01-06','301','微信','208','好评','2020-01-05 06:44:44','2'),('43','团队','2020-01-04','2020-01-06','307','微信','624','垃圾','2020-01-06 00:52:02','1'),('43','团队','2020-01-04','2020-01-06','402','微信','804','垃圾','2020-01-06 00:51:59','1'),('7','团队','2020-01-01','2020-01-02','201','微信','258','中评','2020-01-04 09:23:54','5');
/*!40000 ALTER TABLE `hotelorder` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `rid` varchar(255) NOT NULL,
  `rtype` varchar(255) NOT NULL,
  `rstorey` varchar(255) NOT NULL,
  `rprice` varchar(255) NOT NULL,
  `rdesc` varchar(255) DEFAULT NULL,
  `rpic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `rid` (`rid`,`rprice`),
  KEY `rid_2` (`rid`,`rprice`,`rtype`),
  KEY `rid_3` (`rid`,`rtype`,`rprice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('201','标准间（单人）','2','208','电视故障','D:/pictures/ss.jpg'),('203','标准间（单人）','2','208','无','D:/pictures/ss.jpg'),('205','标准间（双人）','2','268','没事','D:/pictures/sd.jpg'),('207','标准间（双人）','2','268','采光好','D:/pictures/sd.jpg'),('301','标准间（单人）','3','208','采光好','D:/pictures/ss.jpg'),('303','大床房','3','258','无','D:/pictures/b.jpg'),('305','大床房','3','258','设施新','D:/pictures/b.jpg'),('307','标准间（单人）','3','208','设施新','D:/pictures/ss.jpg'),('308','总统套房','3','688','古典','D:/pictures/pr1.jpg'),('402','标准间（双人）','4','268','空调故障','D:/pictures/sd.jpg'),('404','总统套房','4','588','好评率高','D:/pictures/pr1.jpg'),('406','总统套房','4','588','好评率高','D:/pictures/pr2.jpg'),('410','标准间（单人）','4','232','新房','D:/pictures/ss.jpg');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `sid` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `ssex` varchar(255) DEFAULT NULL,
  `stime` date DEFAULT NULL,
  `susername` varchar(255) NOT NULL,
  `spassword` varchar(255) NOT NULL,
  `srole` varchar(255) NOT NULL,
  `sidcard` varchar(255) NOT NULL,
  `sphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `susername` (`susername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('1','冉冉','男','2021-06-18','ranxi','123456','2','422802200108132036','19144336913'),('2','张三','女','2003-12-06','zs123','123456','1','329123199102021234','13823209876'),('3','李四','男','1981-12-26','ls123','123456','1','332987199812262512','13782765657'),('4','赵六','女','1999-01-01','zl123','123456','1','332987199811164512','13888909890'),('5','王五','男','1997-01-01','wang123','123456','1','332987199812264512','13988767890'),('6','黄七','男','2002-01-01','hq123','123456','1','332987199811263333','13962334343'),('7','欧阳毅','男','1975-10-4','oyy123','123456','2','332987199811262222','13962334222'),('8','Jack','男','1990-12-02','jack123','123456','1','332987199810102222','13962334333');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `tname` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `tphone` varchar(255) DEFAULT NULL,
  `check_in_sid` varchar(255) DEFAULT NULL,
  `accomodation_times` int(11) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tid`),
  KEY `team_sid` (`check_in_sid`),
  CONSTRAINT `team_sid` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('管工学院','1','13896534534','1',2,'2020-01-06 00:50:46'),('越岚数聚团队','11','13976523423','6',0,'2020-01-04 09:10:02'),('浙商大','16','13987667890','3',0,'2020-01-04 09:06:55'),('浙商大','30','13898700998','1',5,'2020-01-05 11:09:25'),('就业与创业服务协会','32','13962463676','2',0,'2020-01-04 09:06:37'),('腾讯','43','13829833333','1',3,'2020-01-04 11:55:01'),('管工科导','55','13678998789','2',0,'2020-01-05 06:41:05'),('管乐团','7','17878989098','6',1,'2020-01-04 09:25:37'),('alibaba','8','18978978909','4',0,'2020-01-04 09:07:48');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

DROP VIEW IF EXISTS `Customers`;
Create VIEW Customers as select Cid,Cname,Csex,Cphone From Client;
DROP VIEW IF EXISTS `Rooms`;
Create view Rooms As select Rid,Rtype,Rprice,Rstorey From Room;
DROP VIEW IF EXISTS `Living`;
Create view Living As select Cid,Rid, start_time, end_time, total_price From checkin_client;
DROP VIEW IF EXISTS `Administrators`;
Create view Administrators As select Sid,Sname, Susername From Staff Where Srole>1

