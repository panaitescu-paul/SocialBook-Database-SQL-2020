CREATE DATABASE  IF NOT EXISTS `socialbook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `socialbook`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: socialbook
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` char(50) NOT NULL,
  `lastName` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `password` char(50) NOT NULL,
  `birthDate` date NOT NULL,
  `gender` char(6) NOT NULL,
  `joinDate` date NOT NULL DEFAULT (curdate()),
  `active` tinyint(1) NOT NULL DEFAULT (true),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_name` (`firstName`,`lastName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Paul','Panaitescu','paul000@gmail.com','pass12','1996-10-07','male','2020-06-03',1),(2,'Constantin','Tarau','cons000@gmail.com','pass123','1998-09-15','male','2020-06-03',1),(3,'Marius','Munteanu','mari000@gmail.com','pass1234','1998-07-31','male','2020-06-03',1),(4,'Gianluigi','Buffon','gigi000@gmail.com','gigi','1978-01-28','male','2020-06-03',1),(5,'Andrea','Pirlo','andr000@gmail.com','pass','1995-01-17','male','2020-06-03',1),(6,'Alessandro','Nesta','ales000@gmail.com','pass','1976-03-19','male','2020-06-03',1),(7,'Carlo','Ancelotti','carl000@gmail.com','pass','1959-06-10','male','2020-06-03',1),(8,'Alyssa','Borunda','AlyssaCantamessa@armyspy.com','daimohGh0loo','1977-01-25','female','2020-06-03',1),(9,'Paolo','Maldini','paol000@gmail.com','pass','1968-06-26','male','2020-06-03',1),(10,'Camila','Giorgi','cami000@gmail.com','pass','1991-12-30','female','2020-06-03',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `welcome_post` AFTER INSERT ON `account` FOR EACH ROW BEGIN
    CALL create_welcome_post(
            NEW.id,
            NEW.firstName
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `admin_user_view`
--

DROP TABLE IF EXISTS `admin_user_view`;
/*!50001 DROP VIEW IF EXISTS `admin_user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin_user_view` AS SELECT 
 1 AS `User`,
 1 AS `Select_priv`,
 1 AS `Insert_priv`,
 1 AS `Update_priv`,
 1 AS `Delete_priv`,
 1 AS `Create_priv`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `basic_user_view_account`
--

DROP TABLE IF EXISTS `basic_user_view_account`;
/*!50001 DROP VIEW IF EXISTS `basic_user_view_account`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `basic_user_view_account` AS SELECT 
 1 AS `id`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `gender`,
 1 AS `joinDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `content` char(250) NOT NULL,
  `date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,2,'C - Comment 1','2020-05-01'),(2,1,3,'M - Comment 1','2020-05-01'),(3,1,2,'C - Comment 2','2020-05-02'),(4,1,3,'M - Comment 2','2020-05-02'),(5,1,1,'P - Comment 1','2020-05-02'),(6,1,3,'M - Comment 3','2020-05-03'),(7,1,3,'M - Comment 4','2020-05-03'),(8,1,2,'C - Comment 3','2020-05-03'),(9,1,1,'P - Comment 2','2020-05-03'),(10,1,1,'P - Comment 3','2020-05-04'),(11,3,1,'P - Comment 1','2020-05-02'),(12,3,2,'C - Comment 1','2020-05-02'),(13,3,2,'C - Comment 2','2020-05-02'),(14,3,1,'P - Comment 2','2020-05-02'),(15,2,3,'M - Comment 1','2020-05-02'),(16,2,1,'P - Comment 1','2020-05-02'),(17,2,2,'C - Comment 1','2020-05-02'),(18,10,10,'Camila - Comment 1','2020-05-10'),(19,10,7,'Carlo - Comment 1','2020-05-10'),(20,10,10,'Camila - Comment 2','2020-05-10'),(21,14,6,'Alessandro - Comment 1','2020-05-25'),(22,14,8,'Alyssa - Comment 1','2020-05-25'),(23,14,9,'Paolo - Comment 1','2020-05-25'),(24,14,10,'Camila - Comment 1','2020-05-25'),(25,15,8,'Alyssa - Comment 1','2020-05-15');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentlikes`
--

DROP TABLE IF EXISTS `commentlikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentlikes` (
  `commentId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  PRIMARY KEY (`commentId`,`accountId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `commentlikes_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentlikes_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentlikes`
--

LOCK TABLES `commentlikes` WRITE;
/*!40000 ALTER TABLE `commentlikes` DISABLE KEYS */;
INSERT INTO `commentlikes` VALUES (1,1),(7,1),(8,1),(10,2),(14,2),(15,2),(5,3),(16,3),(17,3),(22,6),(22,7),(19,10),(21,10),(22,10),(25,10);
/*!40000 ALTER TABLE `commentlikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `developer_user_view_account`
--

DROP TABLE IF EXISTS `developer_user_view_account`;
/*!50001 DROP VIEW IF EXISTS `developer_user_view_account`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `developer_user_view_account` AS SELECT 
 1 AS `id`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `email`,
 1 AS `birthDate`,
 1 AS `gender`,
 1 AS `joinDate`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `receiverAccountId` int(11) NOT NULL,
  `senderAccountId` int(11) NOT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT (true),
  `denied` tinyint(1) NOT NULL DEFAULT (false),
  PRIMARY KEY (`receiverAccountId`,`senderAccountId`),
  KEY `senderAccountId` (`senderAccountId`),
  CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`receiverAccountId`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`senderAccountId`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,2,0,1),(1,3,0,0),(2,1,0,0),(2,3,1,0),(3,1,0,0),(3,2,0,0),(7,4,0,1),(7,6,0,0),(8,10,0,1),(10,4,1,0);
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_request` BEFORE INSERT ON `friendship` FOR EACH ROW BEGIN
    DECLARE error_msg varchar(255);
    IF (SELECT COUNT(*)
        FROM Friendship
        WHERE senderAccountId = NEW.receiverAccountId
          AND receiverAccountId = NEW.senderAccountId) != 0 THEN
        SET error_msg =
                'FriendshipError: Trying to insert a friendship where senderAccountId and receiverAccountId were found in reversed places in the table';
        SIGNAL SQLSTATE '45000' SET message_text = error_msg;
    ELSEIF NEW.receiverAccountId = NEW.senderAccountId THEN
        SET error_msg =
                'FriendshipError: Trying to insert a friendship where senderAccountId and receiverAccountId are the same';
        SIGNAL SQLSTATE '45000' SET message_text = error_msg;
    ELSEIF (SELECT COUNT(*)
            FROM Friendship
            WHERE senderAccountId = NEW.senderAccountId
              AND receiverAccountId = NEW.receiverAccountId) != 0 THEN
        SET error_msg =
                'FriendshipError: Trying to insert a friendship where senderAccountId and receiverAccountId already exist in the table';
        SIGNAL SQLSTATE '45000' SET message_text = error_msg;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `groupparticipants`
--

DROP TABLE IF EXISTS `groupparticipants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupparticipants` (
  `socialGroupId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  PRIMARY KEY (`socialGroupId`,`accountId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `groupparticipants_ibfk_1` FOREIGN KEY (`socialGroupId`) REFERENCES `socialgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `groupparticipants_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupparticipants`
--

LOCK TABLES `groupparticipants` WRITE;
/*!40000 ALTER TABLE `groupparticipants` DISABLE KEYS */;
INSERT INTO `groupparticipants` VALUES (1,1),(3,1),(1,2),(3,2),(1,3),(3,3),(2,4),(2,5),(2,6),(4,6),(2,7),(4,7),(2,8),(4,8),(2,9),(2,10),(4,10);
/*!40000 ALTER TABLE `groupparticipants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupposts`
--

DROP TABLE IF EXISTS `groupposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupposts` (
  `socialGroupId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  KEY `socialGroupId` (`socialGroupId`),
  KEY `postId` (`postId`),
  CONSTRAINT `groupposts_ibfk_1` FOREIGN KEY (`socialGroupId`) REFERENCES `socialgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `groupposts_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupposts`
--

LOCK TABLES `groupposts` WRITE;
/*!40000 ALTER TABLE `groupposts` DISABLE KEYS */;
INSERT INTO `groupposts` VALUES (1,1),(1,2),(1,3),(3,4),(3,5),(1,6),(3,7),(3,8),(3,9),(2,10),(2,11),(4,12),(4,13),(2,14),(4,15);
/*!40000 ALTER TABLE `groupposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `content` char(250) NOT NULL,
  `sponsored` tinyint(1) NOT NULL DEFAULT (false),
  `date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'Post number 1 - Paul',1,'2020-05-01'),(2,2,'Post number 1 - Constantin',1,'2020-05-02'),(3,3,'Post number 1 - Marius',1,'2020-05-02'),(4,1,'Post number 2 - Paul',1,'2020-05-05'),(5,1,'Post number 3 - Paul',1,'2020-05-18'),(6,1,'Post number 4 - Paul',1,'2020-05-30'),(7,2,'Post number 2 - Constantin',1,'2020-05-05'),(8,2,'Post number 3 - Constantin',1,'2020-05-30'),(9,3,'Post number 2 - Marius',1,'2020-05-31'),(10,4,'Post number 1 - Gianluigi',1,'2020-05-10'),(11,5,'Post number 1 - Andrea Pirlo',1,'2020-05-15'),(12,10,'Post number 1 - Camila Giorgi',1,'2020-05-16'),(13,10,'Post number 2 - Camila Giorgi',1,'2020-05-17'),(14,10,'Post number 3 - Camila Giorgi',1,'2020-05-25'),(15,7,'Post number 1 - Carlo Ancelotti',1,'2020-05-05');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postlikes`
--

DROP TABLE IF EXISTS `postlikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postlikes` (
  `postId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  PRIMARY KEY (`postId`,`accountId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `postlikes_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postlikes_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postlikes`
--

LOCK TABLES `postlikes` WRITE;
/*!40000 ALTER TABLE `postlikes` DISABLE KEYS */;
INSERT INTO `postlikes` VALUES (2,1),(3,1),(9,1),(10,1),(11,1),(15,1),(1,2),(3,2),(4,2),(9,2),(12,2),(15,2),(5,3),(6,3),(7,3),(8,3),(10,4),(11,4),(1,5),(2,5),(3,5),(15,9),(10,10),(11,10),(15,10);
/*!40000 ALTER TABLE `postlikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postshares`
--

DROP TABLE IF EXISTS `postshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postshares` (
  `postId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  PRIMARY KEY (`postId`,`accountId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `postshares_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postshares_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postshares`
--

LOCK TABLES `postshares` WRITE;
/*!40000 ALTER TABLE `postshares` DISABLE KEYS */;
INSERT INTO `postshares` VALUES (2,1),(3,1),(1,2),(3,2),(4,3),(7,3),(11,4),(15,4),(15,7),(15,10);
/*!40000 ALTER TABLE `postshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `content` char(250) NOT NULL,
  `date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `commentId` (`commentId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,1,1,'P - Reply 1','2020-05-01'),(2,1,2,'C - Reply 1','2020-05-01'),(3,1,3,'M - Reply 1','2020-05-01'),(4,1,1,'P - Reply 2','2020-05-01'),(5,4,1,'P - Reply 1','2020-05-02'),(6,4,2,'C - Reply 1','2020-05-02'),(7,4,1,'P - Reply 2','2020-05-03'),(8,4,2,'C - Reply 2','2020-05-03'),(9,11,3,'M - Reply 1','2020-05-02'),(10,1,2,'C - Reply 1','2020-05-03'),(11,1,3,'M - Reply 2','2020-05-03'),(12,1,2,'C - Reply 2','2020-05-04'),(13,1,1,'P - Reply 1','2020-05-04'),(14,8,6,'Alessandro - Reply 1','2020-05-10'),(15,8,7,'Carlo - Reply 1','2020-05-13'),(16,8,6,'Alessandro - Reply 2','2020-05-15'),(17,8,10,'Camila - Reply 1','2020-05-16'),(18,8,10,'Camila - Reply 2','2020-05-16'),(19,23,8,'Alyssa - Reply 1','2020-05-25'),(20,23,9,'Paolo - Reply 1','2020-05-26'),(21,23,8,'Alyssa - Reply 2','2020-05-28'),(22,19,6,'Alessandro - Reply 1','2020-05-10'),(23,19,6,'Alessandro - Reply 2','2020-05-20'),(24,25,8,'Alyssa - Reply 1','2020-05-15'),(25,21,4,'Gianluigi - Reply 1','2020-05-26');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replylikes`
--

DROP TABLE IF EXISTS `replylikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replylikes` (
  `replyId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  PRIMARY KEY (`replyId`,`accountId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `replylikes_ibfk_1` FOREIGN KEY (`replyId`) REFERENCES `reply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `replylikes_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replylikes`
--

LOCK TABLES `replylikes` WRITE;
/*!40000 ALTER TABLE `replylikes` DISABLE KEYS */;
INSERT INTO `replylikes` VALUES (2,1),(3,1),(10,1),(1,2),(3,2),(11,2),(1,3),(2,3),(12,3),(14,4),(16,5),(25,5),(18,8),(19,10),(24,10);
/*!40000 ALTER TABLE `replylikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialgroup`
--

DROP TABLE IF EXISTS `socialgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `description` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialgroup`
--

LOCK TABLES `socialgroup` WRITE;
/*!40000 ALTER TABLE `socialgroup` DISABLE KEYS */;
INSERT INTO `socialgroup` VALUES (1,'Databases - Final Project','Chat for Final Project in Databases'),(2,'Coppa Campioni d\'Italia','Chat Group for Serie A Championship'),(3,'Software Development - TOP UP','Chat Group for Software Development in TOP UP'),(4,'A.C. Milan','Professional Football club in Milan');
/*!40000 ALTER TABLE `socialgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `photoLink` char(250) NOT NULL,
  `postDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `story_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (1,1,'Link for Story 2','2020-05-01'),(2,1,'Link for Story 2','2020-05-15'),(3,2,'Link for Story 1','2020-05-01'),(4,2,'Link for Story 2','2020-05-05'),(5,2,'Link for Story 3','2020-05-20'),(6,1,'Link for Story 1','2020-05-31'),(7,4,'Link for Story 1','2020-05-01'),(8,5,'Link for Story 1','2020-05-03'),(9,8,'Link for Story 1','2020-05-01'),(10,8,'Link for Story 2','2020-05-02'),(11,8,'Link for Story 3','2020-05-03'),(12,8,'Link for Story 4','2020-05-04'),(13,8,'Link for Story 5','2020-05-05'),(14,9,'Link for Story 1','2020-05-27'),(15,10,'Link for Story 1','2020-05-10'),(16,10,'Link for Story 2','2020-05-12'),(17,10,'Link for Story 3','2020-05-14'),(18,10,'Link for Story 4','2020-05-16'),(19,10,'Link for Story 5','2020-05-16'),(20,10,'Link for Story 6','2020-05-30');
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'socialbook'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `birthday_schedule` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `birthday_schedule` ON SCHEDULE EVERY 1 DAY STARTS '2020-06-03 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
        INSERT INTO Post(accountId, content, date)
        SELECT id, 'Happy Birthday!', NOW()
        FROM Account
        WHERE active = 1
          AND CURRENT_DATE() = DATE_ADD(birthDate, INTERVAL YEAR(CURRENT_DATE()) - YEAR(birthDate) YEAR);
    END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'socialbook'
--
/*!50003 DROP FUNCTION IF EXISTS `get_n_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_n_comments`(postId INT) RETURNS int(11)
BEGIN
    DECLARE temp INT;
    SELECT COUNT(*) INTO temp FROM comment AS c WHERE c.postId = postId;
    RETURN temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_n_likes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_n_likes`(postId INT) RETURNS int(11)
BEGIN
    DECLARE temp INT;
    SELECT COUNT(*) INTO temp FROM postlikes WHERE postlikes.postId = postId;
    RETURN temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_n_shares` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_n_shares`(postId INT) RETURNS int(11)
BEGIN
    DECLARE temp INT;
    SELECT COUNT(*) INTO temp FROM postshares AS ps WHERE ps.postId = postId;
    RETURN temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_friend_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_friend_request`(senderId INT, receiverId INT)
BEGIN
    DECLARE rollback BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        SET rollback = 1;

    INSERT INTO Friendship VALUES (receiverId, senderId, TRUE, FALSE);

    IF rollback THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_welcome_post` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_welcome_post`(accId INT, accFirstName CHAR(50))
BEGIN
    INSERT INTO Post(accountId, content, date)
    VALUES (accId, CONCAT(accFirstName, ' joined SocialBook!'), current_date());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disable_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `disable_account`(accountId INT)
BEGIN
    UPDATE Account SET active = 0 WHERE Account.id = accountId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_posts_of` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_posts_of`(accId INT)
BEGIN

    CREATE TEMPORARY TABLE IF NOT EXISTS RecentPosts
    (
        accountId INT NOT NULL,
        postId    INT NOT NULL,
        likes     INT,
        comments  INT,
        shares    INT,
        firstName CHAR(50),
        lastName  CHAR(50),
        content   CHAR(250),
        sponsored BOOL,
        date      DATE,
        PRIMARY KEY (accountId, postId)
    );

    IF (SELECT COUNT(*) FROM RecentPosts WHERE accountId = accId) = 0 THEN
        INSERT INTO RecentPosts
        SELECT a.id,
               p.id,
               get_n_likes(p.id),
               get_n_comments(p.id),
               get_n_shares(p.id),
               a.firstName,
               a.lastName,
               p.content,
               p.sponsored,
               p.date
        FROM Post as p
                 INNER JOIN Account as a ON a.id = p.accountId
        WHERE accountId = accId;
    END IF;

    SELECT * FROM RecentPosts WHERE accountId = accId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `admin_user_view`
--

/*!50001 DROP VIEW IF EXISTS `admin_user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_user_view` AS select `mysql`.`user`.`User` AS `User`,`mysql`.`user`.`Select_priv` AS `Select_priv`,`mysql`.`user`.`Insert_priv` AS `Insert_priv`,`mysql`.`user`.`Update_priv` AS `Update_priv`,`mysql`.`user`.`Delete_priv` AS `Delete_priv`,`mysql`.`user`.`Create_priv` AS `Create_priv` from `mysql`.`user` where ((`mysql`.`user`.`User` like 'user_%') or (`mysql`.`user`.`User` like 'role_%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `basic_user_view_account`
--

/*!50001 DROP VIEW IF EXISTS `basic_user_view_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `basic_user_view_account` AS select `account`.`id` AS `id`,`account`.`firstName` AS `firstName`,`account`.`lastName` AS `lastName`,`account`.`gender` AS `gender`,`account`.`joinDate` AS `joinDate` from `account` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `developer_user_view_account`
--

/*!50001 DROP VIEW IF EXISTS `developer_user_view_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `developer_user_view_account` AS select `account`.`id` AS `id`,`account`.`firstName` AS `firstName`,`account`.`lastName` AS `lastName`,`account`.`email` AS `email`,`account`.`birthDate` AS `birthDate`,`account`.`gender` AS `gender`,`account`.`joinDate` AS `joinDate`,`account`.`active` AS `active` from `account` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-03 23:10:18
