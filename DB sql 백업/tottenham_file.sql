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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `file` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `board_num` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` varchar(1) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`num`),
  KEY `board_num_idx` (`board_num`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,4,'/2019/08/28/4ac09c1b-83b9-47f0-b19a-88ebaa466a19_board_list_bg.jpg','I'),(2,4,'/2019/08/28/7ff8b621-d1ea-4d8b-9f43-f12f374629a5_A3-1대30.dwt','I'),(3,5,'/2019/08/28/923c1d53-27ed-4190-b4e6-2e84ec780e26_board_list_bg.jpg','I'),(4,5,'/2019/08/28/a74b664f-0f35-49df-b330-6a347f9ea6a0_A3-1대30.dwt','I'),(5,6,'/2019/08/28/e91fdb07-96ac-4417-aa83-a12229e0e925_board_list_bg.jpg','D'),(6,6,'/2019/08/28/a281b4f4-60e3-48bf-9fcb-e3a7422afef4_A3-1대30.dwt','D'),(7,7,'/2019/09/04/ebea0b88-0e15-4b7f-a74a-d112ac48e34c_2019.7.10 첫도면 창문까지.dwg','I'),(8,7,'/2019/09/04/4b81bd0d-20a0-4ea2-996d-d5366b14bcc1_A3-1대30.dwt','I'),(9,8,'/2019/09/04/3818e561-d5fb-4ab5-afd8-bf58c6927378_tottenham_logo_c.png','I'),(10,8,'/2019/09/04/24cb8b2d-5d09-449a-aff1-5d7988e19095_연진꿍3.dwg','I'),(11,1,'/2019/09/04/aa390a84-43e3-4fa3-82ec-a0ac0c4711c3_tottenham_logo_c.png','I'),(12,1,'/2019/09/04/70e32255-961a-42c1-a38f-f6fa6e112751_tottenham_logo_c.png','I'),(13,1,'/2019/09/04/319d4ecc-db18-4e5e-bf5a-de732ba30165_연진꿍2.dwg','I'),(14,1,'/2019/09/04/8f14981f-e7b4-4f63-91d7-8c6ceeb3fe14_tottenham_logo_c.png','I'),(15,1,'/2019/09/04/4564119d-e940-4a62-a28c-0cda1c37bd95_tottenham_logo_c.png','I'),(16,1,'/2019/09/04/230bf7d9-d53e-47d2-8ba2-6d6179f09786_연진꿍.dwg','I'),(17,1,'/2019/09/04/61774732-754b-4fdd-be93-96258ad6f67a_tottenham_logo_c.png','I'),(18,1,'/2019/09/04/82beffe1-8796-46bc-a6f7-a3f1ce64884b_연진꿍.dwg','I'),(19,1,'/2019/09/04/e561dab9-689a-450c-b842-6ff01f9b3419_tottenham_logo_c.png','I'),(20,1,'/2019/09/04/68e40482-c70d-4e7f-8004-c93bc4baa1e5_연진꿍.dwg','I'),(21,6,'/2019/09/04/f065edf3-dbfa-44b0-8113-54e6d94429c9_tottenham_logo_c.png','D'),(22,6,'/2019/09/04/cfce5dc3-b13a-4661-ae5f-983db5fba51d_board_list_bg.jpg','D'),(23,5,'/2019/09/04/4a49b3e4-dc3c-4d3c-b7b8-86c9a6d51c86_tottenham_logo_c.png','I'),(24,9,'/2019/09/05/70d99ef9-005f-4df8-93e6-7f16f11d4428_개발 환경도구 설치과정 5.PNG','I'),(25,9,'/2019/09/05/531e68ae-855d-468d-acce-bd7762ae85c3_개발 환경도구 설치과정 2.PNG','I'),(26,9,'/2019/09/05/093331d1-0ef6-4dad-a4d7-01f30069e283_개발 환경도구 설치과정 5.PNG','I'),(27,9,'/2019/09/05/356c19e2-312a-488c-871e-44b85242c5b5_개발 환경도구 설치과정 2.PNG','I');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
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
