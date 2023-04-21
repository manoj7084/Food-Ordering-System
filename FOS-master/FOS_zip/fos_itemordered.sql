-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: fos
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `itemordered`
--

DROP TABLE IF EXISTS `itemordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemordered` (
  `ItemID` varchar(5) NOT NULL,
  `ItemQuantity` int DEFAULT NULL,
  `OrderID` varchar(5) NOT NULL,
  `RestaurantID` varchar(5) NOT NULL,
  `ItemPrice` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ItemID`),
  KEY `ItmID_idx` (`ItemID`),
  KEY `RestID` (`RestaurantID`),
  CONSTRAINT `ItemID` FOREIGN KEY (`ItemID`) REFERENCES `menu` (`ItemID`) ON UPDATE CASCADE,
  CONSTRAINT `OrdID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON UPDATE CASCADE,
  CONSTRAINT `RestID` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemordered`
--

LOCK TABLES `itemordered` WRITE;
/*!40000 ALTER TABLE `itemordered` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemordered` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 22:18:21
