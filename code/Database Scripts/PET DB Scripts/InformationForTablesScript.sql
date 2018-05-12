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