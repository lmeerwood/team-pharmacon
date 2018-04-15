-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PETdatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PETdatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PETdatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `PETdatabase` ;

-- -----------------------------------------------------
-- Table `PETdatabase`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userName` VARCHAR(45) NOT NULL COMMENT '',
  `userAuthorisation` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`idUser`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Login` (
  `idLogin` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userName` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(150) NOT NULL COMMENT '',
  `key` VARCHAR(45) NOT NULL COMMENT '',
  `salt` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idLogin`)  COMMENT '',
  CONSTRAINT `idUser`
    FOREIGN KEY (`idLogin`)
    REFERENCES `PETdatabase`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Pharmacist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Pharmacist` (
  `idPharmacist` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `pharmacistName` VARCHAR(45) NOT NULL COMMENT '',
  `pharmacistProviderId` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`idPharmacist`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Physician` (
  `idPhysician` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `physicianName` VARCHAR(45) NOT NULL COMMENT '',
  `providerNumber` VARCHAR(15) NOT NULL COMMENT '',
  `physicianComment` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`idPhysician`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `patientName` VARCHAR(50) NOT NULL COMMENT '',
  `patientHospitalId` VARCHAR(20) NOT NULL COMMENT '',
  `patientType` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`idPatient`)  COMMENT '',
  CONSTRAINT `idPhysician`
    FOREIGN KEY (`idPatient`)
    REFERENCES `PETdatabase`.`Physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`ErrorType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`ErrorType` (
  `idErrorType` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `errorType` VARCHAR(45) NOT NULL COMMENT '',
  `generalComment` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`idErrorType`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Error` (
  `idError` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userId` INT NOT NULL COMMENT '',
  `errorDate` DATE NOT NULL COMMENT '',
  `errorTime` TIME(6) NOT NULL COMMENT '',
  `errorDetectedLocation` VARCHAR(25) NOT NULL COMMENT '',
  `iimsCompleted` TINYINT(1) NOT NULL COMMENT '',
  `wasPharmacistNotified` TINYINT(1) NOT NULL COMMENT '',
  `wasPhysicianNotified` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`idError`)  COMMENT '',
  INDEX `idUser_idx` (`userId` ASC)  COMMENT '',
  CONSTRAINT `idPharmacist`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`Pharmacist` (`idPharmacist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUser`
    FOREIGN KEY (`userId`)
    REFERENCES `PETdatabase`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`ErrorType` (`idErrorType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Medication` (
  `idMedication` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `medicationName` VARCHAR(45) NOT NULL COMMENT '',
  `medicationType` VARCHAR(45) NOT NULL COMMENT '',
  `errorTypeId` INT NOT NULL COMMENT '',
  `patientId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idMedication`)  COMMENT '',
  INDEX `idErrorType_idx` (`errorTypeId` ASC)  COMMENT '',
  INDEX `idPatient_idx` (`patientId` ASC)  COMMENT '',
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`errorTypeId`)
    REFERENCES `PETdatabase`.`ErrorType` (`idErrorType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`patientId`)
    REFERENCES `PETdatabase`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPhysician`
    FOREIGN KEY (`idMedication`)
    REFERENCES `PETdatabase`.`Physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Diagnosis` (
  `idDiagnosis` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `diagnosis` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`idDiagnosis`)  COMMENT '',
  CONSTRAINT `idPhysician`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `PETdatabase`.`Physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `PETdatabase`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
