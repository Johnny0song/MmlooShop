-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: MmlooShopdb
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add goods',8,'add_goods'),(23,'Can change goods',8,'change_goods'),(24,'Can delete goods',8,'delete_goods'),(25,'Can add carousel',9,'add_carousel'),(26,'Can change carousel',9,'change_carousel'),(27,'Can delete carousel',9,'delete_carousel'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add order',11,'add_order'),(32,'Can change order',11,'change_order'),(33,'Can delete order',11,'delete_order'),(34,'Can add order goods',12,'add_ordergoods'),(35,'Can change order goods',12,'change_ordergoods'),(36,'Can delete order goods',12,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'app','carousel'),(10,'app','cart'),(8,'app','goods'),(11,'app','order'),(12,'app','ordergoods'),(7,'app','user'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-16 09:45:36.455977'),(2,'auth','0001_initial','2019-01-16 09:45:37.196334'),(3,'admin','0001_initial','2019-01-16 09:45:37.327051'),(4,'admin','0002_logentry_remove_auto_add','2019-01-16 09:45:37.348665'),(5,'app','0001_initial','2019-01-16 09:45:37.418455'),(6,'contenttypes','0002_remove_content_type_name','2019-01-16 09:45:37.509469'),(7,'auth','0002_alter_permission_name_max_length','2019-01-16 09:45:37.572772'),(8,'auth','0003_alter_user_email_max_length','2019-01-16 09:45:37.601482'),(9,'auth','0004_alter_user_username_opts','2019-01-16 09:45:37.621611'),(10,'auth','0005_alter_user_last_login_null','2019-01-16 09:45:37.663574'),(11,'auth','0006_require_contenttypes_0002','2019-01-16 09:45:37.670913'),(12,'auth','0007_alter_validators_add_error_messages','2019-01-16 09:45:37.689867'),(13,'auth','0008_alter_user_username_max_length','2019-01-16 09:45:37.734330'),(14,'sessions','0001_initial','2019-01-16 09:45:37.766253'),(15,'app','0002_cart','2019-01-16 11:06:40.788114'),(16,'app','0003_goods_isselect','2019-01-18 12:03:26.736466'),(17,'app','0004_auto_20190118_1209','2019-01-18 12:09:06.949394'),(18,'app','0005_auto_20190118_1304','2019-01-18 13:04:05.429602'),(19,'app','0006_cart_isselect','2019-01-19 04:02:39.468756'),(20,'app','0007_order_ordergoods','2019-01-19 08:03:56.652332');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7my9hdasbyvklycj8v496mzd62qwj41g','ZThmYzViMzc4OGJjOWUwM2Y4ZmUyNTdiY2M5YmI1ZjkxZDQ5N2Y2YTp7InRva2VuIjoiNDczNDI1YzI0YmYzYTdiOTAxNzg4YjdmZTBjMDljOTYifQ==','2019-02-02 08:40:16.465155'),('8wm3nnixa1u9njx361mv97fugucerj7w','ZjU2NGM3MDY5ODZhMWM3MDRiN2Q0ZjQzZTQ5N2ZiY2RiMDFlZTIxNDp7InRva2VuIjoiZDc4Y2RiZDE4NTgxZjQ3YTQ5YTA1YTQ1NDk1YjUzYWMifQ==','2019-01-30 12:00:18.228728'),('g7q4b4q7q7uv4qpty58wbs0lzt1rv16x','MWNlN2M4Yjc2MmU1MmMzNDBmMzhmNmIyNTA0ZjU3OTVmNDhjYTgxMzp7InRva2VuIjoiMjM4OGI0OTIxMzJhNWY5ZTJlNGU3N2QyZmUyOWQ4NGIifQ==','2019-02-03 01:26:48.232748'),('qm7ni1m4rlvcbjxob03spovj6mdo8tcx','NmRjMjg3OWQ1MGEyMzg1MzQyNjY0Zjk4MzdiMzJkOWVkZGU0MmU1ZDp7InRva2VuIjoiZDk2MGZlZGQyYWUyODBhNTBkYWViZjc0MmM3ZjNiZGQifQ==','2019-01-31 01:58:52.635356');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mml_carousel`
--

DROP TABLE IF EXISTS `mml_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mml_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `imgs` varchar(300) NOT NULL,
  `trackid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mml_carousel`
--

