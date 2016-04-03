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
-- Table structure for table `product_offered`
--

DROP TABLE IF EXISTS `product_offered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_offered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_offered_datetime` timestamp NULL DEFAULT NULL,
  `product_offered_product` int(11) NOT NULL,
  `product_offered_company` int(11) NOT NULL,
  `product_offered_contact` int(11) NOT NULL,
  `product_offered_client_response` int(11) NOT NULL,
  `product_offered_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_offered_product_description1_idx` (`product_offered_product`),
  KEY `fk_product_offered_company1_idx` (`product_offered_company`),
  KEY `fk_product_offered_contact1_idx` (`product_offered_contact`),
  KEY `fk_product_offered_client_response1_idx` (`product_offered_client_response`),
  KEY `fk_product_offered_user1_idx` (`product_offered_user`),
  CONSTRAINT `fk_product_offered_client_response1` FOREIGN KEY (`product_offered_client_response`) REFERENCES `client_response` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_offered_company1` FOREIGN KEY (`product_offered_company`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_offered_contact1` FOREIGN KEY (`product_offered_contact`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_offered_product1` FOREIGN KEY (`product_offered_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_offered_user1` FOREIGN KEY (`product_offered_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_offered`
--

LOCK TABLES `product_offered` WRITE;
/*!40000 ALTER TABLE `product_offered` DISABLE KEYS */;
INSERT INTO `product_offered` VALUES (1,'2015-10-07 14:13:38',2,1,2,1,1),(4,'2015-10-04 09:45:53',1,24,36,2,2),(5,'2015-10-06 07:14:21',1,1,1,1,1),(6,'2015-10-06 07:18:48',1,1,3,1,1),(7,'2015-10-06 07:25:33',3,27,46,1,1),(8,'2015-10-06 11:29:18',1,16,5,1,1),(9,'1999-12-31 21:00:00',1,27,1,1,1),(10,'1999-12-31 21:00:00',1,27,1,1,1),(11,'2015-10-20 21:00:00',1,16,5,1,1),(12,'2015-10-11 21:00:00',1,28,51,1,1),(14,'2015-10-11 21:00:00',2,29,55,2,3);
/*!40000 ALTER TABLE `product_offered` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-17  1:00:33
