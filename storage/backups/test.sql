-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: pallancer2_store
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` smallint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_cart_id_product_id_unique` (`cart_id`,`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (3,'ea495b60-ac7d-4628-a72d-fcb0b7f30ded',NULL,10,2,'2021-10-11 06:50:36','2021-10-11 06:53:14');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Category 3','category-3',NULL,'Category description text','active',1,NULL,NULL,NULL),(2,'Home, Books & Music','home-books-music',NULL,NULL,'active',NULL,'2021-10-11 06:05:38','2021-10-11 06:05:38',NULL),(3,'Games & Music','games-music',NULL,NULL,'active',2,'2021-10-11 06:05:38','2021-10-11 06:05:38',NULL),(4,'Computers, Automotive & Games','computers-automotive-games',NULL,NULL,'active',NULL,'2021-10-11 06:07:48','2021-10-11 06:07:48',NULL),(5,'Industrial','industrial',NULL,NULL,'active',4,'2021-10-11 06:07:48','2021-10-11 06:07:48',NULL),(6,'Toys','toys',NULL,NULL,'active',NULL,'2021-10-11 06:08:39','2021-10-11 06:08:39',NULL),(7,'Jewelry & Electronics','jewelry-electronics',NULL,NULL,'active',6,'2021-10-11 06:08:40','2021-10-11 06:08:40',NULL),(8,'Home','home',NULL,NULL,'active',NULL,'2021-10-11 06:09:50','2021-10-11 06:09:50',NULL),(9,'Games & Shoes','games-shoes',NULL,NULL,'active',NULL,'2021-10-11 06:10:09','2021-10-11 06:10:09',NULL),(10,'Clothing','clothing',NULL,NULL,'active',9,'2021-10-11 06:10:09','2021-10-11 06:10:09',NULL),(15,'Computers','computers',NULL,NULL,'active',NULL,'2021-10-25 06:15:46','2021-10-25 06:15:46',NULL),(16,'Electronics','electronics',NULL,NULL,'active',NULL,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(17,'Clothes','clothes',NULL,NULL,'active',NULL,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(18,'Accessories','accessories',NULL,NULL,'active',NULL,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
INSERT INTO `device_tokens` VALUES (1,1,'ffGO5G48smR7PNIFtD8feQ:APA91bHLMmG-vYwWumfNRGVwPqYE9eVMvGBXtneIOEzt4e-HFXAqp3l7-_Xu8abS9KZP4wTnlXBbXzofpDZtvsKPfNfkHMP40rNQQFm065YIpTNK0tZ5_VzWXCexkmUefeI9wm1vj2Dv','chrome',NULL,NULL);
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'emails','{\"uuid\":\"dbb6e1fc-0961-4231-8fde-fb997bf53d3c\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634455889,1634455889),(2,'emails','{\"uuid\":\"ddd3c3fe-e751-4dc8-95a4-b29d553ec58e\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634455889,1634455889),(3,'emails','{\"uuid\":\"53a052bc-0bc6-4b03-9803-43bdf07c3645\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:13:\\\"Carbon\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2021-10-17 07:44:48.361059\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456688,1634456088),(4,'emails','{\"uuid\":\"e2e9a9c0-e416-405a-be55-e875e6c933e1\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456088,1634456088),(5,'emails','{\"uuid\":\"3a4e85b8-71ce-4fa6-b974-dc901cc9d262\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:13:\\\"Carbon\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2021-10-17 07:47:34.344928\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456854,1634456254),(6,'emails','{\"uuid\":\"b15bfee8-4128-415b-b5e1-5e58464f2871\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456254,1634456254),(7,'emails','{\"uuid\":\"3ea93113-f3b2-4604-9737-5aa2067a8ad9\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:13:\\\"Carbon\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2021-10-17 07:49:03.646217\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456943,1634456343),(8,'emails','{\"uuid\":\"45f57d79-3d87-4100-815d-3140f545ace1\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456343,1634456343),(9,'emails','{\"uuid\":\"f5f78ece-e631-4fce-8c36-8350be670c2e\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634456613,1634456613),(10,'emails','{\"uuid\":\"2d1cb211-2ba9-4101-ae1c-39624ccd6a2a\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:13:\\\"Carbon\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2021-10-17 08:10:28.562182\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634458228,1634457628),(11,'emails','{\"uuid\":\"2acecb32-72aa-4d0a-b4ac-028db365103f\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634457628,1634457628),(12,'emails','{\"uuid\":\"9d4077e7-7d7b-4960-83db-d3ac6c5ba8e0\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634458141,1634458141),(16,'emails','{\"uuid\":\"4e4aed37-8006-43ab-ac30-958e4ec3f033\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634458201,1634458201),(20,'emails','{\"uuid\":\"5ca460c9-7d67-47eb-866b-7ecdf85e6928\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634458381,1634458381),(24,'emails','{\"uuid\":\"705176b6-4eff-46c6-8db8-e59ff1239c11\",\"displayName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\NewProductsEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\NewProductsEmail\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:6:\\\"emails\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1634458441,1634458441),(28,'default','{\"uuid\":\"1b58768f-60fb-434a-b90f-fd3f89c00e6c\",\"displayName\":\"App\\\\Jobs\\\\DatabaseBackup\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\DatabaseBackup\",\"command\":\"O:23:\\\"App\\\\Jobs\\\\DatabaseBackup\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1635154441,1635154441),(29,'default','{\"uuid\":\"d549672a-072f-4aa9-99eb-cb04129646aa\",\"displayName\":\"App\\\\Jobs\\\\DatabaseBackup\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\DatabaseBackup\",\"command\":\"O:23:\\\"App\\\\Jobs\\\\DatabaseBackup\\\":10:{s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1635154501,1635154501);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `recipient_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_recipient_id_foreign` (`recipient_id`),
  CONSTRAINT `messages_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2021_05_05_073541_create_stores_table',1),(7,'2021_05_05_091309_create_categories_table',1),(8,'2021_05_31_070648_create_profiles_table',1),(9,'2021_05_31_074840_create_products_table',1),(10,'2021_05_31_092238_create_tags_table',1),(11,'2021_05_31_092556_create_product_tag_table',1),(12,'2021_06_05_080640_create_product_images_table',1),(13,'2021_06_09_065048_add_auth_to_stores_table',1),(14,'2021_06_09_075811_add_type_column_to_users_table',1),(15,'2021_06_12_100028_create_sessions_table',1),(16,'2021_06_14_100715_create_roles_table',1),(17,'2021_06_14_100907_create_role_user_table',1),(18,'2021_06_19_062841_add_soft_deletes_to_products_table',1),(19,'2021_06_21_064455_create_carts_table',1),(20,'2021_06_21_081832_create_orders_table',1),(21,'2021_06_21_082450_create_order_items_table',1),(22,'2021_06_21_092125_create_notifications_table',1),(23,'2021_06_23_075512_add_mobile_to_users_table',1),(24,'2021_08_30_102556_create_messages_table',1),(25,'2021_10_04_090505_create_device_tokens_table',2),(26,'2021_10_17_072000_create_jobs_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` smallint unsigned NOT NULL,
  `price` double(8,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(8,2) unsigned NOT NULL,
  `status` enum('new','processing','in-delivery','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tag` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `product_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `sale_price` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `status` enum('in-stock','sold-out','draft') COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `sales` bigint unsigned NOT NULL DEFAULT '0',
  `rating` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_store_id_foreign` (`store_id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Mediocre Granite Watch','mediocre-granite-watch',1,9,'et sit voluptatem consectetur consequatur ea sed et cupiditate repellat accusamus nesciunt sed voluptas rerum animi eum nostrum autem accusantium velit est quis est assumenda sed dolores veritatis architecto et fugiat illum velit sunt assumenda ut laboriosam provident repudiandae voluptatem placeat praesentium aut consequatur eius pariatur voluptatibus blanditiis iusto sit est et minima delectus in quia mollitia excepturi adipisci aspernatur libero quasi quia incidunt praesentium adipisci quos ut nisi eveniet quasi harum vero aut voluptatem fugit quis voluptatem animi perspiciatis ea reiciendis inventore eius molestiae et et ullam ullam consequuntur repellendus itaque cumque non eum assumenda aut repellendus perferendis et','https://via.placeholder.com/640x480.png/002200?text=dicta',55.00,477.00,6,'in-stock',0,0,0.00,'2021-10-11 06:12:35','2021-10-11 06:12:35',NULL),(2,'Gorgeous Aluminum Wallet','gorgeous-aluminum-wallet',1,1,'veniam nam possimus ad quis eos rerum quasi cum tempora aperiam vel rerum eligendi dolor id aut hic quaerat omnis dolor maiores perspiciatis officiis cum sapiente exercitationem ut at et amet alias exercitationem saepe ea at omnis aut natus sapiente tempore itaque quaerat et cupiditate corporis labore laboriosam impedit rerum eum autem dignissimos autem assumenda animi cupiditate quod reprehenderit cum sit id corrupti sapiente soluta repudiandae et ad eligendi omnis dignissimos esse iusto dolorem quam et nihil aut repellendus commodi consequatur et eligendi temporibus praesentium molestiae repudiandae eius officiis magni voluptates et suscipit non molestias repellat accusamus velit repellat ut','https://via.placeholder.com/640x480.png/000044?text=ad',397.00,56.00,4,'in-stock',0,0,0.00,'2021-10-11 06:12:35','2021-10-11 06:12:35',NULL),(3,'Gorgeous Aluminum Keyboard','gorgeous-aluminum-keyboard',2,7,'eos dolorum et eos quas quasi itaque omnis odit voluptatem optio eos aut temporibus autem eius laborum vero ut voluptas est ab consequatur commodi perferendis quo aperiam qui labore incidunt similique fugiat eos molestias odio qui sed rerum sint et autem aliquid inventore deserunt nihil voluptate quas aut repellendus quisquam quaerat et quae et dolores ut nihil ut laborum pariatur voluptate atque soluta eius non tempore quia libero alias asperiores ea est et dolor mollitia cumque molestiae asperiores sequi ut voluptatibus rerum maiores repudiandae exercitationem dolores officia quia et laudantium suscipit sit corporis in culpa quaerat ut aut voluptatem rerum','https://via.placeholder.com/640x480.png/004422?text=eum',182.00,436.00,17,'in-stock',0,0,0.00,'2021-10-11 06:12:35','2021-10-11 06:12:35',NULL),(4,'Enormous Steel Gloves','enormous-steel-gloves',2,1,'ullam qui vel illum pariatur iusto quasi est illum laboriosam neque quidem sapiente enim et et deserunt excepturi quas veniam voluptas id officia adipisci delectus hic placeat quam ut eveniet in atque vitae doloremque sequi labore ut velit natus modi non et tempore harum hic amet nisi veniam animi laborum voluptatem esse at veritatis aut explicabo quasi et omnis unde et laborum quod et eligendi cumque perferendis voluptatum suscipit rem perferendis qui deserunt modi unde quo dolor harum perspiciatis cumque ratione quae autem aliquam officia quia quo ad dicta fugit voluptate non iste sunt nemo modi dolorum ea odit nihil','https://via.placeholder.com/640x480.png/00dddd?text=ut',403.00,203.00,3,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(5,'Aerodynamic Rubber Clock','aerodynamic-rubber-clock',3,7,'est qui repellendus totam perspiciatis ab nisi ad rerum provident optio dolor temporibus eveniet omnis voluptate voluptas in qui aut voluptatum expedita voluptas voluptatem nam explicabo beatae voluptas eum cumque ratione modi saepe aut doloremque in facilis consequatur accusantium et impedit dolores vel doloribus nihil aut totam est consequatur culpa dolor vel est consequatur dolor aliquid doloremque harum error blanditiis sequi sint sit fuga tempora ullam voluptatem ipsam dolore laborum est dolorem neque tenetur nemo eos et qui error dolore deserunt omnis vitae aperiam rerum vel quisquam a soluta molestiae animi animi laboriosam explicabo aliquam vel accusantium at consequatur autem','https://via.placeholder.com/640x480.png/00ee44?text=quisquam',456.00,484.00,18,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(6,'Awesome Paper Keyboard','awesome-paper-keyboard',3,6,'eos quaerat qui in sint et enim sit earum praesentium et optio voluptatem hic nostrum dignissimos velit dolor velit saepe doloremque est odio quisquam maiores aut ex quasi doloremque ratione ab earum ad doloremque facere reprehenderit ipsum totam sapiente alias repudiandae commodi voluptatem reprehenderit quidem quis corrupti quia qui veritatis consequatur sed molestias consequatur quae accusantium dolor id aspernatur molestiae neque labore est est consequatur et reiciendis et qui deleniti dicta et voluptas perspiciatis quaerat mollitia at est ut magni debitis dicta eum omnis placeat nisi voluptates et maxime expedita excepturi eos velit fuga laboriosam animi aperiam soluta magnam non','https://via.placeholder.com/640x480.png/0011cc?text=error',258.00,422.00,5,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(7,'Sleek Leather Shoes','sleek-leather-shoes',2,10,'impedit ut itaque eum vero culpa sint explicabo vitae quia consequuntur et est doloribus culpa qui debitis occaecati suscipit laudantium a et reprehenderit aut consequuntur dolore expedita quis esse repellat eos dicta cupiditate aliquid laudantium similique non sed labore delectus inventore aut est eligendi nobis vel aspernatur dolor vel vel est optio incidunt ullam consequuntur qui quia quis possimus sunt voluptas nisi maxime animi culpa dolorem corporis facere non eum a unde quibusdam quam dolor pariatur natus qui porro voluptas ex officiis odit architecto quis qui voluptatem sit eum consequuntur deleniti velit autem amet quis est quo aut voluptatem quibusdam','https://via.placeholder.com/640x480.png/0022bb?text=est',466.00,278.00,17,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(8,'Durable Leather Computer','durable-leather-computer',3,1,'laborum voluptatibus similique est corrupti atque molestias sit veniam optio dolores consequuntur culpa ducimus qui placeat dignissimos temporibus asperiores explicabo distinctio atque voluptatem ut cupiditate et et architecto ea molestiae et aut laboriosam culpa qui similique ullam deserunt quod aliquam asperiores facilis fuga quaerat ut quam aliquid et commodi sit repellat deleniti beatae sed et ullam molestiae praesentium voluptas saepe reiciendis labore ipsam sit voluptatem modi quaerat et facilis eos non ad quibusdam enim cum fugiat voluptatum dolor inventore voluptates sint nemo aperiam hic et ipsum maxime cumque nam enim non provident deserunt quod rerum numquam eius tempora dolor consequuntur','https://via.placeholder.com/640x480.png/00cc00?text=vel',208.00,240.00,6,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(9,'Awesome Plastic Gloves','awesome-plastic-gloves',1,3,'earum delectus ut et corrupti hic voluptatem tenetur porro id quidem voluptatem ipsa non quo voluptas tenetur ullam accusamus recusandae aut voluptas quis dolore neque ea exercitationem sunt harum pariatur sed eveniet aut harum velit recusandae quasi est enim voluptate accusantium ut amet dolor quo magnam quas enim corporis velit numquam error velit in incidunt explicabo hic soluta ex nobis quis in eveniet cumque provident est in et qui assumenda voluptas quos consequuntur sunt ratione incidunt qui voluptatibus velit perspiciatis facilis fuga quis quae eos dolorem dolores placeat ipsum in cum et quia sint dolor temporibus quisquam molestias tempore nesciunt','https://via.placeholder.com/640x480.png/000088?text=deleniti',281.00,421.00,20,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(10,'Gorgeous Bronze Bag','gorgeous-bronze-bag',3,9,'sunt nihil accusamus ipsam eius suscipit magni dolorem totam ratione suscipit sed hic dignissimos sunt dolorem dolorem nihil autem odio consequuntur qui rem sit a alias officiis qui architecto deserunt voluptas quod aliquid quas quibusdam excepturi hic ipsa enim rerum ratione accusamus rerum dolorem quasi atque a et quos repudiandae omnis quia architecto dicta recusandae nesciunt necessitatibus quia enim veniam dicta sit blanditiis qui sunt provident voluptatem debitis fuga ad sapiente odio ullam maiores magni nihil est est molestiae repudiandae esse distinctio magnam molestiae eligendi voluptas animi ut voluptate quia rem quos ab perferendis aut et asperiores reiciendis aperiam sint','https://via.placeholder.com/640x480.png/0044bb?text=eum',392.00,336.00,4,'in-stock',0,0,0.00,'2021-10-11 06:12:36','2021-10-11 06:12:36',NULL),(11,'Sample Product 1','sample-product-1',1,15,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:46','2021-10-25 06:15:46',NULL),(12,'Sample Product 2','sample-product-2',1,15,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(13,'Sample Product 3','sample-product-3',1,16,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(14,'Sample Product 4','sample-product-4',1,16,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(15,'Sample Product 5','sample-product-5',1,16,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(16,'Sample Product 6','sample-product-6',1,17,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(17,'Sample Product 7','sample-product-7',1,17,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(18,'Sample Product 8','sample-product-8',1,17,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(19,'Sample Product 9','sample-product-9',1,18,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL),(20,'Sample Product 10','sample-product-10',1,18,'Product Description',NULL,120.00,0.00,2,'in-stock',0,0,0.00,'2021-10-25 06:15:48','2021-10-25 06:15:48',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `role_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('SiI2tFcRc38GjR81xDb3Lt9vYRJZ6kuHTQWhCVl2',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.30','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiU1Q4R25uMGVKTHp4NmY5Y2NTVzBLNjk2dFRTZlcxeGxHZHY0cWlSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkOTJJWFVOcGtqTzByT1E1YnlNaS5ZZTRvS29FYTNSbzlsbEMvLm9nL2F0Mi51aGVXRy9pZ2kiO30=',1635153349);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stores_slug_unique` (`slug`),
  UNIQUE KEY `stores_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Abernathy Inc','abernathy-inc','annabelle56@example.org','2021-10-11 06:05:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qgoOuYpl68','USD','en',NULL,NULL,'active','2021-10-11 06:05:05','2021-10-11 06:05:05'),(2,'Zulauf, Franecki and Collier','zulauf-franecki-and-collier','tommie.stokes@example.net','2021-10-11 06:05:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','JImclMZuiQ','USD','en',NULL,NULL,'active','2021-10-11 06:05:05','2021-10-11 06:05:05'),(3,'Schimmel-Hahn','schimmel-hahn','roselyn71@example.net','2021-10-11 06:05:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vZelXknoyZ','USD','en',NULL,NULL,'active','2021-10-11 06:05:05','2021-10-11 06:05:05');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'navy','navy','2021-10-11 06:05:05','2021-10-11 06:05:05'),(2,'yellow','yellow','2021-10-11 06:05:06','2021-10-11 06:05:06'),(3,'black','black','2021-10-11 06:05:06','2021-10-11 06:05:06'),(4,'fuchsia','fuchsia','2021-10-11 06:05:07','2021-10-11 06:05:07'),(5,'blue','blue','2021-10-11 06:05:07','2021-10-11 06:05:07'),(6,'white','white','2021-10-11 06:05:07','2021-10-11 06:05:07'),(7,'aqua','aqua','2021-10-11 06:05:07','2021-10-11 06:05:07'),(8,'teal','teal','2021-10-11 06:05:07','2021-10-11 06:05:07');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('user','store','admin','super-admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tracy Schaden','m@safadi.ps','2021-10-04 05:27:48',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','super-admin',NULL,NULL,'THFcPkOpPz',NULL,NULL,'2021-10-04 05:27:48','2021-10-04 05:27:48'),(2,'Liana Hamill II','a@safadi.ps','2021-10-04 05:27:48',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','admin',NULL,NULL,'RETFrQc9kl',NULL,NULL,'2021-10-04 05:27:49','2021-10-04 05:27:49'),(3,'Kristy Donnelly','hartmann.kiana@example.org','2021-10-04 05:27:48',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','user',NULL,NULL,'WOT3qRiQcH',NULL,NULL,'2021-10-04 05:27:50','2021-10-04 05:27:50'),(4,'Mr. Boyd Schmitt I','isabella.daugherty@example.org','2021-10-04 05:27:48',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','user',NULL,NULL,'Pu8gN2Nrrf',NULL,NULL,'2021-10-04 05:27:50','2021-10-04 05:27:50'),(5,'Lilyan Green','candido.stokes@example.org','2021-10-04 05:27:48',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','user',NULL,NULL,'7OIARe1GUx',NULL,NULL,'2021-10-04 05:27:50','2021-10-04 05:27:50');
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

-- Dump completed on 2021-10-25 12:47:52
