-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ctNo` char(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prdNo` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ctQty` int DEFAULT NULL,
  `prdName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `prdImage` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `memId` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('993A69E403ADAB82102FE8CD1224D2F4','A001',1,NULL,NULL,NULL,NULL),('08691F9F51EB1A3AF3FEC71602B1B849','A004',1,'ê±´ì± íì í´ë ì§í¼',12000,NULL,NULL),('8F10E1B949F5A00A8EDF7E641E890929','A004',1,'ê±´ì± íì í´ë ì§í¼',12000,NULL,NULL),('27EB88EC00E231BE03F1E8482B52729C','A004',1,'건성 타입 클렌징폼',12000,NULL,NULL),('83EAD950A899DAE518F1FED6F07A5E85','A004',2,'건성 타입 클렌징폼',12000,NULL,NULL),('1F33CA61F05CD17958A9EF345F209608','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('1F33CA61F05CD17958A9EF345F209608','A002',1,'건성 타입 앰플',14000,'A002.jpg',NULL),('1F33CA61F05CD17958A9EF345F209608','A001',1,'건성 타입 토너',14000,'A001.jpg',NULL),('51566CA85184D1A70ADFF4D87868807C','A003',2,'건성 타입 크림',16000,'A003.jpg',NULL),('78EF33D134594798509AB5A9C6561BC8','A004',1,'건성 타입 클렌징폼',12000,'A004.jpg',NULL),('78EF33D134594798509AB5A9C6561BC8','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('03BD36774EAEB29E1A3136E9A952060F','A002',1,'건성 타입 앰플',14000,'A002.jpg',NULL),('8B2BF99C53408681F1D28ACBF26845B0','A002',1,'건성 타입 앰플',14000,'A002.jpg',NULL),('EA6BB524E8105DD08A4C831D7EA44EDD','A002',1,'건성 타입 앰플',14000,'A002.jpg',NULL),('11A882D182BE0EC506707899C13AE19C','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('93F771A22813B4312D40AFFE44BA61ED','A003',2,'건성 타입 크림',16000,'A003.jpg',NULL),('D8162A9B75CF389EB502DCCF7C2D286E','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('D424C79946359971A53AB6875041D1BF','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('A6850BD36FC117A9198C430891A00EEB','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('DB6D3C71AB57D6B5E13857D6EE5B55C8','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('59F04132D5739394E2B223C09CE517EC','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('4808F35AF44510B452929FFFA3C07430','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('FD365AC0A3724FA88D1137609F2E35FF','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('CA907701FEAC6C95B41EB54A72DE7749','A002',1,'건성 타입 앰플',14000,'A002.jpg',NULL),('EDA9143E1B424F7F77D3BC5D140A4CBA','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('4409B9B6ADCB036024C15C4317EC80CF','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('4409B9B6ADCB036024C15C4317EC80CF','D003',1,'민감성 타입 크림',16000,'D003.jpg',NULL),('C4C82C4D45E24697C734792E9A0C48E6','A003',1,'건성 타입 크림',16000,'A003.jpg',NULL),('F69360F1EA85F12AE30FAAB837DFB026','A001',1,'건성 타입 토너',14000,'A001.jpg',NULL),('BD13FB741F2B33D88777ECD746CA3FFF','A003',1,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('CF5D808CABE396E7409D184FC412B261','A003',1,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('9425F926C51A5986584A71347B702184','A003',1,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('2CA1E61F9F5CDA9A1E5F97485FB608D3','A003',1,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('965ACC08E4F2C11EEFE74839CC575FBA','A003',1,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('22D5CDBEDD27439C8F04717915CA8B41','A003',3,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('4BD06192AC943996ADB45F046F9F2CD6','A004',1,'히알루론산 클렌징폼',12000,'A004.jpg',NULL),('4BD06192AC943996ADB45F046F9F2CD6','A002',1,'워터글로우 앰플',14000,'A002.jpg',NULL),('2C9961B63B7183BB1E8206FD9EB042F6','A003',5,'세라마이드 보습막 크림',16000,'A003.jpg',NULL),('6D858C72B87C5E237AB622082F4FB609','A003',3,'세라마이드 보습막 크림',24000,'A003.jpg',NULL),('6D858C72B87C5E237AB622082F4FB609','A004',3,'히알루론산 클렌징폼',17000,'A004.jpg',NULL),('8A177599136B7ADDD40D2155AEA543E6','A003',1,'세라마이드 보습막 크림',24000,'A003.jpg',NULL),('02031D8D4D542EE84CC5A9AAAE36B351','A004',1,'히알루론산 클렌징폼',17000,'A004.jpg',NULL),('02031D8D4D542EE84CC5A9AAAE36B351','A003',1,'세라마이드 보습막 크림',24000,'A003.jpg',NULL),('2640A53F336931A131B8D5D499669F9E','A003',6,'세라마이드 보습막 크림',24000,'A003.jpg',NULL),('E6B6FBF30A75B6E41BD124B0111C8682','A004',1,'히알루론산 클렌징폼',17000,'A004.jpg',NULL),('E6B6FBF30A75B6E41BD124B0111C8682','A002',1,'워터글로우 앰플',16000,'A002.jpg',NULL),('817354BCAD85C5D393EE378AC0EDE5DE','A003',1,'세라마이드 보습막 크림',24000,'A003.jpg',NULL),('817354BCAD85C5D393EE378AC0EDE5DE','A002',1,'워터글로우 앰플',12800,'A002.jpg',NULL),('817354BCAD85C5D393EE378AC0EDE5DE','A001',1,'수분결 촉촉 토너',14000,'A001.jpg',NULL),('8129B3346727EF1F868612BFEA865734','A003',1,'세라마이드 보습막 크림',24000,'A003.jpg',NULL),(NULL,'A003',1,'세라마이드 보습막 크림',24000,'A003.jpg','kim'),(NULL,'A003',1,'아르간 보습막 크림',18000,'A003.jpg','lee');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `couponId` int NOT NULL AUTO_INCREMENT,
  `memId` varchar(20) DEFAULT NULL,
  `couponCode` varchar(50) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `issuedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `expiryDate` date DEFAULT NULL,
  PRIMARY KEY (`couponId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `ctgType` char(15) COLLATE utf8mb4_general_ci NOT NULL,
  `prdNo` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `prdName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prdPrice` int NOT NULL,
  `prdStock` int NOT NULL,
  `prdSummary` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prdDescription` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discountRate` int DEFAULT '0',
  `originalPrice` int DEFAULT '0',
  PRIMARY KEY (`prdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('category1','A001','호호바 촉촉 토너',14000,99,'건성 타입 토너','',0,14000),('category1','A002','워터글로우 앰플',16000,92,'건성 타입 앰플','',0,16000),('category1','A003','아르간 보습 크림',18000,85,'건성 타입 크림','',25,24000),('category1','A004','히알루론산 클렌징폼',17000,86,'건성 타입 클렌징폼','',0,17000),('category1','A005','알로에베라 토너패드',16800,99,'지성 타입 토너패드','',20,21000),('category1','A006','히알루론산 보습 미스트',15000,100,'건성 타입 미스트','',0,15000),('category1','A007','코코넛 오일 마스크팩',1500,100,'건성 타입 마스크팩','',0,1500),('category1','A008','석류 카렌듈라 세럼',20000,100,'건성 타입 세럼','',0,20000),('category2','B001','로즈마리 피지 케어 토너',14000,100,'지성 타입 토너','',0,14000),('category2','B002','티트리 수분 앰플',16000,100,'지성 타입 앰플','',0,16000),('category2','B003','병풀 수분 크림',24000,100,'지성 타입 크림','',0,24000),('category2','B004','오일컷 세라마이드 클렌징폼',13600,100,'지성 타입 클렌징폼','',20,17000),('category2','B005','티트리 위치하젤 토너 패드',21000,100,'지성 타입 토너패드','',0,21000),('category2','B006','프레시 리셋 미스트',15000,100,'지성 타입 미스트','',0,15000),('category2','B007','카렌듈라 산뜻 마스크팩',1500,100,'지성 타입 마스크팩','',0,1500),('category2','B008','그린티 진정 세럼',20000,100,'지성 타입 세럼','',0,20000),('category3','C001','데일리 캐모마일 토너',11200,100,'중성 타입 토너','',20,14000),('category3','C002','마룰라 탄력 앰플',12800,100,'중성 타입 앰플','',20,16000),('category3','C003','호호바 보습 크림',19200,100,'중성 타입 크림','',20,24000),('category3','C004','알란토인 클렌징폼',13600,100,'중성 타입 클렌징폼','',20,17000),('category3','C005','저자극 밸런스 토너패드',16800,100,'중성 타입 토너패드','',20,21000),('category3','C006','카모마일 진정 미스트',12000,100,'중성 타입 미스트','',20,15000),('category3','C007','알로에 베라 마스크팩',1200,100,'중성 타입 마스크팩','',20,1500),('category3','C008','알로에 보습 세럼',16000,99,'중성 타입 세럼','',20,20000),('category4','D001','살구씨 진정 토너',14000,100,'민감성 타입 토너','',0,14000),('category4','D002','마데카소사이드 진정 앰플',16000,100,'민감성 타입 앰플','',0,16000),('category4','D003','라벤더 수분 진정 크림',24000,100,'민감성 타입 크림','',0,24000),('category4','D004','캐모마일 진정 클렌징폼',17000,100,'민감성 타입 클렌징폼','',0,17000),('category4','D005','라벤더 수분 토너 패드',21000,100,'민감성 타입 토너패드','',0,21000),('category4','D006','알로에베라 미스트',15000,100,'민감성 타입 미스트','',0,15000),('category4','D007','알로에 수분 마스크팩',1500,100,'민감성 타입 마스크팩','',0,1500),('category4','D008','카렌듈라 개선 세럼',20000,100,'민감성 타입 세럼','',0,20000),('category5','E001','듀얼존 밸런스 토너',9800,100,'복합성 타입 토너','',30,14000),('category5','E002','알로에 수분 진정 앰플',16000,100,' 복합성 타입 앰플','',0,16000),('category5','E003','밸런스케어 위치하젤 크림',24000,100,'복합성 타입 크림','',0,24000),('category5','E004','트러블 밸런싱 클렌징폼',17000,100,'복합성 타입 클렌징폼','',0,17000),('category5','E005','듀얼존 케어 토너패드',21000,100,'복합성 타입 토너 패드','',0,21000),('category5','E006','녹차 수분 미스트',15000,100,'복합성 타입 미스트','',0,15000),('category5','E007','티트리 녹차 마스크팩',1500,99,'복합성 타입 마스크팩','',0,1500),('category5','E008','티트리 밸런스 세럼',20000,99,'복합성 타입 세럼','',0,20000);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `managerId` char(8) NOT NULL,
  `managerPasswd` char(8) DEFAULT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('admin','abcd');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memId` varchar(20) NOT NULL,
  `memPasswd` varchar(100) NOT NULL,
  `memName` varchar(50) NOT NULL,
  `memBirth` date DEFAULT NULL,
  `memSolar` char(5) DEFAULT NULL,
  `memAddress` varchar(100) DEFAULT NULL,
  `memPhone` varchar(20) DEFAULT NULL,
  `memSex` char(3) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `detailAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`memId`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('kim','1234','김철수','1988-07-07','음력','서울시 강남구 대치동 100번지','010-7878-2255','남','123123','아파트'),('lee','1234','이현아','2008-01-29','양력','경기 오산시 경기대로 24-5','010-3932-1139','여','18145','아파트');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderinfo` (
  `ordNo` int NOT NULL AUTO_INCREMENT,
  `memId` char(10) DEFAULT NULL,
  `ordDate` char(30) DEFAULT NULL,
  `ordReceiver` char(30) DEFAULT NULL,
  `ordRcvAddress` varchar(200) DEFAULT NULL,
  `ordRcvPhone` char(20) DEFAULT NULL,
  `ordPay` char(20) DEFAULT NULL,
  `ordCardNo` char(16) DEFAULT NULL,
  `ordCardPass` char(10) DEFAULT NULL,
  `ordStatus` varchar(20) DEFAULT '주문완료',
  `paymentkey` varchar(255) DEFAULT NULL,
  `deliveryMemo` varchar(255) DEFAULT '요청사항 없음',
  PRIMARY KEY (`ordNo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfo`
--

LOCK TABLES `orderinfo` WRITE;
/*!40000 ALTER TABLE `orderinfo` DISABLE KEYS */;
INSERT INTO `orderinfo` VALUES (2,'lee','2025-05-12 19:51:45','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','36385','1233213213212313','51','배송 준비중',NULL,'요청사항 없음'),(3,'lee','2025-05-12 20:09:08','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','15800',NULL,NULL,'주문완료','imp_564124429945','요청사항 없음'),(4,'lee','2025-05-12 20:11:33','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','23880',NULL,NULL,'주문완료','imp_313275371787','요청사항 없음'),(5,'lee','2025-05-12 20:15:36','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','34000','1231231312313131','12','주문완료',NULL,'요청사항 없음'),(6,'lee','2025-05-13 19:08:29','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','53800',NULL,NULL,'주문완료','imp_162884622495','요청사항 없음'),(7,'lee','2025-05-13 19:09:48','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','23880',NULL,NULL,'주문완료','imp_312967758482','요청사항 없음'),(8,'kim','2025-05-13 21:19:05','김철수','[123123] 서울시 강남구 대치동 100번지 아파트','010-7878-2255','79866',NULL,NULL,'주문완료','imp_518725357330','요청사항 없음'),(9,'lee','2025-05-14 14:33:59','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','15800','2313131231312312','12','주문완료',NULL,'요청사항 없음'),(10,'lee','2025-05-14 19:44:05','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','29440',NULL,NULL,'주문완료','imp_707421340177','요청사항 없음'),(11,'lee','2025-05-14 19:49:38','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','27000',NULL,NULL,'주문완료','imp_230763597510','요청사항 없음'),(12,'lee','2025-05-14 20:19:13','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','17000','3123123131313131','13','주문완료',NULL,'요청사항 없음'),(13,'kim','2025-05-14 20:49:01','김철수','[06693] 서울 서초구 남부순환로 2103 223','010-7878-2255','51300',NULL,NULL,'주문완료','imp_475320778923','요청사항 없음'),(14,'lee','2025-05-19 13:32:07','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','20100','2312312321123213','12','주문완료',NULL,'요청사항 없음'),(15,'lee','2025-05-19 13:33:18','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','16500','1231321321321321','13','주문완료',NULL,'요청사항 없음'),(16,'lee','2025-05-19 13:35:24','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','16500','1231321213213213','12','주문완료',NULL,'요청사항 없음'),(19,'kim','2025-05-21 19:15:21','김철수','[123123] 서울시 강남구 대치동 100번지 아파트','010-7878-2255','13500','1312312312312312','12','주문완료',NULL,'경비실에 맡겨주세요'),(20,'lee','2025-05-21 19:24:09','이현아','[18145] 경기 오산시 경기대로 24-5 아파트','010-3932-1139','13500',NULL,NULL,'주문완료','imp_825029787966','요청사항 없음'),(21,'kim','2025-05-27 13:25:23','김철수','[123123] 서울시 강남구 대치동 100번지 아파트','010-7878-2255','18000',NULL,NULL,'주문완료','imp_647898253475','요청사항 없음');
/*!40000 ALTER TABLE `orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `ordNo` varchar(30) DEFAULT NULL,
  `prdNo` varchar(10) DEFAULT NULL,
  `ordQty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES ('2','A002',1),('2','A003',1),('2','E007',1),('5','A004',2),('6','A003',1),('6','A004',1),('6','A002',1),('7','A003',1),('8','A003',1),('8','A004',2),('8','A005',1),('8','A002',1),('9','A002',1),('10','A003',1),('10','A002',1),('11','A003',1),('12','A001',1),('13','A004',2),('13','C008',1),('14','A003',1),('15','A003',1),('16','A003',1),('19','A003',1),('20','A003',1),('21','A003',1);
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_coupon`
--

DROP TABLE IF EXISTS `public_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_coupon` (
  `couponCode` varchar(50) NOT NULL,
  `discount` int NOT NULL,
  `expiryDate` date NOT NULL,
  PRIMARY KEY (`couponCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_coupon`
--

LOCK TABLES `public_coupon` WRITE;
/*!40000 ALTER TABLE `public_coupon` DISABLE KEYS */;
INSERT INTO `public_coupon` VALUES ('시크릿쿠폰',25,'2025-05-31');
/*!40000 ALTER TABLE `public_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qnaId` int NOT NULL AUTO_INCREMENT,
  `userId` char(10) NOT NULL,
  `qnaQuestion` text NOT NULL,
  `qnaAnswer` text,
  `qnaStatus` char(10) DEFAULT 'pending',
  `qnaCategory` varchar(20) DEFAULT NULL,
  `qnaDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `qnaAttachment` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qnaId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (7,'kim','건성인데 지성 제품을 써도 괜찮을까요?','가능하지만 지성 제품은 건성 제품보다 건조하기에 고객님께서 건성이시라면 건성타입 제품을 추천드립니다','completed',NULL,'2025-04-16 19:00:44',NULL,'2025-04-16 10:00:44'),(8,'kim','배송 시작을 안 하는데 뭔가 문제가 있나요?','결제 확인시간 11시 전일 경우 당일 주문건으로 처리되어 2~5일(주말제외), 결제 확인시간 11시 이후 일 경우 익일 전문건으로 처리되어 2~5일(주말제외) 정도 소요됩니다.','completed',NULL,'2025-04-16 19:01:16',NULL,'2025-04-16 10:01:16'),(9,'kim','피부타입 테스트는 어떻게 진행하면 되나요?','피부타입 테스트는 고객님께서 평소 하시는 루틴을 바탕으로 답하시면 됩니다!','completed',NULL,'2025-04-16 19:01:40',NULL,'2025-04-16 10:01:40'),(10,'kim','스킨케어 제품을 구매하는것이 처음인데 어떻게 구매하면 되나요?','스킨케어 제품 구매가 처음이시라면 상단에 \"피부관리 처음이라면\" 메뉴를 참고하시는것을 추천드립니다.','completed',NULL,'2025-04-16 19:02:16',NULL,'2025-04-16 10:02:16'),(13,'lee','이벤트에 있는 할인쿠폰 코드는 어디에다 작성하면 되는건가요?','마이페이지 하단에 있는 쿠폰 등록칸에 작성 후 등록 버튼 누르시면 발급됩니다.','completed',NULL,'2025-05-14 20:06:51',NULL,'2025-05-14 11:06:51'),(14,'kim','fjgjfhtg','??안녕하세요 ','completed',NULL,'2025-05-27 13:26:35',NULL,'2025-05-27 04:26:35');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skintest`
--

DROP TABLE IF EXISTS `skintest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skintest` (
  `testNo` varchar(36) NOT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `testDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `skinType` varchar(20) DEFAULT NULL,
  `skinIssue` text,
  `recProductId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`testNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skintest`
--

LOCK TABLES `skintest` WRITE;
/*!40000 ALTER TABLE `skintest` DISABLE KEYS */;
INSERT INTO `skintest` VALUES ('001afe75-4f28-4faf-b026-9218577cd788',NULL,'2025-04-29 17:37:07','지성','',''),('012c9949-43bd-4415-8502-63ce1f678bd7',NULL,'2025-04-08 18:07:22','중성','',''),('0231de8d-1582-477d-b0a1-f575d7f9261a',NULL,'2025-04-19 20:05:56','중성','',''),('054b0137-f0f1-4c15-939c-aa52b395fc84',NULL,'2025-04-09 18:01:35','지성','',''),('08c6ec86-dee7-4814-a85c-b9c2be5e2862',NULL,'2025-05-14 20:26:32','지성','',''),('0cc9e3b0-3b61-47b4-b223-6bdba241df97',NULL,'2025-04-05 21:46:00','민감성','',''),('10135631-7e16-428f-a607-c0d4bc1a476a',NULL,'2025-04-17 12:47:26','지성','',''),('173be206-7b6c-4180-8787-a90b31e72e7d',NULL,'2025-05-24 18:43:57','지성','',''),('1a8de887-ffe4-418f-a7c5-aef9abdfda33',NULL,'2025-03-04 23:23:58','복합성','',''),('1cd1b06c-3f1d-419f-93ea-6486c95f6ea8','kim','2025-03-11 00:23:38','건성','',''),('1e0220f9-b1da-4ecb-8433-18dee1a631e6',NULL,'2025-03-27 21:06:25','중성','',''),('22721e28-45e7-4bc1-a432-6af9616ecc60',NULL,'2025-04-08 20:14:44','중성','',''),('26aa40e0-f9f4-4fdb-94c6-580012b7b4f3',NULL,'2025-03-18 23:01:58','건성','',''),('34a74f74-0043-4300-bf62-9a169e749be1',NULL,'2025-03-11 00:16:36','건성','',''),('3542f50f-809a-4ed9-aed6-3ad7b7536e66','kim','2025-03-27 19:47:16','중성','',''),('3acb5906-0a94-40ff-b5d6-42061c7816de',NULL,'2025-04-10 17:40:48','지성','',''),('3c251ea7-3f04-4b5a-bc3e-02eb09fccd85',NULL,'2025-04-08 21:55:21','지성','',''),('3efde5c4-7137-416a-b5d4-bb8f88962941',NULL,'2025-05-13 20:04:29','지성','',''),('402c86c0-7ffa-4dfb-ac4a-795bcf8dea84',NULL,'2025-04-10 17:43:51','중성','',''),('42794c46-862d-4c0a-a36b-ca85c35b97f7',NULL,'2025-05-24 18:33:44','중성','',''),('486359d9-b16e-4464-be2c-4131fbb3977b',NULL,'2025-05-28 14:57:11','중성','',''),('4dffe19b-5d9f-43b0-98bd-7442fc10316f','user','2025-03-04 22:35:03','ë³µí©ì±','',''),('4e6640d5-9d35-48cf-9b1c-7eb2590ade83',NULL,'2025-04-29 17:36:09','지성','',''),('5620799e-bc60-4240-8d67-98a2000dc0b1',NULL,'2025-05-14 20:26:25','중성','',''),('593726a4-adee-4a14-978a-cd345ebfde3f',NULL,'2025-04-01 23:51:11','중성','',''),('5f0cd25c-56bf-414c-94b8-66524e00f5f8',NULL,'2025-04-08 22:41:47','중성','',''),('60025db7-1188-421b-b18f-bcd8077236ec',NULL,'2025-04-08 22:38:49','중성','',''),('63092654-3ecb-47a1-ba39-dafbe85912e6','testUser','2025-03-04 14:22:24','combination','',''),('640719a1-3a1c-4430-90e1-3247dc04ca3e','lee','2025-05-12 20:17:20','중성','',''),('657e91ba-a0f9-47ba-b15d-ba7bcc8674ff','lee','2025-05-28 12:12:31','중성','',''),('66885830-b15e-481e-9dd1-253afcac1689','testUser','2025-03-04 13:30:49','combination','',''),('67b84a6c-a105-4089-aae9-a59e540b0b38','testUser','2025-03-04 13:42:15','combination','',''),('680f32c5-63e9-41b0-aa8f-fa9f0acfd243','kim','2025-05-24 18:52:05','지성','',''),('765ffa20-8551-4b24-8900-c12fe2f5ff12',NULL,'2025-05-28 12:27:07','민감성','',''),('76acfe78-be1e-4211-8188-5bad0ad1ca96',NULL,'2025-05-24 19:00:59','건성','',''),('76dde2d6-7b33-4867-b5b7-ca005790f77b',NULL,'2025-05-28 12:26:34','지성','',''),('79a3c183-79e7-48ab-a9fb-811e579c5a4a',NULL,'2025-04-05 18:47:29','중성','',''),('7a871a73-9c21-43b5-b032-82dba802fe59',NULL,'2025-03-27 17:36:39','중성','',''),('7b6cad9a-c894-411a-83c7-2ee792ff0311',NULL,'2025-04-08 19:58:18','건성','',''),('7d184de7-bba2-407e-b0c7-c90d23a81e16',NULL,'2025-04-08 22:38:36','건성','',''),('7f2f61f2-89f2-4603-b87c-6649c21d1499',NULL,'2025-04-17 16:06:43','지성','',''),('7f41b751-6f68-474f-af81-bae2b7e3377f',NULL,'2025-05-28 10:49:23','중성','',''),('80571991-f19a-4f60-bbaf-1c2e98eaae94','kim','2025-03-11 00:22:35','건성','',''),('88a0b4f8-4f20-419e-8d8d-1a3c0bf9dc31','user','2025-03-04 22:27:40','ë³µí©ì±','',''),('8b6362ed-9cd6-4aec-9367-85d062d1cfe3','kim','2025-03-19 15:33:19','건성','',''),('917d16a3-05b8-4383-9348-ccf4e0530d0c',NULL,'2025-05-27 13:21:52','민감성','',''),('9b9d8fb8-7752-43ed-a585-09376770b38d',NULL,'2025-04-17 16:11:09','민감성','',''),('9fe6d9f7-67a7-46f8-8491-d6c25a47b0c1','kim','2025-05-24 19:11:54','지성','',''),('a1b8d566-6234-42d9-9aed-72dcb5c244b0',NULL,'2025-05-27 14:47:42','건성','',''),('a1e4071a-9a32-4943-8182-ccbe8b821cfd',NULL,'2025-05-21 20:55:19','민감성','',''),('a2155093-7593-49cb-9e76-887807547ea2','testUser','2025-03-04 22:07:56','combination','',''),('a5e543f7-fb7d-4895-9485-0f079bfbe703',NULL,'2025-04-10 17:29:29','중성','',''),('a8e8f138-7c99-4459-9553-32d49e3b3694',NULL,'2025-05-14 20:26:37','중성','',''),('b3a6d927-66fd-456b-9dc1-a8d7acf1c1fb',NULL,'2025-05-27 10:50:37','중성','',''),('b4890633-290a-4da4-be9c-fbb6846837b6',NULL,'2025-04-09 16:45:12','건성','',''),('b7103b12-f8aa-11ef-acde-2cf05d0d01f1','user123','2025-03-04 12:42:37','지성','여드름, 피지 과다','P003'),('c47c3d69-9c23-4638-9f25-98a25bb3fd14','kim','2025-04-30 14:49:09','지성','',''),('c6149cdc-abdb-4df5-8a73-459db12a091e',NULL,'2025-04-08 18:04:18','건성','',''),('c702ac92-0652-4c1d-8a45-dba4daefa303',NULL,'2025-05-14 20:26:20','중성','',''),('c7abc1e9-6aee-4900-908f-7ca7ed996981',NULL,'2025-05-27 12:30:20','건성','',''),('c9e21528-5b59-4b6c-8ddc-4c29c67bdcec',NULL,'2025-05-14 20:26:42','민감성','',''),('cec667c9-66af-4a43-af7c-78425ec85c59','kim','2025-04-17 20:20:31','중성','',''),('d2119971-9fdb-4687-bfb3-0996f1a10ac4',NULL,'2025-03-27 17:23:28','지성','',''),('d23752cf-2e5d-4039-890d-1205bf23a0e4',NULL,'2025-04-08 18:06:35','중성','',''),('d369a46d-510e-4344-ae8a-1fb90ecef23f',NULL,'2025-05-14 20:26:05','중성','',''),('e0dc64dd-5c93-4250-8365-2bed74ae110b',NULL,'2025-03-27 20:43:52','중성','',''),('e248fece-cb68-49c2-9c29-93eae95c5368',NULL,'2025-04-23 11:53:41','지성','',''),('e2495d5e-afaf-4291-9943-9419fbb6f6c5','kim','2025-04-17 12:32:35','민감성','',''),('e8740931-4625-475c-8e1d-346264c72b60',NULL,'2025-04-01 23:05:53','중성','',''),('f72d5b66-1fc2-43ec-9d9a-ae7950569318','user','2025-03-04 22:23:11','combination','',''),('fb74084a-89a1-4ab9-ac9e-8414cb7702d3','testUser','2025-03-04 14:16:46','combination','','');
/*!40000 ALTER TABLE `skintest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempcart`
--

DROP TABLE IF EXISTS `tempcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempcart` (
  `ctNo` char(40) DEFAULT NULL,
  `prdNo` char(10) DEFAULT NULL,
  `ctQty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempcart`
--

LOCK TABLES `tempcart` WRITE;
/*!40000 ALTER TABLE `tempcart` DISABLE KEYS */;
INSERT INTO `tempcart` VALUES ('C243ABC9FE0927C7C2BEB76C25089C42','A001',1);
/*!40000 ALTER TABLE `tempcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12 16:17:45
