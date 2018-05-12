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
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (1, '2018-01-24', '08:54', 1, 'Dispensary', 4, 1, 0, 1, '', 2);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (2, '2018-02-04', '10:04', 2, 'On the ward', 3, 0, 0, 1, 'Directions lead to overdose', 5);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (3, '2018-01-14', '18:34', 5, 'Dispensary', 2, 1, 0, 1, '', 3);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (4, '2018-01-02', '02:15', 3, 'Dispensary', 3, 1, 0, 0, '', 2);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (5, '2018-03-13', '01:37', 2, 'Outside hospital', 1, 0, 0, 1, 'Directions would lead to minor overdose', 4); 
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (6, '2018-02-05', '23:04', 3, 'Dispensary', 4, 1, 0, 1, '', 3);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (7, '2018-04-01', '20:07', 3, 'On the ward', 5, 1, 0, 0, 'Dosage too low', 3);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (8, '2018-03-16', '13:43', 4, 'On the ward', 3, 0, 0, 1, 'Out of date by one year, patient reaction', 5);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (9, '2018-01-27', '14:27', 2, 'Dispensary', 3, 0, 0, 1, '', 3);
INSERT INTO `petdatabase`.`error` (`idError`, `errorDate`, `errorTime`, `errorTypeId`, `errorDetectedLocation`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`) VALUES (10, '2018-01-29', '16:49', 7, 'Outside hospital', 4, 1, 0, 0, 'Incorrect medication not taken by patient', 5);

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`medication`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (1, '5 mg Acetaminophen USP', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (2, '7.5 mg Acetaminophen USP', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (3, '10 mg Acetaminophen USP', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (4, 'Isotretinoin', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (5, 'Ambien', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (6, 'Diclofenac Sodium', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (7, 'Mustargen', 'Intravenous');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (8, 'Sulfamethoxazole and trimethoprim', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (9, 'Sodium Fluoride', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (10, 'Ceftriaxone', 'Intravenous');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (11, 'Claforan', 'Intravenous');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (12, 'Albuterol Sulfate Inhalation Solution', 'Inhalation');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (13, 'Azathioprine', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (14, 'CitraNatal Harmony 2.1', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (15, 'Hydrocodone Bitartrate and Acetaminophen', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (16, 'Tinnitus', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (17, 'Atovaquone and Proguanil Hydrochloride', 'Oral');
INSERT INTO `petdatabase`.`medication` (`idMedication`, `medicationName`, `medicationType`) VALUES (18, 'Succimer', 'Oral');

COMMIT;
