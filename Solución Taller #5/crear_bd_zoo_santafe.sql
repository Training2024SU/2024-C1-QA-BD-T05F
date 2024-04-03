CREATE SCHEMA `zoo_santafe` ;

-- Crear tabla alimento
CREATE TABLE `alimento` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `dosis` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Crear tabla animal

CREATE TABLE `animal` (
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

-- Crear tabla asear_habitat
CREATE TABLE `asear_habitat` (
  `habitat_id` varchar(45) NOT NULL,
  `empleado_dni` varchar(45) NOT NULL,
  PRIMARY KEY (`habitat_id`,`empleado_dni`),
  KEY `cedula_empleado_idx` (`empleado_dni`),
  CONSTRAINT `empleado_dni` FOREIGN KEY (`empleado_dni`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `habitat_id` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`id`)
);

-- Crear tabla consulta
CREATE TABLE `consulta` (
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

-- Crear tabla dieta
CREATE TABLE `dieta` (
  `id` varchar(45) NOT NULL,
  `id_alimento` varchar(45) NOT NULL,
  `horario` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `objetivo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_alimento_idx` (`id_alimento`),
  CONSTRAINT `id_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id`)
);

-- Crear tabla empleado
CREATE TABLE `empleado` (
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

-- Crear tabla especialidad_empleado
CREATE TABLE `especialidad_empleado` (
  `dni_empleado` varchar(45) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`dni_empleado`),
  CONSTRAINT `dni_empleado` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`cedula`)
);

-- Crear tabla factura
CREATE TABLE `factura` (
  `id` varchar(45) NOT NULL,
  `id_proveedor` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `total` decimal(20,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`)
);

-- Crear tabla habitat
CREATE TABLE `habitat` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `clima` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Crear tabla item_de_orden
CREATE TABLE `item_de_orden` (
  `codigo_alimento` varchar(45) NOT NULL,
  `id_orden_compra` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_alimento`),
  KEY `id_orden_compra_idx` (`id_orden_compra`),
  CONSTRAINT `codigo_alimento` FOREIGN KEY (`codigo_alimento`) REFERENCES `alimento` (`id`),
  CONSTRAINT `id_orden_compra` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_de_compra` (`id`)
);

-- Crear tabla item_de_factura
CREATE TABLE `item_factura` (
  `id_alimento` varchar(45) NOT NULL,
  `id_factura` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(20,0) NOT NULL,
  `precio_total` decimal(20,0) NOT NULL,
  PRIMARY KEY (`id_alimento`,`id_factura`)
);

-- Crear tabla orden_de_compra
CREATE TABLE `orden_de_compra` (
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

-- Crear tabla pago
CREATE TABLE `pago` (
  `id` varchar(45) NOT NULL,
  `id_factura` varchar(45) DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_factura_idx` (`id_factura`),
  CONSTRAINT `id_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`)
);

-- Crear tabla peso
CREATE TABLE `peso` (
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

-- Crear tabla proveedor
CREATE TABLE `proveedor` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci