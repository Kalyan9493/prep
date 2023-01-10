CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Table structure for table `answer_images`
--

DROP TABLE IF EXISTS `answer_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer_images` (
  `answer_image_id` int NOT NULL AUTO_INCREMENT,
  `answer_id` bigint DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  PRIMARY KEY (`answer_image_id`),
  KEY `fk_answer_images_1_idx` (`answer_id`),
  KEY `fk_answer_images_2_idx` (`image_id`),
  CONSTRAINT `fk_answer_images_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `fk_answer_images_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_images`
--

LOCK TABLES `answer_images` WRITE;
/*!40000 ALTER TABLE `answer_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answer_id` bigint NOT NULL AUTO_INCREMENT,
  `answer` varchar(100) DEFAULT NULL,
  `explanation` longtext,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `image_id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` bigint DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_images`
--

DROP TABLE IF EXISTS `option_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_images` (
  `option_image_id` bigint NOT NULL AUTO_INCREMENT,
  `option_id` int DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  PRIMARY KEY (`option_image_id`),
  KEY `fk_option_images_1_idx` (`option_id`),
  KEY `fk_option_images_2_idx` (`image_id`),
  CONSTRAINT `fk_option_images_1` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`),
  CONSTRAINT `fk_option_images_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_images`
--

LOCK TABLES `option_images` WRITE;
/*!40000 ALTER TABLE `option_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `option` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answers`
--

DROP TABLE IF EXISTS `question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_answers` (
  `question_answer_id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT NULL,
  `answer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`question_answer_id`),
  KEY `fk_question_answers_1_idx` (`answer_id`),
  KEY `fk_question_answers_2_idx` (`question_id`),
  CONSTRAINT `fk_question_answers_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `fk_question_answers_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answers`
--

LOCK TABLES `question_answers` WRITE;
/*!40000 ALTER TABLE `question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_images`
--

DROP TABLE IF EXISTS `question_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_images` (
  `question_image_id` int NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`question_image_id`),
  KEY `fk_question_images_1_idx` (`image_id`),
  KEY `fk_question_images_2_idx` (`question_id`),
  CONSTRAINT `fk_question_images_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`),
  CONSTRAINT `fk_question_images_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_images`
--

LOCK TABLES `question_images` WRITE;
/*!40000 ALTER TABLE `question_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_options` (
  `question_option_id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  PRIMARY KEY (`question_option_id`),
  KEY `fk_question_options_1_idx` (`option_id`),
  KEY `fk_question_options_2_idx` (`question_id`),
  CONSTRAINT `fk_question_options_1` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`),
  CONSTRAINT `fk_question_options_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_type` (
  `question_type_id` int NOT NULL AUTO_INCREMENT,
  `question_type` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` bigint DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_type`
--

LOCK TABLES `question_type` WRITE;
/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question_type_id` int DEFAULT NULL,
  `description` longtext,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` bigint DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_questions_1_idx` (`question_type_id`),
  CONSTRAINT `fk_questions_1` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `instructions` longtext,
  `created_date` bigint DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_topics_questions`
--

DROP TABLE IF EXISTS `test_topics_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_topics_questions` (
  `test_topics_questions_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`test_topics_questions_id`),
  KEY `fk_test_topics_questions_1_idx` (`test_id`),
  KEY `fk_test_topics_questions_2_idx` (`topic_id`),
  KEY `fk_test_topics_questions_3_idx` (`question_id`),
  CONSTRAINT `fk_test_topics_questions_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`),
  CONSTRAINT `fk_test_topics_questions_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `fk_test_topics_questions_3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_topics_questions`
--

LOCK TABLES `test_topics_questions` WRITE;
/*!40000 ALTER TABLE `test_topics_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_topics_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_questions`
--

DROP TABLE IF EXISTS `topic_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_questions` (
  `topic_question_id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`topic_question_id`),
  KEY `fk_topic_questions_1_idx` (`topic_id`),
  KEY `fk_topic_questions_2_idx` (`question_id`),
  CONSTRAINT `fk_topic_questions_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `fk_topic_questions_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_questions`
--

LOCK TABLES `topic_questions` WRITE;
/*!40000 ALTER TABLE `topic_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_assignment`
--

DROP TABLE IF EXISTS `user_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_assignment` (
  `user_assignment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `test_id` int DEFAULT NULL,
  `max_time` int DEFAULT NULL,
  `assigned_by` varchar(45) DEFAULT NULL,
  `assigned_date` bigint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_assignment_id`),
  KEY `fk_user_assignment_1_idx` (`user_id`),
  KEY `fk_user_assignment_2_idx` (`test_id`),
  CONSTRAINT `fk_user_assignment_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_assignment_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assignment`
--

LOCK TABLES `user_assignment` WRITE;
/*!40000 ALTER TABLE `user_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `fk_user_roles_1_idx` (`role_id`),
  KEY `fk_user_roles_2_idx` (`user_id`),
  CONSTRAINT `fk_user_roles_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `fk_user_roles_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-10 12:20:34
