-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: rahimproject
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctor_name` varchar(10) DEFAULT NULL,
  `doctor_surname` varchar(10) DEFAULT NULL,
  `doctor_id` int NOT NULL,
  `doctor_salary` int DEFAULT NULL,
  `doctor_start_date` date DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('Marilyn','Monroe',200,1000,'2020-03-29'),('Abraham','Lincoln',201,2090,'2022-04-12'),('Nelson','Mandela',202,3000,'2021-12-04'),('Donald','Trump',203,4000,'2019-08-16'),('Ezio','Auditore',204,6000,'2018-09-23');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `machine_id` int NOT NULL,
  `machine_type` varchar(10) DEFAULT NULL,
  `machine_cost` int DEFAULT NULL,
  `date_of_exploatation` date DEFAULT NULL,
  PRIMARY KEY (`machine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
INSERT INTO `machines` VALUES (300,'Nebulizer',900,'2020-01-12'),(301,'X-ray',1000,'2021-08-14'),(302,'Glucometer',500,'2023-12-09'),(303,'I-Gel ',300,'2022-09-15'),(304,'Otoscope',1500,'2021-01-27');
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` int NOT NULL,
  `medicine_cost` int DEFAULT NULL,
  `medicine_name` varchar(10) DEFAULT NULL,
  `medicine_manufacturer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (400,20,'Lisopril','Bayern'),(401,90,'Ibuprofen','Bayern'),(402,150,'Amoxicilin','Pfizer'),(403,20,'Venazil','Merck'),(404,300,'Naftalin','Janssen');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_medicine`
--

DROP TABLE IF EXISTS `patient_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_medicine` (
  `medicine_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `medicine_amount` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`,`medicine_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `patient_medicine_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`),
  CONSTRAINT `patient_medicine_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_medicine`
--

LOCK TABLES `patient_medicine` WRITE;
/*!40000 ALTER TABLE `patient_medicine` DISABLE KEYS */;
INSERT INTO `patient_medicine` VALUES (402,100,2),(400,101,7),(401,101,4),(401,102,1),(403,102,8),(400,103,9);
/*!40000 ALTER TABLE `patient_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_name` varchar(10) DEFAULT NULL,
  `patient_surname` varchar(10) DEFAULT NULL,
  `patient_id` int NOT NULL,
  `patient_illness` varchar(10) DEFAULT NULL,
  `patient_date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `patient_illness` (`patient_illness`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('Kanye','West',100,'Katarakta','2003-03-22'),('Abel','Tesfaye',101,'Alzheimer','2003-03-22'),('Taylor','Swift',102,'Podagra','2004-02-12'),('David','Guetta',103,'Siphilisys','2001-07-21'),('Frank','Ocean',104,'PTSD','2000-08-09');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `autofill_patient_illness` BEFORE INSERT ON `patients` FOR EACH ROW SET NEW.patient_illness = (SELECT patient_illness FROM patient_info WHERE patient_id = NEW.patient_id) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `randevu`
--

DROP TABLE IF EXISTS `randevu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randevu` (
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `machine_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `patient_illness` varchar(10) DEFAULT NULL,
  `patient_fee` int DEFAULT NULL,
  `date_of_visit` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `machine_id` (`machine_id`),
  KEY `medicine_id` (`medicine_id`),
  KEY `patient_illness` (`patient_illness`),
  CONSTRAINT `randevu_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `randevu_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `randevu_ibfk_3` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`machine_id`),
  CONSTRAINT `randevu_ibfk_4` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`),
  CONSTRAINT `randevu_ibfk_5` FOREIGN KEY (`patient_illness`) REFERENCES `patients` (`patient_illness`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevu`
--

LOCK TABLES `randevu` WRITE;
/*!40000 ALTER TABLE `randevu` DISABLE KEYS */;
INSERT INTO `randevu` VALUES (100,203,302,402,'Katarakta',500,'2023-06-19'),(101,200,302,401,'Alzheimer',900,'2023-09-13'),(102,200,301,403,'Podagra',300,'2023-10-14'),(103,201,303,400,'Siphilisys',700,'2023-05-23'),(104,202,300,401,'PTSD',1500,'2023-09-12');
/*!40000 ALTER TABLE `randevu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rahimproject'
--

--
-- Dumping routines for database 'rahimproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-06 12:37:39
