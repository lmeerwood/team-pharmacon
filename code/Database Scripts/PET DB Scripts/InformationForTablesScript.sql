use petdatabase;
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
-- Data for table `petdatabase`.`severity`
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
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (1, 'Pat', 'Smith', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (2, 'Timothy', 'Myers', 'Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (3, 'Jessica', 'Noble', 'Senior Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (4, 'Amanda', 'Stait', 'Trainee Pharmacist', 1);
INSERT INTO `petdatabase`.`worker` (`idWorker`, `workerFirstName`, `workerSurname`, `workerRole`, `workerActive`) VALUES (5, 'Wang', 'Shu', 'Pharmacist', 1);

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

-- -----------------------------------------------------
-- Data for table `petdatabase`.`patient`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (1, '145dfg', 'HALL', 'Marshall', 'Inpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (2, '128hnk', 'GREEN', 'Oscar', 'Outpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (3, '1cji89', 'PENAL', 'Lucy', 'Inpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (4, '389nub', 'FEDERA', 'Patricia', 'Discharge');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (5, 'adu086', 'HALL', 'Marshall', 'Inpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (6, '389huk', 'HALASMITH', 'Victora', 'Inpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (7, '1cji89', 'PENAL', 'Lucy', 'Discharge');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (8, '987hio', 'GEORGE', 'Lester', 'Outpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (9, '498abk', 'WILLIS', 'Storm', 'Outpatient');
INSERT INTO `petdatabase`.`patient` (`idPatient`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientType`) VALUES (10, '908biu', 'CON', 'Marta', 'Inpatient');

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`physician`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (1, 'DOUSIP', 'Marcus', 'nja86078', '');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (2, 'HOWLETT', 'Sarah', 'gui89264', 'Hi there');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (3, 'ARULANANTHAN', 'Alvin', 'njy98623', '');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (4, 'DAVID', 'Mark', 'apn15385', '');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (5, 'SCHIBECI', 'Alice', 'afd15591', 'All fixed');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (6, 'STEVENS', 'Berlinda', 'cjo54843', '');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (7, 'HOWLETT', 'Sarah', 'gui89264', 'Comment made');
INSERT INTO `petdatabase`.`physician` (`idphysician`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (8, 'DOUSIP', 'Marcus', 'nja86078', 'Not again');

COMMIT;

-- -----------------------------------------------------
-- enable foreign keys checksum table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;
COMMIT;