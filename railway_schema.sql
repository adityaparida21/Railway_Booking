-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: railway
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `berth`
--

DROP TABLE IF EXISTS `berth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `berth` (
  `TrainNo` int NOT NULL,
  `Berth` varchar(10) NOT NULL,
  `SLEEPER` int DEFAULT NULL,
  `AC1` int DEFAULT NULL,
  `AC2` int DEFAULT NULL,
  `AC3` int DEFAULT NULL,
  `AC_Chair` int DEFAULT NULL,
  `Exec_Chair` int DEFAULT NULL,
  KEY `idx_berth_train` (`TrainNo`),
  CONSTRAINT `berth_ibfk_1` FOREIGN KEY (`TrainNo`) REFERENCES `train` (`TrainNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berth`
--

LOCK TABLES `berth` WRITE;
/*!40000 ALTER TABLE `berth` DISABLE KEYS */;
INSERT INTO `berth` VALUES (12345,'LB',1,1,1,1,1,1),(12345,'MB',2,2,2,2,2,2),(12345,'UB',3,3,3,3,3,3),(12345,'SL',4,4,4,4,4,4),(12346,'LB',1,1,1,1,1,1),(12346,'MB',2,2,2,2,2,2),(12346,'UB',3,3,3,3,3,3),(12346,'SL',4,4,4,4,4,4),(12347,'LB',1,1,1,1,1,1),(12347,'MB',2,2,2,2,2,2),(12347,'UB',3,3,3,3,3,3),(12347,'SL',4,4,4,4,4,4),(12348,'LB',1,1,1,1,1,1),(12348,'MB',2,2,2,2,2,2),(12348,'UB',3,3,3,3,3,3),(12348,'SL',4,4,4,4,4,4),(12349,'LB',1,1,1,1,1,1),(12349,'MB',2,2,2,2,2,2),(12349,'UB',3,3,3,3,3,3),(12349,'SL',4,4,4,4,4,4),(12350,'LB',1,1,1,1,1,1),(12350,'MB',2,2,2,2,2,2),(12350,'UB',3,3,3,3,3,3),(12350,'SL',4,4,4,4,4,4),(12351,'LB',1,1,1,1,1,1),(12351,'MB',2,2,2,2,2,2),(12351,'UB',3,3,3,3,3,3),(12351,'SL',4,4,4,4,4,4),(12352,'LB',1,1,1,1,1,1),(12352,'MB',2,2,2,2,2,2),(12352,'UB',3,3,3,3,3,3),(12352,'SL',4,4,4,4,4,4);
/*!40000 ALTER TABLE `berth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `TrainNo` int NOT NULL,
  `SLEEPER` int DEFAULT '0',
  `AC1` int DEFAULT '0',
  `AC2` int DEFAULT '0',
  `AC3` int DEFAULT '0',
  `AC_Chair` int DEFAULT '0',
  `Exec_Chair` int DEFAULT '0',
  KEY `idx_coach_train` (`TrainNo`),
  CONSTRAINT `coaches_ibfk_1` FOREIGN KEY (`TrainNo`) REFERENCES `train` (`TrainNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (12345,72,24,48,64,80,20),(12346,72,24,48,64,80,20),(12347,72,24,48,64,80,20),(12348,72,24,48,64,80,20),(12349,72,24,48,64,80,20),(12350,72,24,48,64,80,20),(12351,72,24,48,64,80,20),(12352,72,24,48,64,80,20);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100) NOT NULL,
  `CustomerPassword` varchar(100) NOT NULL,
  `CustomerEmail` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CustomerEmail` (`CustomerEmail`),
  KEY `idx_customer_email` (`CustomerEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Doe','password123','john@example.com'),(2,'Jane Smith','password456','jane@example.com'),(3,'Bob Wilson','password789','bob@example.com'),(4,'Hima','123456','codehimanshu24@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `TrainNo` int NOT NULL,
  `TrainName` varchar(100) NOT NULL,
  `Source` varchar(100) NOT NULL,
  `Destination` varchar(100) NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  PRIMARY KEY (`TrainNo`),
  KEY `idx_train_source` (`Source`),
  KEY `idx_train_destination` (`Destination`),
  KEY `idx_train_route` (`Source`,`Destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (12345,'Rajdhani Express','Delhi','Mumbai','16:00:00','08:00:00'),(12346,'Shatabdi Express','Mumbai','Bangalore','08:00:00','22:00:00'),(12347,'Duronto Express','Chennai','Kolkata','23:00:00','15:00:00'),(12348,'Garib Rath','Bangalore','Delhi','20:00:00','12:00:00'),(12349,'Vande Bharat Express','Delhi','Varanasi','06:00:00','14:00:00'),(12350,'Tejas Express','Mumbai','Ahmedabad','06:30:00','13:30:00'),(12351,'Gatimaan Express','Delhi','Jhansi','08:45:00','15:30:00'),(12352,'Humsafar Express','Bangalore','Chennai','16:30:00','22:30:00');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08 13:13:13
