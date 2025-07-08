USE mlogistik;

-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: school_log
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `Barang_ID` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `jumlah` int NOT NULL,
  `harga` int NOT NULL,
  PRIMARY KEY (`Barang_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES (450,'kursi',3,450000),(451,'proyektor',1,300000);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input`
--

DROP TABLE IF EXISTS `input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `input` (
  `Input_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Barang_ID` int NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  PRIMARY KEY (`Input_ID`),
  KEY `Barang_ID` (`Barang_ID`),
  CONSTRAINT `input_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `input_ibfk_2` FOREIGN KEY (`Barang_ID`) REFERENCES `barang` (`Barang_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input`
--

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
INSERT INTO `input` VALUES (1,200,450,'13/08/2023'),(2,201,451,'10/08/2023');
/*!40000 ALTER TABLE `input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_rutin`
--

DROP TABLE IF EXISTS `laporan_rutin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laporan_rutin` (
  `Laporan_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `topik` varchar(100) NOT NULL,
  `isi` varchar(100) NOT NULL,
  PRIMARY KEY (`Laporan_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `laporan_rutin_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_rutin`
--

LOCK TABLES `laporan_rutin` WRITE;
/*!40000 ALTER TABLE `laporan_rutin` DISABLE KEYS */;
INSERT INTO `laporan_rutin` VALUES (120,200,'04/08/2023','Laporan M1','Pengisian Ulang Amunisi kelas XII MIPA 2'),(121,201,'11/08/2023','Laporan M2','Penggantian Sasaran Tembak Kelas X MIPA 3'),(122,201,'18/08/2023','Laporan M3','Pemasangan Mesin Jet di ruang pembakaran sampah');
/*!40000 ALTER TABLE `laporan_rutin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surat_pengajuan`
--

DROP TABLE IF EXISTS `surat_pengajuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surat_pengajuan` (
  `Surat_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `topik` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`Surat_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `surat_pengajuan_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surat_pengajuan`
--

LOCK TABLES `surat_pengajuan` WRITE;
/*!40000 ALTER TABLE `surat_pengajuan` DISABLE KEYS */;
INSERT INTO `surat_pengajuan` VALUES (300,201,'10/08/2023','Pembelian mesin potong rumput 12 unit','Menunggu'),(301,200,'11/08/2023','Pembelian pesawat untuk kargo','Disetujui'),(302,200,'9/08/2023','Komputer Harus Diservis di LabKom','Ditolak');
/*!40000 ALTER TABLE `surat_pengajuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nip` varchar(100) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (200,'Lukman Hidayat','123','lukman@logistik.com','088209816102','Bekasi, 9 Mei 1998','Jl. Nangka No.18 Tanggerang Selatan 14215','247840384719854108'),(201,'Jefri Saputra','9e9c2af0','jefrisa@logistik.com','083292078029','Jakarta, 17 Agustus 1996','Jl. Bata Putih No.2 Tanggerang Selatan 12246','260389227302589705'),(202,'Hana Hasanah','7c3a9965','hanahh@wakasek.com','082920011369','Depok, 4 Juli 1989','Jl. Jend. A. Yani No.374 Tanggerang Selatan 12246','272074005850028707'),(203,'Timbul Mahendra','28be556b','timbulma@wakasek.com','088507826343','Bekasi, 5 Desember 1082','Jl. Maskur No.235 Tanggerang Selatan 14215','523464356555862803');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 10:01:04
