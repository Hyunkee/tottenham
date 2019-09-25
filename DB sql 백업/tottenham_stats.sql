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
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stats` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `player_num` int(11) DEFAULT NULL,
  `minutes_played` int(11) NOT NULL DEFAULT '0',
  `goal_scored` int(11) NOT NULL DEFAULT '0',
  `assists` int(11) NOT NULL DEFAULT '0',
  `clearances` int(11) NOT NULL DEFAULT '0',
  `interceptions` int(11) NOT NULL DEFAULT '0',
  `tackles` int(11) NOT NULL DEFAULT '0',
  `passes` int(11) NOT NULL DEFAULT '0',
  `completed_passes` int(11) NOT NULL DEFAULT '0',
  `position` varchar(45) NOT NULL,
  `season` varchar(45) NOT NULL,
  `g_cleanseet` int(11) NOT NULL DEFAULT '0',
  `g_save` int(11) NOT NULL DEFAULT '0',
  `g_pkclean` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num`),
  KEY `player_num_idx` (`player_num`),
  CONSTRAINT `player_num` FOREIGN KEY (`player_num`) REFERENCES `player` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,1,100,0,0,0,0,0,0,0,'G','2019',1,2,3),(2,1,105,0,0,0,0,0,0,0,'G','2018',2,3,4),(4,2,110,0,0,0,0,0,0,0,'D','2019',0,0,0),(5,2,115,0,0,0,0,0,0,0,'D','2018',0,0,0),(34,3,0,0,0,0,0,0,0,0,'D','2019',0,0,0),(35,3,0,0,0,0,0,0,0,0,'D','2018',0,0,0),(36,4,0,0,0,0,0,0,0,0,'D','2019',0,0,0),(37,4,0,0,0,0,0,0,0,0,'D','2018',0,0,0),(38,5,0,0,0,0,0,0,0,0,'D','2019',0,0,0),(39,5,0,0,0,0,0,0,0,0,'D','2018',0,0,0),(40,6,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(41,6,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(42,7,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(43,7,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(44,8,0,0,0,0,0,0,0,0,'A','2019',0,0,0),(45,8,0,0,0,0,0,0,0,0,'A','2018',0,0,0),(46,9,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(47,9,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(48,10,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(49,10,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(50,11,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(51,11,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(52,12,0,0,0,0,0,0,0,0,'D','2019',0,0,0),(53,12,0,0,0,0,0,0,0,0,'D','2018',0,0,0),(54,13,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(55,13,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(56,14,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(57,14,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(58,15,0,0,0,0,0,0,0,0,'M','2019',0,0,0),(59,15,0,0,0,0,0,0,0,0,'M','2018',0,0,0),(60,16,0,0,0,0,0,0,0,0,'A','2019',0,0,0),(61,16,0,0,0,0,0,0,0,0,'A','2018',0,0,0);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-25 16:02:54
