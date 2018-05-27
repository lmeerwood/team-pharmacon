-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema petdatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema petdatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petdatabase` DEFAULT CHARACTER SET utf8 ;
USE `petdatabase` ;

-- -----------------------------------------------------
-- Table `petdatabase`.`physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`physician` (
  `idPhysician` INT NOT NULL,
  `physicianSurname` VARCHAR(45) NOT NULL,
  `physicianFirstName` VARCHAR(45) NOT NULL,
  `providerNumber` VARCHAR(15) NOT NULL,
  `physicianComment` VARCHAR(150) NULL,
  `diagnosisID` INT NULL,
  PRIMARY KEY (`idPhysician`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
<<<<<<< HEAD


-- -----------------------------------------------------
-- Table `petdatabase`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`patient` (
  `idPatient` INT NOT NULL,
  `patientHospitalId` VARCHAR(20) NOT NULL,
  `patientSurname` VARCHAR(45) NOT NULL,
  `patientFirstName` VARCHAR(45) NOT NULL,
  `patientTypeId` INT NOT NULL,
  `patientDiagnosis` INT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`diagnosis` (
  `idDiagnosis` INT NOT NULL AUTO_INCREMENT,
  `diagnosis` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiagnosis`),
  CONSTRAINT `diagnosisID`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `petdatabase`.`physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patientDiagnosis`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `petdatabase`.`patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
=======


-- -----------------------------------------------------
-- Table `petdatabase`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`patient` (
  `idPatient` INT NOT NULL,
  `patientHospitalId` VARCHAR(20) NOT NULL,
  `patientSurname` VARCHAR(45) NOT NULL,
  `patientFirstName` VARCHAR(45) NOT NULL,
  `patientTypeId` INT NOT NULL,
  `patientDiagnosis` INT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`diagnosis` (
  `idDiagnosis` INT NOT NULL AUTO_INCREMENT,
  `diagnosis` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiagnosis`),
  CONSTRAINT `diagnosisID`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `petdatabase`.`physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patientDiagnosis`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `petdatabase`.`patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
>>>>>>> ca59325c5d0894b2a199c1421615dec9e7506be5
-- Table `petdatabase`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`worker` (
  `idWorker` INT NOT NULL,
  `workerFirstName` VARCHAR(45) NOT NULL,
  `workerSurname` VARCHAR(45) NOT NULL,
  `workerRole` VARCHAR(20) NOT NULL,
  `workerActive` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idWorker`),
  UNIQUE INDEX `idWorker_UNIQUE` (`idWorker` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`errortype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`errortype` (
  `idErrorType` INT NOT NULL AUTO_INCREMENT,
  `errorType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idErrorType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `petdatabase`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `authlevel` INT NOT NULL,
  PRIMARY KEY (`id`),
=======
-- Table `petdatabase`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`login` (
  `idLogin` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `authlevel` INT NOT NULL,
  PRIMARY KEY (`idLogin`),
>>>>>>> ca59325c5d0894b2a199c1421615dec9e7506be5
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `petdatabase`.`severity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`severity` (
  `idSeverity` INT NOT NULL AUTO_INCREMENT,
  `level` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idSeverity`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`location` (
  `idlocation` INT NOT NULL AUTO_INCREMENT,
  `errorLocation` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idlocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petdatabase`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`medication` (
  `idMedication` INT NOT NULL AUTO_INCREMENT,
  `medicationName` VARCHAR(45) NOT NULL,
  `medicationTypeId` INT NOT NULL,
  PRIMARY KEY (`idMedication`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`error` (
  `idError` INT NOT NULL,
  `errorDate` DATE NOT NULL,
  `errorTime` TIME(6) NOT NULL,
  `errorTypeId` INT NOT NULL,
  `locationId` INT NOT NULL,
  `errorCausedByWorker` INT NOT NULL,
  `wasWorkerNotified` TINYINT(1) NOT NULL,
  `wasPhysicianNotified` TINYINT(1) NOT NULL,
  `iimsCompleted` TINYINT(1) NOT NULL,
  `generalComment` VARCHAR(150) NULL DEFAULT NULL,
  `severityId` INT NOT NULL,
  `medicationId` INT NOT NULL,
  `patientId` INT NOT NULL,
  `physicianId` INT NULL,
  INDEX `idUser_idx` (`errorCausedByWorker` ASC),
  INDEX `idErrorType_idx` (`errorTypeId` ASC),
  INDEX `idSeverity_idx` (`severityId` ASC),
  INDEX `idLocation_idx` (`locationId` ASC),
  INDEX `idMedication_idx` (`medicationId` ASC),
  INDEX `idPatient_idx` (`patientId` ASC),
  INDEX `idPhysician_idx` (`physicianId` ASC),
  CONSTRAINT `errorCausedByWorker`
    FOREIGN KEY (`errorCausedByWorker`)
    REFERENCES `petdatabase`.`worker` (`idWorker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`errorTypeId`)
    REFERENCES `petdatabase`.`errortype` (`idErrorType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
<<<<<<< HEAD
  CONSTRAINT `id`
    FOREIGN KEY (`idError`)
    REFERENCES `petdatabase`.`User` (`id`)
=======
  CONSTRAINT `idLogin`
    FOREIGN KEY (`idError`)
    REFERENCES `petdatabase`.`login` (`idLogin`)
>>>>>>> ca59325c5d0894b2a199c1421615dec9e7506be5
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idSeverity`
    FOREIGN KEY (`severityId`)
    REFERENCES `petdatabase`.`severity` (`idSeverity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLocation`
    FOREIGN KEY (`locationId`)
    REFERENCES `petdatabase`.`location` (`idlocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMedication`
    FOREIGN KEY (`medicationId`)
    REFERENCES `petdatabase`.`medication` (`idMedication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`patientId`)
    REFERENCES `petdatabase`.`patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPhysician`
    FOREIGN KEY (`physicianId`)
    REFERENCES `petdatabase`.`physician` (`idPhysician`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`patienttype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`patienttype` (
  `idPatientType` INT NOT NULL AUTO_INCREMENT,
  `patientType` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idPatientType`),
  CONSTRAINT `patientTypeId`
    FOREIGN KEY (`idPatientType`)
    REFERENCES `petdatabase`.`patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petdatabase`.`medicationtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`medicationtype` (
  `idmedicationtype` INT NOT NULL AUTO_INCREMENT,
  `medicationType` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idmedicationtype`),
  CONSTRAINT `medicationTypeId`
    FOREIGN KEY (`idmedicationtype`)
    REFERENCES `petdatabase`.`medication` (`idMedication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`worker`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (1234, 'Pat', 'Smith', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (2345, 'Timothy', 'Meyers', 'Pharmacist Trainee', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (3456, 'Jessica', 'Noble', 'Supervisor', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (4567, 'Amanda', 'Stait', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (5678, 'Wang', 'Shu', 'Pharmacist', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`errortype`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Batch Number');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Directions');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Dosage / Strength');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Expiry Date');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Form Intravenous');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Form Per Oral');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Incorrect Medication');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Incorrect Patient');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Incorrect Quantity');
INSERT INTO `petdatabase`.`errortype` (`errorType`) VALUES ('Other');

COMMIT;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Data for table `petdatabase`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`User` (`email`, `password`, `authlevel`) VALUES ('test@test.com', '12345678', 1);
INSERT INTO `petdatabase`.`User` (`email`, `password`, `authlevel`) VALUES ('frank@test.com', '87654321', 1);
INSERT INTO `petdatabase`.`User` (`email`, `password`, `authlevel`) VALUES ('jules@test.com', 'password', 1);
INSERT INTO `petdatabase`.`User` (`email`, `password`, `authlevel`) VALUES ('admin@test.com', 'super123', 2);
=======
-- Data for table `petdatabase`.`login`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`login` (`email`, `password`, `authlevel`) VALUES ('test@test.com', '12345678', 1);
INSERT INTO `petdatabase`.`login` (`email`, `password`, `authlevel`) VALUES ('frank@test.com', '87654321', 1);
INSERT INTO `petdatabase`.`login` (`email`, `password`, `authlevel`) VALUES ('jules@test.com', 'password', 1);
INSERT INTO `petdatabase`.`login` (`email`, `password`, `authlevel`) VALUES ('admin@test.com', 'super123', 2);
>>>>>>> ca59325c5d0894b2a199c1421615dec9e7506be5

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`severity`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`severity` (`level`) VALUES ('Minor');
INSERT INTO `petdatabase`.`severity` (`level`) VALUES ('Low');
INSERT INTO `petdatabase`.`severity` (`level`) VALUES ('Moderate-Low');
INSERT INTO `petdatabase`.`severity` (`level`) VALUES ('Moderate');
INSERT INTO `petdatabase`.`severity` (`level`) VALUES ('Moderate-Severe');
INSERT INTO `petdatabase`.`severity` (`level`) VALUES ('Severe');

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`location` (`errorLocation`) VALUES ('Dispensary');
INSERT INTO `petdatabase`.`location` (`errorLocation`) VALUES ('On the ward');
INSERT INTO `petdatabase`.`location` (`errorLocation`) VALUES ('Outside hospital');

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`patienttype`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Discharge');
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Inpatient');
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Outpatient');
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Day patient');

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`medicationtype`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Inhalation');
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Intravenous');
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Oral');
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Suppository');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
