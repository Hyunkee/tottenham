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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `writer` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `contents` longtext NOT NULL,
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `valid` varchar(1) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`num`),
  KEY `FK_user_TO_board_1` (`writer`),
  CONSTRAINT `FK_user_TO_board_1` FOREIGN KEY (`writer`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'123','123','123','2019-09-18 09:29:23','2019-08-23 13:59:09',NULL,35,'I'),(2,'123','토트넘 로고','<p>ㅇㅇㅇ</p>','2019-09-18 09:29:11','2019-08-23 16:18:12','/2019/08/23/8ee8022d-2d60-40e1-a25e-63835703c655_tottenham_logo_c.png',18,'I'),(3,'khk29092','글1','<p>12312312</p>','2019-09-17 10:35:24','2019-08-28 09:30:19','/2019/08/28/16f511ec-bacc-4bde-88c4-cd872c8b7b89_board_list_bg.jpg',37,'I'),(4,'khk29092','123123','','2019-09-23 17:05:37','2019-08-28 11:59:40',NULL,28,'I'),(5,'khk29092','공지사항!!!!','<p>asdasd</p>','2019-09-17 12:31:59','2019-08-28 12:01:45',NULL,98,'I'),(6,'khk29092','수정','<p>123123</p>','2019-09-04 12:35:20','2019-08-28 12:14:43',NULL,50,'I'),(7,'khk29092','1231','','2019-09-04 12:27:41','2019-09-04 09:54:42',NULL,10,'I'),(8,'khk29092','1231','','2019-09-04 11:58:43','2019-09-04 09:55:06',',',9,'I'),(9,'khk29092','테스트','','2019-09-18 09:28:39','2019-09-05 11:22:39',NULL,148,'I'),(10,'lkokvke33','테스트','<p>테스트</p>','2019-09-19 16:24:42','2019-09-18 09:28:21',NULL,8,'I');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
