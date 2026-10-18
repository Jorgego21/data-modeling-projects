-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hoteldb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hoteldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hoteldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hoteldb` ;

-- -----------------------------------------------------
-- Table `hoteldb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `rol` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`habitacion` (
  `id_habitacion` INT NOT NULL AUTO_INCREMENT,
  `numero_habitacion` INT NULL DEFAULT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `Capacidad` INT NULL DEFAULT NULL,
  `estado` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`pagos` (
  `id_pagos` INT NOT NULL AUTO_INCREMENT,
  `id_reserva` INT NULL DEFAULT NULL,
  `fecha_pago` DATETIME NULL DEFAULT NULL,
  `metodo` VARCHAR(255) NULL DEFAULT NULL,
  `monto` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_pagos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`reserva` (
  `id_reserva` INT NOT NULL AUTO_INCREMENT,
  `id_habitacion` INT NULL DEFAULT NULL,
  `id_cliente` INT NULL DEFAULT NULL,
  `id_empleado` INT NULL DEFAULT NULL,
  `id_pago` INT NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `estado` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  INDEX `id_pago` (`id_pago` ASC) VISIBLE,
  INDEX `id_empleado` (`id_empleado` ASC) VISIBLE,
  INDEX `id_habitacion` (`id_habitacion` ASC) VISIBLE,
  CONSTRAINT `reserva_ibfk_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `hoteldb`.`cliente` (`id_cliente`),
  CONSTRAINT `reserva_ibfk_2`
    FOREIGN KEY (`id_pago`)
    REFERENCES `hoteldb`.`pagos` (`id_pagos`),
  CONSTRAINT `reserva_ibfk_3`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `hoteldb`.`empleado` (`id_empleado`),
  CONSTRAINT `reserva_ibfk_4`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `hoteldb`.`habitacion` (`id_habitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`reserva_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`reserva_servicio` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `id_reserva` INT NULL DEFAULT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  INDEX `id_reserva` (`id_reserva` ASC) VISIBLE,
  CONSTRAINT `reserva_servicio_ibfk_1`
    FOREIGN KEY (`id_reserva`)
    REFERENCES `hoteldb`.`reserva` (`id_reserva`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`servicio_adicional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`servicio_adicional` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `nombre_servicio` VARCHAR(255) NULL DEFAULT NULL,
  `costo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  CONSTRAINT `servicio_adicional_ibfk_1`
    FOREIGN KEY (`id_servicio`)
    REFERENCES `hoteldb`.`reserva_servicio` (`id_servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hoteldb`.`temporada_tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`temporada_tarifa` (
  `id_tarifa` INT NOT NULL AUTO_INCREMENT,
  `id_habitacion` INT NULL DEFAULT NULL,
  `precio_base` INT NULL DEFAULT NULL,
  `temporada` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`),
  INDEX `id_habitacion` (`id_habitacion` ASC) VISIBLE,
  CONSTRAINT `temporada_tarifa_ibfk_1`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `hoteldb`.`habitacion` (`id_habitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
