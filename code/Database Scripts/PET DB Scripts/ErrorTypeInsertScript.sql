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