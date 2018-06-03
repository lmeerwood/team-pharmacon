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
CREATE SCHEMA IF NOT EXISTS `PETdatabase` DEFAULT CHARACTER SET utf8 ;
USE `PETdatabase` ;

-- -----------------------------------------------------
-- Table `PETdatabase`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Login` (
  `idLogin` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `userAuthorisation` VARCHAR(20) NOT NULL,
  `userActive` TINYINT(1) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `key` VARCHAR(45) NOT NULL,
  `salt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLogin`),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Worker` (
  `idWorker` INT NOT NULL AUTO_INCREMENT,
  `workerFirstName` VARCHAR(45) NOT NULL,
  `workerSurname` VARCHAR(45) NOT NULL,
  `workerRole` VARCHAR(20) NOT NULL,
  `workerActive` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idWorker`),
  UNIQUE INDEX `workerName_UNIQUE` (`workerFirstName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`ErrorType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`ErrorType` (
  `idErrorType` INT NOT NULL AUTO_INCREMENT,
  `errorType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idErrorType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Medication` (
  `idMedication` INT NOT NULL AUTO_INCREMENT,
  `medicationName` VARCHAR(45) NOT NULL,
  `medicationType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedication`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Diagnosis` (
  `idDiagnosis` INT NOT NULL AUTO_INCREMENT,
  `diagnosis` VARCHAR(150) NULL,
  PRIMARY KEY (`idDiagnosis`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Physician` (
  `idPhysician` INT NOT NULL,
  `physicianSurname` VARCHAR(45) NOT NULL,
  `physicianFirstName` VARCHAR(45) NOT NULL,
  `providerNumber` VARCHAR(15) NOT NULL,
  `physicianComment` VARCHAR(150) NULL,
  PRIMARY KEY (`idPhysician`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Patient` (
  `idPatient` INT NOT NULL,
  `patientHospitalId` VARCHAR(20) NOT NULL,
  `patientSurname` VARCHAR(45) NOT NULL,
  `patientFirstName` VARCHAR(45) NOT NULL,
  `patientType` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Prescription` (
  `idPrescription` INT NOT NULL AUTO_INCREMENT,
  `medicationID` INT NOT NULL,
  `patientID` INT NOT NULL,
  `physicianID` INT NULL,
  `diagnosisID` INT NULL,
  PRIMARY KEY (`idPrescription`),
  INDEX `idMedication_idx` (`medicationID` ASC),
  INDEX `idDiagnosis_idx` (`diagnosisID` ASC),
  INDEX `providerNumber_idx` (`physicianID` ASC),
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
  CONSTRAINT `idPhysician`
    FOREIGN KEY (`physicianID`)
    REFERENCES `PETdatabase`.`Physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`patientID`)
    REFERENCES `PETdatabase`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Severity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Severity` (
  `idSeverity` INT NOT NULL AUTO_INCREMENT,
  `level` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idSeverity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Error` (
  `idError` INT NOT NULL AUTO_INCREMENT,
  `errorDate` DATE NOT NULL,
  `errorTime` TIME(6) NOT NULL,
  `errorTypeId` INT NOT NULL,
  `errorDetectedLocation` VARCHAR(25) NOT NULL,
  `errorCausedByWorker` INT NOT NULL,
  `wasWorkerNotified` TINYINT(1) NOT NULL,
  `wasPhysicianNotified` TINYINT(1) NOT NULL,
  `iimsCompleted` TINYINT(1) NOT NULL,
  `generalComment` VARCHAR(150) NULL,
  `severityId` INT NOT NULL,
  PRIMARY KEY (`idError`),
  INDEX `idUser_idx` (`errorCausedByWorker` ASC),
  INDEX `idErrorType_idx` (`errorTypeId` ASC),
  INDEX `idSeverity_idx` (`severityId` ASC),
  CONSTRAINT `errorCausedByWorker`
    FOREIGN KEY (`errorCausedByWorker`)
    REFERENCES `PETdatabase`.`Worker` (`idWorker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`errorTypeId`)
    REFERENCES `PETdatabase`.`ErrorType` (`idErrorType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPrescription`
    FOREIGN KEY (`idError`)
    REFERENCES `PETdatabase`.`Prescription` (`idPrescription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idSeverity`
    FOREIGN KEY (`severityId`)
    REFERENCES `PETdatabase`.`Severity` (`idSeverity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
