-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `Biblioteca` ;

-- -----------------------------------------------------
-- Table `Biblioteca`.`Funcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Funcion` (
  `idFuncion` INT NOT NULL,
  `Funcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`EstadoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`EstadoUsuario` (
  `idEstado_Usuario` INT NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Funcion_idFuncion` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `EstadoUsuario_idEstado_Usuario` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `Funcion_idFuncion`, `EstadoUsuario_idEstado_Usuario`),
  INDEX `fk_Usuario_Funcion2_idx` (`Funcion_idFuncion` ASC) VISIBLE,
  INDEX `fk_Usuario_EstadoUsuario1_idx` (`EstadoUsuario_idEstado_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Funcion2`
    FOREIGN KEY (`Funcion_idFuncion`)
    REFERENCES `Biblioteca`.`Funcion` (`idFuncion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_EstadoUsuario1`
    FOREIGN KEY (`EstadoUsuario_idEstado_Usuario`)
    REFERENCES `Biblioteca`.`EstadoUsuario` (`idEstado_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Editorial` (
  `idEditorial` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEditorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Autor` (
  `idAutor` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Nacionalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Estado` (
  `idEstado` INT NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Libro` (
  `idLibro` INT NOT NULL,
  `Autor_idAutor` INT NOT NULL,
  `Editorial_idEditorial` INT NOT NULL,
  `Titulo` NVARCHAR(50) NOT NULL,
  `Fecha_de_publicacion` DATE NOT NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idLibro`, `Autor_idAutor`, `Editorial_idEditorial`, `Estado_idEstado`),
  INDEX `fk_Libro_Autor2_idx` (`Autor_idAutor` ASC) VISIBLE,
  INDEX `fk_Libro_Editorial1_idx` (`Editorial_idEditorial` ASC) VISIBLE,
  INDEX `fk_Libro_Estado2_idx` (`Estado_idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_Autor2`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `Biblioteca`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libro_Editorial1`
    FOREIGN KEY (`Editorial_idEditorial`)
    REFERENCES `Biblioteca`.`Editorial` (`idEditorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libro_Estado2`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `Biblioteca`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`EstadoPrestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`EstadoPrestamo` (
  `idEstadoPrestamo` INT NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadoPrestamo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Prestamo` (
  `idPrestamo` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Libro_idLibro` INT NOT NULL,
  `Fecha_Prestamo` DATE NOT NULL,
  `Fecha_Devolucion` DATE NOT NULL,
  `EstadoPrestamo_idEstadoPrestamo` INT NOT NULL,
  PRIMARY KEY (`idPrestamo`, `Usuario_idUsuario`, `Libro_idLibro`, `EstadoPrestamo_idEstadoPrestamo`),
  INDEX `fk_Prestamo_Libro1_idx` (`Libro_idLibro` ASC) VISIBLE,
  INDEX `fk_Prestamo_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Prestamo_EstadoPrestamo1_idx` (`EstadoPrestamo_idEstadoPrestamo` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamo_Libro1`
    FOREIGN KEY (`Libro_idLibro`)
    REFERENCES `Biblioteca`.`Libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Biblioteca`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_EstadoPrestamo1`
    FOREIGN KEY (`EstadoPrestamo_idEstadoPrestamo`)
    REFERENCES `Biblioteca`.`EstadoPrestamo` (`idEstadoPrestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
