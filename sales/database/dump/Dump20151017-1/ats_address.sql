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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(45) DEFAULT NULL,
  `address_latitude` char(45) DEFAULT NULL,
  `address_longitude` char(45) DEFAULT NULL,
  `address_detail` varchar(225) DEFAULT NULL,
  `address_user` int(11) DEFAULT NULL,
  `address_company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123','25.28241992252014','51.527273654937744','Umm Wishad St, Doha, Qatar',0,7),(2,'xxx','25.28241992252014','51.527273654937744','Umm Wishad St, Doha, Qatar',0,10),(3,'yyy','25.28241992252014','51.527273654937744','Umm Wishad St, Doha, Qatar',0,13),(4,'z','25.260745595874095','51.44417077302933','Al Waab St, Doha, Qatar',0,16),(5,'rizwan','25.226683668661465','51.43258094787598','Salwa Rd, Ar-Rayyān, Qatar',0,19),(6,'1232','25.308493836661064','51.52590036392212','Corniche Promenade, Doha, Qatar',0,25),(7,'123','25.29980315505045','51.53688669204712','Corniche Promenade, Doha, Qatar',0,31),(8,'123','25.298561578232665','51.453115940093994','Al Amhar St, Ar-Rayyān, Qatar',0,37),(9,'aaa','25.298561578232665','51.56160593032837','Promenade, Doha, Qatar',0,43),(10,'asd','25.28490339401531','51.469595432281494','Snaya St, Doha, Qatar',0,49),(11,'sample','25.273106451609934','51.508047580718994','C Ring Rd, Doha, Qatar',0,55),(12,'sample1','25.36993157376243','51.56435251235962','Pearl Blvd, Doha, Qatar',0,57),(13,'sam2','25.30911457578394','51.551992893218994','Corniche Promenade, Doha, Qatar',0,24),(14,'salwa road','25.279936400180603','51.51766061782837','Al Ghafiqi St, Doha, Qatar',0,25),(15,'123123123','25.363727158475925','51.576712131500244','Isola Dana Dr, Doha, Qatar',0,26),(16,'Maim Office','25.26666421603113','51.45516514778137','Wadi Al Gaiya St, Doha, Qatar',0,27),(17,'rhalf','25.2724855281317','51.45174264907837','Umm Suwayya St, Doha, Qatar',0,28),(18,'Doha, Qatar','25.300431213479747','51.484723426401615','Rawd Al Ain St, Doha, Qatar',0,29);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-17  1:26:32
