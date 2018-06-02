use petdatabase;
-- -----------------------------------------------------
-- disable foreign keys checksum table
-- -----------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
COMMIT;

-- -----------------------------------------------------
-- Change patient table to auto increment
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
ALTER TABLE patient MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;
COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`medication`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('5 mg Acetaminophen USP', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('7.5 mg Acetaminophen USP', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('10 mg Acetaminophen USP', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Isotretinoin', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Ambien', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Diclofenac Sodium', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Mustargen', 2);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Sulfamethoxazole and trimethoprim', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Sodium Fluoride', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Ceftriaxone', 2);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Claforan', 2);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Albuterol Sulfate Inhalation Solution', 1);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Azathioprine', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('CitraNatal Harmony 2.1', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Hydrocodone Bitartrate and Acetaminophen', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Tinnitus', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Atovaquone and Proguanil Hydrochloride', 3);
INSERT INTO `petdatabase`.`medication` (`medicationName`, `medicationTypeId`) VALUES ('Succimer', 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`diagnosis`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`diagnosis` (`diagnosis`) VALUES ('Pains in stomach');
INSERT INTO `petdatabase`.`diagnosis` (`diagnosis`) VALUES ('Infection');
INSERT INTO `petdatabase`.`diagnosis` (`diagnosis`) VALUES ('Migraine Headache');

-- -----------------------------------------------------
-- Data for table `petdatabase`.`patient`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('145dfg', 'HALL', 'Marshall', 2);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('128hnk', 'GREEN', 'Oscar', 3);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`, `patientDiagnosis`) VALUES ('1cji89', 'PENAL', 'Lucy', 2, 1);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`, `patientDiagnosis`) VALUES ('389nub', 'FEDERA', 'Patricia', 1, 2);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('adu086', 'HALL', 'Marshall', 2);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('389huk', 'HALASMITH', 'Victora', 2);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`, `patientDiagnosis`) VALUES ('1cji89', 'PENAL', 'Lucy', 1, 3);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('987hio', 'GEORGE', 'Lester', 3);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('498abk', 'WILLIS', 'Storm', 4);
INSERT INTO `petdatabase`.`patient` (`patientHospitalId`, `patientSurname`, `patientFirstName`, `patientTypeId`) VALUES ('908biu', 'CON', 'Marta', 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`physician`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES ('Dousip', 'Marcus', 'nja86078', '');
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES ('Howlett', 'Sarah', 'gui89264', 'Hi there');
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`, `diagnosisID`) VALUES ('Arulananthan', 'Alvin', 'njy98623', '', 1);
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`, `diagnosisID`) VALUES ('David', 'Mark', 'apn15385', '', 2);
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES ('Schibeci', 'Alice', 'afd15591', 'All fixed');
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES ('Stevens', 'Berlinda', 'cjo54843', '');
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`, `diagnosisID`) VALUES ('HOWLETT', 'Sarah', 'gui89264', 'Comment made', 3);
INSERT INTO `petdatabase`.`physician` (`physicianSurname`, `physicianFirstName`, `providerNumber`, `physicianComment`) VALUES ('Dousip', 'Marcus', 'nja86078', 'Not again');

COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`error`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-01-24', '08:54', 1, 1, 4567, 0, 1, 1, '', 2, 5, 1, 1);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-02-04', '10:04', 2, 2, 3456, 1, 1, 1, 'Directions lead to overdose', 5, 11, 2, 2);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-01-14', '18:34', 5, 1, 2345, 1, 1, 1, '', 3, 1, 3, 3);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-01-02', '02:15', 3, 1, 3456, 1, 1, 0, '', 2, 6, 4, 4);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`) VALUES ('2018-03-13', '01:37', 2, 3, 1234, 0, 0, 1, 'Directions would lead to minor overdose', 4, 7, 5); 
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-02-05', '23:04', 3, 1, 4567, 1, 1, 1, '', 3, 4, 6, 5);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-04-01', '20:07', 3, 2, 5678, 1, 1, 0, 'Dosage too low', 3, 1, 7, 6);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`) VALUES ('2018-03-16', '13:43', 4, 2, 3456, 0, 0, 1, 'Out of date by one year, patient reaction', 5, 7, 8);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-01-27', '14:27', 2, 1, 3456, 0, 1, 1, '', 3, 5, 9, 7);
INSERT INTO `petdatabase`.`error` (`errorDate`, `errorTime`, `errorTypeId`, `locationId`, `errorCausedByWorker`, `wasWorkerNotified`, `wasPhysicianNotified`, `iimsCompleted`, `generalComment`, `severityId`, `medicationId`, `patientId`, `physicianId`) VALUES ('2018-01-29', '16:49', 7, 3, 4567, 1, 1, 0, 'Incorrect medication not taken by patient', 5, 5, 10, 8);

COMMIT;

-- -----------------------------------------------------
-- enable foreign keys checksum table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;

COMMIT;
