-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `physicianSurname` VARCHAR(45) NOT NULL,
  `physicianFirstName` VARCHAR(45) NOT NULL,
  `providerNumber` VARCHAR(15) NOT NULL,
  `physicianComment` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`patient` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `patientHospitalId` VARCHAR(20) NOT NULL,
  `patientSurname` VARCHAR(45) NOT NULL,
  `patientFirstName` VARCHAR(45) NOT NULL,
  `patientTypeId` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`worker` (
  `id` INT(11) NOT NULL,
  `workerFirstName` VARCHAR(45) NOT NULL,
  `workerSurname` VARCHAR(45) NOT NULL,
  `workerRole` VARCHAR(20) NOT NULL,
  `workerActive` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idWorker_UNIQUE` (`id` ASC))
  AUTO_INCREMENT = 1
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`errortype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`errortype` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `errorType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`location` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `errorLocation` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`medication` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `medicationName` VARCHAR(45) NOT NULL,
  `medicationTypeId` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`severity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`severity` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `level` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


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


-- -----------------------------------------------------
-- Table `petdatabase`.`error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`error` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `errorDate` DATE NOT NULL,
  `errorTime` TIME(6) NOT NULL,
  `errorTypeId` INT(11) DEFAULT NULL,
  `locationId` INT(11) DEFAULT NULL,
  `errorCausedByWorker` INT(11) DEFAULT NULL,
  `wasWorkerNotified` TINYINT(1) DEFAULT NULL,
  `wasPhysicianNotified` TINYINT(1) DEFAULT NULL,
  `iimsCompleted` TINYINT(1) DEFAULT NULL,
  `generalComment` VARCHAR(150) NULL DEFAULT NULL,
  `severityId` INT(11) DEFAULT NULL,
  `medicationId` INT(11) DEFAULT NULL,
  `patientId` INT(11) DEFAULT NULL,
  `physicianId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idUser_idx` (`errorCausedByWorker` ASC),
  INDEX `idErrorType_idx` (`errorTypeId` ASC),
  INDEX `idSeverity_idx` (`severityId` ASC),
  INDEX `idLocation_idx` (`locationId` ASC),
  INDEX `idMedication_idx` (`medicationId` ASC),
  INDEX `idPatient_idx` (`patientId` ASC),
  INDEX `idPhysician_idx` (`physicianId` ASC),
  CONSTRAINT `errorCausedByWorker`
    FOREIGN KEY (`errorCausedByWorker`)
    REFERENCES `petdatabase`.`worker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idErrorType`
    FOREIGN KEY (`errorTypeId`)
    REFERENCES `petdatabase`.`errortype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLocation`
    FOREIGN KEY (`locationId`)
    REFERENCES `petdatabase`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMedication`
    FOREIGN KEY (`medicationId`)
    REFERENCES `petdatabase`.`medication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`patientId`)
    REFERENCES `petdatabase`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPhysician`
    FOREIGN KEY (`physicianId`)
    REFERENCES `petdatabase`.`physician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idSeverity`
    FOREIGN KEY (`severityId`)
    REFERENCES `petdatabase`.`severity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`login` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `authlevel` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `userName_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `petdatabase`.`medicationtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`medicationtype` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `medicationType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `medicationTypeId`
    FOREIGN KEY (`id`)
    REFERENCES `petdatabase`.`medication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `petdatabase`.`patienttype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petdatabase`.`patienttype` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `patientType` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `patientTypeId`
    FOREIGN KEY (`id`)
    REFERENCES `petdatabase`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `petdatabase`.`hiddenFields
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `petdatabase`.`hiddenfields` (
  `id` int(11) NOT NULL,
  `showPatientFields` tinyint(1) NOT NULL DEFAULT '1',
  `showErrorType` tinyint(1) NOT NULL DEFAULT '1',
  `showMedicationFields` tinyint(1) NOT NULL DEFAULT '1',
  `showWorker` tinyint(1) NOT NULL DEFAULT '1',
  `showWorkerNotified` tinyint(1) NOT NULL DEFAULT '1',
  `showLocation` tinyint(1) NOT NULL DEFAULT '1',
  `showIIMScompleted` tinyint(1) NOT NULL DEFAULT '1',
  `showSeverity` tinyint(1) NOT NULL DEFAULT '1',
  `showPhysicianFields` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
