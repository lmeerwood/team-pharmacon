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
-- Table `PETdatabase`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Login` (
  `idLogin` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userName` VARCHAR(45) NOT NULL COMMENT '',
  `userAuthorisation` VARCHAR(20) NOT NULL COMMENT '',
  `userActive` TINYINT(1) NOT NULL COMMENT '',
  `password` VARCHAR(150) NOT NULL COMMENT '',
  `key` VARCHAR(45) NOT NULL COMMENT '',
  `salt` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idLogin`)  COMMENT '',
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Worker` (
  `idWorker` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `workerName` VARCHAR(45) NOT NULL COMMENT '',
  `workerRole` VARCHAR(20) NOT NULL COMMENT '',
  `workerActive` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`idWorker`)  COMMENT '',
  UNIQUE INDEX `workerName_UNIQUE` (`workerName` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`ErrorType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`ErrorType` (
  `idErrorType` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `errorType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idErrorType`)  COMMENT '')
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
  PRIMARY KEY (`idMedication`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Physician` (
  `physicianName` VARCHAR(45) NOT NULL COMMENT '',
  `providerNumber` VARCHAR(15) NOT NULL COMMENT '',
  `physicianComment` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`providerNumber`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Diagnosis` (
  `idDiagnosis` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `diagnosis` VARCHAR(150) NULL COMMENT '',
  `physicianProviderNo` VARCHAR(5) NULL COMMENT '',
  PRIMARY KEY (`idDiagnosis`)  COMMENT '',
  INDEX `providerNumber_idx` (`physicianProviderNo` ASC)  COMMENT '',
  CONSTRAINT `providerNumber`
    FOREIGN KEY (`physicianProviderNo`)
    REFERENCES `PETdatabase`.`Physician` (`providerNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Patient` (
  `patientHospitalId` VARCHAR(20) NOT NULL COMMENT '',
  `patientName` VARCHAR(50) NOT NULL COMMENT '',
  `patientType` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`patientHospitalId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Prescription` (
  `idPrescription` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `medicationID` INT NOT NULL COMMENT '',
  `patientID` VARCHAR(20) NOT NULL COMMENT '',
  `physicianID` VARCHAR(15) NULL COMMENT '',
  `diagnosisID` INT NULL COMMENT '',
  PRIMARY KEY (`idPrescription`)  COMMENT '',
  INDEX `idMedication_idx` (`medicationID` ASC)  COMMENT '',
  INDEX `idDiagnosis_idx` (`diagnosisID` ASC)  COMMENT '',
  INDEX `patientHospitalId_idx` (`patientID` ASC)  COMMENT '',
  INDEX `providerNumber_idx` (`physicianID` ASC)  COMMENT '',
  CONSTRAINT `idMedication`
    FOREIGN KEY (`medicationID`)
    REFERENCES `PETdatabase`.`Medication` (`idMedication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDiagnosis`
    FOREIGN KEY (`diagnosisID`)
    REFERENCES `PETdatabase`.`Diagnosis` (`idDiagnosis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patientHospitalId`
    FOREIGN KEY (`patientID`)
    REFERENCES `PETdatabase`.`Patient` (`patientHospitalId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `providerNumber`
    FOREIGN KEY (`physicianID`)
    REFERENCES `PETdatabase`.`Physician` (`providerNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `errorCausedByWorker` VARCHAR(45) NOT NULL COMMENT '',
  `wasWorkerNotified` TINYINT(1) NOT NULL COMMENT '',
  `wasPhysicianNotified` TINYINT(1) NOT NULL COMMENT '',
  `iimsCompleted` TINYINT(1) NOT NULL COMMENT '',
  `generalComment` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`idError`)  COMMENT '',
  INDEX `idUser_idx` (`userId` ASC)  COMMENT '',
  CONSTRAINT `idUser`
    FOREIGN KEY (`userId`)
    REFERENCES `PETdatabase`.`Worker` (`idWorker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`ErrorType` (`idErrorType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLogin`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`Login` (`idLogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPrescription`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`Prescription` (`idPrescription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
