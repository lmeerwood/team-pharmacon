START TRANSACTION;

use `tempPETdb`;

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (1, '2018-03-08', '23:45', 'James', 'Windsor', 'Id434h', 
'Outpatient', 'Incorrect Medication', 'Should be Hydrocodone Bitartrate and Acetaminophen', 'Wang Shu', true, 'Dispensary', false, 'CitraNatal Harmony 2.1 - Oral',
'Moderate-Severe', true, 'Marcus', 'DOUSIP', 'nja86078', '', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (2, '2018-02-28', '12:09', 'Vicki', 'Jones', 'Id4dj9', 'Inpatient', 'Dosage / Strength', 
'', 'Timothy Myers', true, 'Dispensary', false, 'Isotretinoin - Oral',
'Moderate', false, '', '', '', '', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (3, '2018-01-31', '18:06', 'Joshua', 'Stait', 'Idgt6', 'Day patient', 'Incorrect Medication', 
'Should be Diclofenac Sodium', 'Wang Shu', true, 'On the ward', false, 'Ambien - Oral',
'Low', true, 'Alice', 'SCHIBECI', 'afd15591', 'All fixed', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (4, '2018-05-01', '03:54', 'Jessie', 'Norris', 'Id562r', 'Outpatient', 'Directions', 
'Directions state twice daily, should be three times', 'Timothy Myers', false, 'Dispensary', true, '10 mg Acetaminophen USP - Oral',
'Minor', false, '', '', '', '', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (5, '2018-03-28', '08:24', 'Jay', 'Holmes', 'Idnjd09', 'Inpatient', 'Dosage / Strength', 
'Should be Diclofenac Sodium', 'Jessica Noble', true, 'On the ward', false, 'Ambien - Oral',
'Moderate-Low', true, 'Alice', 'SCHIBECI', 'afd15591', '', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (6, '2018-03-12', '20:19', 'Jay', 'Holmes', 'Idnjd09', 'Outpatient', 'Incorrect Medication', 
'Should be Sulfamethoxazole and trimethoprim', 'Wang Shu', true, 'Outside hospital', true, 'Mustargen - Intravenous',
'Moderate', true, 'Sarah', 'HOWLETT', 'gui89264', 'Spoken to staff member involved', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (7, '2018-02-24', '23:20', 'Ryan', 'Vale', 'Iddju9', 'Inpatient', 'Directions', 
'', 'Timothy Myers', false, 'On the ward', true, 'Mustargen - Intravenous',
'Moderate-Low', true, 'Mark', 'DAVID', 'apn15385', 'Error in directions noticed prior to patient receiving dose', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (8, '2018-01-28', '14:27', 'Vanessa', 'Noel', 'Id897oo', 'Outpatient', 'Batch Number', 
'Batch had been called back', 'Amanda Stait', true, 'Dispensary', false, '10 mg Acetaminophen USP - Oral',
'Moderate-Low', true, 'Alice', 'SCHIBECI', 'afd15591', '', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (9, '2018-05-02', '05:06', 'Mitchel', 'Fletcher', 'Idn87t', 'Inpatient', 'Incorrect Patient', 
'', 'Pat Smith', true, 'Dispensary', true, 'Diclofenac Sodium - Oral',
'Severe', false, '', '', '', '', '');

INSERT INTO `tempPETdb`.`errorForm` (`idErrorForm`, `date`, `time`, `patientFirstName`, `patientSurname`, `patientId`, 
`patientType`, `errorType`, `errorComment`, `workerAtFault`, `workerNotified`, `location`, `iimsCompleted`, `medication`,
`severity`, `physicianNotified`, `physicianFirstName`, `physicianSurname`, `providerNumber`, `physicianComments`, `dianosis`) 
VALUES (10, '2018-04-02', '09:36', 'Storm', 'Knight', 'Idbq89', 'Outpatient', 'Incorrect Patient', 
'Patient brought medication back', 'Amanda Stait', true, 'Outside hospital', true, 'Diclofenac Sodium - Oral',
'Severe', false, '', '', '', '', '');

COMMIT;