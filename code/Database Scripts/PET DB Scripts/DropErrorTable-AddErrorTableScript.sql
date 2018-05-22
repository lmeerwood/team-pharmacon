use petdatabase;
drop table error;

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