-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: zoologico
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `ID` varchar(10) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  `ID_proveedor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_proveedor` (`ID_proveedor`),
  CONSTRAINT `alimento_ibfk_1` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES ('AL1','Carne de res','Carne','Carne de res fresca y magra','P1'),('AL10','Hojas de eucalipto','Forraje','Hojas frescas de eucalipto para koalas','P1'),('AL11','Ratas congeladas','Roedor','Ratas congeladas como alimento para serpientes','P2'),('AL12','Naranjas','Fruta','Naranjas frescas y jugosas','P2'),('AL13','Ratones vivos','Roedor','Ratones vivos como alimento para aves rapaces','P2'),('AL14','Bambu','Planta','Bambu fresco y crujiente para pandas','P2'),('AL15','Gusanos de seda','Insecto','Gusanos de seda vivos y nutritivos','P3'),('AL16','Pienso en escamas','Pienso','Pienso en escamas para peces tropicales','P3'),('AL17','Carne de pollo','Carne','Carne de pollo magra y sin huesos','P3'),('AL18','Semillas de girasol','Semilla','Semillas de girasol como golosina para pajaros','P3'),('AL19','Algas marinas','Alga','Algas marinas frescas y nutritivas para tortugas','P3'),('AL2','Heno de alfalfa','Forraje','Heno de alfalfa para herbivoros','P1'),('AL20','Pienso granulado','Pienso','Pienso granulado para animales pequenos','P3'),('AL3','Pescado blanco','Pescado EN ALGUNAS OCASIONES HUMEDA','Pescado blanco fresco y sin espinas','P1'),('AL4','Frutas tropicales','Fruta','Mezcla de frutas tropicales frescas','P1'),('AL5','Vegetales frescos','Verdura','Mezcla de vegetales frescos y crujientes','P1'),('AL6','Nectar de flores','Nectar','Nectar natural de diferentes flores','P1'),('AL7','Insectos vivos','Insecto','Mezcla de insectos vivos y crujientes','P7'),('AL8','Hierbas aromaticas','Hierba','Mezcla de hierbas frescas y aromaticas','P1'),('AL9','Granulos de pienso','Pienso','Granulos de pienso balanceado para herbivoros','P1');
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `ID` varchar(10) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Clasificacion` varchar(10) NOT NULL,
  `Peso` varchar(10) NOT NULL,
  `ID_entrenador` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_entrenador` (`ID_entrenador`),
  CONSTRAINT `animales_ibfk_1` FOREIGN KEY (`ID_entrenador`) REFERENCES `empleado` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES ('A1','Leon','Mamifero','200 kg','E2'),('A10','Tortuga','Reptil','50 kg','E12'),('A11','Aguila','Ave','9 kg','E16'),('A12','Aguila','Ave','8 kg','E16'),('A13','Tiburon','pez','350 kg','E2'),('A14','Hipopotamo','Mamifero','1800 kg','E5'),('A15','Hipopotamo','Mamifero','1800 kg','E2'),('A16','Tiburon','Pez','400 kg','E2'),('A17','Oso de anteojos','Mamifero','300 kg','E10'),('A18','Tortuga marina','Reptil','200 kg','E12'),('A19','pez payaso','peces','0.1 kg','E19'),('A2','Leon','Mamifero','250 kg','E5'),('A20','pez payaso','peces','0.1 kg','E2'),('A21','Buho','Ave','7 kg','E10'),('A3','Elefante','Mamifero','5000 kg','E5'),('A4','Jirafa','Mamifero','1200 kg','E2'),('A5','Leopardo','Mamifero','60 kg','E7'),('A6','Elefante','Mamifero','4000 kg','E10'),('A7','Jirafa','Mamifero','1100 kg','E2'),('A8','Cocodrilo','Reptil','1000 kg','E10'),('A9','Serpiente','Reptil','10 kg','E12');
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comida`
--

DROP TABLE IF EXISTS `comida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comida` (
  `ID_animal` varchar(10) NOT NULL,
  `ID_alimento` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_animal`,`ID_alimento`),
  KEY `ID_alimento` (`ID_alimento`),
  CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`ID_animal`) REFERENCES `animales` (`ID`),
  CONSTRAINT `comida_ibfk_2` FOREIGN KEY (`ID_alimento`) REFERENCES `alimento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comida`
