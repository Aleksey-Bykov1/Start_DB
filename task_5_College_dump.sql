-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: College
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.21.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `cities_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор города',
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название города',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`cities_id`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Города';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Краснодар','2021-06-09 10:14:21'),(2,'Хадыженск','2021-06-09 10:14:21'),(3,'Ставрополь','2021-06-09 10:14:21'),(4,'Абшеронск','2021-06-09 10:14:21'),(5,'Армавир','2021-06-09 10:14:21'),(6,'Белореченск','2021-06-09 10:14:21'),(7,'Геленджик','2021-06-09 10:14:21'),(8,'Горячий Ключ','2021-06-09 10:14:21'),(9,'Гулькевичи','2021-06-09 10:14:21'),(10,'Ейск','2021-06-09 10:14:21'),(11,'Кореновск','2021-06-09 10:14:21'),(12,'Кропоткин','2021-06-09 10:14:21'),(13,'Крымск','2021-06-09 10:14:21'),(14,'Курганинск','2021-06-09 10:14:21'),(15,'Лабинск','2021-06-09 10:14:21'),(16,'Новокубанск','2021-06-09 10:14:21'),(17,'Новороссийск','2021-06-09 10:14:21'),(18,'Приморско-Ахтарск','2021-06-09 10:14:21'),(19,'Славянск-на-Кубани','2021-06-09 10:14:21'),(20,'Сочи','2021-06-09 10:14:21'),(21,'Темрюк','2021-06-09 10:14:21'),(22,'Тимашёвск','2021-06-09 10:14:21'),(23,'Тихорецк','2021-06-09 10:14:21'),(24,'Туапсе','2021-06-09 10:14:21'),(25,'Усть-Лабинск','2021-06-09 10:14:21');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_for_internship`
--

