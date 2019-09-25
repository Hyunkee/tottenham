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
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `league` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(45) NOT NULL,
  `game_num` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `win` int(11) DEFAULT '0',
  `draw` int(11) DEFAULT '0',
  `lose` int(11) DEFAULT '0',
  `point` int(11) DEFAULT '0',
  `lose_point` int(11) DEFAULT '0',
  `diff_point` int(11) DEFAULT '0',
  `season_league` varchar(45) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,'Liverpool',6,18,6,0,0,17,5,12,'2019'),(2,'Manchester City',6,13,4,1,1,24,6,18,'2019'),(3,'Tottenham Hotspur',6,8,2,2,2,12,8,4,'2019'),(4,'Manchester United',6,8,2,2,2,8,6,2,'2019'),(5,'Leicester City',6,11,3,2,1,8,5,3,'2019'),(6,'Chelsea',6,8,2,2,2,12,13,-1,'2019'),(7,'Arsenal',6,11,3,2,1,11,10,1,'2019'),(8,'West Ham United',6,11,3,2,1,8,7,1,'2019'),(9,'Bournemouth',6,10,3,1,2,11,10,1,'2019'),(10,'Southampton',6,7,2,1,3,6,9,-3,'2019'),(11,'Everton',6,7,2,1,3,5,9,-4,'2019'),(12,'Crystal Palace',6,8,2,2,2,4,7,-3,'2019'),(13,'Norwich City',6,6,2,0,4,9,14,-5,'2019'),(14,'Burnley',6,8,2,2,2,8,7,1,'2019'),(15,'Sheffield United',6,8,2,2,2,7,6,1,'2019'),(16,'Brighton and Hove Albion',6,6,1,3,2,5,8,-3,'2019'),(17,'Aston Villa',6,4,1,1,4,6,9,-3,'2019'),(18,'Newcastle United',6,5,1,2,3,4,8,-4,'2019'),(19,'Wolverhampton Wanderers',6,4,0,4,2,7,11,-4,'2019'),(20,'Watford',6,2,0,2,4,4,18,-14,'2019');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
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
