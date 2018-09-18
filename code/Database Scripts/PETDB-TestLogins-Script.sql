USE petdatabase;
-- -----------------------------------------------------
-- disable foreign keys checksum table
-- -----------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
COMMIT;

-- -----------------------------------------------------
-- Data for table `petdatabase`.`login`
-- -----------------------------------------------------
START TRANSACTION;
USE `petdatabase`;
INSERT INTO `petdatabase`.`login` (`username`, `password`, `authlevel`) VALUES ('test@test.com', 'pass5678', 1);
INSERT INTO `petdatabase`.`login` (`username`, `password`, `authlevel`) VALUES ('frank@test.com', 'pass4321', 1);
INSERT INTO `petdatabase`.`login` (`username`, `password`, `authlevel`) VALUES ('jules@test.com', 'passwor1', 1);
INSERT INTO `petdatabase`.`login` (`username`, `password`, `authlevel`) VALUES ('admin@test.com', 'super123', 2);

COMMIT;

-- -----------------------------------------------------
-- enable foreign keys checksum table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;

COMMIT;