-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema testdatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema testdatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `testdatabase` DEFAULT CHARACTER SET utf8 ;
USE `testdatabase` ;

-- -----------------------------------------------------
-- Table `testdatabase`.`medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdatabase`.`medicine` (
  `idMedicine` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `medicineType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idMedicine`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testdatabase`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdatabase`.`user` (
  `idUser` INT(10) NOT NULL AUTO_INCREMENT COMMENT '',
  `userName` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `userType` VARCHAR(15) NULL DEFAULT NULL COMMENT '',
  `password` CHAR(150) NULL DEFAULT NULL COMMENT '',
  `salt` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idUser`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `testdatabase`.`error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdatabase`.`error` (
  `idError` INT(10) NOT NULL COMMENT '',
  `errorType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idError`)  COMMENT '',
  CONSTRAINT `idMedicine`
    FOREIGN KEY (`idError`)
    REFERENCES `testdatabase`.`medicine` (`idMedicine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUser`
    FOREIGN KEY (`idError`)
    REFERENCES `testdatabase`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testdatabase`.`errorentries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdatabase`.`errorentries` (
  `idErrorEntries` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `userName` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `errorType` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `medicineType` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `entryDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`idErrorEntries`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Data for table `testdatabase`.`error`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdatabase`;
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (1, 'Quantity');
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (2, 'Incorrect drug supplied');
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (3, 'Incorrect directions given');
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (4, 'Slow release drug provided');
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (5, 'Immediate release provided');
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (6, 'Per oral drug provided');
INSERT INTO `testdatabase`.`error` (`idError`, `errorType`) VALUES (7, 'Given intraveniously');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
