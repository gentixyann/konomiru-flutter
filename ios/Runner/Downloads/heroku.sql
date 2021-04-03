-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: us-cdbr-iron-east-05.cleardb.net    Database: heroku_02dda95d941a585
-- ------------------------------------------------------
-- Server version	5.6.36-log

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
-- Table structure for table `whereis_contact`
--

DROP TABLE IF EXISTS `whereis_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whereis_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `nick_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `inquiries` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whereis_contact`
--

LOCK TABLES `whereis_contact` WRITE;
/*!40000 ALTER TABLE `whereis_contact` DISABLE KEYS */;
INSERT INTO `whereis_contact` VALUES (1,23,'さ','さ','１番目','さ','2018-02-23 14:13:35','2018-03-17 02:19:37'),(2,30,'sa','sasa@a','最初に題','asas','2018-02-25 14:13:21','2018-03-17 02:20:04'),(3,23,'おいら','hiro@yahoo.ne.jp','初めてのタイトル','おらおら','2018-03-17 11:27:35','2018-03-17 02:27:35'),(4,44,'fuker','sasas','toooi','ggjfgfu','0000-00-00 00:00:00','2018-03-17 12:55:48'),(5,23,'sasa','rrrr','kkkk','fuck','2018-03-17 22:25:00','2018-03-17 13:25:00'),(6,23,'ほ','ひ','か','へ','2018-03-17 22:36:06','2018-03-17 13:36:06'),(11,31,'これは','テスト','idのね','さて南蛮？','2018-03-18 01:02:57','2018-03-18 01:02:57'),(21,31,'今度','は','果たして','12かな？','2018-03-18 01:04:28','2018-03-18 01:04:28');
/*!40000 ALTER TABLE `whereis_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whereis_map`
--

DROP TABLE IF EXISTS `whereis_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whereis_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `movie_info` text NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whereis_map`
--

LOCK TABLES `whereis_map` WRITE;
/*!40000 ALTER TABLE `whereis_map` DISABLE KEYS */;
INSERT INTO `whereis_map` VALUES (8,23,41.376239097087634,2.1782684592468513,'<iframe width=\"1280\" height=\"483\" src=\"https://www.youtube.com/embed/tJiVJV29e6M?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','Passeig de Colom, 1806, 08002 Barcelona, スペイン','2018-02-19 15:18:10'),(9,23,-34.11920017728388,18.37438080312495,'<iframe width=\"1280\" height=\"483\" src=\"https://www.youtube.com/embed/IJh_ZF0Z5R8?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','Scirpus Rd, The Lakes, Cape Town, 7975 南アフリカ','2018-02-19 15:21:44'),(12,23,50.848457441169195,4.354007072387276,'<iframe width=\"1280\" height=\"483\" src=\"https://www.youtube.com/embed/3ftgCOXPWXU?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','Impasse de la Fidélité 1-11, 1000 Bruxelles, ベルギー','2018-02-22 13:56:16'),(19,23,36.32162182071344,139.01331425396734,'<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/LtfjlJjXOfk?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','日本、〒370-0849 群馬県高崎市八島町222','2018-03-01 14:46:31'),(24,23,35.66051928052476,139.70111089891964,'<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/Od6EeCWytZo?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','日本、〒150-0041 東京都渋谷区神南１丁目２２−３ 渋谷住友信託ビル','2018-03-11 17:31:08'),(31,29,10.317643565173181,123.90268711373903,'<iframe width=\"1280\" height=\"485\" src=\"https://www.youtube.com/embed/9wvtPfz_cXc?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','20 Luzon Ave, Cebu City, Cebu, フィリピン','2018-03-13 11:46:25'),(41,31,-37.878788732410165,175.70043018320314,'<iframe width=\"1280\" height=\"485\" src=\"https://www.youtube.com/embed/eRWXRwOs3dM?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>','277A Buckland Rd, Matamata 3472 ニュージーランド','2018-03-18 01:17:13');
/*!40000 ALTER TABLE `whereis_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whereis_members`
--

DROP TABLE IF EXISTS `whereis_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whereis_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whereis_members`
--

LOCK TABLES `whereis_members` WRITE;
/*!40000 ALTER TABLE `whereis_members` DISABLE KEYS */;
INSERT INTO `whereis_members` VALUES (23,'san gen','a551.return@gmail.com','e37f33f9e82bd757d6978fd7f3216e5b1708d402','2018-02-25 06:15:11','2018-02-25 06:15:11'),(29,'jou migi','kokogento@gmail.com','5e3de5cc6d68245165df26fce21a5bcae8cfa05c','2018-02-18 11:26:39','2018-02-18 11:26:39'),(31,'View Whe','wheview@gmail.com','31c93131426366f3254d2d92324830a7e2c5b385','2018-03-17 01:38:05','2018-03-17 01:38:05');
/*!40000 ALTER TABLE `whereis_members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-18 10:19:23
