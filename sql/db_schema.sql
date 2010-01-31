-- MySQL dump 10.13  Distrib 5.1.42, for apple-darwin10.2.0 (i386)
--
-- Host: localhost    Database: cine
-- ------------------------------------------------------
-- Server version	5.1.42

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
-- Table structure for table `theater_info`
--

DROP TABLE IF EXISTS `theater_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext,
  `lat` varchar(30) DEFAULT NULL,
  `long` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_info`
--

LOCK TABLES `theater_info` WRITE;
/*!40000 ALTER TABLE `theater_info` DISABLE KEYS */;
INSERT INTO `theater_info` VALUES (1,'Plaza del Caribe','17.993435','-66.611407'),(2,'Ponce Towne Center','17.996088','-66.639548'),(3,'Western Plaza','18.243255','-67.162828'),(4,'Yauco','18.024796','-66.857547');
/*!40000 ALTER TABLE `theater_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'USVI Market Square'),(2,'Aguadilla Mall'),(3,'Arecibo'),(4,'Barceloneta'),(5,'Belz Outlets'),(6,'Dorado Cinemas'),(7,'Fajardo'),(8,'Fine Arts'),(9,'Fine Arts Cafe'),(10,'Las Catalinas'),(11,'Las Piedras'),(12,'Los Colobos'),(13,'Metro'),(14,'Montehiedra'),(15,'Plaza Cayey'),(16,'Plaza del Caribe'),(17,'Plaza del Sol'),(18,'Plaza Escorial'),(19,'Plaza Guayama'),(20,'Plaza Guaynabo'),(21,'Plaza Isabela'),(22,'Plaza Las Americas'),(23,'Ponce Towne Center'),(24,'Rio Hondo'),(25,'San German'),(26,'San Patricio'),(27,'Santa Isabel'),(28,'St. Kitts'),(29,'St. Lucia Megaplex 8'),(30,'St. Maarten Megaplex 7'),(31,'Trincity Mall'),(32,'Vega Alta'),(33,'Western Plaza'),(34,'Yauco');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-01-31 16:18:56
