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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(15) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT '',
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `email` varchar(45) NOT NULL,
  `authority` varchar(45) DEFAULT 'USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123','$2a$10$FNf5WLO3ptFresxr5ZYN1.Wk3N6QmHQY9ylFGTtl3CNBkRc5GZ1Em','khk','M','khk2909@naver.com','USER'),('123123','$2a$10$r8aNQTk0GzLWgpeQHJD35ORsSlUyBq/.C5x8ANVIgYKNkuqUc44Gq','khk','W','a@a','USER'),('1234','$2a$10$reDCExAlMFLUXyr5OHXG9uH11f4WPM7gGf7elBZcWI3YLLvhLhWa6','','W','1234@1234','ADMIN'),('12345','$2a$10$2lGLTB9cqCQWqz8Usm23Mu3HIwnf4Nd.2o1Gqa.O9K7BlekA/HObi','123','M','1@1','ADMIN'),('khk2909','$2a$10$ac8rr8e4RoKsdHgVXChmTeF3fqaynWwSCr4Buwk3/KyYuVLDIKwl2','','M','khk2909@naver.com','USER'),('khk29092','$2a$10$DP/GfRKvRa/Vm9euI25teebsbPTcXDFBSS2OePS/xCCnQS5Hq111q','김현기','M','khk2909@naver.com','ADMIN'),('lkokvke33','$2a$10$Jm9FeRpFNvS7vP0NRESB9uplaNS2QhJwA58ziH4XH0BFpAe2w4J6W','khk','M','khk2909@naver.com','USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
