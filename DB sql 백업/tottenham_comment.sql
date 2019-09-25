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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `writer` varchar(15) NOT NULL,
  `board_num` int(11) NOT NULL,
  `contents` longtext NOT NULL,
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(1) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`num`),
  KEY `FK_user_TO_comment_1` (`writer`),
  KEY `board_num_idx` (`board_num`),
  CONSTRAINT `FK_user_TO_comment_1` FOREIGN KEY (`writer`) REFERENCES `user` (`id`),
  CONSTRAINT `board_num` FOREIGN KEY (`board_num`) REFERENCES `board` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'khk29092',9,'123123','2019-09-10 10:51:53','I'),(2,'khk29092',9,'123123454677','2019-09-10 10:52:33','I'),(3,'khk29092',5,'테스트1','2019-09-10 10:52:58','I'),(4,'khk29092',5,'테스트2','2019-09-10 10:53:03','I'),(5,'khk29092',9,'123','2019-09-10 12:12:47','D'),(6,'khk29092',9,'123','2019-09-10 12:16:31','D'),(7,'khk29092',9,'12334','2019-09-10 12:16:42','I'),(8,'khk29092',9,'12312','2019-09-10 12:18:43','I'),(9,'khk29092',9,'12312343','2019-09-10 12:18:46','D'),(10,'khk29092',9,'12312343','2019-09-10 12:21:18','I'),(11,'khk29092',9,'123','2019-09-10 12:21:54','D'),(12,'khk29092',9,'1234','2019-09-10 12:21:56','D'),(13,'khk29092',5,'테스트3','2019-09-10 16:07:39','I'),(14,'khk29092',5,'테스트5','2019-09-10 16:07:46','I'),(15,'khk29092',5,'3','2019-09-10 16:09:47','I'),(16,'khk29092',5,'테스트10','2019-09-10 16:13:53','I'),(17,'khk29092',4,'삭제용','2019-09-11 09:20:10','D'),(18,'khk29092',4,'삭제용1','2019-09-11 09:31:14','I'),(19,'khk29092',4,'삭제용2','2019-09-11 09:31:18','D'),(20,'khk29092',4,'123','2019-09-11 09:37:53','I'),(21,'khk29092',4,'삭제용4','2019-09-11 09:46:25','I'),(22,'khk29092',4,'21','2019-09-11 09:48:03','I'),(23,'khk29092',4,'23','2019-09-11 09:48:56','D'),(24,'khk29092',4,'213','2019-09-11 09:49:35','D'),(25,'khk29092',4,'ㅇㅇ','2019-09-11 09:50:50','D'),(26,'khk29092',4,'ㅇㅇㅇ','2019-09-11 09:50:59','I'),(27,'khk29092',4,'삭제용5','2019-09-11 09:54:59','D'),(28,'khk29092',4,'ㅇㅇㅇㅇ','2019-09-11 09:56:31','I'),(29,'khk29092',9,'00000','2019-09-11 09:58:48','D'),(30,'khk29092',9,'123','2019-09-11 10:17:54','D'),(31,'khk29092',9,'123','2019-09-11 10:21:59','D'),(32,'khk29092',9,'123','2019-09-11 10:29:15','D'),(33,'khk29092',9,'1231','2019-09-11 10:29:29','D'),(34,'khk29092',9,'1231','2019-09-11 10:29:44','D'),(35,'khk29092',9,'삭제용2','2019-09-11 10:31:57','D'),(36,'khk29092',9,'삭제용3','2019-09-11 10:34:14','I'),(37,'khk29092',9,'삭제용4','2019-09-11 10:34:21','I'),(38,'khk29092',9,'123123123','2019-09-11 10:37:57','I'),(39,'khk29092',9,'123123123','2019-09-11 10:38:29','I'),(40,'khk29092',9,'1231231231','2019-09-11 10:38:33','D'),(41,'khk29092',9,'456789456','2019-09-11 10:40:02','D'),(42,'khk29092',9,'123','2019-09-11 10:44:28','D'),(43,'khk29092',9,'증가','2019-09-11 11:54:00','I'),(44,'khk29092',5,'테스트11','2019-09-11 11:55:24','I'),(45,'khk29092',5,'123123','2019-09-11 12:00:30','I'),(46,'khk29092',3,'123','2019-09-17 10:35:26','I'),(47,'khk29092',3,'123','2019-09-17 10:35:58','I'),(48,'khk29092',5,'123','2019-09-17 10:47:56','I'),(49,'khk29092',5,'213123','2019-09-17 10:47:59','I'),(50,'khk29092',1,'123123','2019-09-17 11:17:57','D'),(51,'lkokvke33',10,'33','2019-09-18 09:28:27','D'),(52,'lkokvke33',10,'33','2019-09-18 09:28:34','I'),(53,'lkokvke33',9,'ㅎㅇㅎㅇ','2019-09-18 09:28:43','I'),(54,'lkokvke33',2,'11','2019-09-18 09:29:15','I'),(55,'lkokvke33',1,'22','2019-09-18 09:29:25','I');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