LOCK TABLES `mml_carousel` WRITE;
/*!40000 ALTER TABLE `mml_carousel` DISABLE KEYS */;
INSERT INTO `mml_carousel` VALUES (1,'lunbo1','images1/lunbo1.png','1001'),(2,'lunbo2','images1/lunbo2.jpg','1002'),(3,'lunbo3','images1/lunbo3.jpg','1003');
/*!40000 ALTER TABLE `mml_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mml_cart`
--

DROP TABLE IF EXISTS `mml_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mml_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartnum` varchar(50) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mml_cart_goods_id_a878acc0_fk_mml_goods_id` (`goods_id`),
  KEY `mml_cart_user_id_565614aa_fk_mml_user_id` (`user_id`),
  CONSTRAINT `mml_cart_goods_id_a878acc0_fk_mml_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `mml_goods` (`id`),
  CONSTRAINT `mml_cart_user_id_565614aa_fk_mml_user_id` FOREIGN KEY (`user_id`) REFERENCES `mml_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mml_cart`
--

LOCK TABLES `mml_cart` WRITE;
/*!40000 ALTER TABLE `mml_cart` DISABLE KEYS */;
INSERT INTO `mml_cart` VALUES (1,'2',1,2,1),(3,'7',3,2,0),(4,'3',1,3,1),(5,'2',2,3,1),(6,'4',1,5,1),(7,'6',2,5,1),(8,'3',3,5,1),(9,'2',1,6,0),(10,'1',2,6,1),(11,'4',2,2,1),(12,'2',1,7,1),(13,'3',2,7,1);
/*!40000 ALTER TABLE `mml_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mml_goods`
--

DROP TABLE IF EXISTS `mml_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mml_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `imgs` varchar(300) NOT NULL,
  `price` varchar(50) NOT NULL,
  `productnumber` varchar(50) NOT NULL,
  `trackid` varchar(10) NOT NULL,
  `isselect` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mml_goods`
--

LOCK TABLES `mml_goods` WRITE;
/*!40000 ALTER TABLE `mml_goods` DISABLE KEYS */;
INSERT INTO `mml_goods` VALUES (1,'iphone7','images1/iphone7pjin.jpg','5666','200','2001','true'),(2,'ipad','images1/ipad.jpg','6666','300','2002','true'),(3,'iphone7 plus','images1/iphone7phei.jpg','7666','100','2003','true');
/*!40000 ALTER TABLE `mml_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mml_order`
--

DROP TABLE IF EXISTS `mml_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mml_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mml_order_user_id_22a54d9c_fk_mml_user_id` (`user_id`),
  CONSTRAINT `mml_order_user_id_22a54d9c_fk_mml_user_id` FOREIGN KEY (`user_id`) REFERENCES `mml_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mml_order`
--

LOCK TABLES `mml_order` WRITE;
/*!40000 ALTER TABLE `mml_order` DISABLE KEYS */;
INSERT INTO `mml_order` VALUES (1,0,'2019-01-19 08:04:00.971196','15478850400.18523536671484786',2),(2,0,'2019-01-19 08:04:15.683262','15478850550.39393746455415346',2),(3,0,'2019-01-19 08:04:57.410837','15478850970.7992498233612005',2),(4,0,'2019-01-19 08:05:22.065263','15478851220.8771236467518387',2),(5,0,'2019-01-19 08:07:44.405394','15478852640.6805051386585423',2),(6,0,'2019-01-19 08:07:46.468105','15478852660.9881020406820057',2),(7,0,'2019-01-19 08:09:40.466693','15478853800.13701467948636403',2),(8,0,'2019-01-19 08:09:58.892274','15478853980.22343702448836422',2),(9,0,'2019-01-19 08:13:04.340775','15478855840.3385064014752377',5),(10,0,'2019-01-19 08:13:38.242349','15478856180.6546450280469687',5),(11,0,'2019-01-19 08:14:18.273967','15478856580.14526373687938554',5),(12,0,'2019-01-19 08:14:23.197048','15478856630.5059795329838567',5),(13,0,'2019-01-19 08:15:10.985213','15478857100.33197919719003566',5),(14,0,'2019-01-19 08:15:13.730526','15478857130.6228369808105892',5),(15,0,'2019-01-19 08:22:04.758192','15478861240.4917173834471734',5),(16,0,'2019-01-19 08:22:07.683347','15478861270.5561021817540338',5),(17,0,'2019-01-19 08:22:10.066378','15478861300.888475072063118',5),(18,0,'2019-01-19 08:22:14.662439','15478861340.5569394068841088',5),(19,0,'2019-01-19 08:24:36.915880','15478862760.6135653156332282',5),(20,0,'2019-01-19 08:24:47.097860','15478862870.9232165507942198',5),(21,0,'2019-01-19 08:25:34.508129','15478863340.7845980595136182',5),(22,0,'2019-01-19 08:26:32.080958','15478863920.29073518825281974',5),(23,0,'2019-01-19 08:26:37.955124','15478863970.18597157159690647',5),(24,0,'2019-01-19 08:40:44.146083','15478872440.6241663207477399',6),(25,0,'2019-01-19 08:41:28.141581','15478872880.3691695418466028',6),(26,0,'2019-01-19 08:59:54.314738','15478883940.6944067710914009',6),(27,0,'2019-01-19 09:21:14.007423','15478896740.10114596398461584',2),(28,0,'2019-01-19 09:24:14.207539','15478898540.8757799367358386',2),(29,0,'2019-01-19 09:28:47.571160','15478901270.19244900719030866',2),(30,0,'2019-01-19 09:28:54.782864','15478901340.7314946704255552',2),(31,0,'2019-01-19 09:36:52.040957','15478906120.0230518419321718',2),(32,0,'2019-01-19 09:37:18.904115','15478906380.21583023667528345',2),(33,0,'2019-01-19 09:37:24.567719','15478906440.9485172101590295',2),(34,0,'2019-01-19 09:37:33.389329','15478906530.1606709299081488',2),(35,0,'2019-01-19 09:47:02.330590','15478912220.3834130980759597',2),(36,0,'2019-01-19 09:47:52.662176','15478912720.35370096008887897',2),(37,0,'2019-01-19 09:48:11.099537','15478912910.3363192617133728',2),(38,0,'2019-01-19 09:50:16.163390','15478914160.9418715837200109',2),(39,0,'2019-01-19 09:51:59.162392','15478915190.5235445020750299',3),(40,0,'2019-01-19 10:01:34.239061','15478920940.07328582637810233',3),(41,0,'2019-01-19 10:01:42.917122','15478921020.38161153394498404',3),(42,0,'2019-01-19 13:45:45.558132','15479055450.3419140248337914',3),(43,0,'2019-01-19 13:51:04.804953','15479058640.5595291869166119',3),(44,0,'2019-01-20 01:08:55.109637','15479465350.16845994307997592',3),(45,0,'2019-01-20 01:23:44.417479','15479474240.628780772997964',3),(46,0,'2019-01-20 01:26:06.478772','15479475660.47273319214111686',3),(47,0,'2019-01-20 01:27:12.325664','15479476320.2776691540807429',7);
/*!40000 ALTER TABLE `mml_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mml_ordergoods`
--

DROP TABLE IF EXISTS `mml_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mml_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mml_ordergoods_goods_id_fc020b7a_fk_mml_goods_id` (`goods_id`),
  KEY `mml_ordergoods_order_id_17fa91cf_fk_mml_order_id` (`order_id`),
  CONSTRAINT `mml_ordergoods_goods_id_fc020b7a_fk_mml_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `mml_goods` (`id`),
  CONSTRAINT `mml_ordergoods_order_id_17fa91cf_fk_mml_order_id` FOREIGN KEY (`order_id`) REFERENCES `mml_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mml_ordergoods`
--

LOCK TABLES `mml_ordergoods` WRITE;
/*!40000 ALTER TABLE `mml_ordergoods` DISABLE KEYS */;
INSERT INTO `mml_ordergoods` VALUES (1,15,2,4),(2,4,1,9),(3,4,1,10),(4,4,1,11),(5,4,1,12),(6,4,1,13),(7,4,1,14),(8,4,1,15),(9,4,1,16),(10,4,1,17),(11,4,1,18),(12,4,1,19),(13,4,1,20),(14,4,1,21),(15,4,1,22),(16,4,1,23),(17,2,1,24),(18,1,2,25),(19,1,1,27),(20,3,3,27),(21,2,1,28),(22,4,3,28),(23,4,2,28),(24,2,1,29),(25,4,3,29),(26,4,2,29),(27,2,1,30),(28,4,3,30),(29,4,2,30),(30,2,1,31),(31,5,3,31),(32,4,2,31),(33,2,1,32),(34,4,2,32),(35,4,2,33),(36,2,1,34),(37,4,2,34),(38,5,3,35),(39,4,2,35),(40,2,1,36),(41,4,2,36),(42,2,1,37),(43,4,2,37),(44,2,1,38),(45,4,2,38),(46,3,1,39),(47,2,2,39),(48,2,2,40),(49,3,1,41),(50,3,1,42),(51,3,1,43),(52,3,1,44),(53,3,1,45),(54,3,1,46),(55,2,2,46),(56,2,1,47),(57,3,2,47);
/*!40000 ALTER TABLE `mml_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mml_user`
--

DROP TABLE IF EXISTS `mml_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mml_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `token` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mml_user`
--

LOCK TABLES `mml_user` WRITE;
/*!40000 ALTER TABLE `mml_user` DISABLE KEYS */;
INSERT INTO `mml_user` VALUES (2,'admin','a3402603d21512e986a6b4102e52e0c5ae5bf83f','18281961891','fab049354fe3532df92ab76c67c476ba'),(3,'admin2','a3402603d21512e986a6b4102e52e0c5ae5bf83f','18281961892','f6540b0c7a6d5f2d34ced012918feff1'),(5,'admin123','a3402603d21512e986a6b4102e52e0c5ae5bf83f','18281961893','9cc972207f748bda7c86fa223a7f843d'),(6,'111','a3402603d21512e986a6b4102e52e0c5ae5bf83f','18281961894','473425c24bf3a7b901788b7fe0c09c96'),(7,'123','a3402603d21512e986a6b4102e52e0c5ae5bf83f','18281961895','2388b492132a5f9e2e4e77d2fe29d84b');
/*!40000 ALTER TABLE `mml_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-20  9:53:07
