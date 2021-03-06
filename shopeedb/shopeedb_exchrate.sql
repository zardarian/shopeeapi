-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: shopeedb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exchrate`
--

DROP TABLE IF EXISTS `exchrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchrate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BEGDA` date DEFAULT NULL,
  `EXRT0` varchar(3) DEFAULT NULL,
  `EXRT1` varchar(3) DEFAULT NULL,
  `RATES` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchrate`
--

LOCK TABLES `exchrate` WRITE;
/*!40000 ALTER TABLE `exchrate` DISABLE KEYS */;
INSERT INTO `exchrate` VALUES (1,'2018-11-02','USD','IDR',14953),(2,'2018-11-01','USD','IDR',15068.75),(3,'2018-10-31','USD','IDR',15203),(4,'2018-10-30','USD','IDR',15278.1),(5,'2018-10-29','USD','IDR',15302.8),(6,'2018-10-28','USD','IDR',15217),(7,'2018-10-27','USD','IDR',15217),(8,'2018-10-26','USD','IDR',15190.65),(9,'2018-10-26','IDR','USD',15190.65),(10,'2018-10-26','SGD','IDR',15190.65),(11,'2018-10-28','SGD','IDR',15190.65);
/*!40000 ALTER TABLE `exchrate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-08 21:33:36
