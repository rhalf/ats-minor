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
-- Dumping routines for database 'ats'
--
/*!50003 DROP PROCEDURE IF EXISTS `address_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `address_insert`(
	 IN addressName CHAR(45),
	 IN addressLatitude CHAR(45),
	 IN addressLongitude CHAR(45), 
	 IN addressCompany INT,
	 IN addressUser INT,
	 IN addressDetail CHAR(225),
     IN user INT
     
     )
BEGIN

	INSERT INTO ats.address (
    ats.address.address_name,
	ats.address.address_latitude,
	ats.address.address_longitude,
    ats.address.address_company,
    ats.address.address_user,
    ats.address.address_detail
    )
    
	VALUES (
    
			addressName, 
			addressLatitude,
			addressLongitude,
			addressCompany,
            addressUser,
			addressDetail
            
    );
    
    
    CALL ats.user_log_insert(user,2,'ats.address',addressName);
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `business_field_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `business_field_select`()
BEGIN

SELECT 

    ats.business_field.id,
    ats.business_field.business_field_name,
    ats.business_field.business_field_description
    
    
FROM ats.business_field;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `client_response_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `client_response_select`()
BEGIN
SELECT 

	ats.client_response.id,
    ats.client_response.client_response_name,
    ats.client_response.client_response_description
    
    
FROM ats.client_response;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_address_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `company_address_select`()
BEGIN
SELECT    
    ats.company_address.id,
    ats.company_address.company_address_name,
    ats.company_address.company_address_latitude,
    ats.company_address.company_address_longitude,
    ats.company_address.company_address_company,
    ats.company_address.company_address_detail
FROM ats.company_address;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_address_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `company_address_update`(   
     IN companyAddressId INT(11),
	 IN companyAddressName CHAR(45),
	 IN companyAddressLatitude DOUBLE,
	 IN companyAddressLongitude DOUBLE, 
	 IN companyAddressCompany INT(11),
	 IN companyAddressDetail CHAR(225),
     IN user INT)
BEGIN

UPDATE ats.company_address
SET
    company_address_name=companyAddressName,
	company_address_latitude=companyAddressLatitude,
	company_address_longitude=companyAddressLongitude,
    company_address_company=companyAddressCompany,
    company_address_detail=companyAddressDetail
    
    where ats.company_address.id=companyAddressId;


   CALL ats.user_log_insert(user,3,'ats.company_address',companyAddressName);
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `company_delete`(
    IN companyId INT, 
    
    IN user INT

)
BEGIN

DELETE 
FROM 
	ats.company 
WHERE
	ats.company.id= companyId;


 SET @companyName=(SELECT ats.company.company_name FROM ats.company WHERE ats.company.id=companyId);

 CALL ats.user_log_insert(user,4,'ats.company',@companyName);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `company_insert`(
	IN companyName CHAR(128), 
    IN companyDescription CHAR(128), 
    IN companyStatus INT, 
    IN companyBusinessField INT,
    IN user INT
)
BEGIN
	INSERT INTO ats.company (
		ats.company.company_name,
		ats.company.company_description, 
		ats.company.company_datetime_created,
		ats.company.company_status, 
		ats.company.company_business_field,
		ats.company.company_added_by
	)

	VALUES ( 
		companyName, 
        companyDescription, 
        NOW(),
        companyStatus,
        companyBusinessField,
        user
	);
    

    #IN userLogUser INT, 
    #IN userLogType INT,
    #IN userLogTableName CHAR(128),
    #IN userLogItemName CHAR(128)
    CALL ats.user_log_insert(user,2,'ats.company',companyName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_insert_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `company_insert_all`(
	IN companyName CHAR(128), 
    IN companyDescription CHAR(128), 
    IN companyStatus INT, 
    IN companyBusinessField INT,
    
	IN addressName CHAR(45),
	IN addressLatitude DOUBLE,
	IN addressLongitude DOUBLE,
    IN addressDetail CHAR(128),
    
	IN contactPerson CHAR(45),
    IN contactMobile CHAR(45),
    IN contactEmail CHAR(45),
    IN contactLandline CHAR(45),
    IN contactFax CHAR(45),
    
    
    
    IN user INT
)
BEGIN
	#=========================================================================================================================
	SET @companyId  = (SELECT ats.company.id FROM ats.company WHERE ats.company.company_name = companyName); 

	IF (@companyId IS NULL) THEN
		CALL ats.company_insert(companyName, companyDescription, companyStatus, companyBusinessField, user);
		#SET @companyId = LAST_INSERT_ID();
        SET @companyId  = (SELECT ats.company.id FROM ats.company WHERE ats.company.company_name = companyName); 
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Company already exists.', MYSQL_ERRNO = 1001;
		#CALL ats.company_update(@companyId, companyName, companyDescription, companyStatus, companyBusinessField, user);
	END IF;
    

	#=========================================================================================================================
	CALL ats.address_insert(
		addressName, 
		addressLatitude,
		addressLongitude,
		@companyId,
        0,
        addressDetail, 
        user
	);
    #=========================================================================================================================
    IF (contactMobile IS  NOT NULL) THEN
		CALL ats.contact_insert(
			contactPerson,
            contactMobile,
            @companyId,
            2,
            user
		);
    END IF;
	IF (contactEmail IS  NOT NULL) THEN
		CALL ats.contact_insert(
			contactPerson,
            contactEmail,
            @companyId,
            1,
            user
		);
    END IF;
	IF (contactLandline IS  NOT NULL) THEN
		CALL ats.contact_insert(
			contactPerson,
            contactLandline,
            @companyId,
            3,
            user
		);
    END IF;
	IF (contactFax IS  NOT NULL) THEN
		CALL ats.contact_insert(
			contactPerson,
            contactFax,
            @companyId,
            4,
            user
		);
    END IF;
	#=========================================================================================================================
	#IN userLogUser INT, 
	#IN userLogType INT,
	#IN userLogTableName CHAR(128),
	#IN userLogItemName CHAR(128)
	#CALL ats.user_log_insert(user,3,'ats.company',companyName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `company_select`()
BEGIN
SELECT 

    ats.company.id,
    ats.company.company_name,
    ats.company.company_description,
    ats.company.company_datetime_created,
    ats.company.company_status,
    ats.company.company_business_field,
    ats.company.company_added_by
    
    
FROM ats.company;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rhalf`@`%` PROCEDURE `company_update`(
	IN companyId INT,
	IN companyName CHAR(45),
    IN companyDescription CHAR(128),
    IN companyStatus INT,
    IN companyBusinessField INT,
    IN user INT
)
BEGIN
	UPDATE ats.company 
	SET 
	company_name= companyName,
	company_description= companyDescription,
	company_status= companyStatus,
	company_business_field= companyBusinessField
	
	WHERE ats.company.id = companyId;
    
    
	#IN userLogUser INT, 
    #IN userLogType INT,
    #IN userLogTableName CHAR(128),
    #IN userLogItemName CHAR(128)
    CALL ats.user_log_insert(user,3,'ats.company',companyName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contact_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `contact_insert`(
    IN contactPerson CHAR(45),
	IN contactData CHAR(128),
	IN contactCompany INT,
	IN contactType INT,
	IN user INT)
BEGIN
	INSERT INTO ats.contact (
    ats.contact.contact_data,
	ats.contact.contact_company,
	ats.contact.contact_type,
    ats.contact.contact_person)
	VALUES (
		contactData, 
		contactCompany, 
		contactType,
        contactPerson
    );
    
    
     CALL ats.user_log_insert(user,2,'ats.contact',contactData);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contact_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `contact_select`()
BEGIN
SELECT
	ats.contact.id,
	ats.contact.contact_data,
	ats.contact.contact_company,
	ats.contact.contact_type,
	ats.contact.contact_person
	
FROM 
	ats.contact;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contact_type_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `contact_type_insert`(

IN contactTypeName CHAR(45), 
IN contactTypeDescription CHAR(128),
IN user INT
)
BEGIN
	INSERT INTO ats.contact_type (
    ats.contact_type.contact_type_name,
	ats.contact_type.contact_type_description
    )
	VALUES (
    contactTypeName,
    contactTypeDescription
    );
    
    
    CALL ats.user_log_insert(user,2,'ats.contact_type',contactTypeName);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contact_type_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `contact_type_select`()
BEGIN

SELECT 

	ats.contact_type.id,
    ats.contact_type.contact_type_name,
    ats.contact_type.contact_type_description
    
    
FROM ats.contact_type;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contact_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `contact_update`(
 IN contactId INT(11),
 IN contactData CHAR(128),
 IN contactCompany INT,
 IN contactType INT,
 IN user INT)
BEGIN

UPDATE ats.contact

SET 

		contact_data=contactData,
		contact_company=contactCompany,
		contact_type=contactType

WHERE ats.contact.id=contactId;



CALL ats.user_log_insert(user,3,'ats.contact',contactData);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `privilege_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `privilege_insert`(


IN privilegeName CHAR(45),
IN user INT

)
BEGIN
	INSERT INTO ats.privilege(
    ats.privilege.privilege_name)
    
    
	VALUES (privilegeName);
    
CALL ats.user_log_insert(user,2,'ats.privilege',privilegeName);


    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `privilege_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `privilege_select`()
BEGIN

SELECT 

    ats.privilege.id,
    ats.privilege.privilege_name,
    ats.privilege.privilege_description
    
    
FROM ats.privilege;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `product_insert`(
IN productName CHAR(45),
IN productDescription CHAR(128),
IN productCompany INT,
IN user INT)
BEGIN
	INSERT INTO ats.product(
    ats.product.product_name,
    ats.product.product_description,
    ats.product.product_company)
    
    
	VALUES (productName,productDescription,productCompany);
    
    CALL ats.user_log_insert(user,2,'ats.product',product_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_offered` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rhalf`@`%` PROCEDURE `product_offered`()
BEGIN
SELECT
ats.product_offered.id, 
ats.product_offered.product_offered_datetime, 
ats.product.product_name,
ats.company.company_name,
ats.contact.contact_data,
ats.contact_type.contact_type_name,
ats.client_response.client_response_name,
ats.user.user_name


from product_offered
LEFT JOIN ats.product
ON ats.product_offered.product_offered_product=ats.product.product_company

LEFT JOIN ats.company
ON ats.product_offered.product_offered_company=ats.company.id

LEFT JOIN ats.contact
ON ats.product_offered.product_offered_contact=ats.contact.id

LEFT JOIN ats.contact_type
ON ats.contact.contact_type=ats.contact_type.id

LEFT JOIN ats.client_response
ON ats.product_offered.product_offered_client_response=ats.client_response.id

LEFT JOIN ats.user
ON ats.product_offered.product_offered_user=ats.user.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_offered_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `product_offered_delete`(
    IN productOfferedId INT,
    IN user INT

)
BEGIN

DELETE 
FROM 
	ats.product_offered
WHERE
	ats.product_offered.id= productOfferedId;


 SET @productOfferProduct = (
 
	SELECT ats.product_offered.product_offered_product
	FROM ats.product_offered
    WHERE ats.product_offered.id=productOfferedId);

SET @productName=(SELECT ats.product.product_name FROM ats.product WHERE ats.product.id=@productOfferProduct);


 CALL ats.user_log_insert(user,4,'ats.product',@productName);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_offered_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `product_offered_insert`(
IN productOfferedDateTime TIMESTAMP,
IN productOfferedCompany INT,
IN productOfferedContact INT,
IN productOfferedProduct INT,
IN productOfferedClientResponse INT,
IN productOfferedUser INT,
IN user INT)
BEGIN
	INSERT INTO ats.product_offered(
    ats.product_offered.product_offered_datetime,
    ats.product_offered.product_offered_product,
    ats.product_offered.product_offered_company,
    ats.product_offered.product_offered_contact,
    ats.product_offered.product_offered_client_response,
    ats.product_offered.product_offered_user)
    
    
	VALUES (
	productOfferedDateTime,
    productOfferedProduct,
    productOfferedCompany,
    productOfferedContact,
    productOfferedClientResponse,
    productOfferedUser
    );
    
    SET @productName = (SELECT ats.product.product_name FROM ats.product WHERE ats.product.id =  productOfferedProduct);
    CALL ats.user_log_insert(user,2,'product_offered',@productName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_offered_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `product_offered_select`()
BEGIN

SELECT 
    ats.product_offered.id,
    ats.product_offered.product_offered_datetime,
    ats.product_offered.product_offered_product,
    ats.product_offered.product_offered_company,
    ats.product_offered.product_offered_contact,
    ats.product_offered.product_offered_client_response,
    ats.product_offered.product_offered_user
    
    
FROM ats.product_offered;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_offered_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `product_offered_update`(
IN productId INT,
IN productDateTime TIMESTAMP,
IN productOfferedProduct INT,
IN productOfferedCompany INT,
IN productOfferedontact INT,
IN productOfferedClientResponse INT,
IN product_offered_user INT,
IN user INT
)
BEGIN

UPDATE 
	ats.product_offered
SET
	product_offered_datetime = productDateTime,
	product_offered_product = productOfferedProduct,
	product_offered_company = productOfferedCompany,
	product_offered_contact = productOfferedontact,
	product_offered_client_response = productOfferedClientResponse,
	product_offered_user = product_offered_user
WHERE id = productId;



 SET @productName = (SELECT ats.product.product_name FROM ats.product WHERE ats.product.id =  productOfferedProduct);
 CALL ats.user_log_insert(user,3,'product_offered',@productName);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `product_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `product_select`()
BEGIN

SELECT 
    ats.product.id,
    ats.product.product_name,
    ats.product.product_description,
    ats.product.product_company
    
    
FROM ats.product;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `status_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `status_insert`(IN statusName CHAR(45),IN user INT)
BEGIN
	INSERT INTO ats.status(
    ats.status.status_name)
    
    
	VALUES (statusName);
    CALL ats.user_log_insert(user,2,'ats.status',status_name);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `status_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `status_select`()
BEGIN

SELECT 

    ats.status.id,
    ats.status.status_name,
    ats.status.status_description
    
    
FROM ats.status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_delete`(
IN user_id INT,
IN user INT)
BEGIN
DELETE FROM ats.user
WHERE ats.user.id=user_id;


SET @username=(SELECT ats.user.user_name FROM ats.user WHERE ats.user.id=user);
CALL ats.user_log_insert(user,4,'ats.user',@username);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_insert`(
	IN userName CHAR(128), 
    IN userPassword CHAR(128),
    IN userHash CHAR(128),
    IN userEmail  CHAR(128),
    IN userPrivilege INT,
    IN userStatus INT,
    IN user INT
)
BEGIN
	INSERT INTO ats.user (
		ats.user.user_name,
		ats.user.user_password,
		ats.user.user_datetime_created,
		ats.user.user_datetime_renewed,
		ats.user.user_hash,
		ats.user.user_email,
		ats.user.user_privilege,
		ats.user.user_status   
    )
	VALUES (
		userName, 
		userPassword,
        NOW(),
        userHash,
        userEmail,
        userPrivilege,
        userStatus);

	CALL ats.user_log_insert(user,2,'ats.user',userName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_log_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_log_insert`(
	IN userLogUser INT, 
    IN userLogType INT,
    IN userLogTableName CHAR(128),
    IN userLogItemName CHAR(128)
)
BEGIN
	INSERT INTO ats.user_log (
		ats.user_log.user_log_datetime,
		ats.user_log.user_log_user,
		ats.user_log.user_log_type,
		ats.user_log.user_log_table_name,
		ats.user_log.user_log_item_name
    )
	VALUES (
		NOW(), 
		userLogUser,
		userLogType,
		userLogTableName,
		userLogItemName
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_log_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rhalf`@`%` PROCEDURE `user_log_select`()
BEGIN
	SELECT
		ats.user_log.id,
		ats.user_log.user_log_datetime,
		ats.user_log.user_log_user,
		ats.user_log.user_log_table_name,
		ats.user_log.user_log_item_name,
		ats.user_log.user_log_type
	FROM ats.user_log;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_log_type_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_log_type_insert`(IN userLogTypeName CHAR(45))
BEGIN
	INSERT INTO ats.user_log_type(
    ats.user_log_type.user_log_type_name)
    
    
	VALUES (userLogTypeName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_log_type_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rhalf`@`%` PROCEDURE `user_log_type_select`()
BEGIN

SELECT 
	ats.user_log_type.id,
    ats.user_log_type.user_log_type_name,
    ats.user_log_type.user_log_type_description
    
FROM ats.user_log_type;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_select`()
BEGIN
SELECT 
			ats.user.id,
			ats.user.user_name,
			ats.user.user_password,
			ats.user.user_datetime_created,
			ats.user.user_datetime_renewed,
			ats.user.user_hash,
			ats.user.user_email,
			ats.user.user_privilege,
			ats.user.user_status,
			ats.user.user_login_count,
            ats.user.user_login_datetime
            
FROM ats.user;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_update`(
IN userId INT,
IN userName CHAR(45),
IN userDatetimeRenewed TIMESTAMP,
IN userEmail CHAR(45),
IN userPrivilege INT,
IN userStatus INT,
IN user INT
)
BEGIN
UPDATE ats.user

SET 
	user_name=userName,
	user_datetime_renewed=userDatetimeRenewed,
	user_email=userEmail,
	user_privilege=userPrivilege,
	user_status=userStatus

WHERE ats.user.id=userId;

CALL ats.user_log_insert(user,3,'ats.user',userName);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_update_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rizwan`@`%` PROCEDURE `user_update_password`(
IN userId INT,
IN userPassword CHAR(45)
)
BEGIN
	UPDATE ats.user

	SET 
		user_password=userPassword
	WHERE 
		 ats.user.id=userId;

	SET @userName=(SELECT ats.user.user_name FROM ats.user where ats.user.id=userId);
	CALL ats.user_log_insert(userId,3,'ats.user',@userName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-17  1:27:28
