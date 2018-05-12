USE petdatabase;
-- -----------------------------------------------------
-- Table `PETdatabase`.`Severity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PETdatabase.Severity (
  idSeverity INT NOT NULL AUTO_INCREMENT,
  level VARCHAR(15) NOT NULL,
  PRIMARY KEY (idSeverity))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PETdatabase`.`error` - add severityId & foreign key
-- Change userId to workerID
-- -----------------------------------------------------
ALTER TABLE error ADD severityId INT NOT NULL,
ADD CONSTRAINT idSeverity
    FOREIGN KEY (severityId)
    REFERENCES PETdatabase.Severity (idSeverity)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE error CHANGE userId workerID INT NOT NULL;

COMMIT;