CREATE DATABASE  IF NOT EXISTS `ats` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ats`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 184.107.179.178    Database: ats
-- ------------------------------------------------------
-- Server version	5.7.8-rc-log

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `company_description` varchar(128) DEFAULT NULL,
  `company_datetime_created` timestamp NULL DEFAULT NULL,
  `company_status` int(11) NOT NULL,
  `company_business_field` int(11) NOT NULL,
  `company_added_by` int(11) NOT NULL,
  PRIMARY KEY (`id`,`company_status`,`company_business_field`,`company_added_by`),
  UNIQUE KEY `company_name_UNIQUE` (`company_name`),
  KEY `fk_companies_company_business_type1_idx` (`company_business_field`),
  KEY `fk_companies_users1_idx` (`company_added_by`),
  KEY `fk_companies_status1_idx` (`company_status`),
  CONSTRAINT `fk_companies_company_business_type1` FOREIGN KEY (`company_business_field`) REFERENCES `business_field` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_companies_status1` FOREIGN KEY (`company_status`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_companies_users1` FOREIGN KEY (`company_added_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Advanced Technologies and Solutions','Advanced Technologies and Solutions','2015-09-13 04:00:00',3,1,1),(2,'Almarfa','Almarfa','2015-09-13 04:00:00',3,2,1),(3,'Al Mannai Corp','Al Mannai Corp','2015-09-29 12:45:14',3,1,1),(16,'rizwan','Solutions COmpany','2015-09-29 13:35:02',3,1,1),(17,'mary','mary','2015-09-30 06:57:03',3,1,1),(23,'sample1','sample1','2015-10-01 18:10:52',3,1,1),(24,'sam2','sam2','2015-10-01 18:42:23',3,1,1),(25,'zonal','zonal','2015-10-04 09:49:38',3,2,2),(27,'Al Amera','Al Amera','2015-10-06 07:23:15',3,1,1),(28,'rhalf','rhalf','2015-10-11 13:44:19',3,1,1),(29,'RS Groups','Multinational Company','2015-10-12 13:03:34',3,2,3);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-17  1:26:09
