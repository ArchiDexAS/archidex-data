-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pokemon` (
  `idPokedex` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `generation` INT NULL,
  PRIMARY KEY (`idPokedex`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Type` (
  `idType` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pokemon_has_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pokemon_has_Type` (
  `Pokemon_idPokedex` INT NOT NULL,
  `Type_idType` INT NOT NULL,
  PRIMARY KEY (`Pokemon_idPokedex`, `Type_idType`),
  INDEX `fk_Pokemon_has_Type_Type1_idx` (`Type_idType` ASC) VISIBLE,
  INDEX `fk_Pokemon_has_Type_Pokemon1_idx` (`Pokemon_idPokedex` ASC) VISIBLE,
  CONSTRAINT `fk_Pokemon_has_Type_Pokemon1`
    FOREIGN KEY (`Pokemon_idPokedex`)
    REFERENCES `mydb`.`Pokemon` (`idPokedex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_has_Type_Type1`
    FOREIGN KEY (`Type_idType`)
    REFERENCES `mydb`.`Type` (`idType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Type_vs_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Type_vs_Type` (
  `Type_idType` INT NOT NULL,
  `Type_idType1` INT NOT NULL,
  `value` FLOAT NULL,
  PRIMARY KEY (`Type_idType`, `Type_idType1`),
  INDEX `fk_Type_has_Type_Type2_idx` (`Type_idType1` ASC) VISIBLE,
  INDEX `fk_Type_has_Type_Type1_idx` (`Type_idType` ASC) VISIBLE,
  CONSTRAINT `fk_Type_has_Type_Type1`
    FOREIGN KEY (`Type_idType`)
    REFERENCES `mydb`.`Type` (`idType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Type_has_Type_Type2`
    FOREIGN KEY (`Type_idType1`)
    REFERENCES `mydb`.`Type` (`idType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

