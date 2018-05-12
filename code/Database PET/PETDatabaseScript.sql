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
  `workerName` VARCHAR(45) NOT NULL,
  `workerRole` VARCHAR(20) NOT NULL,
  `workerActive` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idWorker`),
  UNIQUE INDEX `workerName_UNIQUE` (`workerName` ASC))
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
-- Table `PETdatabase`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Patient` (
  `patientHospitalId` VARCHAR(20) NOT NULL,
  `patientName` VARCHAR(50) NOT NULL,
  `patientType` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`patientHospitalId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Physician` (
  `physicianName` VARCHAR(45) NOT NULL,
  `providerNumber` VARCHAR(15) NOT NULL,
  `physicianComment` VARCHAR(150) NULL,
  PRIMARY KEY (`providerNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PETdatabase`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PETdatabase`.`Prescription` (
  `idPrescription` INT NOT NULL AUTO_INCREMENT,
  `medicationID` INT NOT NULL,
  `patientID` VARCHAR(20) NOT NULL,
  `physicianID` VARCHAR(15) NULL,
  `diagnosisID` INT NULL,
  PRIMARY KEY (`idPrescription`),
  INDEX `idMedication_idx` (`medicationID` ASC),
  INDEX `idDiagnosis_idx` (`diagnosisID` ASC),
  INDEX `patientHospitalId_idx` (`patientID` ASC),
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
  `workerId` INT NOT NULL,
  `errorDate` DATE NOT NULL,
  `errorTime` TIME(6) NOT NULL,
  `errorTypeId` INT NOT NULL,
  `errorDetectedLocation` VARCHAR(25) NOT NULL,
  `errorCausedByWorker` VARCHAR(45) NOT NULL,
  `wasWorkerNotified` TINYINT(1) NOT NULL,
  `wasPhysicianNotified` TINYINT(1) NOT NULL,
  `iimsCompleted` TINYINT(1) NOT NULL,
  `generalComment` VARCHAR(150) NULL,
  `severityId` INT NOT NULL,
  PRIMARY KEY (`idError`),
  INDEX `idUser_idx` (`workerId` ASC),
  INDEX `idErrorType_idx` (`errorTypeId` ASC),
  INDEX `idSeverity_idx` (`severityId` ASC),
  CONSTRAINT `idWorker`
    FOREIGN KEY (`workerId`)
    REFERENCES `PETdatabase`.`Worker` (`idWorker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`errorTypeId`)
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
    ON UPDATE NO ACTION,
  CONSTRAINT `idSeverity`
    FOREIGN KEY (`severityId`)
    REFERENCES `PETdatabase`.`Severity` (`idSeverity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`errortype`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (1, 'Batch Number');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (2, 'Directions');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (3, 'Dosage / Strength');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (4, 'Expiry Date');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (5, 'Form Intravenous');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (6, 'Form Per Oral');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (7, 'Incorrect Medication');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (8, 'Incorrect Patient');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (9, 'Incorrect Quantity');
INSERT INTO `petdatabase`.`errortype` (`idErrorType`, `errorType`) VALUES (10, 'Other');

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`severity` Minor, Low, Moderate-Low, Moderate, Moderate-Severe, Severe
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`severity` (`idSeverity`, `level`) VALUES (1, 'Minor');
INSERT INTO `petdatabase`.`severity` (`idSeverity`, `level`) VALUES (2, 'Low');
INSERT INTO `petdatabase`.`severity` (`idSeverity`, `level`) VALUES (3, 'Moderate-Low');
INSERT INTO `petdatabase`.`severity` (`idSeverity`, `level`) VALUES (4, 'Moderate');
INSERT INTO `petdatabase`.`severity` (`idSeverity`, `level`) VALUES (5, 'Moderate-Severe');
INSERT INTO `petdatabase`.`severity` (`idSeverity`, `level`) VALUES (6, 'Severe');

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`worker`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerName`, `workerRole`, `workerActive`) VALUES (1, 'Pat Smith', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerName`, `workerRole`, `workerActive`) VALUES (2, 'Timothy Myers', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerName`, `workerRole`, `workerActive`) VALUES (3, 'Jessica Noble', 'Senior Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerName`, `workerRole`, `workerActive`) VALUES (4, 'Amanda Stait', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerName`, `workerRole`, `workerActive`) VALUES (5, 'Wang Shu', 'Pharmacist', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`error`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (1, 'Batch Number');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (2, 'Directions');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (3, 'Dosage / Strength');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (4, 'Expiry Date');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (5, 'Form Intravenous');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (6, 'Form Per Oral');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (7, 'Incorrect Medication');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (8, 'Incorrect Patient');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (9, 'Incorrect Quantity');
INSERT INTO `petdatabase`.`error` (`idError`, `workerId`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (10, 'Other');

COMMIT;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
