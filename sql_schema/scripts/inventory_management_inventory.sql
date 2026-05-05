CREATE DATABASE  IF NOT EXISTS `inventory_management` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventory_management`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventory_management
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '5452f022-bf8a-11f0-8898-cd73d8dfd58f:1-4909';

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `product_SKU` varchar(50) NOT NULL,
  `purchase_date` date NOT NULL,
  `warranty_expiry_date` date NOT NULL,
  `quantity` int DEFAULT NULL,
  `item_description` varchar(250) NOT NULL,
  `division` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `country_of_origin` varchar(50) NOT NULL,
  `unit_purchase_cost` decimal(10,0) NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `inventory_id_UNIQUE` (`inventory_id`),
  UNIQUE KEY `product_SKU_UNIQUE` (`product_SKU`),
  KEY `fk_inventory_invetory_lookup_idx` (`status_id`),
  CONSTRAINT `fk_inventory_invetory_lookup` FOREIGN KEY (`status_id`) REFERENCES `inventory_status_lookup` (`status_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'OX-2345-PLPH','2023-01-12','2027-01-12',5,'Inverted Microscope','LifeScience','Microscopex','Switzerland',135000,5),(2,'BTR-NWR-640','2023-02-02','2026-02-02',5,'Battery Tester','BatterResearch','Lware','China',168750,5),(3,'HRM-GB-2308-12','2023-04-09','2026-04-09',12,'Refrigerated Centrifuge','LifeScience','Hermlab','Germany',405000,6),(4,'FSC-SC-90C-GB','2023-06-15','2026-06-15',5,'Fire Safety Cabinets','MaterialScience','Safecos','Germany',540000,5),(5,'GC-FSC-30C-GB','2023-06-26','2026-06-26',4,'Gas Cabinets','MaterialScience','Safecos','Germany',438750,3),(6,'SVC-AC-23A-GB','2023-07-20','2026-07-20',5,'Acid Cabinets','MaterialScience','Safecos','Germany',506250,5),(7,'TM-CM-25-78','2023-09-10','2026-09-10',4,'Sealing machine','BatterResearch','BTST','China',168750,3),(8,'DC-FSC-90C-GB','2023-10-18','2026-10-18',3,'Drum Cabinets','MaterialScience','Safecos','Germany',405000,6),(9,'BMH-2152-US-02','2022-11-08','2025-11-08',3,'Bead Mill Homogenisers','LifeScience','OmoG','USA',371250,3),(10,'FUR-Lite-678-12','2023-12-20','2026-12-20',20,'Furnance','MaterialScience','Furolite','France',1012500,2),(11,'CR-09-PP-34','2024-01-05','2027-01-05',20,'Crimper','BatterResearch','TBEST','China',337500,2),(12,'HRP-09-PP-35','2024-01-05','2027-01-05',10,'Hot Roll Press','BatterResearch','TBEST','China',236250,5),(13,'DX-2289-PLPHF','2022-02-14','2026-02-14',5,'Fluorescence Microscope','LifeScience','Microscopex','Switzerland',675000,2),(14,'JT-2016-IN-04','2024-04-10','2026-04-10',15,'Orbital Shaker','LifeScience','Jtech','South Korea',202500,4),(15,'AD-MS-1025-IN','2024-04-25','2026-04-25',20,'Magnetic stirrer','LifeScience','IKYA','India',13500,2),(16,'PR-USA-1234-HP','2024-05-12','2027-05-12',5,'Photoreactor','LifeScience','HEphotoR','USA',675000,2),(17,'ILK-FD-SK-345','2024-05-20','2026-05-20',12,'Freeze Dryers','LifeScience','Ilkhem','South Korea',540000,4),(18,'PR-USA-1200-HP','2024-06-12','2027-06-12',3,'Photoreactor Lamps','LifeScience','HEphotoR','USA',67500,6),(19,'UB-FSC-30C-GB','2024-06-17','2027-06-17',8,'Underbench Cabinets','MaterialScience','Safecos','Germany',337500,2),(20,'SK-200-S-II','2024-06-20','2027-06-20',10,'Planetary Mixer','MaterialScience','KubotoSu','Japan',270000,4),(21,'AD-VP-2300-IN','2024-07-12','2026-07-12',5,'Vacuum Pump','LifeScience','IKYA','India',67500,5),(22,'JT-2003-IN-04','2024-08-15','2026-08-15',10,'Shaking Incubator','LifeScience','Jtech','South Korea',168750,4),(23,'DP-SGZ-456-04','2025-09-15','2027-09-15',5,'Deep Freezers','LifeScience','SangodZ','India',168750,3),(24,'JCR-SM-123-09-R','2024-09-30','2027-09-30',10,'Jaw Crushers ','MaterialScience','Smasch','France',810000,5),(25,'IS-3456-PLi','2025-10-10','2028-10-10',5,'Upright Microscope','LifeScience','Microscopex','Switzerland',57375,3),(26,'CM-09-PP-37','2024-11-18','2027-11-18',2,'Coating Machine','BatterResearch','TBEST','China',175500,1),(27,'ILK-DF-SK-330','2024-12-12','2026-12-12',4,'Deep Freezers Package','LifeScience','Ilkhem','South Korea',675000,1),(28,'CC-BT-2023','2025-01-10','2028-01-10',15,'Coin cells','BatterResearch','TOBRST','China',202500,4),(29,'UDP-SGZ-420-05','2025-01-30','2027-01-30',3,'Ultra Deep Freezers','LifeScience','SangodZ','India',202500,3),(30,'ProT-1234-IN-05','2025-02-03','2027-02-03',2,'Humidity Chambers','LifeScience','ProTech','India',378000,3),(31,'AD-RE-3042-IN','2024-02-12','2026-02-12',5,'Rotary Evaporator','LifeScience','IKYA','India',202500,6),(32,'YZ-4052-FC-162','2023-03-02','2026-03-02',5,'Flash Chromatography','LifeScience','YZFlash','Japan',1012500,1),(33,'GB-INAT-895-01','2024-03-06','2027-03-06',1,'Glovebox Full Package','MaterialScience','GSBraun','Germany',10125000,6),(34,'NW-BT-2560','2025-03-10','2028-03-10',7,'Battery Tester Multi','BatterResearch','Nwand','China',202500,2),(35,'SK-400-TV-II','2025-03-20','2028-03-20',6,'Planetary Vacuum Mixer','MaterialScience','KubotSu','Japan',540000,4),(36,'BS-2344-EPLi','2025-05-16','2027-05-16',3,'Student Microscope','LifeScience','Microscopex','Switzerland',37125,5),(37,'IS-387-CC-125','2025-05-20','2028-05-20',4,'Colony Counter','LifeScience','Shashin Kagaku','Japan',675000,1),(38,'RF-SGD-432-05','2025-05-24','2027-05-24',5,'Refrigerators ','LifeScience','SangodZ','India',67500,4),(39,'GB-INAT-897-00','2025-05-26','2028-05-26',3,'Glovebox','MaterialScience','GSBraun','Germany',6750000,6),(40,'YZ-4050-FC-161','2024-08-16','2027-08-16',2,'High Flash Chromatography','LifeScience','YZFlash','Japan',877500,6),(41,'DS-20X-CCD','2022-08-25','2024-08-25',3,'CCD Camera','LifeScience','Microscopex','Switzerland',81000,3),(42,'DS-HSC-CMOS','2025-11-06','2027-11-06',3,'CMOS Camera','LifeScience','Microscopex','Switzerland',66825,3);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 11:41:00
