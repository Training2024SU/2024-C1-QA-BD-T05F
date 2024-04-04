CREATE SCHEMA IF NOT EXISTS `zoo_santafe` ;

-- Creación de Tablas --

-- Tabla: alimento --
CREATE TABLE IF NOT EXISTS `alimento` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `dosis` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: animal --
CREATE TABLE IF NOT EXISTS `animal` (
  `id` varchar(30) NOT NULL,
  `id_habitat` varchar(45) NOT NULL,
  `id_dieta` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `especie` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `edad` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_habitat_idx` (`id_habitat`),
  KEY `id_dieta_idx` (`id_dieta`),
  CONSTRAINT `id_dieta` FOREIGN KEY (`id_dieta`) REFERENCES `dieta` (`id`),
  CONSTRAINT `id_habitat` FOREIGN KEY (`id_habitat`) REFERENCES `habitat` (`id`)
);

-- Tabla: asear_habitat --
CREATE TABLE IF NOT EXISTS `asear_habitat` (
  `habitat_id` varchar(45) NOT NULL,
  `empleado_dni` varchar(45) NOT NULL,
  PRIMARY KEY (`habitat_id`,`empleado_dni`),
  KEY `cedula_empleado_idx` (`empleado_dni`),
  CONSTRAINT `empleado_dni` FOREIGN KEY (`empleado_dni`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `habitat_id` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`id`)
);

-- Tabla: consulta --
CREATE TABLE IF NOT EXISTS `consulta` (
  `id` varchar(45) NOT NULL,
  `id_animal` varchar(45) NOT NULL,
  `id_empleado` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `motivo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_empleado_idx` (`id_empleado`),
  KEY `id_animal_idx` (`id_animal`),
  CONSTRAINT `id_animal` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  CONSTRAINT `id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`cedula`)
);

-- Tabla: dieta --
CREATE TABLE IF NOT EXISTS `dieta` (
  `id` varchar(45) NOT NULL,
  `id_alimento` varchar(45) NOT NULL,
  `horario` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `objetivo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_alimento_idx` (`id_alimento`),
  CONSTRAINT `id_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id`)
);

-- Tabla: empleado --
CREATE TABLE IF NOT EXISTS `empleado` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `salario` double NOT NULL,
  `horario` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`)
);

-- Tabla: especialidad_empleado --
CREATE TABLE IF NOT EXISTS `especialidad_empleado` (
  `dni_empleado` varchar(45) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`dni_empleado`),
  CONSTRAINT `dni_empleado` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`cedula`)
);

-- Tabla: factura --
CREATE TABLE IF NOT EXISTS `factura` (
  `id` varchar(45) NOT NULL,
  `id_proveedor` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `total` decimal(20,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`)
);

-- Tabla: habitat --
CREATE TABLE IF NOT EXISTS `habitat` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `clima` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: item_de_orden --
CREATE TABLE IF NOT EXISTS `item_de_orden` (
  `codigo_alimento` varchar(45) NOT NULL,
  `id_orden_compra` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_alimento`),
  KEY `id_orden_compra_idx` (`id_orden_compra`),
  CONSTRAINT `codigo_alimento` FOREIGN KEY (`codigo_alimento`) REFERENCES `alimento` (`id`),
  CONSTRAINT `id_orden_compra` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_de_compra` (`id`)
);

-- Tabla: item_de_factura --
CREATE TABLE IF NOT EXISTS `item_factura` (
  `id_alimento` varchar(45) NOT NULL,
  `id_factura` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(20,0) NOT NULL,
  `precio_total` decimal(20,0) NOT NULL,
  PRIMARY KEY (`id_alimento`,`id_factura`)
);

-- Tabla: orden_de_compra --
CREATE TABLE IF NOT EXISTS `orden_de_compra` (
  `id` varchar(45) NOT NULL,
  `codigo_proveedor` varchar(45) NOT NULL,
  `cedula_empleado` varchar(45) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_id_idx` (`cedula_empleado`),
  KEY `id_proveedor_idx` (`codigo_proveedor`),
  CONSTRAINT `cedula_empleado` FOREIGN KEY (`cedula_empleado`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `codigo_proveedor` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedor` (`id`)
);

-- Tabla: pago --
CREATE TABLE IF NOT EXISTS `pago` (
  `id` varchar(45) NOT NULL,
  `id_factura` varchar(45) DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_factura_idx` (`id_factura`),
  CONSTRAINT `id_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`)
);

-- Tabla: peso --
CREATE TABLE IF NOT EXISTS `peso` (
  `id` varchar(45) NOT NULL,
  `empleado_id` varchar(45) NOT NULL,
  `animal_id` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `peso` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_empleado_idx` (`empleado_id`),
  KEY `id_animal_idx` (`animal_id`),
  CONSTRAINT `animal_id` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`cedula`)
);

-- Tabla: proveedor --
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);
