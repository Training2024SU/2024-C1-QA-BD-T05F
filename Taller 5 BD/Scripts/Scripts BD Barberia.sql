-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema barberia_house_man
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `barberia_house_man` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE `barberia_house_man` ;

-- -----------------------------------------------------
-- Table `barberia_house_man`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `cedula_cliente` VARCHAR(12) NOT NULL,
  `nombre_cliente` VARCHAR(45) NOT NULL,
  `apellido_cliente` VARCHAR(45) NOT NULL,
  `profesion` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `edad` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `barberia_house_man`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`especialidad` (
  `id_especialidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `cedula_empleado` VARCHAR(15) NOT NULL,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  `apellido_empleado` VARCHAR(45) NOT NULL,
  `id_especialidad` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `id_especialidad_idx` (`id_especialidad` ASC) VISIBLE,
  CONSTRAINT `id_especialidad`
    FOREIGN KEY (`id_especialidad`)
    REFERENCES `barberia_house_man`.`especialidad` (`id_especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`servicio` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `nombre_servicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE INDEX `nombre_servicio_UNIQUE` (`nombre_servicio` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`cita` (
  `id_cita` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `fecha_y_hora` DATETIME NOT NULL,
  `id_servicio` INT NOT NULL,
  PRIMARY KEY (`id_cita`),
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_servicio_idx` (`id_servicio` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `barberia_house_man`.`cliente` (`id_cliente`),
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `barberia_house_man`.`empleado` (`id_empleado`),
  CONSTRAINT `id_servicio`
    FOREIGN KEY (`id_servicio`)
    REFERENCES `barberia_house_man`.`servicio` (`id_servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`proveedor` (
  `id_proveedor` VARCHAR(12) NOT NULL,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`producto` (
  `ref_producto` VARCHAR(30) NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` INT NOT NULL,
  `id_proveedor` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ref_producto`),
  UNIQUE INDEX `nombre_producto_UNIQUE` (`nombre_producto` ASC) VISIBLE,
  INDEX `id_proveedor_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `id_proveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `barberia_house_man`.`proveedor` (`id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`compra_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`compra_producto` (
  `id_cliente` INT NOT NULL,
  `ref_producto` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_cliente`, `ref_producto`),
  INDEX `ref_producto` (`ref_producto` ASC) VISIBLE,
  CONSTRAINT `compra_producto_ibfk_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `barberia_house_man`.`cliente` (`id_cliente`),
  CONSTRAINT `compra_producto_ibfk_2`
    FOREIGN KEY (`ref_producto`)
    REFERENCES `barberia_house_man`.`producto` (`ref_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`historial_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`historial_servicios` (
  `id_servicio_prestado` INT NOT NULL AUTO_INCREMENT,
  `producto_consumido` VARCHAR(150) NOT NULL,
  `fecha_y_hora` DATETIME NOT NULL,
  `duracion_procedimiento` TIME NOT NULL,
  `id_empleado` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_servicio_prestado`),
  INDEX `historial_servicios_ibfk_1` (`id_empleado` ASC) VISIBLE,
  INDEX `historial_servicios_ibfk_2` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `historial_servicios_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `barberia_house_man`.`empleado` (`id_empleado`),
  CONSTRAINT `historial_servicios_ibfk_2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `barberia_house_man`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`registro_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`registro_venta` (
  `id_registro` INT NOT NULL AUTO_INCREMENT,
  `fecha_y_hora` DATETIME NOT NULL,
  `total` INT NOT NULL,
  `ganancia_ocasional` INT NULL DEFAULT NULL,
  `id_empleado` INT NOT NULL,
  PRIMARY KEY (`id_registro`),
  INDEX `registro_venta_ibfk_1` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `registro_venta_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `barberia_house_man`.`empleado` (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`registro_venta_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`registro_venta_producto` (
  `id_registro` INT NOT NULL,
  `ref_producto` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_registro`, `ref_producto`),
  INDEX `ref_producto` (`ref_producto` ASC) VISIBLE,
  CONSTRAINT `registro_venta_producto_ibfk_1`
    FOREIGN KEY (`id_registro`)
    REFERENCES `barberia_house_man`.`registro_venta` (`id_registro`),
  CONSTRAINT `registro_venta_producto_ibfk_2`
    FOREIGN KEY (`ref_producto`)
    REFERENCES `barberia_house_man`.`producto` (`ref_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`telefono_cliente` (
  `id_cliente` INT NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_cliente`, `telefono`),
  CONSTRAINT `telefono_cliente_ibfk_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `barberia_house_man`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `barberia_house_man`.`telefono_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia_house_man`.`telefono_proveedor` (
  `id_proveedor` VARCHAR(12) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_proveedor`, `telefono`),
  CONSTRAINT `telefono_proveedor_ibfk_1`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `barberia_house_man`.`proveedor` (`id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
