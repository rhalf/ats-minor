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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_datetime_created` timestamp NULL DEFAULT NULL,
  `user_datetime_renewed` timestamp NULL DEFAULT NULL,
  `user_hash` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_privilege` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `user_login_count` int(11) DEFAULT '0',
  `user_login_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`user_name`),
  KEY `fk_users_privilege_idx` (`user_privilege`),
  KEY `fk_users_status1_idx` (`user_status`),
  CONSTRAINT `fk_users_privilege` FOREIGN KEY (`user_privilege`) REFERENCES `privilege` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_status1` FOREIGN KEY (`user_status`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rhalf','83482b428ba25361eae10319620d642b8cf74791','2015-09-13 04:00:00','2016-09-13 04:00:00',NULL,'rhalf@ats-qatar.com',1,3,NULL,NULL),(2,'maryann','0270bd3fa57440f9bdd427958e8850112c04b72d','2015-09-13 04:00:00','2016-09-13 04:00:00',NULL,'maryann@ats-qatar.com',2,3,NULL,NULL),(3,'rizwan','ce517421b67b41442b1a299e916290983a311e9e','2015-09-13 04:00:00','2016-09-13 04:00:00',NULL,'rizwan',3,3,NULL,NULL),(6,'Jaher','bc53b5813c49642762c251319405523e399e6176','2015-10-14 06:18:39','2015-10-13 21:00:00','','Jaher@ats-qatar.com',6,5,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-17  1:26:27
