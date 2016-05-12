-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: waitingroom
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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

--
-- Table structure for table `busStatus`
--

DROP TABLE IF EXISTS `busStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `busStatus` (
  `id` int(10) unsigned NOT NULL,
  `busIsActive` tinytext,
  `currentStop` tinytext,
  `leavingAt` tinytext,
  `nextStop` tinytext,
  `arrivingAt` tinytext,
  `waitTime` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busStatus`
--

LOCK TABLES `busStatus` WRITE;
/*!40000 ALTER TABLE `busStatus` DISABLE KEYS */;
INSERT INTO `busStatus` VALUES (1,'No','Stop C','8:15 AM','Stop A','10:45 AM','22');
/*!40000 ALTER TABLE `busStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientHistory`
--

DROP TABLE IF EXISTS `patientHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientHistory` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `seenBy` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `id_patient` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientHistory`
--

LOCK TABLES `patientHistory` WRITE;
/*!40000 ALTER TABLE `patientHistory` DISABLE KEYS */;
INSERT INTO `patientHistory` VALUES (1,'2016-02-01 00:48:50','Melodie Z. Tanner','2016-06-06 09:22:39','2016-04-19 21:37:19',73),(2,'2015-06-27 04:00:57','Marsden H. Sweet','2016-04-12 05:32:05','2016-03-24 21:15:51',67),(3,'2015-07-19 18:00:17','Wilma L. Decker','2016-03-27 20:05:43','2015-01-15 21:31:31',58),(4,'2015-04-18 10:33:43','Matthew O. Watson','2015-01-11 16:49:13','2015-03-12 07:03:02',78),(5,'2015-04-28 20:35:57','Hiram V. Howard','2015-08-14 08:06:07','2016-05-18 23:39:18',84),(6,'2014-07-27 18:21:06','Bree R. Campbell','2015-07-10 06:24:11','2014-08-10 19:23:48',41),(7,'2016-04-06 21:26:17','Ali A. Swanson','2015-01-03 00:01:46','2015-07-22 13:28:02',74),(8,'2015-02-25 09:04:38','Graiden D. Todd','2015-06-18 09:33:18','2016-04-25 15:41:46',90),(9,'2015-01-07 01:35:07','Claudia V. Greer','2014-10-28 17:27:09','2016-02-08 19:42:34',64),(10,'2014-07-17 07:19:31','Jameson O. Fowler','2015-11-23 00:58:35','2014-07-17 16:27:59',91),(11,'2016-02-05 20:59:16','Darryl N. Manning','2016-05-07 13:47:32','2014-10-19 21:09:31',44),(12,'2014-06-11 02:22:43','Justin L. Reilly','2014-12-08 15:33:19','2015-02-22 07:02:42',23),(13,'2016-01-02 07:19:11','Reuben A. Mcfarland','2016-04-02 15:24:37','2015-07-23 01:30:45',95),(14,'2014-12-31 06:38:00','Basia S. Bauer','2014-08-06 18:57:16','2015-09-12 02:40:49',84),(15,'2014-06-24 20:38:21','Matthew Q. Morrison','2015-05-24 01:08:22','2014-10-05 15:29:25',53),(16,'2015-01-30 14:17:53','Nathan Q. Mcdowell','2015-08-04 16:58:45','2014-06-23 03:18:54',32),(17,'2015-10-25 07:22:27','Jolie V. Figueroa','2014-11-03 16:19:57','2016-05-15 16:03:39',59),(18,'2015-02-11 16:07:09','Sybill Y. Dudley','2015-11-28 01:00:57','2014-08-30 20:10:55',77),(19,'2015-08-07 08:44:28','Naida T. Haney','2015-05-24 09:57:05','2014-09-09 03:58:55',72),(20,'2015-01-14 10:19:50','Ethan U. Avila','2016-05-21 20:38:44','2015-10-25 01:33:59',37),(21,'2016-01-02 15:10:22','Erin G. Knight','2015-08-01 06:47:48','2015-08-03 09:19:42',90),(22,'2016-01-04 08:38:48','Justin N. Weiss','2016-04-24 23:24:16','2015-06-17 21:04:54',7),(23,'2014-11-07 15:15:51','Rhonda I. Torres','2015-02-14 20:58:31','2016-02-16 17:04:28',61),(24,'2014-12-05 07:49:27','Bree A. Lang','2015-08-12 04:17:07','2015-01-13 05:26:36',87),(25,'2015-10-29 08:20:15','Otto Q. Roberts','2016-05-30 05:31:41','2015-10-27 00:04:48',53),(26,'2014-09-25 00:25:06','Quinn J. Steele','2014-10-01 08:41:05','2016-01-18 05:45:38',24),(27,'2015-09-11 07:53:06','Branden U. Hogan','2014-12-21 04:56:52','2016-02-20 03:42:56',40),(28,'2014-08-28 09:33:47','Nola Z. Byers','2015-09-18 21:59:46','2015-02-13 01:19:33',34),(29,'2015-12-05 07:26:28','Stephen J. Wynn','2014-12-05 23:30:17','2014-12-07 23:49:15',2),(30,'2014-11-25 09:14:16','Astra U. Wall','2014-10-21 13:20:33','2015-07-18 01:43:52',79),(31,'2014-08-14 01:56:08','Cally X. Mejia','2016-05-08 04:44:14','2014-06-12 22:49:14',7),(32,'2016-05-29 01:40:51','Wesley O. Williamson','2014-07-06 05:04:48','2014-11-28 19:35:10',26),(33,'2015-10-09 05:04:50','Jorden D. Dodson','2016-03-27 23:18:22','2015-11-13 12:03:25',59),(34,'2014-07-30 08:30:59','Kasimir X. Newman','2015-06-19 07:28:06','2014-12-21 13:59:51',45),(35,'2015-08-16 04:28:31','James X. Howell','2014-12-12 04:26:47','2014-10-15 18:36:12',70),(36,'2015-06-09 09:15:00','Jesse X. Rice','2015-06-23 15:04:04','2015-03-31 13:47:33',26),(37,'2015-06-23 14:03:37','Daphne J. Mcclain','2015-05-28 23:52:22','2015-09-16 11:26:40',99),(38,'2015-05-22 00:08:06','Todd Q. Wall','2015-08-23 05:59:11','2016-01-16 12:17:40',28),(39,'2015-07-28 01:41:22','Martin K. Matthews','2015-11-15 13:49:44','2016-03-15 20:44:40',7),(40,'2014-11-11 14:54:47','Susan K. Armstrong','2015-01-10 12:01:46','2015-05-26 04:22:19',48),(41,'2015-12-21 17:49:34','Amal P. Ballard','2015-05-15 21:17:49','2016-06-09 22:07:41',43),(42,'2015-12-05 11:00:57','Phillip L. Mccarty','2015-08-18 09:04:50','2016-01-22 10:03:46',96),(43,'2015-02-19 18:00:35','Jin S. Baxter','2016-01-28 12:45:03','2016-04-17 08:01:45',46),(44,'2015-03-24 14:42:05','Nina X. Sweeney','2014-11-18 12:11:11','2015-09-29 21:33:14',56),(45,'2016-02-19 13:08:45','Colt I. Lamb','2015-05-27 11:45:06','2016-03-31 09:49:57',96),(46,'2014-06-16 12:22:23','Hope H. Ward','2014-08-04 08:28:58','2016-03-20 14:24:35',97),(47,'2015-05-28 20:09:01','Evangeline T. Becker','2015-03-12 13:10:55','2016-05-01 11:55:40',82),(48,'2015-10-10 01:17:41','Quyn T. Short','2016-01-25 02:36:27','2015-09-13 20:21:02',38),(49,'2015-01-26 15:54:40','Palmer I. Wolfe','2015-01-29 19:11:57','2016-04-23 10:17:26',6),(50,'2014-10-10 13:27:07','Freya S. Nieves','2015-12-14 18:03:11','2015-05-10 06:15:37',39),(51,'2015-07-23 03:09:13','Paul C. Kerr','2015-05-15 07:01:26','2015-04-04 05:25:00',66),(52,'2014-10-15 04:28:12','Jelani L. Irwin','2014-12-12 21:22:01','2015-03-26 23:45:09',75),(53,'2016-06-04 22:46:14','Elton K. Guzman','2015-05-11 00:50:58','2015-06-30 12:07:09',75),(54,'2014-10-15 13:28:11','Jacqueline W. Collins','2015-09-19 04:11:14','2015-10-27 12:07:13',18),(55,'2014-12-12 08:27:43','Zoe D. Padilla','2014-06-18 17:57:22','2014-09-10 11:37:45',56),(56,'2014-08-10 10:36:48','Zena L. Davenport','2015-12-20 12:02:26','2016-01-09 09:05:33',95),(57,'2015-10-05 18:25:25','Roth U. Ramirez','2015-08-21 20:37:23','2016-04-03 13:26:41',51),(58,'2014-07-28 18:59:36','Malachi K. Ellison','2015-12-03 16:56:26','2015-10-14 23:25:32',68),(59,'2016-01-25 20:32:47','Rhoda T. Campos','2014-10-25 17:36:57','2014-07-08 14:57:43',24),(60,'2016-05-23 19:27:25','Celeste A. Pratt','2015-11-16 12:53:26','2015-05-02 08:55:47',37),(61,'2014-09-06 08:13:35','Uriel G. Ayala','2015-08-10 19:14:55','2015-11-14 23:14:38',47),(62,'2014-08-04 14:36:05','Mikayla Q. Burnett','2015-05-17 19:52:57','2016-01-05 07:53:23',94),(63,'2016-01-17 04:38:53','Ima U. Gould','2015-05-16 02:12:34','2014-11-21 16:54:44',60),(64,'2014-10-17 14:45:13','Irma E. Dejesus','2015-08-06 03:20:47','2016-01-07 21:42:45',43),(65,'2015-07-01 10:21:55','Solomon W. Underwood','2014-11-10 13:00:13','2015-06-29 08:17:24',18),(66,'2015-06-03 07:01:47','Mercedes I. Ward','2015-01-31 04:59:21','2015-12-06 13:20:45',94),(67,'2014-12-27 04:25:52','Ora P. Mcleod','2014-12-19 04:43:00','2015-02-26 04:58:47',36),(68,'2014-12-15 02:15:29','Lars R. Frazier','2016-05-07 07:14:08','2015-11-16 15:31:47',27),(69,'2015-11-15 18:58:27','Shad C. Goodwin','2014-11-04 19:21:52','2015-03-07 20:17:16',33),(70,'2015-03-22 22:15:44','Nero Z. Edwards','2015-03-12 23:03:04','2014-08-28 22:01:59',83),(71,'2014-07-10 15:16:20','Sierra M. Holman','2016-01-31 02:47:50','2014-11-17 03:35:35',72),(72,'2015-09-18 07:29:53','Declan Q. Matthews','2014-09-13 22:10:15','2015-08-23 01:50:02',41),(73,'2015-01-08 09:11:34','Reuben Y. Mejia','2014-08-12 12:26:46','2016-03-29 17:59:41',85),(74,'2015-04-24 21:18:00','Akeem P. Workman','2016-01-14 20:06:10','2015-04-24 22:07:55',40),(75,'2016-01-26 23:59:49','Aaron D. Combs','2016-04-03 03:55:00','2015-01-16 18:55:24',64),(76,'2014-12-31 15:40:15','Nomlanga F. Pollard','2014-11-12 18:07:44','2015-08-05 05:20:39',19),(77,'2015-09-07 02:45:49','Germaine S. James','2014-07-21 21:03:48','2015-05-15 02:04:51',17),(78,'2015-04-05 08:11:41','Fuller O. Morris','2015-01-30 18:41:58','2015-06-17 16:23:17',73),(79,'2016-05-02 23:24:13','Francis F. Barrera','2015-05-12 19:24:18','2015-06-10 09:53:36',38),(80,'2015-12-01 16:25:34','Risa U. Noel','2015-02-25 20:07:37','2014-11-08 19:58:54',72),(81,'2015-09-28 15:43:56','Maya Q. Barron','2016-05-04 22:13:35','2015-09-03 13:43:37',81),(82,'2015-09-02 12:48:06','Natalie U. Mcleod','2015-01-22 17:28:54','2014-08-13 07:54:57',21),(83,'2015-07-29 11:33:01','Ivor Z. Parsons','2015-12-29 19:12:35','2015-03-14 06:44:03',17),(84,'2015-11-19 15:02:43','Malcolm G. Benjamin','2015-12-26 17:00:58','2016-03-14 11:38:01',84),(85,'2016-05-02 16:23:37','Curran I. Durham','2014-07-07 09:08:41','2015-03-20 15:52:13',50),(86,'2016-02-03 12:28:09','Dakota Z. Vinson','2016-05-21 14:54:32','2014-11-27 06:50:44',20),(87,'2015-08-03 16:05:09','Ila Z. Love','2016-01-17 20:10:18','2014-06-27 02:45:46',93),(88,'2016-04-04 13:52:33','Griffin Y. Black','2014-11-18 20:50:19','2015-01-07 22:55:01',40),(89,'2014-12-13 22:54:45','Ivana S. Greer','2014-10-27 21:09:36','2016-01-18 11:09:44',93),(90,'2014-08-06 16:02:12','Beatrice Y. Acevedo','2014-07-28 01:25:40','2016-01-30 06:41:45',76),(91,'2016-05-10 05:18:59','Fleur J. Stout','2015-10-14 11:27:55','2014-07-16 20:54:22',37),(92,'2014-10-03 01:09:55','Raymond N. Curry','2014-09-01 00:35:03','2015-12-08 01:51:07',23),(93,'2015-10-02 20:22:38','Stephen Y. Russell','2015-03-22 17:13:41','2016-03-26 15:16:01',14),(94,'2015-09-05 13:48:52','Mara X. Peterson','2015-12-22 02:51:58','2016-05-08 06:19:11',2),(95,'2015-02-09 09:56:43','Belle U. Hyde','2014-07-22 20:43:44','2014-10-25 06:02:02',28),(96,'2015-08-03 08:50:19','Lionel G. Johnson','2016-03-18 03:17:42','2015-12-01 13:53:03',21),(97,'2015-03-11 12:03:16','Lara W. Parrish','2015-10-24 18:37:05','2014-10-04 22:44:19',41),(98,'2016-05-06 17:26:55','August D. Olson','2014-11-20 20:59:48','2014-09-28 21:08:12',42),(99,'2015-12-19 19:34:49','Gisela P. Jordan','2014-09-10 17:40:52','2014-10-30 12:11:52',72),(100,'2014-10-26 14:55:15','Fallon S. Logan','2016-05-12 15:43:45','2014-06-20 10:18:44',70);
/*!40000 ALTER TABLE `patientHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientNotifications`
--

DROP TABLE IF EXISTS `patientNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientNotifications` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `id_patient` mediumint(9) DEFAULT NULL,
  `status` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientNotifications`
--

LOCK TABLES `patientNotifications` WRITE;
/*!40000 ALTER TABLE `patientNotifications` DISABLE KEYS */;
INSERT INTO `patientNotifications` VALUES (1,'2015-08-08 16:04:24',61,'Notifcation sent'),(2,'2016-05-09 18:17:56',30,'Notifcation sent'),(3,'2016-03-23 17:43:03',41,'Notifcation sent'),(4,'2014-09-10 13:19:19',37,'Notifcation sent'),(5,'2014-06-14 11:32:31',21,'Notifcation sent'),(6,'2016-04-15 07:42:40',18,'Notifcation sent'),(7,'2015-05-05 02:57:58',52,'Notifcation sent'),(8,'2015-09-07 09:26:09',89,'Notifcation sent'),(9,'2014-11-21 12:13:44',25,'Notifcation sent'),(10,'2015-05-24 02:56:31',37,'Notifcation sent'),(11,'2015-07-14 03:14:24',89,'Notifcation sent'),(12,'2015-05-26 23:13:58',96,'Notifcation sent'),(13,'2016-05-16 08:12:56',65,'Notifcation sent'),(14,'2016-01-29 14:21:16',9,'Notifcation sent'),(15,'2015-02-02 08:04:34',17,'Notifcation sent'),(16,'2015-10-23 18:02:23',11,'Notifcation sent'),(17,'2014-10-17 02:31:40',73,'Notifcation sent'),(18,'2015-09-11 16:31:32',15,'Notifcation sent'),(19,'2015-10-17 12:54:15',15,'Notifcation sent'),(20,'2015-09-25 10:59:50',36,'Notifcation sent'),(21,'2016-02-17 07:52:17',70,'Notifcation sent'),(22,'2015-02-19 11:52:55',84,'Notifcation sent'),(23,'2016-05-31 02:59:14',52,'Notifcation sent'),(24,'2015-08-08 00:22:23',93,'Notifcation sent'),(25,'2015-05-31 14:28:41',9,'Notifcation sent'),(26,'2014-12-08 04:20:53',28,'Notifcation sent'),(27,'2015-07-13 03:18:27',99,'Notifcation sent'),(28,'2014-10-04 00:49:28',70,'Notifcation sent'),(29,'2015-11-19 23:58:06',37,'Notifcation sent'),(30,'2015-01-05 21:44:58',22,'Notifcation sent'),(31,'2016-04-01 22:25:38',100,'Notifcation sent'),(32,'2016-01-19 16:11:55',25,'Notifcation sent'),(33,'2015-08-27 16:28:24',73,'Notifcation sent'),(34,'2015-11-02 01:48:08',43,'Notifcation sent'),(35,'2016-04-16 03:38:52',72,'Notifcation sent'),(36,'2015-04-14 18:43:50',8,'Notifcation sent'),(37,'2015-12-12 09:52:51',97,'Notifcation sent'),(38,'2015-12-25 16:50:01',70,'Notifcation sent'),(39,'2015-02-11 23:52:38',54,'Notifcation sent'),(40,'2015-03-22 02:45:48',77,'Notifcation sent'),(41,'2014-07-22 06:47:52',92,'Notifcation sent'),(42,'2015-08-01 14:59:40',43,'Notifcation sent'),(43,'2014-09-08 06:35:18',41,'Notifcation sent'),(44,'2015-04-30 04:11:42',23,'Notifcation sent'),(45,'2014-09-28 07:58:43',55,'Notifcation sent'),(46,'2015-11-18 18:47:18',76,'Notifcation sent'),(47,'2015-01-11 22:17:22',13,'Notifcation sent'),(48,'2015-10-01 01:22:40',97,'Notifcation sent'),(49,'2015-02-19 03:19:12',27,'Notifcation sent'),(50,'2016-03-06 06:33:01',29,'Notifcation sent'),(51,'2015-11-30 03:31:19',50,'Notifcation sent'),(52,'2014-09-11 12:54:19',17,'Notifcation sent'),(53,'2014-07-01 03:24:37',9,'Notifcation sent'),(54,'2014-08-09 15:30:33',4,'Notifcation sent'),(55,'2015-05-10 02:12:10',38,'Notifcation sent'),(56,'2014-12-29 12:28:37',52,'Notifcation sent'),(57,'2015-07-09 03:04:39',16,'Notifcation sent'),(58,'2014-07-26 15:17:35',24,'Notifcation sent'),(59,'2016-03-26 02:45:56',41,'Notifcation sent'),(60,'2016-02-25 11:34:22',36,'Notifcation sent'),(61,'2014-09-29 01:00:03',73,'Notifcation sent'),(62,'2014-12-06 17:35:46',43,'Notifcation sent'),(63,'2015-02-04 00:25:59',76,'Notifcation sent'),(64,'2015-11-22 14:13:21',82,'Notifcation sent'),(65,'2015-07-27 21:26:21',22,'Notifcation sent'),(66,'2016-01-30 08:51:02',89,'Notifcation sent'),(67,'2014-07-19 06:28:50',93,'Notifcation sent'),(68,'2015-10-10 22:54:59',81,'Notifcation sent'),(69,'2014-12-11 00:53:25',55,'Notifcation sent'),(70,'2014-10-17 11:44:51',93,'Notifcation sent'),(71,'2015-11-10 22:09:10',13,'Notifcation sent'),(72,'2015-04-01 16:40:19',99,'Notifcation sent'),(73,'2015-05-22 12:24:14',31,'Notifcation sent'),(74,'2014-09-26 13:42:15',75,'Notifcation sent'),(75,'2016-05-02 13:08:13',74,'Notifcation sent'),(76,'2016-01-24 04:57:46',53,'Notifcation sent'),(77,'2014-07-15 05:42:36',32,'Notifcation sent'),(78,'2015-09-02 05:25:55',27,'Notifcation sent'),(79,'2014-07-18 10:53:19',15,'Notifcation sent'),(80,'2014-12-19 23:04:33',14,'Notifcation sent'),(81,'2014-11-09 11:43:50',2,'Notifcation sent'),(82,'2016-02-24 07:17:31',24,'Notifcation sent'),(83,'2015-06-09 12:20:40',6,'Notifcation sent'),(84,'2016-03-12 06:52:45',36,'Notifcation sent'),(85,'2014-10-20 01:54:10',39,'Notifcation sent'),(86,'2014-12-04 16:04:27',11,'Notifcation sent'),(87,'2014-10-21 22:03:24',22,'Notifcation sent'),(88,'2015-10-10 15:59:59',51,'Notifcation sent'),(89,'2015-01-10 10:57:30',50,'Notifcation sent'),(90,'2014-12-21 14:47:12',91,'Notifcation sent'),(91,'2016-05-18 01:00:12',89,'Notifcation sent'),(92,'2014-09-19 19:31:00',4,'Notifcation sent'),(93,'2015-06-13 18:10:40',8,'Notifcation sent'),(94,'2015-06-16 01:14:36',24,'Notifcation sent'),(95,'2015-08-24 04:08:15',64,'Notifcation sent'),(96,'2014-11-26 10:00:51',82,'Notifcation sent'),(97,'2015-03-25 04:34:45',67,'Notifcation sent'),(98,'2014-09-12 04:27:19',9,'Notifcation sent'),(99,'2014-09-23 20:13:22',88,'Notifcation sent'),(100,'2014-11-19 11:00:03',77,'Notifcation sent');
/*!40000 ALTER TABLE `patientNotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `contactBy` varchar(255) DEFAULT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinytext,
  `seen` int(1) unsigned DEFAULT '0',
  `owner` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (63,'Dane','Forbes','lectus.a.sollicitudin@aceleifend.edu','1-171-405-1344','Email','2015-06-12 17:49:56','Seen',1,'admin'),(68,'Tanek','Mccarty','ante.dictum.cursus@porttitor.net','1-807-772-5945','Email','2015-06-12 17:49:56','Seen',1,'admin'),(69,'Chase','Watson','vulputate.nisi@aodiosemper.net','1-488-988-1878','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(70,'Nasim','Burnett','egestas@posuere.co.uk','1-276-137-6724','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(71,'Cruz','Leach','gravida.Aliquam@duiaugue.org','1-109-724-1365','Email','2015-06-12 17:49:56','Seen',1,'admin'),(72,'Lev','Mcgee','non.enim@Suspendissecommodotincidunt.co.uk','1-329-807-9971','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(73,'Erasmus','Pacheco','parturient.montes@egettincidunt.co.uk','1-129-578-3629','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(74,'Kennedy','Thomas','non@nuncrisusvarius.edu','1-646-423-6971','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(75,'Chancellor','Hardy','et@sedhendrerita.org','1-557-900-7204','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(76,'Acton','Whitley','molestie.orci.tincidunt@ullamcorperDuis.com','1-354-596-0891','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(77,'Slade','Wheeler','bibendum.sed@egestasAliquamfringilla.co.uk','1-231-830-4123','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(78,'Harper','Mcleod','In.condimentum.Donec@urna.net','1-934-661-8839','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(79,'Cyrus','Garner','lectus.convallis.est@commodoat.net','1-421-581-1740','Email','2015-06-12 17:49:56','Seen',1,'admin'),(80,'Francis','Simpson','erat@erategetipsum.org','1-703-618-1704','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(81,'Fulton','Wheeler','eget.tincidunt.dui@arcuMorbisit.com','1-494-414-7501','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(82,'Connor','Mcintyre','cursus.et@pedeetrisus.org','1-663-276-8608','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(83,'Ray','Kirkland','purus@cursus.ca','1-347-841-1112','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(84,'Allen','Fulton','interdum@cursusNunc.ca','1-478-135-0866','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(85,'Derek','Henson','Donec.consectetuer.mauris@Aliquam.co.uk','1-949-311-1279','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(86,'Chaim','Watts','Cras.vulputate@nunc.co.uk','1-692-451-7643','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(87,'Lee','Bishop','tristique.pellentesque.tellus@ProinvelitSed.edu','1-284-893-5188','Email','2015-06-12 17:49:56','Seen',1,'admin'),(88,'Kadeem','Silva','massa.Mauris.vestibulum@Seddiamlorem.ca','1-227-780-5082','Texts','2015-06-12 17:49:56','Seen',1,'admin'),(89,'Jonas','Warner','elit.fermentum.risus@Quisquetinciduntpede.co.uk','1-392-939-6749','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(91,'Hedley','Munoz','Donec@Duis.org','1-772-199-9728','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(92,'Garth','Hart','sit.amet@malesuada.edu','1-473-805-8167','Email','2015-06-12 17:49:56','Seen',1,'admin'),(94,'Justin','Mccarty','gravida@atvelitPellentesque.org','1-930-575-2808','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(95,'Hakeem','Cross','varius@nequeseddictum.net','1-956-942-6145','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(98,'Tyler','Gutierrez','inceptos@Etiamlaoreetlibero.org','1-696-573-4061','Texts','2015-06-11 17:49:11','Waiting',1,'admin'),(99,'Tarik','Andrews','cursus.purus.Nullam@tellusjusto.net','1-491-555-4585','Phone','2015-06-11 17:48:22','Waiting',1,'admin'),(100,'Ryder','Harvey','ornare.tortor.at@sitametornare.ca','1-979-570-0273','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(103,'Devin','Buckner','Nunc.ac.sem@placeratvelitQuisque.org','1-256-628-9071','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(104,'Devin','Buckner','Nunc.ac.sem@placeratvelitQuisque.org','1-256-628-9071','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(106,'Adrian','Bush','torquent@afacilisisnon.edu','1-905-168-2547','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(107,'Carson','Sharp','non.quam.Pellentesque@Nullasemper.co.uk','1-742-476-1606','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(108,'Carson','Sharp','non.quam.Pellentesque@Nullasemper.co.uk','1-742-476-1606','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(110,'Daniel','Cote','Donec.felis@hendrerit.co.uk','1-782-236-8117','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(111,'Rafael','Weiss','parturient.montes.nascetur@ipsumcursusvestibulum.ca','1-158-883-9638','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(112,'Rafael','Weiss','parturient.montes.nascetur@ipsumcursusvestibulum.ca','1-158-883-9638','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(113,'Theodore','Lott','consectetuer.adipiscing.elit@enim.ca','1-341-464-2200','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(114,'Theodore','Lott','consectetuer.adipiscing.elit@enim.ca','1-341-464-2200','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(115,'Trevor','Hutchinson','erat.Vivamus@Integerin.edu','1-399-867-7968','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(117,'Timon','Casey','nonummy.ipsum@Sed.edu','1-564-214-1202','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(118,'Timon','Casey','nonummy.ipsum@Sed.edu','1-564-214-1202','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(120,'Daniel','Cote','Donec.felis@hendrerit.co.uk','1-782-236-8117','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(121,'Craig','Bradford','dis.parturient.montes@Namnullamagna.co.uk','1-417-508-2348','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(122,'Craig','Bradford','dis.parturient.montes@Namnullamagna.co.uk','1-417-508-2348','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(126,'Hayden','Petty','gravida@dui.net','1-164-709-7933','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(133,'Asher','Cardenas','ornare.sagittis.felis@sedorci.net','1-960-929-4400','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(136,'Joseph','Waller','Integer.mollis.Integer@pretiumetrutrum.org','1-148-511-4563','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(138,'James','Orr','Quisque@purusinmolestie.net','1-832-595-4804','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(165,'Paul','Obrien','egestas@Craslorem.co.uk','1-489-146-7549','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(166,'Omar','Fry','dolor@eget.co.uk','1-516-499-4532','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(167,'Kieran','Wallace','mi@habitantmorbitristique.co.uk','1-662-194-3405','Email','2015-06-11 17:48:32','Waiting',0,'admin'),(168,'Theodore','Rodriguez','eleifend@semelit.com','1-137-277-9052','Texts','2015-06-11 17:49:11','Waiting',0,'admin'),(179,'Omar','Mann','urna.suscipit@sodales.edu','1-679-850-9370','Email','2015-06-12 17:49:56','Seen',1,'admin'),(180,'Orson','Mccarthy','dis.parturient.montes@insodaleselit.edu','1-897-565-6803','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(181,'Moses','Mcfarland','sem.ut.cursus@porttitorinterdumSed.net','1-584-547-4496','Phone','2015-06-12 17:49:56','Seen',1,'admin'),(182,'Deacon','Rogers','non.egestas.a@sitamet.co.uk','1-445-441-6143','Phone','2015-06-11 17:48:22','Waiting',0,'admin'),(183,'Moses','Emerson','arcu.Vestibulum.ut@tellus.co.uk','1-629-261-5625','Phone','2015-06-11 17:48:22','Waiting',0,'admin');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-12 14:24:38
