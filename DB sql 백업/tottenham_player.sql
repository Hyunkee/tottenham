CREATE DATABASE  IF NOT EXISTS `tottenham` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `tottenham`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: tottenham
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `back_num` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `height` varchar(10) NOT NULL,
  `type` varchar(2) NOT NULL,
  `country` varchar(45) NOT NULL,
  `detail_position` varchar(45) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,'Hugo Lloris',32,'G','70kg','190cm','P','Nice, France','Goalkeeper'),(2,3,'Danny Rose',25,'D','75kg','180cm','P','DonCaster, England',''),(3,4,'Toby Alderweireld',25,'D','75kg','180cm','P','Wilrijk, Belgium',''),(4,5,'Jan Vertonghen',25,'D','75kg','180cm','P','Sint-Niklaas, Belgium',''),(5,6,'Davinson Sanchez',25,'D','75kg','180cm','P','Caloto, Colombia',''),(6,7,'HeungMin Son',24,'M','75kg','180cm','P','Chuncheon, South Korea',''),(7,8,'Harry Winks',25,'M','75kg','180cm','P','Hemel Hempstead, England',''),(8,10,'Harry Kane',25,'A','75kg','180cm','P','London, England',''),(9,11,'Erik Lamela',25,'M','75kg','180cm','P','Carapachay, Argentina',''),(10,12,'Victor Wanyama',25,'M','75kg','180cm','P','Nairobi, Kenya',''),(11,15,'Eric Dier',25,'M','75kg','180cm','P','Cheltenham, England',''),(12,16,'Kyle WalkerPeters',25,'D','75kg','180cm','P','Edmonton, England',''),(13,17,'Moussa Sissoko',25,'M','75kg','180cm','P','Le Blanc-Mesnil, France',''),(14,20,'Dele Alli',25,'M','75kg','180cm','P','Milton Keynes, England',''),(15,23,'Christian Eriksen',25,'M','75kg','180cm','P','Middelfart, Denmark',''),(16,27,'Lucas Moura',25,'A','75kg','180cm','P','Sao Paulo, Brazil','');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-25 16:02:55