--

LOCK TABLES `comida` WRITE;
/*!40000 ALTER TABLE `comida` DISABLE KEYS */;
INSERT INTO `comida` VALUES ('A1','AL1'),('A2','AL1'),('A5','AL1'),('A8','AL1'),('A11','AL11'),('A12','AL11'),('A9','AL11'),('A19','Al16'),('A20','Al16'),('A1','AL17'),('A2','AL17'),('A5','AL17'),('A8','AL17'),('A13','Al3'),('A10','Al5'),('A14','Al5'),('A15','Al5'),('A3','Al5'),('A4','Al5'),('A7','Al5');
/*!40000 ALTER TABLE `comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `ID` varchar(10) NOT NULL,
  `Fecha` date NOT NULL,
  `ID_animal` varchar(10) NOT NULL,
  `ID_empleado` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_animal` (`ID_animal`),
  KEY `ID_empleado` (`ID_empleado`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`ID_animal`) REFERENCES `animales` (`ID`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`ID_empleado`) REFERENCES `empleado` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES ('C01','2024-04-04','A17','E10'),('C02','2024-04-10','A10','E12'),('C03','2024-04-07','A9','E12'),('C04','2024-04-16','A16','E2'),('C05','2024-04-12','A12','E16'),('C06','2024-04-09','A6','E10'),('C07','2024-04-09','A10','E12'),('C08','2024-04-07','A2','E5'),('C09','2024-04-08','A1','E2'),('C10','2024-04-03','A15','E2'),('C11','2024-04-15','A13','E2'),('C12','2024-04-13','A15','E2'),('C13','2024-04-13','A2','E5'),('C14','2024-04-14','A1','E2'),('C15','2024-04-17','A5','E7'),('C16','2024-04-16','A2','E5'),('C17','2024-04-05','A20','E2'),('C18','2024-04-16','A7','E2'),('C19','2024-04-03','A5','E7'),('C20','2024-04-02','A17','E10');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieta`
--

DROP TABLE IF EXISTS `dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieta` (
  `ID` varchar(10) NOT NULL,
  `Descripcion` varchar(40) DEFAULT NULL,
  `Dosis` varchar(10) DEFAULT NULL,
  `ID_veterinario` varchar(10) DEFAULT NULL,
  `ID_animal` varchar(10) DEFAULT NULL,
  `ID_alimento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_veterinario` (`ID_veterinario`),
  KEY `ID_animal` (`ID_animal`),
  KEY `ID_alimento` (`ID_alimento`),
  CONSTRAINT `dieta_ibfk_1` FOREIGN KEY (`ID_veterinario`) REFERENCES `empleado` (`ID`),
  CONSTRAINT `dieta_ibfk_2` FOREIGN KEY (`ID_animal`) REFERENCES `animales` (`ID`),
  CONSTRAINT `dieta_ibfk_3` FOREIGN KEY (`ID_alimento`) REFERENCES `alimento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieta`
--

LOCK TABLES `dieta` WRITE;
/*!40000 ALTER TABLE `dieta` DISABLE KEYS */;
INSERT INTO `dieta` VALUES ('D1','Dieta para leones','200g','E4','A1','AL1'),('D10','Dieta para gorilas','500g','E14','A10','AL10'),('D11','Dieta para serpientes','100g','E16','A11','AL11'),('D12','Dieta para osos','400g','E18','A12','AL12'),('D13','Dieta para aves rapaces','300g','E2','A13','AL13'),('D14','Dieta para koalas','200g','E5','A14','AL14'),('D15','Dieta para tortugas','100g','E15','A15','AL15'),('D16','Dieta para pandas','600g','E17','A16','AL16'),('D17','Dieta para suricatas','150g','E18','A17','AL17'),('D18','Dieta para hipopótamos','800g','E20','A18','AL18'),('D19','Dieta para rinocerontes','900g','E2','A19','AL19'),('D2','Dieta para elefantes','5kg','E5','A2','AL2'),('D20','Dieta para peces','50g','E5','A20','AL20'),('D3','Dieta para pingüinos','100g','E6','A3','AL3'),('D4','Dieta para tigres','300g','E7','A4','AL4'),('D5','Dieta para jirafas','7kg','E8','A5','AL5'),('D6','Dieta para monos','150g','E10','A6','AL6'),('D7','Dieta para cocodrilos','400g','E2','A7','AL7'),('D8','Dieta para canguros','250g','E4','A8','AL8'),('D9','Dieta para delfines','1kg','E12','A9','AL9');
/*!40000 ALTER TABLE `dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID` varchar(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `fecha_nac` date NOT NULL,
  `salario` int NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('E1','Juan Pérez','1985-07-15',2500,'Gerente','Calle 123, Ciudad','5551234','juan@mail.com'),('E10','Marcela Torres','1995-02-08',2250,'Entrenador','Calle 321, Pueblo','5550123','marcela@mail.com'),('E11','Luisa Ramírez','1990-11-05',2600,'cuidador','Carrera 10, Ciudad','5552468','luisa@mail.com'),('E12','Diego Sánchez','1987-07-20',2800,'Entrenador','Avenida 15, Pueblo','5551357','diego@mail.com'),('E13','Carolina Herrera','1993-04-18',2450,'Veterinaria','Calle 20, Ciudad','5553698','carolina@mail.com'),('E14','Roberto Martín','1985-12-30',2700,'Logistico','Ruta 5, Pueblo','5558024','roberto@mail.com'),('E15','Valeria Gutiérrez','1988-09-15',2300,'Veterinaria','Avenida 25, Ciudad','5559753','valeria@mail.com'),('E16','Gabriel Díaz','1992-06-12',2550,'Entrenador','Calle 30, Pueblo','5557412','gabriel@mail.com'),('E17','Isabel Jiménez','1986-08-28',2750,'Veterinaria','Avenida 35, Ciudad','5553692','isabel@mail.com'),('E18','Francisco Ruiz','1994-03-22',2400,'Cuidador','Carrera 40, Pueblo','5558023','francisco@mail.com'),('E19','Camila Vargas','1991-10-17',2650,'Entrenadora','Ruta 55, Ciudad','5551478','camila@mail.com'),('E2','María García','1990-02-28',2200,'Entrenador','Av. Principal, Pueblo','5555678','mariaG@mail.com'),('E20','Alejandro Castro','1989-04-05',2300,'Veterinario','Avenida 60, Pueblo','5559632','alejandro@mail.com'),('E3','Carlos Ruiz','1988-11-10',2800,'Logistico','Calle 456, Ciudad','5559012','carlosruiz@mail.com'),('E4','Laura Martínez','1987-09-03',2600,'Veterinario','Av. Central, Pueblo','5553456','lmartinez@mail.com'),('E5','Andrés López','1993-04-20',2300,'Entrenador','Calle 789, Ciudad','5557890','andres@maile.com'),('E6','Ana Gómez','1984-12-12',2700,'Veterinario','Calle 987, Pueblo','5556789','ana@mail.com'),('E7','Pedro López','1991-08-25',2400,'Entrenador','Av. Libertad, Ciudad','5552345','pedro@mail.com'),('E8','Sofía Rodríguez','1989-03-17',2900,'Cuidador','Calle 654, Pueblo','5554567','sofia@mail.com'),('E9','Javier Fernández','1986-06-30',2550,'Veterinario','Av. Principal, Ciudad','5557891','javier@mail.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad_empleado`
--

DROP TABLE IF EXISTS `especialidad_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad_empleado` (
  `Id_empleado` varchar(10) NOT NULL,
  `especialidad` varchar(20) NOT NULL,
  KEY `Id_empleado` (`Id_empleado`),
  CONSTRAINT `especialidad_empleado_ibfk_1` FOREIGN KEY (`Id_empleado`) REFERENCES `empleado` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad_empleado`
--

LOCK TABLES `especialidad_empleado` WRITE;
/*!40000 ALTER TABLE `especialidad_empleado` DISABLE KEYS */;
INSERT INTO `especialidad_empleado` VALUES ('E4','animales grandes'),('E4','Cirugía'),('E6','animales pequeños'),('E6','Nutrición'),('E6','fauna silvestre'),('E7','felinos'),('E9','fauna silvestre'),('E9','Cirugía'),('E9','Cirugía'),('E9','animales pequeños'),('E10','aves'),('E12','aves'),('E13','Aves'),('E15','Peces Grandes'),('E15','Peces pequeños'),('E16','Entrenador felinos'),('E17','animales grandes'),('E17','animales grandes'),('E20','Cirugía veterinaria'),('E20','Nutrición');
/*!40000 ALTER TABLE `especialidad_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `ID` varchar(10) NOT NULL,
  `Valor` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Estado` varchar(10) DEFAULT NULL,
  `ID_empleado` varchar(10) DEFAULT NULL,
  `ID_proveedor` varchar(10) DEFAULT NULL,
  `ID_orden` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_empleado` (`ID_empleado`),
  KEY `ID_proveedor` (`ID_proveedor`),
  KEY `ID_orden` (`ID_orden`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_empleado`) REFERENCES `empleado` (`ID`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedor` (`ID`),
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`ID_orden`) REFERENCES `orden_de_compra` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('F1',15000,'2024-04-01','Pendiente','E1','P1','OC1'),('F10',28000,'2024-04-10','Pagada','E1','P2','OC10'),('F11',23000,'2024-04-11','Pendiente','E1','P3','OC11'),('F12',26000,'2024-04-12','Pagada','E1','P1','OC12'),('F13',32000,'2024-04-13','Pendiente','E1','P1','OC13'),('F14',27000,'2024-04-14','Pagada','E1','P2','OC14'),('F15',30000,'2024-04-15','Pendiente','E1','P2','OC15'),('F16',24000,'2024-04-16','Pagada','E1','P3','OC16'),('F17',29000,'2024-04-17','Pendiente','E1','P3','OC17'),('F18',31000,'2024-04-18','Pagada','E1','P3','OC18'),('F19',33000,'2024-04-19','Pendiente','E1','P1','OC19'),('F2',20000,'2024-04-02','Pagada','E1','P1','OC2'),('F20',34000,'2024-04-20','Pagada','E1','P1','OC20'),('F3',30000,'2024-04-03','Pendiente','E1','P1','OC3'),('F4',25000,'2024-04-04','Pagada','E1','P1','OC4'),('F5',18000,'2024-04-05','Pendiente','E1','P2','OC5'),('F6',22000,'2024-04-06','Pagada','E1','P2','OC6'),('F7',27000,'2024-04-07','Pendiente','E1','P1','OC7'),('F8',19000,'2024-04-08','Pagada','E1','P1','OC8'),('F9',21000,'2024-04-09','Pendiente','E1','P1','OC9');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_compra`
--

DROP TABLE IF EXISTS `orden_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_compra` (
  `ID` varchar(10) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `ID_empleado` varchar(10) DEFAULT NULL,
  `ID_proveedor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_empleado` (`ID_empleado`),
  KEY `ID_proveedor` (`ID_proveedor`),
  CONSTRAINT `orden_de_compra_ibfk_1` FOREIGN KEY (`ID_empleado`) REFERENCES `empleado` (`ID`),
  CONSTRAINT `orden_de_compra_ibfk_2` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_compra`
--

LOCK TABLES `orden_de_compra` WRITE;
/*!40000 ALTER TABLE `orden_de_compra` DISABLE KEYS */;
INSERT INTO `orden_de_compra` VALUES ('OC1','2024-04-01','E8','P1'),('OC10','2024-04-10','E18','P2'),('OC11','2024-04-11','E8','P3'),('OC12','2024-04-12','E11','P1'),('OC13','2024-04-13','E11','P1'),('OC14','2024-04-14','E11','P2'),('OC15','2024-04-15','E18','P2'),('OC16','2024-04-16','E8','P3'),('OC17','2024-04-17','E8','P3'),('OC18','2024-04-18','E18','P3'),('OC19','2024-04-19','E11','P1'),('OC2','2024-04-02','E8','P1'),('OC20','2024-04-20','E11','P1'),('OC3','2024-04-03','E11','P1'),('OC4','2024-04-04','E11','P1'),('OC5','2024-04-05','E8','P2'),('OC6','2024-04-06','E11','P2'),('OC7','2024-04-07','E18','P1'),('OC8','2024-04-08','E18','P1'),('OC9','2024-04-09','E8','P1');
/*!40000 ALTER TABLE `orden_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_orden` varchar(10) DEFAULT NULL,
  `ID_alimento` varchar(10) DEFAULT NULL,
  `Cantidad` varchar(20) DEFAULT NULL,
  KEY `ID_orden` (`ID_orden`),
  KEY `ID_alimento` (`ID_alimento`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_orden`) REFERENCES `orden_de_compra` (`ID`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`ID_alimento`) REFERENCES `alimento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('OC1','AL1','50'),('OC2','AL3','30'),('OC3','AL2','100'),('OC4','AL4','80'),('OC5','AL7','200'),('OC6','AL8','40'),('OC7','AL12','60'),('OC8','AL11','150'),('OC9','AL6','70'),('OC10','AL9','90'),('OC11','AL5','120'),('OC12','AL17','110'),('OC13','AL17','75'),('OC14','AL13','200'),('OC15','AL19','85'),('OC16','AL15','60'),('OC17','AL1','90'),('OC18','AL19','110'),('OC19','AL9','75'),('OC20','AL2','100');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID` varchar(10) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Especialidad` varchar(40) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('P1','Tierragro','Mamiferos','mascotas y aves'),('P10','FurryFriends','Mamiferos, Aves','Alimentos y juguetes para mascotas'),('P11','FeatheredFriends','Aves','Alimentos  aves'),('P12','ReptileHaven','Mamiferos, Peces','Reptiles y alimentos'),('P13','PawPrints','Mamiferos, Peces','Productos personalizados'),('P14','FinsAndScales','Peces','Peces tropicales y alimentos'),('P15','CritterCare','Mamiferos','Productos para mascotas'),('P16','TailWaggers','Mamiferos','Alimentos y accesorios para perros'),('P17','PurrFect','Mamiferos, Aves','Productos para gatos y aves'),('P18','WhiskerWonders','Mamiferos, Aves','Juguetes para gatos y aves'),('P19','WildWings','Aves','Alimentos y accesorios para aves'),('P2','VetSupplies Ltd.','Mamiferos','Alimentos mascotas'),('P20','FurFeathers','Mamiferos, Peces','Productos para mascotas'),('P3','HabitatWorld S.A.','Peces','Alimentos peces'),('P4','PetPharma','Mamiferos','Medicamentos y suplementos'),('P5','AquaTerra','Peces','Acuarios y alimentos para peces'),('P6','PlushPets','Mamiferos','Juguetes y accesorios para mascotas'),('P7','GreenGrass','Mamiferos, Aves','Plantas y suministros de jardin'),('P8','BirdieSupplies','Aves','Alimentospara aves'),('P9','ExoticPets','Mamiferos, Aves','Animales exoticos y alimentos');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 16:09:09
