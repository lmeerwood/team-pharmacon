use petdatabase;
-- -----------------------------------------------------
-- disable foreign keys checksum table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`medication`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (1, '5 mg Acetaminophen USP', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (2, '7.5 mg Acetaminophen USP', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (3, '10 mg Acetaminophen USP', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (4, 'Isotretinoin', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (5, 'Ambien', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (6, 'Diclofenac Sodium', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (7, 'Mustargen', 2);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (8, 'Sulfamethoxazole and trimethoprim', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (9, 'Sodium Fluoride', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (10, 'Ceftriaxone', 2);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (11, 'Claforan', 2);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (12, 'Albuterol Sulfate Inhalation Solution', 1);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (13, 'Azathioprine', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (14, 'CitraNatal Harmony 2.1', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (15, 'Hydrocodone Bitartrate and Acetaminophen', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (16, 'Tinnitus', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (17, 'Atovaquone and Proguanil Hydrochloride', 3);
INSERT INTO `petdatabase`.`medication` (`id`, `medicationName`, `medicationTypeId`) VALUES (18, 'Succimer', 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`diagnosis`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`diagnosis` (`id`, `diagnosis`) VALUES (1, 'Pains in stomach');
INSERT INTO `petdatabase`.`diagnosis` (`id`, `diagnosis`) VALUES (2, 'Infection');
INSERT INTO `petdatabase`.`diagnosis` (`id`, `diagnosis`) VALUES (3, 'Migraine Headache');

-- -----------------------------------------------------
-- Data for table `petdatabase`.`patient`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (1, '145dfg', 'HALL', 'Marshall', 2);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (2, '128hnk', 'GREEN', 'Oscar', 3);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`, `patientDiagnosis`) VALUES (3, '1cji89', 'PENAL', 'Lucy', 2, 1);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`, `patientDiagnosis`) VALUES (4, '389nub', 'FEDERA', 'Patricia', 1, 2);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (5, 'adu086', 'HALL', 'Marshall', 2);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (6, '389huk', 'HALASMITH', 'Victora', 2);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`, `patientDiagnosis`) VALUES (7, '1cji89', 'PENAL', 'Lucy', 1, 3);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (8, '987hio', 'GEORGE', 'Lester', 3);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (9, '498abk', 'WILLIS', 'Storm', 4);
INSERT INTO `petdatabase`.`patient` (`id`, `patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES (10, '908biu', 'CON', 'Marta', 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`physician`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (1, 'Dousip', 'Marcus', 'nja86078', '');
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (2, 'Howlett', 'Sarah', 'gui89264', 'Hi there');
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`, `diagnosisID`) VALUES (3, 'Arulananthan', 'Alvin', 'njy98623', '', 1);
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`, `diagnosisID`) VALUES (4, 'David', 'Mark', 'apn15385', '', 2);
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (5, 'Schibeci', 'Alice', 'afd15591', 'All fixed');
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (6, 'Stevens', 'Berlinda', 'cjo54843', '');
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`, `diagnosisID`) VALUES (7, 'HOWLETT', 'Sarah', 'gui89264', 'Comment made', 3);
INSERT INTO `petdatabase`.`physician` (`id`, `physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES (8, 'Dousip', 'Marcus', 'nja86078', 'Not again');

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`error`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (1, '2018-01-24', '08:54', 1, 1, 4567, 0, 1, 1, '', 2, 5, 1, 1);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (2, '2018-02-04', '10:04', 2, 2, 3456, 1, 1, 1, 'Directions lead to overdose', 5, 11, 2, 2);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (3, '2018-01-14', '18:34', 5, 1, 2345, 1, 1, 1, '', 3, 1, 3, 3);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (4, '2018-01-02', '02:15', 3, 1, 3456, 1, 1, 0, '', 2, 6, 4, 4);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`) VALUES (5, '2018-03-13', '01:37', 2, 3, 1234, 0, 0, 1, 'Directions would lead to minor overdose', 4, 7, 5); 
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (6, '2018-02-05', '23:04', 3, 1, 4567, 1, 1, 1, '', 3, 4, 6, 5);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (7, '2018-04-01', '20:07', 3, 2, 5678, 1, 1, 0, 'Dosage too low', 3, 1, 7, 6);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`) VALUES (8, '2018-03-16', '13:43', 4, 2, 3456, 0, 0, 1, 'Out of date by one year, patient reaction', 5, 7, 8);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (9, '2018-01-27', '14:27', 2, 1, 3456, 0, 1, 1, '', 3, 5, 9, 7);
INSERT INTO `petdatabase`.`error` (`id`, `errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES (10, '2018-01-29', '16:49', 7, 3, 4567, 1, 1, 0, 'Incorrect medication not taken by patient', 5, 5, 10, 8);

COMMIT;

-- -----------------------------------------------------
-- enable foreign keys checksum table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;

COMMIT;
