USE petdatabase;
-- -----------------------------------------------------
-- disable foreign keys checksum table
-- -----------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
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
-- Data for table `petdatabase`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`location` (`errorLocation`) VALUES ('Dispensary');
INSERT INTO `petdatabase`.`location` (`errorLocation`) VALUES ('On the ward');
INSERT INTO `petdatabase`.`location` (`errorLocation`) VALUES ('Outside hospital');

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`medicationtype`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Inhalation');
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Inhatravenous');
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Oral');
INSERT INTO `petdatabase`.`medicationtype` (`medicationType`) VALUES ('Suppository');

COMMIT;


-- -----------------------------------------------------
-- Data for table `petdatabase`.`patienttype`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Discharge');
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Inpatient');
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Outpatient');
INSERT INTO `petdatabase`.`patienttype` (`patientType`) VALUES ('Day Charge');

COMMIT;

-- -----------------------------------------------------
-- enable foreign keys checksum table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;

COMMIT;
