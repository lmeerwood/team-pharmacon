-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tempPETdb` DEFAULT CHARACTER SET utf8 ;
USE `tempPETdb` ;

-- -----------------------------------------------------
-- Table `tempPETdb`.`errorForm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tempPETdb`.`errorForm` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `patientFirstName` VARCHAR(45) NOT NULL,
  `patientSurname` VARCHAR(45) NOT NULL,
  `patientId` VARCHAR(15) NOT NULL,
  `patientType` VARCHAR(45) NOT NULL,
  `errorType` VARCHAR(45) NOT NULL,
  `errorComment` VARCHAR(150) NULL,
  `workerAtFault` VARCHAR(45) NOT NULL,
  `workerNotified` TINYINT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `iimsCompleted` TINYINT NOT NULL,
  `medication` VARCHAR(45) NOT NULL,
  `severity` VARCHAR(45) NOT NULL,
  `physicianNotified` TINYINT NOT NULL,
  `physicianFirstName` VARCHAR(45) NULL,
  `physicianSurname` VARCHAR(45) NULL,
  `providerNumber` VARCHAR(45) NULL,
  `physicianComments` VARCHAR(150) NULL,
  `dianosis` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tempPETdb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tempPETdb`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `authlevel` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
