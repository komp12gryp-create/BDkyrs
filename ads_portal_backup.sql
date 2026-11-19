-- MySQL dump 10.13  Distrib 8.4.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ads_portal
-- ------------------------------------------------------
-- Server version	8.4.9

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
-- Table structure for table `ad_price_history`
--

DROP TABLE IF EXISTS `ad_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_price_history` (
  `history_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` int unsigned NOT NULL,
  `old_price` decimal(12,2) NOT NULL,
  `new_price` decimal(12,2) NOT NULL,
  `changed_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`history_id`),
  KEY `fk_history_ad` (`ad_id`),
  CONSTRAINT `fk_history_ad` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`ad_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_history_new_price` CHECK ((`new_price` >= 0)),
  CONSTRAINT `chk_history_old_price` CHECK ((`old_price` >= 0)),
  CONSTRAINT `chk_history_price_changed` CHECK ((`old_price` <> `new_price`))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_price_history`
--

LOCK TABLES `ad_price_history` WRITE;
/*!40000 ALTER TABLE `ad_price_history` DISABLE KEYS */;
INSERT INTO `ad_price_history` VALUES (1,1,9500.00,9000.00,'2026-10-28 20:09:50.675644'),(2,1,9000.00,8500.00,'2026-10-28 20:09:50.676682'),(3,2,14000.00,13500.00,'2026-10-28 20:09:50.677518'),(4,2,13500.00,12500.00,'2026-10-28 20:09:50.678325'),(5,3,850.00,800.00,'2026-10-28 20:09:50.679091'),(6,3,800.00,750.00,'2026-10-28 20:09:50.679908');
/*!40000 ALTER TABLE `ad_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `ad_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `city` varchar(100) NOT NULL,
  `status` enum('active','sold','archived') NOT NULL DEFAULT 'active',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ad_id`),
  KEY `fk_ads_user` (`user_id`),
  KEY `fk_ads_category` (`category_id`),
  CONSTRAINT `fk_ads_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ads_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_ads_price` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,1,1,'Ноутбук для навчання','Навчальний ноутбук у справному стані, зарядний пристрій у комплекті.',8500.00,'Київ','active','2026-09-01 10:00:00.000000','2026-10-28 20:09:50.676682'),(2,2,1,'Смартфон 128 ГБ','Демонстраційний смартфон без пошкоджень, повна комплектація.',12500.00,'Львів','active','2026-09-02 11:00:00.000000','2026-10-28 20:09:50.678325'),(3,3,5,'Демісезонна куртка','Легка куртка розміру M, чиста та охайна.',750.00,'Київ','active','2026-09-03 12:00:00.000000','2026-10-28 20:09:50.679908'),(4,4,1,'Монітор 24 дюйми','Монітор для роботи з документами, кабель живлення в комплекті.',3800.00,'Київ','active','2026-10-20 09:00:00.000000','2026-10-20 09:00:00.000000'),(5,5,1,'Бездротові навушники','Навушники з футляром, акумулятор тримає заряд.',1500.00,'Одеса','sold','2026-09-05 14:00:00.000000','2026-09-05 14:00:00.000000'),(6,6,1,'Планшет для читання','Планшет із захисним чохлом для електронних книжок.',5200.00,'Харків','archived','2026-09-06 15:00:00.000000','2026-09-06 15:00:00.000000'),(7,7,1,'Механічна клавіатура','Клавіатура з українською розкладкою та USB-кабелем.',2100.00,'Київ','active','2026-10-20 09:00:00.000000','2026-10-20 09:00:00.000000'),(8,8,2,'Міський велосипед','Велосипед для міських поїздок, гальма перевірено.',7800.00,'Київ','active','2026-10-18 10:00:00.000000','2026-10-18 10:00:00.000000'),(9,1,2,'Автомобіль 2012 року','Вигаданий демонстраційний автомобіль для тестування порталу.',235000.00,'Дніпро','active','2026-09-09 12:00:00.000000','2026-09-09 12:00:00.000000'),(10,2,4,'Кімнатна рослина у подарунок','Віддам саджанець кімнатної рослини безкоштовно.',0.00,'Київ','active','2026-10-25 13:00:00.000000','2026-10-25 13:00:00.000000'),(11,3,2,'Комплект зимових шин','Чотири вживані шини з рівномірним зносом.',6000.00,'Полтава','active','2026-09-11 14:00:00.000000','2026-09-11 14:00:00.000000'),(12,4,2,'Дитячий самокат','Самокат зі складаною рамою, зріст дитини від 110 см.',1100.00,'Київ','sold','2026-09-12 15:00:00.000000','2026-09-12 15:00:00.000000'),(13,5,2,'Велосипедний багажник','Універсальний задній багажник для міського велосипеда.',900.00,'Вінниця','active','2026-09-13 16:00:00.000000','2026-09-13 16:00:00.000000'),(14,6,2,'Електросамокат','Електросамокат із зарядним пристроєм, пробіг демонстраційний.',18000.00,'Київ','active','2026-10-26 10:00:00.000000','2026-10-26 10:00:00.000000'),(15,7,3,'Оренда однокімнатної квартири','Вигадана квартира без конкретної адреси, щомісячна оренда.',16000.00,'Київ','active','2026-09-15 11:00:00.000000','2026-09-15 11:00:00.000000'),(16,8,3,'Оренда гаража','Демонстраційне оголошення про оренду гаража без адреси.',2500.00,'Львів','active','2026-09-16 12:00:00.000000','2026-09-16 12:00:00.000000'),(17,1,3,'Оренда кімнати','Вигадана кімната для довгострокової оренди без адреси.',7000.00,'Київ','active','2026-10-22 13:00:00.000000','2026-10-22 13:00:00.000000'),(18,2,3,'Продаж дачної ділянки','Умовна земельна ділянка для навчального набору даних.',320000.00,'Черкаси','sold','2026-09-18 14:00:00.000000','2026-09-18 14:00:00.000000'),(19,3,3,'Оренда офісного місця','Робоче місце у вигаданому офісі, вартість за місяць.',4500.00,'Одеса','archived','2026-09-19 15:00:00.000000','2026-09-19 15:00:00.000000'),(20,4,3,'Оренда складського приміщення','Навчальний приклад невеликого складського приміщення.',10000.00,'Київ','active','2026-10-23 16:00:00.000000','2026-10-23 16:00:00.000000'),(21,5,4,'Письмовий стіл','Дерев’яний стіл для навчання, розміри 120 на 60 см.',2300.00,'Київ','active','2026-10-24 09:00:00.000000','2026-10-24 09:00:00.000000'),(22,6,4,'Набір садового інструменту','Лопатка, грабельки та секатор у комплекті.',650.00,'Полтава','active','2026-09-22 10:00:00.000000','2026-09-22 10:00:00.000000'),(23,7,4,'Крісло для читання','М’яке крісло із тканинною оббивкою.',3400.00,'Львів','sold','2026-09-23 11:00:00.000000','2026-09-23 11:00:00.000000'),(24,8,4,'Настільна лампа','Лампа з регулюванням нахилу, справна.',450.00,'Київ','active','2026-10-27 12:00:00.000000','2026-10-27 12:00:00.000000'),(25,1,4,'Книжкова полиця','Полиця на три відділення для домашньої бібліотеки.',1200.00,'Дніпро','archived','2026-09-25 13:00:00.000000','2026-09-25 13:00:00.000000'),(26,2,5,'Жіночий светр','Теплий светр розміру S для повсякденного носіння.',500.00,'Київ','active','2026-10-21 14:00:00.000000','2026-10-21 14:00:00.000000'),(27,3,5,'Чоловічі черевики','Демісезонні черевики розміру 42.',1600.00,'Харків','active','2026-09-27 15:00:00.000000','2026-09-27 15:00:00.000000'),(28,4,5,'Дитячий комбінезон','Зимовий комбінезон на зріст 104 см.',950.00,'Київ','sold','2026-09-28 16:00:00.000000','2026-09-28 16:00:00.000000'),(29,5,5,'Літня сукня','Легка сукня розміру M, однотонна.',700.00,'Вінниця','active','2026-09-29 09:00:00.000000','2026-09-29 09:00:00.000000'),(30,6,5,'Шкіряний ремінь','Ремінь нейтрального кольору, довжина 110 см.',350.00,'Київ','active','2026-10-19 10:00:00.000000','2026-10-19 10:00:00.000000');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ads_price_history` AFTER UPDATE ON `ads` FOR EACH ROW BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO ad_price_history (ad_id, old_price, new_price, changed_at)
        VALUES (NEW.ad_id, OLD.price, NEW.price, CURRENT_TIMESTAMP(6));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_categories_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Електроніка','Комп’ютери, телефони та інша техніка'),(2,'Транспорт','Автомобілі, велосипеди та запчастини'),(3,'Нерухомість','Продаж та оренда нерухомості'),(4,'Дім і сад','Меблі, побутові речі та садове приладдя'),(5,'Одяг','Одяг, взуття та аксесуари'),(6,'Спорт','Спортивне спорядження');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Мирон Зореліс','myron.zorelis@example.com','+380000000101','2026-01-10 09:00:00.000000'),(2,'Олеся Вітроліс','olesia.vitrolis@example.com',NULL,'2026-01-12 10:30:00.000000'),(3,'Тарас Світлояр','taras.svitloiar@example.com','+380000000103','2026-02-01 11:00:00.000000'),(4,'Марта Весноцвіт','marta.vesnotsvit@example.com',NULL,'2026-02-15 12:00:00.000000'),(5,'Данило Тихозор','danylo.tykhozor@example.com','+380000000105','2026-03-03 08:20:00.000000'),(6,'Соломія Ясноділ','solomiia.yasnodil@example.com',NULL,'2026-03-20 14:10:00.000000'),(7,'Левко Дивосад','levko.dyvosad@example.com','+380000000107','2026-04-05 15:45:00.000000'),(8,'Ніна Росолуг','nina.rosoluh@example.com',NULL,'2026-04-22 16:00:00.000000'),(9,'Орест Листозор','orest.lystozor@example.com',NULL,'2026-05-10 09:15:00.000000'),(10,'Злата Мрійоліс','zlata.mriilis@example.com',NULL,'2026-05-18 10:00:00.000000');
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

-- Dump completed on 2026-11-03 20:47:27
