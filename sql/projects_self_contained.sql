-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: projects
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Woodworking'),(2,'Painting'),(3,'Electronics'),(4,'Gardening'),(5,'Home Improvement');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `material_name` varchar(128) NOT NULL,
  `num_required` int DEFAULT NULL,
  `cost` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,1,'Pressure-treated lumber',20,120.50),(2,1,'Galvanized screws',500,25.75),(3,1,'Decking boards',30,180.00),(4,2,'Primer',2,24.99),(5,2,'Paint',3,45.50),(6,2,'Paint brushes',2,18.75),(7,3,'Smart LED bulbs',8,120.00),(8,3,'Smart switch',2,50.00),(9,3,'Wires and connectors',1,15.25),(10,4,'Cedar wood',12,96.00),(11,4,'Soil',4,20.00),(12,4,'Compost',2,15.00),(13,5,'Ceramic tiles',200,300.00),(14,5,'Grout',2,12.50),(15,5,'Tile cutter',1,45.00);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(128) NOT NULL,
  `estimated_hours` decimal(7,2) DEFAULT NULL,
  `actual_hours` decimal(7,2) DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Garden Shed',12.00,10.50,3,'First DIY project'),(2,'Bookshelf',8.00,8.00,2,'Simple wooden bookshelf'),(3,'Backyard Deck',40.00,38.00,5,'Building a deck in the backyard'),(4,'Kitchen Cabinet Painting',20.00,22.00,3,'Refreshing kitchen cabinets with new paint'),(5,'Smart Lighting System',15.00,16.00,4,'Installing smart LED lights in the living room'),(6,'Raised Garden Beds',12.00,10.00,2,'Creating garden beds for vegetables'),(7,'Bathroom Remodel',80.00,75.00,7,'Complete bathroom renovation');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_category` (
  `project_id` int NOT NULL,
  `category_id` int NOT NULL,
  UNIQUE KEY `project_id` (`project_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `project_category_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `project_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_category`
--

LOCK TABLES `project_category` WRITE;
/*!40000 ALTER TABLE `project_category` DISABLE KEYS */;
INSERT INTO `project_category` VALUES (1,1),(2,2),(3,3),(4,4),(1,5),(2,5),(3,5),(4,5),(5,5);
/*!40000 ALTER TABLE `project_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `step_text` text NOT NULL,
  `step_order` int NOT NULL,
  PRIMARY KEY (`step_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `step_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,1,'Measure and mark the area for the deck',1),(2,1,'Prepare the ground and lay the foundation',2),(3,1,'Install support posts and beams',3),(4,1,'Attach joists to the frame',4),(5,1,'Install decking boards',5),(6,1,'Add railings and stairs if needed',6),(7,1,'Apply sealant or stain to protect the wood',7),(8,2,'Remove old cabinet doors and hardware',1),(9,2,'Clean and prepare the cabinet surfaces',2),(10,2,'Apply primer to the cabinets',3),(11,2,'Paint the cabinets with the first coat',4),(12,2,'Allow the first coat to dry completely',5),(13,2,'Apply the second coat of paint',6),(14,2,'Reattach the doors and hardware',7),(15,3,'Plan your smart lighting layout',1),(16,3,'Install the smart switch at the desired location',2),(17,3,'Connect the smart LED bulbs to the power source',3),(18,3,'Pair the smart bulbs with your home automation system',4),(19,3,'Test the lighting system and adjust settings as needed',5),(20,4,'Choose the location for your garden beds',1),(21,4,'Measure and mark the area for the beds',2),(22,4,'Build the frame for the raised beds using cedar wood',3),(23,4,'Fill the beds with soil and compost',4),(24,4,'Plant your vegetables or flowers',5),(25,5,'Remove old fixtures and surfaces',1),(26,5,'Install new plumbing if needed',2),(27,5,'Prepare the walls and floor for tiling',3),(28,5,'Lay out the ceramic tiles and make adjustments as needed',4),(29,5,'Apply adhesive and install the tiles',5),(30,5,'Allow the adhesive to set, then apply grout',6),(31,5,'Clean the tiles and enjoy your new bathroom',7);
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-14 15:06:07
