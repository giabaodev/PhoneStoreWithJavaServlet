-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: phonestore
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `iddonhang` int NOT NULL,
  `idsanpham` int NOT NULL,
  KEY `iddonhang` (`iddonhang`),
  CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`iddonhang`) REFERENCES `donhang` (`iddonhang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (93718421,125),(67532998,124),(74362511,225);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `iddonhang` int NOT NULL AUTO_INCREMENT,
  `hoten` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngaydathang` varchar(2000) DEFAULT NULL,
  `sdt` varchar(2000) NOT NULL,
  `diachi` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tongtien` varchar(45) NOT NULL,
  `trangthai` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`iddonhang`)
) ENGINE=InnoDB AUTO_INCREMENT=95679155 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (67532998,'Shadow Danger','25-06-2021','0123456789','596/3A, Vo Van Ngan, Q9','1100','Done'),(74362511,'Billy Antom','25-06-2021','0369214695','596/3A, Vo Van Ngan, Q9','19','Queue'),(93718421,'Billy Antom','25-06-2021','0369214695','596/3A, Vo Van Ngan, Thanh Pho Thu Duc','899','Done');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `idsanpham` int NOT NULL AUTO_INCREMENT,
  `tensanpham` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loaisp` int NOT NULL,
  `motasp` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `soluong` int NOT NULL,
  `giaban` int NOT NULL,
  `hinhanh` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`idsanpham`),
  KEY `fk_sp_loai` (`loaisp`),
  CONSTRAINT `fk_sp_loai` FOREIGN KEY (`loaisp`) REFERENCES `theloai` (`idTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (123,'Iphone 12 pro max',1,'6GB / 128GB',11,1109,'image/sanpham/ip12pm.jpg'),(124,'Asus Rog Phone 5',1,'12GB / 512GB',10,1100,'image/sanpham/rogphone5.png'),(125,'Xiaomi Mi 11',1,'12GB / 256GB',5,899,'image/sanpham/xiaomi11.jpg'),(223,'Anker Lightning Cable',2,'Output: 3A',100,5,'image/sanpham/capsacankerlightning.jpg'),(224,'Baseus Lightning Cable',2,'Output: 2A',120,3,'image/sanpham/capsacbaseus.jpg'),(225,'Adapter Anker PD',2,'Output: 9V / 2A',25,19,'image/sanpham/cusacankerPD.jpg'),(226,'Adapter Baseus',2,'Output: 9V / 3A',25,17,'image/sanpham/cusacbaseus.jpg'),(333,'Laptop Dell Alienware',3,'i9 10900H / RTX 3060',15,2499,'image/sanpham/dellalienware.jpg'),(334,'Laptop Asus ROG ZephyrusDuo',3,'i7 10875H / RTX 2070S',10,1525,'image/sanpham/laptopasusrogZephyrusDuo.jpg'),(335,'Ipad Pro 2021',3,'16GB / 2TB',16,999,'image/sanpham/ipadpro2021.jpg'),(336,'Xiaomi Mi 11 Ultra',1,'Snapdragon 888',5,1199,'image/sanpham/Mi11ultra.jpg'),(338,'Acer Nitro 7',3,'i7 9750H / 1660ti',0,1699,'image/sanpham/acernitro7.jpg');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `idTaikhoan` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(450) NOT NULL,
  `quyen` char(3) NOT NULL,
  PRIMARY KEY (`idTaikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (1,'admin','admin','admin@phonestorel.com','adm'),(4,'tester','tester','tester@gmail.com','mng');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `idTheLoai` int NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES (1,'Phone'),(2,'Accessories'),(3,'Laptop - Tablet');
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-25 19:24:41
