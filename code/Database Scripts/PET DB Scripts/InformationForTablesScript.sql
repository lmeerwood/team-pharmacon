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
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (1, '2018-01-24', '08:54', 'Dispensary', 4, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (2, '2018-02-04', '10:04', 'On the ward', 3, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (3, '2018-01-14', '18:34', 'Dispensary', 2, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (4, '2018-01-02', '02:15', 'Dispensary', 3, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (5, '2018-03-13', '01:37', 'Outside hospital', 1, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (6, '2018-02-05', '23:04', 'Dispensary', 4, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (7, '2018-04-01', '20:07', 'On the ward', 5, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (8, '2018-03-16', '13:43', 'On the ward', 3, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (9, '2018-01-27', '14:27', 'Dispensary', 3, '');
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (10, '2018-01-29', '16:49', 'Outside hospital', 4, '');

COMMIT;