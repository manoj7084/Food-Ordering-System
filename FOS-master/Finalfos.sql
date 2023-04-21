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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` char(10) DEFAULT NULL,
  `houseNO` char(4) DEFAULT NULL,
  `societyName` varchar(10) DEFAULT NULL,
  `LandmarkOrArea` char(10) DEFAULT NULL,
  `City` char(15) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `idx_customer_CustomerID` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryprovider`
--

DROP TABLE IF EXISTS `deliveryprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryprovider` (
  `dID` char(5) NOT NULL,
  `DPName` char(10) DEFAULT NULL,
  `PhoneNO` char(13) DEFAULT NULL,
  `AreaOfOpration` char(5) DEFAULT NULL,
  `Availibility` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`dID`),
  CONSTRAINT `c_dID` CHECK ((`dID` like _utf8mb4'D%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryprovider`
--

LOCK TABLES `deliveryprovider` WRITE;
/*!40000 ALTER TABLE `deliveryprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryprovider` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `itemordered_item`
--

DROP TABLE IF EXISTS `itemordered_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemordered_item` (
  `ItemID` varchar(5) NOT NULL,
  `ItemName` varchar(5) DEFAULT NULL,
  `RestaurantID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `ItmNm` (`ItemName`),
  KEY `Rest_ID` (`RestaurantID`),
  CONSTRAINT `ItmID` FOREIGN KEY (`ItemID`) REFERENCES `menu` (`ItemID`) ON UPDATE CASCADE,
  CONSTRAINT `ItmNm` FOREIGN KEY (`ItemName`) REFERENCES `menu` (`ItemName`),
  CONSTRAINT `Rest_ID` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemordered_item`
--

LOCK TABLES `itemordered_item` WRITE;
/*!40000 ALTER TABLE `itemordered_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemordered_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemordered_price`
--

DROP TABLE IF EXISTS `itemordered_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemordered_price` (
  `ItemID` varchar(5) NOT NULL,
  `RestaurantID` varchar(5) NOT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`,`RestaurantID`),
  KEY `Itm_res` (`RestaurantID`),
  CONSTRAINT `Itm_ID2` FOREIGN KEY (`ItemID`) REFERENCES `menu` (`ItemID`) ON UPDATE CASCADE,
  CONSTRAINT `Itm_res` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemordered_price`
--

LOCK TABLES `itemordered_price` WRITE;
/*!40000 ALTER TABLE `itemordered_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemordered_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `ItemID` char(5) NOT NULL,
  `ItemName` char(20) DEFAULT NULL,
  `RestaurantID` varchar(5) NOT NULL,
  PRIMARY KEY (`RestaurantID`,`ItemID`),
  KEY `Itm` (`ItemID`),
  KEY `name` (`ItemName`),
  CONSTRAINT `R_id` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_iID` CHECK ((`ItemID` like _utf8mb4'I%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` varchar(5) NOT NULL,
  `pID` varchar(10) DEFAULT NULL,
  `dID` varchar(5) DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `pID` (`pID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `dID` (`dID`),
  CONSTRAINT `CustomerId` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `dID` FOREIGN KEY (`dID`) REFERENCES `deliveryprovider` (`dID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `paymentmanager` (`pID`),
  CONSTRAINT `c_oID` CHECK ((`OrderID` like _utf8mb4'O%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmanager`
--

DROP TABLE IF EXISTS `paymentmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmanager` (
  `pID` char(10) NOT NULL,
  `RefNo` char(65) DEFAULT NULL,
  `PaymentMode` char(3) DEFAULT NULL,
  PRIMARY KEY (`pID`),
  CONSTRAINT `c_pID` CHECK ((`pID` like _utf8mb4'P%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmanager`
--

LOCK TABLES `paymentmanager` WRITE;
/*!40000 ALTER TABLE `paymentmanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` char(5) NOT NULL,
  `RestaurantName` varchar(5) DEFAULT NULL,
  `Area` char(10) DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`),
  CONSTRAINT `c_rID` CHECK ((`RestaurantID` like _utf8mb4'R%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 22:03:13
