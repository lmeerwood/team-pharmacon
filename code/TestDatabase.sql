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
  `idError` INT(10) NOT NULL AUTO_INCREMENT COMMENT '',
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
-- Table `testdatabase`.`errorEntries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdatabase`.`errorEntries` (
  `idErrorEntries` INT(10) NOT NULL AUTO_INCREMENT COMMENT '',
  `userId` INT(10) NOT NULL COMMENT '',
  `userName` VARCHAR(20) NOT NULL COMMENT '',
  `errorId` INT(10) NOT NULL COMMENT '',
  `errorType` VARCHAR(45) NOT NULL COMMENT '',
  `medicineId` INT(10) NOT NULL COMMENT '',
  `medicineType` VARCHAR(45) NOT NULL COMMENT '',
  `entryTime` TIMESTAMP(6) NOT NULL COMMENT '',
  PRIMARY KEY (`idErrorEntries`)  COMMENT '',
  INDEX `idError_idx` (`errorId` ASC)  COMMENT '',
  CONSTRAINT `idError`
    FOREIGN KEY (`errorId`)
    REFERENCES `testdatabase`.`error` (`idError`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Data for table `testdatabase`.`medicine`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdatabase`;
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Ibuprofen');
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Morphine');
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Codeine');
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Paracetamol');
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Levothroxine');
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Rosuvastatin');
INSERT INTO `testdatabase`.`medicine` (`medicineType`) VALUES ('Ciprofloxacin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `testdatabase`.`error`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdatabase`;
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Quantity');
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Incorrect drug supplied');
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Incorrect directions given');
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Slow release drug provided');
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Immediate release provided');
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Per oral drug provided');
INSERT INTO `testdatabase`.`error` (`errorType`) VALUES ('Given intraveniously');

COMMIT;

-- -----------------------------------------------------
-- Data for table `testdatabase`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `testdatabase`;
insert into user (userName, userType, password, salt) values ('Oliver', 'User', aes_encrypt(concat('password12', 'salt1'), 'key1'), 'salt1');
insert into user (userName, userType, password, salt) values ('Charlotte', 'User', aes_encrypt(concat('password12', 'salt2'), 'key1'), 'salt2');
insert into user (userName, userType, password, salt) values ('Jackson', 'Supervisor', aes_encrypt(concat('password12', 'salt3'), 'key1'), 'salt3');
insert into user (userName, userType, password, salt) values ('Chloe', 'Administrator', aes_encrypt(concat('password12', 'salt4'), 'key1'), 'salt4');

commit;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