DROP TABLE IF EXISTS `company_for_internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_for_internship` (
  `company_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор компании',
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название компании',
  `city` int unsigned DEFAULT NULL COMMENT 'Город',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`company_id`),
  KEY `com_city_id` (`city`),
  CONSTRAINT `com_city_id` FOREIGN KEY (`city`) REFERENCES `cities` (`cities_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Компании для стажировки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_for_internship`
--

LOCK TABLES `company_for_internship` WRITE;
/*!40000 ALTER TABLE `company_for_internship` DISABLE KEYS */;
INSERT INTO `company_for_internship` VALUES (1,'Apple',1,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(2,'Google',1,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(3,'Microsoft',6,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(4,'Amazon',9,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(5,'Facebook',20,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(6,'Samsung',12,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(7,'Intel',11,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(8,'AT&T',13,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(9,'Cisco',14,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(10,'Oracle',15,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(11,'Verizon',18,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(12,'Visa',19,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(13,'Walmart',15,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(14,'SAP',11,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(15,'IBM',2,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(16,'Netflix',3,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(17,'American Express',6,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(18,'Accenture',1,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(19,'Mastercard',1,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(20,'HSBC',1,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(21,'J.P. Morgan',1,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(22,'Deloitte',7,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(23,'Sony',9,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(24,'UPS',6,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(25,'Bank of America',22,'2021-06-09 15:36:24','2021-06-09 15:36:24'),(26,'Chase',23,'2021-06-09 15:36:24','2021-06-09 15:36:24');
/*!40000 ALTER TABLE `company_for_internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_mark`
--

DROP TABLE IF EXISTS `exam_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_mark` (
  `exam_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор экзамена',
  `student` int unsigned DEFAULT NULL COMMENT 'Студент',
  `subjects` int unsigned DEFAULT NULL COMMENT 'Предмет',
  `mark` int DEFAULT NULL COMMENT 'Оценка за экзамен',
  `exam_date` datetime DEFAULT NULL COMMENT 'Дата экзамена',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`exam_id`),
  KEY `exam_stud_id` (`student`),
  KEY `exam_subj_id` (`subjects`),
  CONSTRAINT `exam_stud_id` FOREIGN KEY (`student`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `exam_subj_id` FOREIGN KEY (`subjects`) REFERENCES `subjects` (`subj_id`),
  CONSTRAINT `exam_mark_chk_1` CHECK ((`mark` between 2 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Оценки за экзамены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_mark`
--

LOCK TABLES `exam_mark` WRITE;
/*!40000 ALTER TABLE `exam_mark` DISABLE KEYS */;
INSERT INTO `exam_mark` VALUES (1,1,2,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(2,2,2,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(3,3,2,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(4,4,2,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(5,5,2,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(6,6,2,2,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(7,7,2,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(8,8,2,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(9,9,2,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(10,10,3,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(11,11,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(12,12,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(13,13,3,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(14,14,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(15,15,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(16,16,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(17,17,3,2,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(18,18,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(19,19,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(20,20,3,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(21,21,9,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(22,22,9,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(23,23,9,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(24,24,9,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(25,25,9,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(26,26,9,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(27,27,9,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(28,28,9,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(29,29,9,2,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(30,30,9,2,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(31,31,8,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(32,32,8,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(33,33,8,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(34,34,8,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(35,35,8,3,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(36,36,8,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(37,37,8,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(38,38,8,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(39,39,8,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(40,40,8,4,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(41,41,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(42,42,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(43,43,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(44,44,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(45,45,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(46,46,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(47,47,10,5,'2021-06-09 15:03:17','2021-06-09 15:03:17'),(48,48,10,3,'2021-06-09 15:03:17','2021-06-09 15:03:17');
/*!40000 ALTER TABLE `exam_mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int unsigned NOT NULL COMMENT 'Идентификатор факультета',
  `faculty_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название факультета',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Факультет';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Вычислительные машины, комплексы системы и сети','2021-06-09 15:01:31','2021-06-09 15:01:31'),(2,'Программирование и базы данных','2021-06-09 15:01:31','2021-06-09 15:01:31');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internship` (
  `int_student_id` int unsigned NOT NULL COMMENT 'Идентификатор студента',
  `company_internship` int unsigned NOT NULL COMMENT 'Идентификатор компании',
  `length_of_day` int unsigned DEFAULT NULL COMMENT 'Длительность стажировки',
  `intern_mark` int DEFAULT NULL COMMENT 'Оценка за стажировку',
  PRIMARY KEY (`int_student_id`,`company_internship`),
  KEY `company_internship` (`company_internship`),
  CONSTRAINT `company_internship` FOREIGN KEY (`company_internship`) REFERENCES `company_for_internship` (`company_id`),
  CONSTRAINT `int_student_id` FOREIGN KEY (`int_student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `internship_chk_1` CHECK ((`intern_mark` between 2 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Стажировка';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship`
--

LOCK TABLES `internship` WRITE;
/*!40000 ALTER TABLE `internship` DISABLE KEYS */;
INSERT INTO `internship` VALUES (30,1,32,5),(31,16,32,5),(32,6,32,5),(33,8,32,5),(34,6,32,5),(35,9,32,5),(36,1,32,5),(37,4,32,5),(38,7,32,5),(39,11,32,5),(40,12,32,5),(41,13,32,5),(42,17,32,5),(43,14,32,5),(44,19,32,5),(45,2,32,5),(46,15,32,5),(47,3,32,5),(48,1,32,5);
/*!40000 ALTER TABLE `internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `lecturers_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор преподавателя',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия преподавателя',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя преподавателя',
  `patronymic` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Отчество преподавателя',
  `subjects` int unsigned DEFAULT NULL COMMENT 'Предмет который ведет преподаватель',
  `city` int unsigned DEFAULT NULL COMMENT 'Город',
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта преподавателя',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон преподавателя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`lecturers_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `subjects_id` (`subjects`),
  KEY `lect_l_f_p` (`last_name`,`first_name`,`patronymic`),
  CONSTRAINT `subjects_id` FOREIGN KEY (`subjects`) REFERENCES `subjects` (`subj_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (1,'Прокофьев','Кирилл','Вадимович',1,1,'1980-07-16','proc@ya.ru','79185444957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(2,'Зотова','Мария','Ивановна',3,1,'1974-06-16','zot@mail.ru','79185554957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(3,'Агеев','Михаил','Михайлович',2,1,'1982-03-16','ageev@ya.ru','79185054957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(4,'Кожевников','Николай','Фёдорович',5,3,'1984-01-16','kog@mail.ru','79775054957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(5,'Сычева','Дарья','Евгеньевна',4,14,'1976-07-16','sich@ya.ru','79185884957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(6,'Бочаров','Тимофей','Георгиевич',6,6,'1983-09-16','boch@mail.ru','79185054997','2021-06-09 13:22:04','2021-06-09 13:22:04'),(7,'Чистякова','Ксения','Никитична',7,1,'1989-11-16','chis@bk.ru','79185011957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(8,'Овсянникова','Маргарита','Сергеевна',9,1,'1991-08-16','ovs@ya.ru','79122054957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(9,'Чесноков','Роман','Максимович',10,1,'1985-04-16','chesn@mail.ru','79185334957','2021-06-09 13:22:04','2021-06-09 13:22:04'),(10,'Ларионов','Константин','Елисеевич',8,12,'1981-02-16','lar@bk.ru','79185044957','2021-06-09 13:22:04','2021-06-09 13:22:04');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `book_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор книги',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название книги',
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Автор',
  `amount` int unsigned DEFAULT NULL COMMENT 'Колличество',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Библиотека';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'Системы искусственного интеллекта : учеб. пособие для СПО','И.А.Бессмертный.',12,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(2,'Технология разработки программного обеспечения','И.Г.Гниденко',6,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(3,'Организация баз данных в 2 ч.','С.И.Гордеев',11,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(4,'Моделирование замкнутых систем автоматического управления','В.А.Жмудь',30,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(5,'Программирование. Объектно-ориентированный подход','С.В.Зыков',9,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(6,'Интеллектуальные системы','А.Н.Сесекина',4,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(7,'Функциональное программирование','А.А.Кубенский',14,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(8,'Основы алгоритмизации и программирования на языке c#','Е.В.Кудрина',9,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(9,'Функциональное программирование : учебник и практикум','А.А.Кубенский',11,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(10,'Методы оптимизации','А.М.Прудников',16,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(11,'Программная инженерия и технологии программирования сложных систем','Е.М.Лаврищева',5,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(12,'Формальные языки и компиляторы','А.А.Малявко',7,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(13,'Информационные технологии. Лабораторный практикум','Т.Е.Мамонова',9,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(14,'Программирование: delphi','И.А.Кузнецов',3,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(15,'Базы данных : учебник для прикладного бакалавриата','В.В.Цехановский',5,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(16,'Базы данных: технологии доступа','Т.Л.Стасышина',17,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(17,'Разработка интернет-приложений','С.Д.Ростунцев',21,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(18,'Основы алгоритмизации и программирования','В.В.Трофимов',32,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(19,'Численные методы расчета строительных конструкций','Б.А.Тухфатуллин',28,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(20,'Программирование на языке высокого уровня python','Д.Ю.Федоров.',19,'2021-06-10 10:22:08','2021-06-10 10:22:08'),(21,'Автоматизация обработки информации','Е.А.Черткова',21,'2021-06-10 10:22:08','2021-06-10 10:22:08');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reading_room`
--

DROP TABLE IF EXISTS `reading_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reading_room` (
  `student` int unsigned NOT NULL COMMENT 'Идентификатор студента',
  `book` int unsigned NOT NULL COMMENT 'Идентификатор книги',
  `date_of_issue` datetime DEFAULT NULL COMMENT 'Дата выдачи',
  `return_date` datetime DEFAULT NULL COMMENT 'Дата возврата',
  PRIMARY KEY (`student`,`book`),
  KEY `read_book` (`book`),
  CONSTRAINT `read_book` FOREIGN KEY (`book`) REFERENCES `library` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `stud_id` FOREIGN KEY (`student`) REFERENCES `students` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Читальный зал';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reading_room`
--

LOCK TABLES `reading_room` WRITE;
/*!40000 ALTER TABLE `reading_room` DISABLE KEYS */;
INSERT INTO `reading_room` VALUES (2,1,'2021-06-10 10:29:19',NULL),(5,14,'2021-06-10 10:29:19',NULL),(6,4,'2021-06-10 10:29:19',NULL),(7,12,'2021-06-10 10:29:19',NULL),(8,15,'2021-06-10 10:29:19',NULL),(11,2,'2021-06-10 10:29:19',NULL),(12,21,'2021-06-10 10:29:19',NULL),(13,20,'2021-06-10 10:29:19',NULL),(18,9,'2021-06-10 10:29:19',NULL),(19,19,'2021-06-10 10:29:19',NULL),(21,3,'2021-06-10 10:29:19',NULL),(22,12,'2021-06-10 10:29:19',NULL),(24,5,'2021-06-10 10:29:19',NULL),(26,8,'2021-06-10 10:29:19',NULL),(27,16,'2021-06-10 10:29:19',NULL),(27,17,'2021-06-10 10:29:19',NULL),(29,13,'2021-06-10 10:29:19',NULL),(29,20,'2021-06-10 10:29:19',NULL),(31,10,'2021-06-10 10:29:19',NULL),(32,16,'2021-06-10 10:29:19',NULL),(32,18,'2021-06-10 10:29:19',NULL),(33,15,'2021-06-10 10:29:19',NULL),(34,17,'2021-06-10 10:29:19',NULL),(40,13,'2021-06-10 10:29:19',NULL),(41,13,'2021-06-10 10:29:19',NULL),(43,14,'2021-06-10 10:29:19',NULL),(44,12,'2021-06-10 10:29:19',NULL),(46,10,'2021-06-10 10:29:19',NULL),(47,9,'2021-06-10 10:29:19',NULL),(48,6,'2021-06-10 10:29:19',NULL);
/*!40000 ALTER TABLE `reading_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор студента',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия студента',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя студента',
  `patronymic` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Отчество студента',
  `course` int unsigned NOT NULL COMMENT 'Номер курса',
  `faculty` int unsigned DEFAULT NULL COMMENT 'Факультет',
  `city` int unsigned DEFAULT NULL COMMENT 'Город',
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта студента',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон студента',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `faculty_id` (`faculty`),
  KEY `city_id` (`city`),
  KEY `stud_l_f_p` (`last_name`,`first_name`,`patronymic`),
  CONSTRAINT `city_id` FOREIGN KEY (`city`) REFERENCES `cities` (`cities_id`) ON DELETE SET NULL,
  CONSTRAINT `faculty_id` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Студенты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Воробьев','Кирилл','Кириллович',1,1,14,'2004-04-16','vorobev@ya.ru','79185054957','2021-06-09 15:01:55','2021-06-09 15:01:55'),(2,'Рябинина','Елизавета','Артёмовна',1,1,1,'2004-03-12','riab@mail.ru','79169306592','2021-06-09 15:01:55','2021-06-09 15:01:55'),(3,'Марков','Иван','Саввич',1,1,4,'2004-02-14','marv@bk.ru','89185054957','2021-06-09 15:01:55','2021-06-09 15:01:55'),(4,'Макарова','Юлия','Ивановна',1,1,8,'2004-07-06','makar@gmail.com','79169306661','2021-06-09 15:01:55','2021-06-09 15:01:55'),(5,'Прокофьева','Ксения','Захаровна',1,1,11,'2004-08-08','pro@ya.ru','79169306671','2021-06-09 15:01:55','2021-06-09 15:01:55'),(6,'Федосеев','Яромир','Дмитриевич',1,2,4,'2004-06-18','fedov@rambler.ru','79169306702','2021-06-09 15:01:55','2021-06-09 15:01:55'),(7,'Белова','Анастасия','Михайловна',1,2,23,'2004-01-04','bel@mail.ru','79169601538','2021-06-09 15:01:55','2021-06-09 15:01:55'),(8,'Степанов','Александр','Петрович',1,2,4,'2004-03-14','step@inbox.ru','79169601573','2021-06-09 15:01:55','2021-06-09 15:01:55'),(9,'Васильева','Оливия','Адамовна',1,2,11,'2004-04-30','vasi@ya.ru','79169601578','2021-06-09 15:01:55','2021-06-09 15:01:55'),(10,'Власова','Анастасия','Алексеевна',1,2,6,'2007-04-29','vlas@ya.ru','79169601581','2021-06-09 15:01:55','2021-06-09 15:01:55'),(11,'Осипова','Мия','Филипповна',2,1,9,'2003-09-25','osip@ya.ru','79169601627','2021-06-09 15:01:55','2021-06-09 15:01:55'),(12,'Кононов','Тимофей','Артёмович',2,1,7,'2003-11-19','konon@mail.ru','79169721015','2021-06-09 15:01:55','2021-06-09 15:01:55'),(13,'Глухов','Артём','Алексеевич',2,1,6,'2003-12-17','gluh@bk.ru','79169721286','2021-06-09 15:01:55','2021-06-09 15:01:55'),(14,'Козлов','Андрей','Иванович',2,1,21,'2003-01-07','koz@ya.ru','79169721316','2021-06-09 15:01:55','2021-06-09 15:01:55'),(15,'Дементьева','Кира','Георгиевна',2,1,2,'2003-06-04','demen@inbox.ru','79169721348','2021-06-09 15:01:55','2021-06-09 15:01:55'),(16,'Попов','Егор','Максимович',2,2,3,'2003-07-04','popov@ya.ru','79169721386','2021-06-09 15:01:55','2021-06-09 15:01:55'),(17,'Титов','Матвей','Арсентьевич',2,2,4,'2003-09-16','tit@ya.ru','79169721424','2021-06-09 15:01:55','2021-06-09 15:01:55'),(18,'Смирнова','Мария','Ивановна',2,2,5,'2003-06-22','smit@mail.ru','79169721431','2021-06-09 15:01:55','2021-06-09 15:01:55'),(19,'Шестаков','Пётр','Лукич',2,2,6,'2003-07-22','shest@ya.ru','79169721434','2021-06-09 15:01:55','2021-06-09 15:01:55'),(20,'Малышев','Алексей','Андреевич',2,2,17,'2003-06-05','mal@rambler.ru','79169721494','2021-06-09 15:01:55','2021-06-09 15:01:55'),(21,'Акимова','Милана','Данииловна',3,2,19,'2002-04-06','akim@ya.ru','79169903521','2021-06-09 15:01:55','2021-06-09 15:01:55'),(22,'Зотова','Анна','Тимофеевна',3,1,18,'2002-02-07','zoto@ya.ru','79214275533','2021-06-09 15:01:55','2021-06-09 15:01:55'),(23,'Мартынова','Ксения','Николаевна',3,1,20,'2002-01-08','mart@ya.ru','79236409000','2021-06-09 15:01:55','2021-06-09 15:01:55'),(24,'Ларин','Ярослав','Адамович',3,1,1,'2002-06-09','larin@mail.ru','79250810888','2021-06-09 15:01:55','2021-06-09 15:01:55'),(25,'Кулешова','Елизавета','Валерьевна',3,1,6,'2002-09-30','kulesh@ya.ru','79250843000','2021-06-09 15:01:55','2021-06-09 15:01:55'),(26,'Васильев','Михаил','Яковлевич',3,1,7,'2002-10-23','vasil@inbox.ru','79250844000','2021-06-09 15:01:55','2021-06-09 15:01:55'),(27,'Дружинина','Олеся','Владиславовна',3,2,9,'2002-05-22','drug@ya.ru','79250845000','2021-06-09 15:01:55','2021-06-09 15:01:55'),(28,'Сорокина','Алина','Романовна',3,2,6,'2002-07-21','sorok@ya.ru','79257602359','2021-06-09 15:01:55','2021-06-09 15:01:55'),(29,'Петров','Иван','Степанович',3,2,4,'2002-09-20','petr@ya.ru','79257602361','2021-06-09 15:01:55','2021-06-09 15:01:55'),(30,'Завьялов','Никита','Давидович',3,2,7,'2002-01-19','zavia@mail.ru','79257602364','2021-06-09 15:01:55','2021-06-09 15:01:55'),(31,'Никитина','Алиса','Семёновна',4,1,6,'2001-02-18','niki@mail.ru','79257602365','2021-06-09 15:01:55','2021-06-09 15:01:55'),(32,'Горячева','Арина','Сергеевна',4,1,17,'2001-03-17','goriach@ya.ru','79257602367','2021-06-09 15:01:55','2021-06-09 15:01:55'),(33,'Кузин','Александр','Лукич',4,1,19,'2001-09-16','kuz@bk.ru','79262604760','2021-06-09 15:01:55','2021-06-09 15:01:55'),(34,'Зайцева','Сафия','Максимовна',4,1,4,'2001-08-14','zay@ya.ru','79262604773','2021-06-09 15:01:55','2021-06-09 15:01:55'),(35,'Никитина','Мария','Ильинична',4,1,3,'2001-04-04','nikit@ya.ru','79296115390','2021-06-09 15:01:55','2021-06-09 15:01:55'),(36,'Макаров','Всеволод','Матвеевич',4,2,22,'2001-09-07','mack@ya.ru','79296115538','2021-06-09 15:01:55','2021-06-09 15:01:55'),(37,'Гордеев','Владимир','Ильич',4,2,11,'2001-07-13','gord@mail.ru','79296536813','2021-06-09 15:01:55','2021-06-09 15:01:55'),(38,'Гаврилов','Кирилл','Михайлович',4,2,17,'2001-08-12','gavr@ya.ru','79296834266','2021-06-09 15:01:55','2021-06-09 15:01:55'),(39,'Дубов','Святослав','Русланович',4,2,4,'2001-03-12','dub@ya.ru','79312409833','2021-06-09 15:01:55','2021-06-09 15:01:55'),(40,'Тихомирова','Арина','Андреевна',5,1,6,'2000-02-11','nbh@gmail.ru','79312440487','2021-06-09 15:01:55','2021-06-09 15:01:55'),(41,'Данилова','Марта','Артёмовна',5,1,7,'2000-01-08','dani@ya.ru','79312440720','2021-06-09 15:01:55','2021-06-09 15:01:55'),(42,'Кулешова','Серафима','Андреевна',5,1,6,'2000-11-04','culesh@bk.ru','79312440832','2021-06-09 15:01:55','2021-06-09 15:01:55'),(43,'Смирнов','Родион','Егорович',5,1,12,'2000-11-23','smir@ya.ru','79531575277','2021-06-09 15:01:55','2021-06-09 15:01:55'),(44,'Воробьева','Алиса','Александровна',5,1,13,'2000-12-22','vorob@rambler.ru','79531576010','2021-06-09 15:01:55','2021-06-09 15:01:55'),(45,'Абрамов','Михаил','Адрианович',5,2,19,'2000-07-18','abr@ya.ru','79531582030','2021-06-09 15:01:55','2021-06-09 15:01:55'),(46,'Кузин','Илья','Артёмович',5,2,20,'2000-07-17','kuzi@bk.ru','79612211671','2021-06-09 15:01:55','2021-06-09 15:01:55'),(47,'Фадеева','Виктория','Денисовна',5,2,5,'2000-03-15','fade@ya.ru','79612211684','2021-06-09 15:01:55','2021-06-09 15:01:55'),(48,'Барсукова','Варвара','Данииловна',5,2,9,'2000-05-29','bars@bk.ru','79612211695','2021-06-09 15:01:55','2021-06-09 15:01:55');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subj_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор предмета',
  `subj_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название предмета',
  `hour` int unsigned NOT NULL COMMENT 'Количество часов, отводимых на изучение предмета',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`subj_id`),
  UNIQUE KEY `subj_name` (`subj_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Предметы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Информатика',68,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(2,'Физика',72,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(3,'Схемотехника',100,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(4,'Математика',76,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(5,'История',60,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(6,'Английский',124,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(7,'Физкультура',94,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(8,'Программирование',240,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(9,'Основы реляционных баз данных',190,'2021-06-09 13:03:16','2021-06-09 13:03:16'),(10,'Компьютерные сети',146,'2021-06-09 13:03:16','2021-06-09 13:03:16');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-10 13:17:19
