-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: homestead
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (97,'2014_10_12_000000_create_users_table',1),(98,'2014_10_12_100000_create_password_resets_table',1),(99,'2015_01_20_084450_create_roles_table',1),(100,'2015_01_20_084525_create_role_user_table',1),(101,'2015_01_24_080208_create_permissions_table',1),(102,'2015_01_24_080433_create_permission_role_table',1),(103,'2015_12_04_003040_add_special_role_column',1),(104,'2017_10_17_170735_create_permission_user_table',1),(105,'2019_04_21_225424_create_products_table',1),(106,'2019_04_22_214242_create_shopping_carts_table',1),(107,'2019_04_22_235205_create_product_in_shopping_carts_table',1),(108,'2019_04_25_012703_create_orders_table',1),(109,'2014_01_07_073615_create_tagged_table',2),(110,'2014_01_07_073615_create_tags_table',2),(111,'2016_06_29_073615_create_tag_groups_table',2),(112,'2016_06_29_073615_update_tags_table',2),(113,'2019_05_14_012436_create_posts_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `guide_number` int(11) DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `line1` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `line2` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postal_code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country_code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recipient_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_shopping_cart_id_unique` (`shopping_cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,43,264718122,NULL,'lalala@mlrseguridad.com','1 Main St',NULL,'San Jose','95131','US','CA','','2019-05-14 02:24:55','2019-05-14 02:24:55');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (10,10,4,'2019-05-13 23:46:00','2019-05-13 23:46:00'),(11,11,4,'2019-05-13 23:46:00','2019-05-13 23:46:00'),(12,12,4,'2019-05-13 23:46:00','2019-05-13 23:46:00'),(13,13,4,'2019-05-13 23:46:00','2019-05-13 23:46:00'),(14,14,4,'2019-05-13 23:46:00','2019-05-13 23:46:00'),(15,1,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(16,2,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(17,3,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(18,5,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(19,6,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(20,8,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(21,10,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(22,11,5,'2019-05-14 02:21:36','2019-05-14 02:21:36'),(23,13,5,'2019-05-14 02:21:36','2019-05-14 02:21:36');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Navegar usuarios','users.index','Lista y navega todos los usuarios del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(2,'Ver detalle de usuario','users.show','Ver en detalle cada usuario del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(3,'Edicion de usuarios','users.edit','Editar los datos del usuario del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(4,'Eliminar usuarios','users.destroy','Eliminar cualquier usuario del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(5,'Navegar Roles','roles.index','Lista y navega todos los Roles del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(6,'Ver detalle de rol','roles.show','Ver en detalle cada rol del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(7,'Creacion de Roles','roles.create','Editar los datos del rol del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(8,'Edicion de Roles','roles.edit','Editar los datos del rol del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(9,'Eliminar Roles','roles.destroy','Eliminar cualquier rol del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(10,'Navegar Productos','products.index','Lista y navega todos los Productos del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(11,'Ver detalle de Producto','products.show','Ver en detalle cada Producto del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(12,'Creacion de Productos','products.create','Editar los datos del Producto del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(13,'Edicion de Productos','products.edit','Editar los datos del Producto del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01'),(14,'Eliminar Productos','products.destroy','Eliminar cualquier Producto del sistema','2019-05-13 00:57:01','2019-05-13 00:57:01');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in_shopping_carts`
--

DROP TABLE IF EXISTS `product_in_shopping_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_in_shopping_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `shopping_cart_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_in_shopping_carts_product_id_foreign` (`product_id`),
  KEY `product_in_shopping_carts_shopping_cart_id_foreign` (`shopping_cart_id`),
  CONSTRAINT `product_in_shopping_carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_in_shopping_carts_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_shopping_carts`
--

LOCK TABLES `product_in_shopping_carts` WRITE;
/*!40000 ALTER TABLE `product_in_shopping_carts` DISABLE KEYS */;
INSERT INTO `product_in_shopping_carts` VALUES (1,2,35,1,'2019-05-13 23:40:11','2019-05-13 23:40:11'),(3,2,35,3,'2019-05-13 23:40:27','2019-05-27 17:45:45'),(4,2,43,1,'2019-05-14 02:23:49','2019-05-14 02:23:49'),(5,2,47,1,'2019-05-14 23:52:54','2019-05-14 23:52:54'),(6,4,47,1,'2019-05-14 23:52:57','2019-05-14 23:52:57'),(7,6,47,1,'2019-05-14 23:52:58','2019-05-14 23:52:58'),(8,7,47,1,'2019-05-14 23:53:00','2019-05-14 23:53:00'),(9,6,47,1,'2019-05-14 23:57:58','2019-05-14 23:57:58'),(10,6,47,1,'2019-05-15 00:07:51','2019-05-15 00:07:51'),(11,2,47,1,'2019-05-15 01:41:02','2019-05-15 01:41:02'),(12,90,101,1,'2019-05-15 19:42:58','2019-05-15 19:42:58'),(15,90,101,1,'2019-05-15 19:43:02','2019-05-15 19:43:02'),(20,90,105,10,'2019-05-27 14:44:49','2019-05-27 19:46:54'),(21,90,105,5,'2019-05-27 14:45:09','2019-05-27 19:46:57'),(22,90,105,6,'2019-05-27 14:54:12','2019-05-27 19:47:01'),(23,90,105,2,'2019-05-27 18:12:08','2019-05-27 19:47:03');
/*!40000 ALTER TABLE `product_in_shopping_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '1',
  `description` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'esto es un producto',264718122,'Eveniet earum iste iure suscipit blanditiis eaque.',NULL,'2019-05-13 00:57:02','2019-05-13 23:39:39'),(4,'Quisquam sit sed id voluptatem excepturi aut repudiandae.',1330346562,'Ut nostrum repellat quia ullam.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(6,'Quia id iure ullam nihil repudiandae quam qui.',939209649,'Et soluta quae sint qui ea.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(7,'Velit est quis accusamus.',19299666,'Quidem laboriosam repellat quidem repellat expedita velit.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(9,'Animi vero et voluptatem quasi totam perspiciatis enim.',60929505,'Adipisci ut ab esse quia.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(10,'Incidunt nesciunt ad perferendis sint omnis alias debitis molestiae.',493982916,'Est sequi dolorem cum illum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(12,'Ut exercitationem ut atque at aut ut.',1564761962,'Impedit nemo quo id repellat debitis qui ut.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(13,'Consequuntur illum qui occaecati eum.',935270475,'Minima iusto adipisci culpa autem sed recusandae distinctio.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(14,'Ea corporis magnam dicta aperiam ea excepturi itaque.',546397733,'Occaecati quam suscipit natus explicabo consequatur officia neque.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(15,'Nihil dolorem perspiciatis possimus at.',996327708,'Dolore sunt accusamus tempore consequatur.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(17,'Assumenda ut asperiores cupiditate.',1439221949,'Suscipit a et dolores alias sit.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(18,'Aspernatur culpa impedit sit voluptas libero aliquid doloribus.',1498281132,'Doloribus et nam consequuntur similique id exercitationem dolor.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(19,'Nobis et consequatur illo magni earum eius quo voluptas.',209050279,'Debitis sapiente unde magni asperiores enim sit occaecati.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(20,'Aut ut enim libero voluptas dolor minus.',467570994,'Hic sit ut est sed eveniet.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(21,'Nihil libero aut quam.',1423958308,'In quia atque exercitationem aut odit voluptas.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(22,'Tenetur voluptas doloribus fugit a qui veniam ducimus qui.',440954863,'Provident ut nam beatae consequatur a.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(23,'Explicabo eos voluptatem aspernatur rem.',1175000465,'Molestiae laborum possimus a a ab.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(24,'Enim dignissimos ut provident ipsam dolor autem voluptates.',1507244179,'Voluptas ipsam quam minima modi sed accusamus dolor.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(25,'Expedita voluptas pariatur ea hic.',127541980,'Perspiciatis est debitis qui expedita atque autem.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(26,'Est eius et asperiores totam magnam.',75310812,'Consequuntur quis deleniti repudiandae quos exercitationem in et.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(27,'Error illum nesciunt ullam.',1382467081,'Velit consequuntur sed ea id dolorem.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(28,'Est quae dolorem consequatur et laboriosam quas.',1802274127,'Ut et corporis nulla quia.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(29,'Quis voluptatibus pariatur porro hic iure.',531717844,'Voluptatem dolores quis consequatur nihil doloremque unde adipisci.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(30,'Officia facere alias numquam qui.',2020409399,'Dolor excepturi reiciendis expedita.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(31,'Aut voluptate eum autem suscipit et rerum est suscipit.',2076415850,'Eligendi suscipit nihil qui optio commodi adipisci.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(32,'Asperiores qui voluptas sapiente ut.',369148746,'Similique quis saepe veniam.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(33,'Asperiores itaque ut sapiente voluptatem omnis sunt aut.',588760822,'Accusantium est similique vitae dolor.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(34,'Modi incidunt aut sed voluptatibus minima doloribus quis.',2001088416,'Facilis et ea est quis.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(35,'Dignissimos ipsum illum quia odit.',552836583,'Perferendis voluptate eaque perspiciatis omnis repudiandae fuga mollitia.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(36,'Aut suscipit et voluptatem totam exercitationem qui magnam.',857088930,'Animi deserunt eaque provident et.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(37,'Nam qui non est placeat.',2038754629,'Quisquam beatae laudantium quam dolores.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(38,'Dicta non reiciendis assumenda ea quibusdam aspernatur.',1951110490,'Velit voluptate dolor sunt ratione.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(39,'Veritatis laboriosam natus ut aut voluptates eveniet enim.',782622574,'Ipsam quos ducimus illum commodi.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(40,'A quasi iusto delectus et libero ipsa eveniet.',1941645650,'Ad et voluptatem corporis odio et omnis voluptas.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(41,'Vero et eligendi perspiciatis aut.',706970643,'Consectetur quasi possimus non.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(42,'Dolor aliquam nihil nihil illo tempora non sunt et.',985362765,'Ut et ea id omnis commodi vel neque.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(43,'Mollitia ut quasi omnis ut minima alias.',1979475294,'At voluptas nihil laboriosam rerum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(44,'Id accusantium quidem minima at eum et est repellat.',1042865956,'Dolorem rerum incidunt dignissimos nemo.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(45,'Repudiandae tempore a vitae qui tenetur animi.',185084111,'Dolorem excepturi maxime expedita est alias hic velit.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(46,'Distinctio distinctio ut qui incidunt animi voluptas.',1531930732,'Magni rerum laborum magnam et quibusdam repellat.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(47,'Pariatur voluptatem aspernatur atque qui in laboriosam.',593463521,'Eum consectetur non recusandae nobis repellendus.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(48,'Soluta quis doloribus aut ipsam enim veniam soluta totam.',606458022,'Maxime consequatur excepturi vitae sed assumenda ipsum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(49,'Maiores molestiae cupiditate ullam et voluptatem qui.',425872871,'Est quod quibusdam modi delectus.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(50,'Id pariatur doloremque quis molestiae provident temporibus veritatis.',1184595429,'Cum nam aut quia expedita cupiditate quo iste.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(51,'Voluptas doloremque qui adipisci dolores et ratione.',2071659921,'Consequuntur hic quis ea consectetur aperiam iure nostrum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(52,'Omnis quidem sunt quia nemo cum nesciunt.',1076475623,'Perspiciatis enim deleniti maiores ea nostrum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(53,'Aut voluptatum saepe eum.',291502432,'Odit consequuntur rem architecto eos aperiam qui.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(54,'Ea voluptatem at esse ut accusamus quo.',970064685,'Vero velit ut mollitia necessitatibus eum assumenda.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(55,'Autem labore iure optio aut et et veniam.',1872082383,'Et voluptatem dignissimos enim et tempora.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(56,'Omnis laboriosam omnis autem corporis et eum facere.',287340812,'Adipisci iste non et laboriosam nulla rerum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(57,'Amet adipisci tempore optio nam.',939839788,'Hic maiores laboriosam unde reiciendis repellendus velit.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(58,'Iure consequuntur nobis eos et.',1433763355,'Perferendis qui id a et exercitationem eos nesciunt.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(59,'Officia iusto quo maxime autem.',1547154068,'Voluptatem nobis maiores nihil unde voluptatem deserunt velit.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(60,'Alias voluptatibus consequatur recusandae veniam aut cupiditate.',328564350,'Sunt quis at ut architecto.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(61,'Nobis voluptatum sunt aspernatur aut distinctio eligendi.',216510483,'Et quasi alias voluptate ut rem.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(62,'Velit nemo quo harum temporibus ut enim.',708942972,'Quam voluptas ea numquam.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(63,'Nesciunt recusandae nisi ut ut.',1067135850,'Sit nam eum ab illum nihil voluptates.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(64,'Excepturi ea sapiente eius veritatis aperiam deserunt dolores.',1192863997,'Omnis quia repellendus repellat nemo corrupti.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(65,'Sit consequuntur cupiditate iste sed vel.',1303181110,'Et quia ad sed delectus saepe animi.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(66,'Iure dolorem excepturi et atque qui est.',192613810,'Dignissimos nam vero ipsam.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(67,'Labore ad illum fugiat magnam in voluptas.',815458441,'Impedit non quis beatae est molestias praesentium temporibus.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(68,'Sit qui in et est corporis hic.',1099925881,'Recusandae fugit officia reiciendis qui accusamus.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(69,'Ut sit est officia veritatis est.',617958298,'Sed quidem quia molestiae.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(70,'Rerum et omnis officiis tenetur.',351873571,'Aut natus consequuntur non.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(71,'Dolor expedita consequatur voluptas earum.',1916379919,'Voluptatem magnam nesciunt ut minus fugiat dolores.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(72,'Exercitationem dolor exercitationem repellendus qui dolorem delectus.',1147397419,'Velit ex aut assumenda repellat iste qui sunt.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(73,'Occaecati accusantium commodi nobis excepturi incidunt.',1978439996,'Non rerum fugiat id maiores doloribus et.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(74,'Error est voluptates quisquam ex.',1684989311,'Omnis error consequatur tempora beatae magnam tempora.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(75,'Rerum velit reiciendis ipsa dolorum magni cupiditate.',1278189324,'Illum dolor est dicta dolor aliquam.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(76,'Voluptatem molestiae doloremque vero quaerat nihil et.',636076531,'Voluptas sed voluptatem sit rerum facere.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(77,'Iste reiciendis quas consequatur non veritatis cum sed.',603245995,'Et maiores est dolorum.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(78,'Maxime rerum maiores minus qui commodi consequatur temporibus.',117755406,'Quia distinctio modi culpa.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(79,'Quo vero ipsum et saepe error eligendi esse.',1034962193,'Consequatur dolorum suscipit sint dolore aut.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(80,'Repellendus quod vero asperiores ipsam blanditiis reprehenderit.',1518032064,'Id sunt odio itaque non voluptatem in.',NULL,'2019-05-13 00:57:02','2019-05-13 00:57:02'),(81,'MLR seguridad',342,'dsfsgdsfg','png','2019-05-15 16:44:30','2019-05-15 16:44:30'),(82,'dfs',4534,'dsfsgfafg',NULL,'2019-05-15 16:48:02','2019-05-15 16:48:02'),(83,'MLR seguridadfds',435345,'sdafsf',NULL,'2019-05-15 16:56:59','2019-05-15 16:56:59'),(84,'gdfg',435,'asfasdf',NULL,'2019-05-15 16:58:15','2019-05-15 16:58:15'),(85,'gdfg',435,'asfasdf',NULL,'2019-05-15 16:58:45','2019-05-15 16:58:45'),(86,'utyu',645,'ghdf',NULL,'2019-05-15 16:59:11','2019-05-15 16:59:11'),(87,'utyu',645,'ghdf',NULL,'2019-05-15 17:00:35','2019-05-15 17:00:35'),(88,'fgdf',453,'gsdfgsd',NULL,'2019-05-15 17:00:48','2019-05-15 17:00:48'),(89,'MLR seguridad',243,'dasddfsd',NULL,'2019-05-15 17:02:25','2019-05-15 17:02:25'),(90,'MLR seguridad',2342,'asdfsdf',NULL,'2019-05-15 17:03:02','2019-05-15 17:03:02');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,21,NULL,NULL),(2,1,1,'2019-05-13 20:21:13','2019-05-13 20:21:13'),(5,5,22,'2019-05-14 02:22:36','2019-05-14 02:22:36');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','admin','este es el role administrador','2019-05-13 00:57:02','2019-05-13 23:21:31','all-access'),(4,'creador','creador',NULL,'2019-05-13 23:46:00','2019-05-13 23:46:00',NULL),(5,'editor','editor',NULL,'2019-05-14 02:21:36','2019-05-14 02:21:36',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_carts`
--

DROP TABLE IF EXISTS `shopping_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_carts`
--

LOCK TABLES `shopping_carts` WRITE;
/*!40000 ALTER TABLE `shopping_carts` DISABLE KEYS */;
INSERT INTO `shopping_carts` VALUES (1,0,NULL,'2019-05-13 01:24:35','2019-05-13 01:24:35'),(2,0,NULL,'2019-05-13 14:37:53','2019-05-13 14:37:53'),(3,0,NULL,'2019-05-13 16:10:34','2019-05-13 16:10:34'),(4,0,NULL,'2019-05-13 16:10:42','2019-05-13 16:10:42'),(5,0,NULL,'2019-05-13 16:12:32','2019-05-13 16:12:32'),(6,0,NULL,'2019-05-13 16:12:53','2019-05-13 16:12:53'),(7,0,NULL,'2019-05-13 16:14:04','2019-05-13 16:14:04'),(8,0,NULL,'2019-05-13 16:14:08','2019-05-13 16:14:08'),(9,0,NULL,'2019-05-13 16:14:20','2019-05-13 16:14:20'),(10,0,NULL,'2019-05-13 16:14:30','2019-05-13 16:14:30'),(11,0,NULL,'2019-05-13 16:25:19','2019-05-13 16:25:19'),(12,0,NULL,'2019-05-13 16:25:27','2019-05-13 16:25:27'),(13,0,NULL,'2019-05-13 16:25:33','2019-05-13 16:25:33'),(14,0,NULL,'2019-05-13 16:25:48','2019-05-13 16:25:48'),(15,0,NULL,'2019-05-13 16:25:55','2019-05-13 16:25:55'),(16,0,NULL,'2019-05-13 16:26:13','2019-05-13 16:26:13'),(17,0,NULL,'2019-05-13 16:35:00','2019-05-13 16:35:00'),(18,0,NULL,'2019-05-13 16:35:04','2019-05-13 16:35:04'),(19,0,NULL,'2019-05-13 16:35:13','2019-05-13 16:35:13'),(20,0,NULL,'2019-05-13 17:32:17','2019-05-13 17:32:17'),(21,0,NULL,'2019-05-13 17:41:16','2019-05-13 17:41:16'),(22,0,NULL,'2019-05-13 17:41:31','2019-05-13 17:41:31'),(23,0,NULL,'2019-05-13 17:43:14','2019-05-13 17:43:14'),(24,0,NULL,'2019-05-13 17:43:19','2019-05-13 17:43:19'),(25,0,NULL,'2019-05-13 19:18:18','2019-05-13 19:18:18'),(26,0,NULL,'2019-05-13 21:57:29','2019-05-13 21:57:29'),(27,0,NULL,'2019-05-13 21:57:31','2019-05-13 21:57:31'),(28,0,NULL,'2019-05-13 21:58:03','2019-05-13 21:58:03'),(29,0,NULL,'2019-05-13 21:58:32','2019-05-13 21:58:32'),(30,0,NULL,'2019-05-13 21:58:43','2019-05-13 21:58:43'),(31,0,NULL,'2019-05-13 21:59:00','2019-05-13 21:59:00'),(32,0,NULL,'2019-05-13 23:27:42','2019-05-13 23:27:42'),(33,0,NULL,'2019-05-13 23:28:32','2019-05-13 23:28:32'),(34,0,NULL,'2019-05-13 23:28:59','2019-05-13 23:28:59'),(35,0,NULL,'2019-05-13 23:36:17','2019-05-13 23:36:17'),(36,0,NULL,'2019-05-13 23:46:38','2019-05-13 23:46:38'),(37,0,NULL,'2019-05-14 01:21:36','2019-05-14 01:21:36'),(38,0,NULL,'2019-05-14 01:21:50','2019-05-14 01:21:50'),(39,0,NULL,'2019-05-14 01:22:22','2019-05-14 01:22:22'),(40,0,NULL,'2019-05-14 01:22:29','2019-05-14 01:22:29'),(41,0,NULL,'2019-05-14 01:22:44','2019-05-14 01:22:44'),(42,0,NULL,'2019-05-14 02:14:16','2019-05-14 02:14:16'),(43,0,NULL,'2019-05-14 02:22:48','2019-05-14 02:22:48'),(44,0,NULL,'2019-05-14 02:24:55','2019-05-14 02:24:55'),(45,0,NULL,'2019-05-14 02:32:51','2019-05-14 02:32:51'),(46,0,NULL,'2019-05-14 03:35:24','2019-05-14 03:35:24'),(47,0,NULL,'2019-05-14 19:26:07','2019-05-14 19:26:07'),(48,0,NULL,'2019-05-14 19:28:24','2019-05-14 19:28:24'),(49,0,NULL,'2019-05-14 19:28:28','2019-05-14 19:28:28'),(50,0,NULL,'2019-05-14 19:28:59','2019-05-14 19:28:59'),(51,0,NULL,'2019-05-14 19:31:21','2019-05-14 19:31:21'),(52,0,NULL,'2019-05-14 19:31:24','2019-05-14 19:31:24'),(53,0,NULL,'2019-05-14 19:42:19','2019-05-14 19:42:19'),(54,0,NULL,'2019-05-14 19:42:22','2019-05-14 19:42:22'),(55,0,NULL,'2019-05-14 19:46:13','2019-05-14 19:46:13'),(56,0,NULL,'2019-05-14 19:47:31','2019-05-14 19:47:31'),(57,0,NULL,'2019-05-14 19:48:09','2019-05-14 19:48:09'),(58,0,NULL,'2019-05-14 19:48:43','2019-05-14 19:48:43'),(59,0,NULL,'2019-05-14 19:48:52','2019-05-14 19:48:52'),(60,0,NULL,'2019-05-14 19:54:14','2019-05-14 19:54:14'),(61,0,NULL,'2019-05-14 19:54:20','2019-05-14 19:54:20'),(62,0,NULL,'2019-05-14 19:54:56','2019-05-14 19:54:56'),(63,0,NULL,'2019-05-14 19:54:58','2019-05-14 19:54:58'),(64,0,NULL,'2019-05-14 20:07:07','2019-05-14 20:07:07'),(65,0,NULL,'2019-05-14 20:07:55','2019-05-14 20:07:55'),(66,0,NULL,'2019-05-14 20:08:46','2019-05-14 20:08:46'),(67,0,NULL,'2019-05-14 20:09:10','2019-05-14 20:09:10'),(68,0,NULL,'2019-05-14 20:09:24','2019-05-14 20:09:24'),(69,0,NULL,'2019-05-14 20:12:01','2019-05-14 20:12:01'),(70,0,NULL,'2019-05-14 20:13:01','2019-05-14 20:13:01'),(71,0,NULL,'2019-05-14 20:13:43','2019-05-14 20:13:43'),(72,0,NULL,'2019-05-14 20:14:01','2019-05-14 20:14:01'),(73,0,NULL,'2019-05-14 23:38:11','2019-05-14 23:38:11'),(74,0,NULL,'2019-05-14 23:38:13','2019-05-14 23:38:13'),(75,0,NULL,'2019-05-14 23:38:28','2019-05-14 23:38:28'),(76,0,NULL,'2019-05-14 23:38:40','2019-05-14 23:38:40'),(77,0,NULL,'2019-05-14 23:38:48','2019-05-14 23:38:48'),(78,0,NULL,'2019-05-14 23:39:43','2019-05-14 23:39:43'),(79,0,NULL,'2019-05-14 23:43:56','2019-05-14 23:43:56'),(80,0,NULL,'2019-05-14 23:44:23','2019-05-14 23:44:23'),(81,0,NULL,'2019-05-14 23:44:31','2019-05-14 23:44:31'),(82,0,NULL,'2019-05-14 23:44:47','2019-05-14 23:44:47'),(83,0,NULL,'2019-05-14 23:44:53','2019-05-14 23:44:53'),(84,0,NULL,'2019-05-14 23:49:34','2019-05-14 23:49:34'),(85,0,NULL,'2019-05-14 23:49:45','2019-05-14 23:49:45'),(86,0,NULL,'2019-05-14 23:50:49','2019-05-14 23:50:49'),(87,0,NULL,'2019-05-15 01:40:35','2019-05-15 01:40:35'),(88,0,NULL,'2019-05-15 01:41:34','2019-05-15 01:41:34'),(89,0,NULL,'2019-05-15 01:43:23','2019-05-15 01:43:23'),(90,0,NULL,'2019-05-15 01:43:25','2019-05-15 01:43:25'),(91,0,NULL,'2019-05-15 01:44:48','2019-05-15 01:44:48'),(92,0,NULL,'2019-05-15 01:56:44','2019-05-15 01:56:44'),(93,0,NULL,'2019-05-15 01:56:55','2019-05-15 01:56:55'),(94,0,NULL,'2019-05-15 01:57:07','2019-05-15 01:57:07'),(95,0,NULL,'2019-05-15 01:58:29','2019-05-15 01:58:29'),(96,0,NULL,'2019-05-15 01:58:31','2019-05-15 01:58:31'),(97,0,NULL,'2019-05-15 02:00:18','2019-05-15 02:00:18'),(98,0,NULL,'2019-05-15 02:00:27','2019-05-15 02:00:27'),(99,0,NULL,'2019-05-15 02:00:29','2019-05-15 02:00:29'),(100,0,NULL,'2019-05-15 02:03:30','2019-05-15 02:03:30'),(101,0,NULL,'2019-05-15 16:42:50','2019-05-15 16:42:50'),(102,0,NULL,'2019-05-15 21:53:04','2019-05-15 21:53:04'),(103,0,NULL,'2019-05-15 21:57:59','2019-05-15 21:57:59'),(104,0,NULL,'2019-05-15 21:58:00','2019-05-15 21:58:00'),(105,0,NULL,'2019-05-27 14:16:41','2019-05-27 14:16:41'),(106,0,NULL,'2019-05-27 14:28:49','2019-05-27 14:28:49'),(107,0,NULL,'2019-05-27 14:28:54','2019-05-27 14:28:54'),(108,0,NULL,'2019-05-27 14:29:22','2019-05-27 14:29:22'),(109,0,NULL,'2019-05-27 14:29:32','2019-05-27 14:29:32'),(110,0,NULL,'2019-05-27 14:32:22','2019-05-27 14:32:22'),(111,0,NULL,'2019-05-27 14:32:29','2019-05-27 14:32:29'),(112,0,NULL,'2019-05-27 14:36:36','2019-05-27 14:36:36'),(113,0,NULL,'2019-05-27 14:36:42','2019-05-27 14:36:42'),(114,0,NULL,'2019-05-27 14:44:11','2019-05-27 14:44:11'),(115,0,NULL,'2019-05-27 14:44:13','2019-05-27 14:44:13'),(116,0,NULL,'2019-05-27 14:45:05','2019-05-27 14:45:05'),(117,0,NULL,'2019-05-27 14:54:10','2019-05-27 14:54:10'),(118,0,NULL,'2019-05-27 14:54:17','2019-05-27 14:54:17'),(119,0,NULL,'2019-05-27 14:54:50','2019-05-27 14:54:50'),(120,0,NULL,'2019-05-27 14:59:22','2019-05-27 14:59:22'),(121,0,NULL,'2019-05-27 15:09:45','2019-05-27 15:09:45'),(122,0,NULL,'2019-05-27 15:10:01','2019-05-27 15:10:01'),(123,0,NULL,'2019-05-27 15:10:15','2019-05-27 15:10:15'),(124,0,NULL,'2019-05-27 15:10:41','2019-05-27 15:10:41'),(125,0,NULL,'2019-05-27 15:10:44','2019-05-27 15:10:44'),(126,0,NULL,'2019-05-27 15:10:48','2019-05-27 15:10:48'),(127,0,NULL,'2019-05-27 15:11:31','2019-05-27 15:11:31'),(128,0,NULL,'2019-05-27 15:13:25','2019-05-27 15:13:25'),(129,0,NULL,'2019-05-27 15:14:03','2019-05-27 15:14:03'),(130,0,NULL,'2019-05-27 15:14:43','2019-05-27 15:14:43'),(131,0,NULL,'2019-05-27 15:16:02','2019-05-27 15:16:02'),(132,0,NULL,'2019-05-27 15:16:45','2019-05-27 15:16:45'),(133,0,NULL,'2019-05-27 15:17:13','2019-05-27 15:17:13'),(134,0,NULL,'2019-05-27 15:17:50','2019-05-27 15:17:50'),(135,0,NULL,'2019-05-27 15:18:13','2019-05-27 15:18:13'),(136,0,NULL,'2019-05-27 15:18:54','2019-05-27 15:18:54'),(137,0,NULL,'2019-05-27 15:19:08','2019-05-27 15:19:08'),(138,0,NULL,'2019-05-27 15:20:01','2019-05-27 15:20:01'),(139,0,NULL,'2019-05-27 15:20:22','2019-05-27 15:20:22'),(140,0,NULL,'2019-05-27 15:20:40','2019-05-27 15:20:40'),(141,0,NULL,'2019-05-27 15:24:15','2019-05-27 15:24:15'),(142,0,NULL,'2019-05-27 15:26:06','2019-05-27 15:26:06'),(143,0,NULL,'2019-05-27 16:21:39','2019-05-27 16:21:39'),(144,0,NULL,'2019-05-27 16:22:28','2019-05-27 16:22:28'),(145,0,NULL,'2019-05-27 16:22:43','2019-05-27 16:22:43'),(146,0,NULL,'2019-05-27 16:35:12','2019-05-27 16:35:12'),(147,0,NULL,'2019-05-27 16:42:56','2019-05-27 16:42:56'),(148,0,NULL,'2019-05-27 16:43:08','2019-05-27 16:43:08'),(149,0,NULL,'2019-05-27 16:43:54','2019-05-27 16:43:54'),(150,0,NULL,'2019-05-27 16:44:03','2019-05-27 16:44:03'),(151,0,NULL,'2019-05-27 16:44:29','2019-05-27 16:44:29'),(152,0,NULL,'2019-05-27 16:45:29','2019-05-27 16:45:29'),(153,0,NULL,'2019-05-27 16:45:34','2019-05-27 16:45:34'),(154,0,NULL,'2019-05-27 16:47:01','2019-05-27 16:47:01'),(155,0,NULL,'2019-05-27 16:56:13','2019-05-27 16:56:13'),(156,0,NULL,'2019-05-27 17:00:23','2019-05-27 17:00:23'),(157,0,NULL,'2019-05-27 17:01:00','2019-05-27 17:01:00'),(158,0,NULL,'2019-05-27 17:01:19','2019-05-27 17:01:19'),(159,0,NULL,'2019-05-27 17:02:05','2019-05-27 17:02:05'),(160,0,NULL,'2019-05-27 17:24:51','2019-05-27 17:24:51'),(161,0,NULL,'2019-05-27 17:27:01','2019-05-27 17:27:01'),(162,0,NULL,'2019-05-27 17:28:00','2019-05-27 17:28:00'),(163,0,NULL,'2019-05-27 17:28:24','2019-05-27 17:28:24'),(164,0,NULL,'2019-05-27 17:28:48','2019-05-27 17:28:48'),(165,0,NULL,'2019-05-27 17:29:06','2019-05-27 17:29:06'),(166,0,NULL,'2019-05-27 17:29:24','2019-05-27 17:29:24'),(167,0,NULL,'2019-05-27 17:31:49','2019-05-27 17:31:49'),(168,0,NULL,'2019-05-27 17:36:15','2019-05-27 17:36:15'),(169,0,NULL,'2019-05-27 17:37:38','2019-05-27 17:37:38'),(170,0,NULL,'2019-05-27 17:38:36','2019-05-27 17:38:36'),(171,0,NULL,'2019-05-27 17:41:28','2019-05-27 17:41:28'),(172,0,NULL,'2019-05-27 17:43:13','2019-05-27 17:43:13'),(173,0,NULL,'2019-05-27 17:43:43','2019-05-27 17:43:43'),(174,0,NULL,'2019-05-27 17:44:10','2019-05-27 17:44:10'),(175,0,NULL,'2019-05-27 17:44:27','2019-05-27 17:44:27'),(176,0,NULL,'2019-05-27 17:44:45','2019-05-27 17:44:45'),(177,0,NULL,'2019-05-27 17:45:13','2019-05-27 17:45:13'),(178,0,NULL,'2019-05-27 17:45:42','2019-05-27 17:45:42'),(179,0,NULL,'2019-05-27 17:46:03','2019-05-27 17:46:03'),(180,0,NULL,'2019-05-27 17:46:21','2019-05-27 17:46:21'),(181,0,NULL,'2019-05-27 17:46:48','2019-05-27 17:46:48'),(182,0,NULL,'2019-05-27 17:47:13','2019-05-27 17:47:13'),(183,0,NULL,'2019-05-27 17:49:35','2019-05-27 17:49:35'),(184,0,NULL,'2019-05-27 17:50:00','2019-05-27 17:50:00'),(185,0,NULL,'2019-05-27 17:50:27','2019-05-27 17:50:27'),(186,0,NULL,'2019-05-27 17:52:31','2019-05-27 17:52:31'),(187,0,NULL,'2019-05-27 17:53:40','2019-05-27 17:53:40'),(188,0,NULL,'2019-05-27 17:56:38','2019-05-27 17:56:38'),(189,0,NULL,'2019-05-27 17:56:57','2019-05-27 17:56:57'),(190,0,NULL,'2019-05-27 17:58:39','2019-05-27 17:58:39'),(191,0,NULL,'2019-05-27 17:59:52','2019-05-27 17:59:52'),(192,0,NULL,'2019-05-27 18:01:00','2019-05-27 18:01:00'),(193,0,NULL,'2019-05-27 18:01:04','2019-05-27 18:01:04'),(194,0,NULL,'2019-05-27 18:01:36','2019-05-27 18:01:36'),(195,0,NULL,'2019-05-27 18:01:47','2019-05-27 18:01:47'),(196,0,NULL,'2019-05-27 18:03:47','2019-05-27 18:03:47'),(197,0,NULL,'2019-05-27 18:04:23','2019-05-27 18:04:23'),(198,0,NULL,'2019-05-27 18:04:54','2019-05-27 18:04:54'),(199,0,NULL,'2019-05-27 18:05:31','2019-05-27 18:05:31'),(200,0,NULL,'2019-05-27 18:10:56','2019-05-27 18:10:56'),(201,0,NULL,'2019-05-27 18:11:25','2019-05-27 18:11:25'),(202,0,NULL,'2019-05-27 18:12:05','2019-05-27 18:12:05'),(203,0,NULL,'2019-05-27 18:12:12','2019-05-27 18:12:12'),(204,0,NULL,'2019-05-27 19:34:47','2019-05-27 19:34:47'),(205,0,NULL,'2019-05-27 19:35:31','2019-05-27 19:35:31'),(206,0,NULL,'2019-05-27 19:35:43','2019-05-27 19:35:43'),(207,0,NULL,'2019-05-27 19:35:54','2019-05-27 19:35:54'),(208,0,NULL,'2019-05-27 19:36:01','2019-05-27 19:36:01'),(209,0,NULL,'2019-05-27 19:36:23','2019-05-27 19:36:23'),(210,0,NULL,'2019-05-27 19:36:30','2019-05-27 19:36:30'),(211,0,NULL,'2019-05-27 19:36:33','2019-05-27 19:36:33'),(212,0,NULL,'2019-05-27 19:36:47','2019-05-27 19:36:47'),(213,0,NULL,'2019-05-27 19:36:57','2019-05-27 19:36:57'),(214,0,NULL,'2019-05-27 19:37:24','2019-05-27 19:37:24'),(215,0,NULL,'2019-05-27 19:37:33','2019-05-27 19:37:33'),(216,0,NULL,'2019-05-27 19:37:47','2019-05-27 19:37:47'),(217,0,NULL,'2019-05-27 19:38:13','2019-05-27 19:38:13'),(218,0,NULL,'2019-05-27 19:42:52','2019-05-27 19:42:52'),(219,0,NULL,'2019-05-27 19:43:02','2019-05-27 19:43:02'),(220,0,NULL,'2019-05-27 19:43:35','2019-05-27 19:43:35'),(221,0,NULL,'2019-05-27 19:44:01','2019-05-27 19:44:01'),(222,0,NULL,'2019-05-27 19:44:11','2019-05-27 19:44:11'),(223,0,NULL,'2019-05-27 19:46:51','2019-05-27 19:46:51'),(224,0,NULL,'2019-05-27 19:47:19','2019-05-27 19:47:19'),(225,0,NULL,'2019-05-27 20:00:12','2019-05-27 20:00:12'),(226,0,NULL,'2019-05-27 20:00:12','2019-05-27 20:00:12'),(227,0,NULL,'2019-05-27 20:00:12','2019-05-27 20:00:12'),(228,0,NULL,'2019-05-27 20:00:12','2019-05-27 20:00:12'),(229,0,NULL,'2019-05-27 20:00:13','2019-05-27 20:00:13'),(230,0,NULL,'2019-05-27 20:00:13','2019-05-27 20:00:13'),(231,0,NULL,'2019-05-27 20:00:13','2019-05-27 20:00:13'),(232,0,NULL,'2019-05-27 20:00:13','2019-05-27 20:00:13'),(233,0,NULL,'2019-05-27 20:00:13','2019-05-27 20:00:13'),(234,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(235,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(236,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(237,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(238,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(239,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(240,0,NULL,'2019-05-27 20:00:14','2019-05-27 20:00:14'),(241,0,NULL,'2019-05-27 20:00:19','2019-05-27 20:00:19'),(242,0,NULL,'2019-05-27 20:00:25','2019-05-27 20:00:25'),(243,0,NULL,'2019-05-27 20:00:25','2019-05-27 20:00:25'),(244,0,NULL,'2019-05-27 20:00:25','2019-05-27 20:00:25'),(245,0,NULL,'2019-05-27 20:00:26','2019-05-27 20:00:26'),(246,0,NULL,'2019-05-27 20:00:26','2019-05-27 20:00:26'),(247,0,NULL,'2019-05-27 20:00:26','2019-05-27 20:00:26'),(248,0,NULL,'2019-05-27 20:00:26','2019-05-27 20:00:26'),(249,0,NULL,'2019-05-27 20:00:27','2019-05-27 20:00:27'),(250,0,NULL,'2019-05-27 20:00:27','2019-05-27 20:00:27'),(251,0,NULL,'2019-05-27 20:00:27','2019-05-27 20:00:27'),(252,0,NULL,'2019-05-27 20:00:27','2019-05-27 20:00:27'),(253,0,NULL,'2019-05-27 20:00:27','2019-05-27 20:00:27'),(254,0,NULL,'2019-05-27 20:00:27','2019-05-27 20:00:27'),(255,0,NULL,'2019-05-27 20:00:28','2019-05-27 20:00:28'),(256,0,NULL,'2019-05-27 20:00:28','2019-05-27 20:00:28'),(257,0,NULL,'2019-05-27 20:00:28','2019-05-27 20:00:28'),(258,0,NULL,'2019-05-27 20:00:31','2019-05-27 20:00:31'),(259,0,NULL,'2019-05-27 20:00:31','2019-05-27 20:00:31'),(260,0,NULL,'2019-05-27 20:00:31','2019-05-27 20:00:31'),(261,0,NULL,'2019-05-27 20:00:31','2019-05-27 20:00:31'),(262,0,NULL,'2019-05-27 20:00:31','2019-05-27 20:00:31'),(263,0,NULL,'2019-05-27 20:00:31','2019-05-27 20:00:31'),(264,0,NULL,'2019-05-27 20:00:32','2019-05-27 20:00:32'),(265,0,NULL,'2019-05-27 20:00:32','2019-05-27 20:00:32'),(266,0,NULL,'2019-05-27 20:00:32','2019-05-27 20:00:32'),(267,0,NULL,'2019-05-27 20:00:32','2019-05-27 20:00:32'),(268,0,NULL,'2019-05-27 20:00:33','2019-05-27 20:00:33'),(269,0,NULL,'2019-05-27 20:00:33','2019-05-27 20:00:33'),(270,0,NULL,'2019-05-27 20:00:33','2019-05-27 20:00:33'),(271,0,NULL,'2019-05-27 20:00:33','2019-05-27 20:00:33'),(272,0,NULL,'2019-05-27 20:00:33','2019-05-27 20:00:33'),(273,0,NULL,'2019-05-27 20:00:33','2019-05-27 20:00:33'),(274,0,NULL,'2019-05-27 20:00:37','2019-05-27 20:00:37'),(275,0,NULL,'2019-05-27 20:00:37','2019-05-27 20:00:37'),(276,0,NULL,'2019-05-27 20:00:37','2019-05-27 20:00:37'),(277,0,NULL,'2019-05-27 20:00:38','2019-05-27 20:00:38'),(278,0,NULL,'2019-05-27 20:00:38','2019-05-27 20:00:38'),(279,0,NULL,'2019-05-27 20:00:38','2019-05-27 20:00:38'),(280,0,NULL,'2019-05-27 20:00:38','2019-05-27 20:00:38'),(281,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(282,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(283,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(284,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(285,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(286,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(287,0,NULL,'2019-05-27 20:00:39','2019-05-27 20:00:39'),(288,0,NULL,'2019-05-27 20:00:40','2019-05-27 20:00:40'),(289,0,NULL,'2019-05-27 20:00:40','2019-05-27 20:00:40'),(290,0,NULL,'2019-05-27 20:00:42','2019-05-27 20:00:42'),(291,0,NULL,'2019-05-27 20:00:42','2019-05-27 20:00:42'),(292,0,NULL,'2019-05-27 20:00:42','2019-05-27 20:00:42'),(293,0,NULL,'2019-05-27 20:00:43','2019-05-27 20:00:43'),(294,0,NULL,'2019-05-27 20:00:43','2019-05-27 20:00:43'),(295,0,NULL,'2019-05-27 20:00:43','2019-05-27 20:00:43'),(296,0,NULL,'2019-05-27 20:00:43','2019-05-27 20:00:43'),(297,0,NULL,'2019-05-27 20:00:44','2019-05-27 20:00:44'),(298,0,NULL,'2019-05-27 20:00:44','2019-05-27 20:00:44'),(299,0,NULL,'2019-05-27 20:00:44','2019-05-27 20:00:44'),(300,0,NULL,'2019-05-27 20:00:44','2019-05-27 20:00:44'),(301,0,NULL,'2019-05-27 20:00:45','2019-05-27 20:00:45'),(302,0,NULL,'2019-05-27 20:00:45','2019-05-27 20:00:45'),(303,0,NULL,'2019-05-27 20:00:45','2019-05-27 20:00:45'),(304,0,NULL,'2019-05-27 20:00:45','2019-05-27 20:00:45'),(305,0,NULL,'2019-05-27 20:00:45','2019-05-27 20:00:45'),(306,0,NULL,'2019-05-27 20:00:49','2019-05-27 20:00:49'),(307,0,NULL,'2019-05-27 20:00:49','2019-05-27 20:00:49'),(308,0,NULL,'2019-05-27 20:00:49','2019-05-27 20:00:49'),(309,0,NULL,'2019-05-27 20:00:49','2019-05-27 20:00:49'),(310,0,NULL,'2019-05-27 20:01:04','2019-05-27 20:01:04'),(311,0,NULL,'2019-05-27 20:01:07','2019-05-27 20:01:07');
/*!40000 ALTER TABLE `shopping_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tag_groups`
--

DROP TABLE IF EXISTS `tagging_tag_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tag_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tag_groups_slug_index` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tag_groups`
--

LOCK TABLES `tagging_tag_groups` WRITE;
/*!40000 ALTER TABLE `tagging_tag_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tagged`
--

DROP TABLE IF EXISTS `tagging_tagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tagged` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taggable_id` int(10) unsigned NOT NULL,
  `taggable_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_slug` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tagged_taggable_id_index` (`taggable_id`),
  KEY `tagging_tagged_taggable_type_index` (`taggable_type`),
  KEY `tagging_tagged_tag_slug_index` (`tag_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tagged`
--

LOCK TABLES `tagging_tagged` WRITE;
/*!40000 ALTER TABLE `tagging_tagged` DISABLE KEYS */;
INSERT INTO `tagging_tagged` VALUES (1,81,'App\\Product','Uno','uno'),(2,81,'App\\Product','Dos','dos'),(3,81,'App\\Product','Tres','tres'),(4,82,'App\\Product','Uno','uno'),(5,82,'App\\Product','Dos','dos'),(6,82,'App\\Product','Tres','tres'),(7,83,'App\\Product','Uno','uno'),(8,83,'App\\Product','Cuatro','cuatro'),(9,84,'App\\Product','6','6'),(10,84,'App\\Product','7','7'),(11,85,'App\\Product','6','6'),(12,85,'App\\Product','7','7'),(13,86,'App\\Product','[]',''),(14,86,'App\\Product','L','l'),(15,87,'App\\Product','[]',''),(16,87,'App\\Product','L','l'),(17,88,'App\\Product','[]',''),(18,88,'App\\Product','L','l'),(19,89,'App\\Product','Camaras','camaras'),(20,90,'App\\Product','[]',''),(21,90,'App\\Product','Algo','algo');
/*!40000 ALTER TABLE `tagging_tagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tags`
--

DROP TABLE IF EXISTS `tagging_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_group_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suggest` tinyint(1) NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tagging_tags_slug_index` (`slug`),
  KEY `tagging_tags_tag_group_id_foreign` (`tag_group_id`),
  CONSTRAINT `tagging_tags_tag_group_id_foreign` FOREIGN KEY (`tag_group_id`) REFERENCES `tagging_tag_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tags`
--

LOCK TABLES `tagging_tags` WRITE;
/*!40000 ALTER TABLE `tagging_tags` DISABLE KEYS */;
INSERT INTO `tagging_tags` VALUES (1,NULL,'uno','Uno',0,3),(2,NULL,'dos','Dos',0,2),(3,NULL,'tres','Tres',0,2),(4,NULL,'cuatro','Cuatro',0,1),(5,NULL,'6','6',0,2),(6,NULL,'7','7',0,2),(7,NULL,'','[]',0,4),(8,NULL,'l','L',0,3),(9,NULL,'camaras','Camaras',0,1),(10,NULL,'algo','Algo',0,1);
/*!40000 ALTER TABLE `tagging_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cyril Rosenbaum','zmonahan@example.net2','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ZSfe3qEQwd','2019-05-13 00:57:02','2019-05-13 20:20:54'),(2,'Jada Koss I','eliseo.carroll@example.org','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'oqIHDV84h6','2019-05-13 00:57:02','2019-05-13 00:57:02'),(4,'Easton Grant','uadams@example.com','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'K8Ifuk2DSI','2019-05-13 00:57:02','2019-05-13 00:57:02'),(5,'Dr. Karlie Jacobi','lwilderman@example.net','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Kfotn2mDjb','2019-05-13 00:57:02','2019-05-13 00:57:02'),(6,'Dr. Lola Blanda','minnie.olson@example.org','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'ydsbr3f02j','2019-05-13 00:57:02','2019-05-13 00:57:02'),(8,'Leonardo Gleichner','obogan@example.net','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'9PvqZ1seia','2019-05-13 00:57:02','2019-05-13 00:57:02'),(9,'Caterina Stanton','jerel.hartmann@example.org','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'9TDqMAc2OO','2019-05-13 00:57:02','2019-05-13 00:57:02'),(11,'Aimee Langworth','cecilia61@example.org','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'yIusi5b7Hg','2019-05-13 00:57:02','2019-05-13 00:57:02'),(13,'Franco Reichert','nicole47@example.org','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'SW6Pmh5E77','2019-05-13 00:57:02','2019-05-13 00:57:02'),(14,'Sydnee Murphy','iwunsch@example.net','2019-05-13 00:57:01','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'t8VOKX6QKM','2019-05-13 00:57:02','2019-05-13 00:57:02'),(15,'Marquise Huel','oreilly.kasey@example.net','2019-05-13 00:57:02','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'IKdn6B5rYg','2019-05-13 00:57:02','2019-05-13 00:57:02'),(16,'Dr. Helmer Oberbrunner V','jamel.schneider@example.com','2019-05-13 00:57:02','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'CseRg4dx5m','2019-05-13 00:57:02','2019-05-13 00:57:02'),(17,'Aletha Hane','amuller@example.org','2019-05-13 00:57:02','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'clSFPw3QKF','2019-05-13 00:57:02','2019-05-13 00:57:02'),(18,'Charity Rice','joana.koepp@example.net','2019-05-13 00:57:02','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'RoA0ovNqcx','2019-05-13 00:57:02','2019-05-13 00:57:02'),(19,'May O\'Reilly','bayer.michele@example.org','2019-05-13 00:57:02','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'hGClz6JCzD','2019-05-13 00:57:02','2019-05-13 00:57:02'),(20,'Lewis Stark','ljacobs@example.net','2019-05-13 00:57:02','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'e4AVD8u9CG','2019-05-13 00:57:02','2019-05-13 00:57:02'),(21,'daniel','danilocha1@gmail.com',NULL,'$2y$10$IXwF5rk3vs/rnQy/V/usTevfIHCq08GofC6MW5lVyoOtqk175xUW6',NULL,NULL,'2019-05-13 14:38:14','2019-05-13 14:38:14'),(22,'editor','editor@editor.com',NULL,'$2y$10$ZgXUU7BR0RrkWPD7B1AWoOARwnlqNnmzWbl.qf8hfFVYHKnGd33DS',NULL,NULL,'2019-05-13 23:28:29','2019-05-13 23:28:29'),(23,'andres','andres@correo.com',NULL,'$2y$10$ZM6IIUrPlOHtE1lWUlwym.BWWxXtHOZ4y544PDdfndemwFMItBKVe',NULL,NULL,'2019-05-14 03:34:48','2019-05-14 03:34:48');
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

-- Dump completed on 2019-05-27 21:04:01
