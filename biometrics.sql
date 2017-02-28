-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Biometrics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Biometrics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Biometrics` DEFAULT CHARACTER SET utf8 ;
USE `Biometrics` ;

-- -----------------------------------------------------
-- Table `Biometrics`.`nation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`nation` (
  `nationCode` VARCHAR(45) NOT NULL,
  `nationName` VARCHAR(45) NULL,
  `nationConflictzone` BOOLEAN NULL,
  `nationUNsactions` BOOLEAN NULL,
  `nationGovType` VARCHAR(45) NULL,
  PRIMARY KEY (`nationCode`))
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`nation` (`nationCode`, `nationName`, `nationConflictzone`, `nationUNsactions`, `nationGovType`) VALUES ("NLD", "the Netherlands", FALSE, FALSE, "Constitutional monarchy");
INSERT INTO `Biometrics`.`nation` (`nationCode`, `nationName`, `nationConflictzone`, `nationUNsactions`, `nationGovType`) VALUES ("FRA", "France", FALSE, FALSE, "Republic");
INSERT INTO `Biometrics`.`nation` (`nationCode`, `nationName`, `nationConflictzone`, `nationUNsactions`, `nationGovType`) VALUES ("ESP", "Spain", FALSE, FALSE, "Constitutional monarchy");
INSERT INTO `Biometrics`.`nation` (`nationCode`, `nationName`, `nationConflictzone`, `nationUNsactions`, `nationGovType`) VALUES ("GER", "Germany", FALSE, FALSE, "Republic");
INSERT INTO `Biometrics`.`nation` (`nationCode`, `nationName`, `nationConflictzone`, `nationUNsactions`, `nationGovType`) VALUES ("DEN", "Denmark", FALSE, FALSE, "Constitutional monarchy");

-- -----------------------------------------------------
-- Table `Biometrics`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`Person` (
  `personID` INT NOT NULL,
  `personName` VARCHAR(45) NOT NULL,
  `personEducation` VARCHAR(45) NULL,
  `personJobState` BOOLEAN NULL,
  `personCivilState` ENUM('single', 'married', 'widow') NULL,
  `personGender` ENUM('male','female') NULL,
  `personBirthDate` DATE NOT NULL,
  `personDeathDate` DATE NULL,
  `personRace` VARCHAR(45) NULL,
  `personPriority` VARCHAR(45) NULL,
  `nationCode` VARCHAR(45) NULL,
  PRIMARY KEY (`personID`),
  CONSTRAINT `nationCode`
    FOREIGN KEY (nationCode)
    REFERENCES `Biometrics`.`nation` (nationCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`Person` (`personID`, `personName`, `personEducation`, `personJobState`, `personCivilState`, `personGender`, `personBirthDate`, `personDeathDate`, `personRace`, `personPriority`, `nationCode`) VALUES (1,'Geert de Vries', 'Master', TRUE, 'single', 'male', '1999-12-31', '2011-12-31', 'germanic', 'low','NLD');
INSERT INTO `Biometrics`.`Person` (`personID`, `personName`, `personEducation`, `personJobState`, `personCivilState`, `personGender`, `personBirthDate`, `personRace`, `personPriority`, `nationCode`) VALUES (2,'Jean Blanc', 'Bachelor', TRUE, 'single', 'male', '1993-12-31', 'germanic', 'low','FRA');
INSERT INTO `Biometrics`.`Person` (`personID`, `personName`, `personEducation`, `personJobState`, `personCivilState`, `personGender`, `personBirthDate`, `personRace`, `personPriority`, `nationCode`) VALUES (3,'Geertje de Jong', 'Master', TRUE, 'married', 'female', '1992-12-31', 'germanic', 'low','ESP');
INSERT INTO `Biometrics`.`Person` (`personID`, `personName`, `personEducation`, `personJobState`, `personCivilState`, `personGender`, `personBirthDate`, `personRace`, `personPriority`, `nationCode`) VALUES (4,'Oscar Llorian Salvador', 'Bachelor', TRUE, 'married', 'male', '1991-12-31', 'germanic', 'low','ESP');
INSERT INTO `Biometrics`.`Person` (`personID`, `personName`, `personEducation`, `personJobState`, `personCivilState`, `personGender`, `personBirthDate`, `personRace`, `personPriority`, `nationCode`) VALUES (5,'Maria Muller', 'Master', TRUE, 'single', 'female', '1990-12-31',  'germanic', 'low','GER');
-- -----------------------------------------------------
-- Table `Biometrics`.`Nationalities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`Nationalities` (
 `personID` INT NOT NULL,
 `nationCode` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`personID`, `nationCode`),
    FOREIGN KEY (nationCode)
    REFERENCES `Biometrics`.`nation` (nationCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (PersonID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`Nationalities` (`personID`, `nationCode`) VALUES (1, 'NLD');
INSERT INTO `Biometrics`.`Nationalities` (`personID`, `nationCode`) VALUES (1, 'ESP');
INSERT INTO `Biometrics`.`Nationalities` (`personID`, `nationCode`) VALUES (2, 'FRA');
INSERT INTO `Biometrics`.`Nationalities` (`personID`, `nationCode`) VALUES (3, 'ESP');
INSERT INTO `Biometrics`.`Nationalities` (`personID`, `nationCode`) VALUES (4, 'ESP');
INSERT INTO `Biometrics`.`Nationalities` (`personID`, `nationCode`) VALUES (5, 'GER');
-- -----------------------------------------------------
-- Table `Biometrics`.`BodyInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`BodyInfo` (
  `personID` INT NOT NULL,
  `bodyHeight` VARCHAR(45) NULL,
  `bodyWeight` VARCHAR(45) NULL,
  `bodySkincolor` VARCHAR(45) NULL,
  `bodyFeetSize` VARCHAR(45) NULL,
  `bodyHairColor` VARCHAR(45) NULL,
  `bodyMassIndex` FLOAT NULL,
  `bodyChestSize` VARCHAR(45) NULL,
  `bodyWaistSize` VARCHAR(45) NULL,
  `bodyHipSize` VARCHAR(45) NULL,
  `bodyPhysicalHandicap` VARCHAR(45) NULL,
  `bodyTattoo` VARCHAR(45) NULL,
  `bodyPiercing` VARCHAR(45) NULL,
  PRIMARY KEY (`personID`),
  CONSTRAINT `personID`
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO `Biometrics`.`BodyInfo` (`personID`, `bodyHeight`, `bodyWeight`, `bodySkincolor`, `bodyFeetSize`, `bodyHairColor`, `bodyMassIndex`, `bodyChestSize`, `bodyWaistSize`, `bodyHipSize`, `bodyPhysicalHandicap`, `bodyTattoo`, `bodyPiercing`) VALUES (1, '187', '100', 'white', '45', 'brown',25.2,'90', '54','60','TRUE', 'FALSE', 'FALSE');
INSERT INTO `Biometrics`.`BodyInfo` (`personID`, `bodyHeight`, `bodyWeight`, `bodySkincolor`, `bodyFeetSize`, `bodyHairColor`, `bodyMassIndex`, `bodyChestSize`, `bodyWaistSize`, `bodyHipSize`, `bodyPhysicalHandicap`, `bodyTattoo`, `bodyPiercing`) VALUES (2, '190', '75', 'light brown', '45', 'Blond', 22, '60', '60', '60', 'TRUE', 'TRUE', NULL);
INSERT INTO `Biometrics`.`BodyInfo` (`personID`, `bodyHeight`, `bodyWeight`, `bodySkincolor`, `bodyFeetSize`, `bodyHairColor`, `bodyMassIndex`, `bodyChestSize`, `bodyWaistSize`, `bodyHipSize`, `bodyPhysicalHandicap`, `bodyTattoo`, `bodyPiercing`) VALUES (3, '164', '70', 'brown', '39', 'Brown', 25, '90', '60', '90', NULL, NULL, 'TRUE');
INSERT INTO `Biometrics`.`BodyInfo` (`personID`, `bodyHeight`, `bodyWeight`, `bodySkincolor`, `bodyFeetSize`, `bodyHairColor`, `bodyMassIndex`, `bodyChestSize`, `bodyWaistSize`, `bodyHipSize`, `bodyPhysicalHandicap`, `bodyTattoo`, `bodyPiercing`) VALUES (4, '180', '80', 'dark brown', NULL, 'Black', NULL, '70', '70', '70', 'FALSE', NULL, NULL);
INSERT INTO `Biometrics`.`BodyInfo` (`personID`, `bodyHeight`, `bodyWeight`, `bodySkincolor`, `bodyFeetSize`, `bodyHairColor`, `bodyMassIndex`, `bodyChestSize`, `bodyWaistSize`, `bodyHipSize`, `bodyPhysicalHandicap`, `bodyTattoo`, `bodyPiercing`) VALUES (5, '180', '80', 'dark brown', NULL, 'Black', NULL, '70', '70', '70', 'FALSE', NULL, NULL);
-- -----------------------------------------------------
-- Table `Biometrics`.`FaceInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`FaceInfo` (
  `personID` INT NOT NULL,
  `faceNoseSize` VARCHAR(45) NULL,
  `faceEyesSize` VARCHAR(45) NULL,
  `faceLipsWidth` VARCHAR(45) NULL,
  `faceEarsSize` VARCHAR(45) NULL,
  `faceLobule` VARCHAR(45) NULL,
  `faceFacialAnomalies` VARCHAR(45) NULL,
  `faceMouthSize` VARCHAR(45) NULL,
  `faceImage` VARCHAR(45) NULL,
  PRIMARY KEY (`personID`),
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`FaceInfo` (`personID`, `faceNoseSize`, `faceEyesSize`, `faceLipsWidth`, `faceEarsSize`, `faceLobule`, `faceFacialAnomalies`, `faceMouthSize`, `faceImage`) VALUES (1, '2', '45', '43', '5', '7', 'Scar', '5', NULL);
INSERT INTO `Biometrics`.`FaceInfo` (`personID`, `faceNoseSize`, `faceEyesSize`, `faceLipsWidth`, `faceEarsSize`, `faceLobule`, `faceFacialAnomalies`, `faceMouthSize`, `faceImage`) VALUES (2, '5', '23', '64', '32', '2', 'Glasses', '2', NULL);
INSERT INTO `Biometrics`.`FaceInfo` (`personID`, `faceNoseSize`, `faceEyesSize`, `faceLipsWidth`, `faceEarsSize`, `faceLobule`, `faceFacialAnomalies`, `faceMouthSize`, `faceImage`) VALUES (3, '5', '23', '64', '32', '2', 'Scar', '2', NULL);
INSERT INTO `Biometrics`.`FaceInfo` (`personID`, `faceNoseSize`, `faceEyesSize`, `faceLipsWidth`, `faceEarsSize`, `faceLobule`, `faceFacialAnomalies`, `faceMouthSize`, `faceImage`) VALUES (4, '5', '23', '65', '32', '2', 'Glasses', '2', NULL);
INSERT INTO `Biometrics`.`FaceInfo` (`personID`, `faceNoseSize`, `faceEyesSize`, `faceLipsWidth`, `faceEarsSize`, `faceLobule`, `faceFacialAnomalies`, `faceMouthSize`, `faceImage`) VALUES (5, '5', '23', '66', '32', '2', 'Glasses', '2', NULL);
-- -----------------------------------------------------
-- Table `Biometrics`.`Fingerprints`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`Fingerprints` (
  `fingersInfo` INT NOT NULL,
  `fingerImage` VARCHAR(45) NULL,
  `personID` INT NOT NULL,
  PRIMARY KEY (`fingersInfo`),
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`Fingerprints` (`fingersInfo`, `fingerImage`, `personID`) VALUES (13, NULL, 2);
INSERT INTO `Biometrics`.`Fingerprints` (`fingersInfo`, `fingerImage`, `personID`) VALUES (132, NULL, 1);
INSERT INTO `Biometrics`.`Fingerprints` (`fingersInfo`, `fingerImage`, `personID`) VALUES (133, NULL, 3);
INSERT INTO `Biometrics`.`Fingerprints` (`fingersInfo`, `fingerImage`, `personID`) VALUES (134, NULL, 4);
INSERT INTO `Biometrics`.`Fingerprints` (`fingersInfo`, `fingerImage`, `personID`) VALUES (135, NULL, 5);
-- -----------------------------------------------------
-- Table `Biometrics`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`contact` (
  `personID` INT NOT NULL,
  `contactPhoneNumber` VARCHAR(45) NULL,
  `contactEmail` VARCHAR(45) NULL,
  `contactPhonecompany` VARCHAR(45) NULL,
  `contactAddress` VARCHAR(45) NULL,
  `contactFacebook` VARCHAR(45) NULL,
  `contactTwitter` VARCHAR(45) NULL,
  `contactLinkedin` VARCHAR(45) NULL,
  `contactGmail` VARCHAR(45) NULL,
  `contactYahoo` VARCHAR(45) NULL,
  `contactInstagram` VARCHAR(45) NULL,
  `contactZIPcode` VARCHAR(45) NULL,
  PRIMARY KEY (`personID`),
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`contact` (`personID`, `contactPhoneNumber`, `contactEmail`, `contactPhonecompany`, `contactAddress`, `contactFacebook`, `contactTwitter`, `contactLinkedin`, `contactGmail`, `contactYahoo`, `contactInstagram`, `contactZIPcode`) VALUES (1, '0654523125', 'fakemail@company.nl', 'Movistar', 'Haarweg, 333', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', '6709RZ');
INSERT INTO `Biometrics`.`contact` (`personID`, `contactPhoneNumber`, `contactEmail`, `contactPhonecompany`, `contactAddress`, `contactFacebook`, `contactTwitter`, `contactLinkedin`, `contactGmail`, `contactYahoo`, `contactInstagram`, `contactZIPcode`) VALUES (2, '0677788899', 'another@mail.nl', 'JosePhone', 'Keenweg, 12', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', '6609RA');
INSERT INTO `Biometrics`.`contact` (`personID`, `contactPhoneNumber`, `contactEmail`, `contactPhonecompany`, `contactAddress`, `contactFacebook`, `contactTwitter`, `contactLinkedin`, `contactGmail`, `contactYahoo`, `contactInstagram`, `contactZIPcode`) VALUES (3, '0666432874', 'last@mail.nl', 'Lebara', 'Tierstraat, 45', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', '33012E');
INSERT INTO `Biometrics`.`contact` (`personID`, `contactPhoneNumber`, `contactEmail`, `contactPhonecompany`, `contactAddress`, `contactFacebook`, `contactTwitter`, `contactLinkedin`, `contactGmail`, `contactYahoo`, `contactInstagram`, `contactZIPcode`) VALUES (4, '0654523125', 'fakemail@company.nl', 'Movistar', 'Haarweg, 333', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', '6709RZ');
INSERT INTO `Biometrics`.`contact` (`personID`, `contactPhoneNumber`, `contactEmail`, `contactPhonecompany`, `contactAddress`, `contactFacebook`, `contactTwitter`, `contactLinkedin`, `contactGmail`, `contactYahoo`, `contactInstagram`, `contactZIPcode`) VALUES (5, '0677788899', 'another@mail.nl', 'JosePhone', 'Keenweg, 12', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', '6609RA');

-- -----------------------------------------------------
-- Table `Biometrics`.`relatives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`relatives` (
  `personID` INT NOT NULL,
   `personID2` INT NOT NULL,
  `relationship` VARCHAR(45) NULL,
  PRIMARY KEY (`personID`, `personID2`),
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (personID2)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`relatives` (`personID`, `personID2`, `relativesID`, `relationship`) VALUES (4, 5, 1, 'Married');
INSERT INTO `Biometrics`.`relatives` (`personID`, `personID2`, `relativesID`, `relationship`) VALUES (1, 4, 2, 'Father-Son');
INSERT INTO `Biometrics`.`relatives` (`personID`, `personID2`, `relativesID`, `relationship`) VALUES (1, 5, 3, 'Father-Daughter');
INSERT INTO `Biometrics`.`relatives` (`personID`, `personID2`, `relativesID`, `relationship`) VALUES (2, 3, 4, 'Cousins');

-- -----------------------------------------------------
-- Table `Biometrics`.`Province/State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`Province/State` (
  `provinceName` VARCHAR(45) NOT NULL,
  `provinceCapital` VARCHAR(45) NULL,
  `nationCode` VARCHAR(45) NOT NULL,
  `provincePopulation` VARCHAR(45) NULL,
  PRIMARY KEY (`provinceName`, `nationCode`),
    FOREIGN KEY (nationCode)
    REFERENCES `Biometrics`.`nation` (nationCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`Province/State` (`provinceName`, `provinceCapital`, `nationCode`, `provincePopulation`) VALUES ('Andalucia', 'Sevilla', 'ESP', '4000000');
INSERT INTO `Biometrics`.`Province/State` (`provinceName`, `provinceCapital`, `nationCode`, `provincePopulation`) VALUES ('Gelderland', 'Arnhem', 'NLD', '600000');
INSERT INTO `Biometrics`.`Province/State` (`provinceName`, `provinceCapital`, `nationCode`, `provincePopulation`) VALUES ('Asturias', 'Oviedo', 'ESP', '2000000');

-- -----------------------------------------------------
-- Table `Biometrics`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`City` (
  `cityCode` VARCHAR(45) NOT NULL,
  `cityName` VARCHAR(45) NULL,
  `cityPopulation` VARCHAR(45) NULL,
  `cityNeigh` VARCHAR(45) NULL,
  `nationCode` VARCHAR(45) NOT NULL,
  `provinceName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cityCode`),
    FOREIGN KEY (provinceName)
    REFERENCES `Biometrics`.`Province/State` (provinceName)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (nationCode)
    REFERENCES `Biometrics`.`nation` (nationCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`City` (`cityCode`, `cityName`, `cityPopulation`, `cityNeigh`, `nationCode`, `provinceName`) VALUES ('CA56', 'Cadiz', '7585685', 'Las viña', 'ESP', 'Andalucia');
INSERT INTO `Biometrics`.`City` (`cityCode`, `cityName`, `cityPopulation`, `cityNeigh`, `nationCode`, `provinceName`) VALUES ('OV15', 'Oviedo', '300000', 'Ventanielles', 'ESP', 'Asturias');
INSERT INTO `Biometrics`.`City` (`cityCode`, `cityName`, `cityPopulation`, `cityNeigh`, `nationCode`, `provinceName`) VALUES ('WAG23', 'Wageningen', '34219', 'Haarweghood', 'NLD', 'Gelderland');

-- -----------------------------------------------------
-- Table `Biometrics`.`MedicalInfo(CONF)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`MedicalInfo` (
  `personID` INT NOT NULL,
  `medicalPhysicalillness` VARCHAR(45) NULL,
  `medicalMenthalillness` VARCHAR(45) NULL,
  `medicalInsuranceCompany` VARCHAR(45) NULL,
  `medicalSocialSecurityNr` VARCHAR(45) NULL,
  PRIMARY KEY (`personID`),
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`MedicalInfo` (`personID`, `medicalPhysicalillness`, `medicalMenthalillness`, `medicalInsuranceCompany`, `medicalSocialSecurityNr`) VALUES (1, 'TRUE', 'FALSE', 'GetWell', '246747473783');
INSERT INTO `Biometrics`.`MedicalInfo` (`personID`, `medicalPhysicalillness`, `medicalMenthalillness`, `medicalInsuranceCompany`, `medicalSocialSecurityNr`) VALUES (2, 'FALSE', 'TRUE', NULL, '213235233346');
INSERT INTO `Biometrics`.`MedicalInfo` (`personID`, `medicalPhysicalillness`, `medicalMenthalillness`, `medicalInsuranceCompany`, `medicalSocialSecurityNr`) VALUES (3, NULL, 'TRUE', 'GovCoorp', NULL);
INSERT INTO `Biometrics`.`MedicalInfo` (`personID`, `medicalPhysicalillness`, `medicalMenthalillness`, `medicalInsuranceCompany`, `medicalSocialSecurityNr`) VALUES (4, 'FALSE', NULL, NULL, '573457345875');
INSERT INTO `Biometrics`.`MedicalInfo` (`personID`, `medicalPhysicalillness`, `medicalMenthalillness`, `medicalInsuranceCompany`, `medicalSocialSecurityNr`) VALUES (5, 'FALSE', NULL, NULL, '573457345875');
-- -----------------------------------------------------
-- Table `Biometrics`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`role` (
  `roleID` VARCHAR(45) NOT NULL,
  `roleDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`roleID`))
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`role` (`roleID`, `roleDescription`) VALUES ('Boss', 'View and edit data');
INSERT INTO `Biometrics`.`role` (`roleID`, `roleDescription`) VALUES ('Employee', 'View and select data');
INSERT INTO `Biometrics`.`role` (`roleID`, `roleDescription`) VALUES ('MasterAdmin', 'Maintains database');

-- -----------------------------------------------------
-- Table `Biometrics`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`User` (
  `userID` INT NOT NULL,
  `userName` VARCHAR(45) NULL,
  `userDepartment` VARCHAR(45) NULL,
  `userPassword` VARCHAR(45) NULL,
  `cityCode` VARCHAR(45) NOT NULL,
  `roleID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`),
    FOREIGN KEY (roleID)
    REFERENCES `Biometrics`.`role` (roleID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (cityCode)
    REFERENCES `Biometrics`.`City` (cityCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`User` (`userID`, `userName`, `userDepartment`, `userPassword`, `cityCode`, `roleID`) VALUES (1, 'Guus', 'SSB', '1234', 'WAG23', 'Boss');
INSERT INTO `Biometrics`.`User` (`userID`, `userName`, `userDepartment`, `userPassword`, `cityCode`, `roleID`) VALUES (2, 'Ronald', 'BIF', '5678', 'WAG23', 'Employee');
INSERT INTO `Biometrics`.`User` (`userID`, `userName`, `userDepartment`, `userPassword`, `cityCode`, `roleID`) VALUES (3, 'Wiebe', 'SSB', '0000', 'WAG23', 'Employee');
INSERT INTO `Biometrics`.`User` (`userID`, `userName`, `userDepartment`, `userPassword`, `cityCode`, `roleID`) VALUES (4, 'Raquel', 'BIF', '1111', 'CA56', 'MasterAdmin');


-- -----------------------------------------------------
-- Table `Biometrics`.`LogInInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`LogInInfo` (
  `userID` INT NOT NULL,
  `logInTime` DATETIME NOT NULL,
  `logIP` VARCHAR(45) NOT NULL,
  `logOutTime` DATETIME NULL,
  `logInGeolocation` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`, `logInTime`, `logIP`),
    FOREIGN KEY (userID)
    REFERENCES `Biometrics`.`User` (userID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`LogInInfo` (`userID`, `logInTime`, `logIP`, `logOutTime`, `logInGeolocation`) VALUES (1, '1000-01-01 00:00:00', '192.444.2.19', '9999-12-31 23:59:59', '+34.2313124, -45.324243');
INSERT INTO `Biometrics`.`LogInInfo` (`userID`, `logInTime`, `logIP`, `logOutTime`, `logInGeolocation`) VALUES (2, '1000-01-01 00:00:00', '67.234.4.12', '9999-12-31 23:59:59', '-22.3242423, +44.232445');
INSERT INTO `Biometrics`.`LogInInfo` (`userID`, `logInTime`, `logIP`, `logOutTime`, `logInGeolocation`) VALUES (3, '1000-01-01 00:00:00', '33.453.3.11', '9999-12-31 23:59:59', '-44.3455544, +45.453444');


-- -----------------------------------------------------
-- Table `Biometrics`.`queryLog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`queryLog` (
  `queryID` INT NOT NULL AUTO_INCREMENT,
  `queryType` VARCHAR(45) NOT NULL,
  `queryUsedTable` VARCHAR(45) NULL,
  `queryDuration` VARCHAR(45) NULL,
  `query` VARCHAR(45) NULL,
  `queryTimeStamping` VARCHAR(45) NULL,
  `queryServerDuration` VARCHAR(45) NULL,
   `userID` INT NOT NULL,
  PRIMARY KEY (`queryID`),
    FOREIGN KEY (userID)
    REFERENCES `Biometrics`.`User` (userID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`queryLog` (`queryType`, `queryUsedTable`, `queryDuration`, `query`, `queryTimeStamping`, `queryServerDuration`, `userID`) VALUES ('Select', 'nation', '15', 'SELECT ...', '56', '3', 1);
INSERT INTO `Biometrics`.`queryLog` (`queryType`, `queryUsedTable`, `queryDuration`, `query`, `queryTimeStamping`, `queryServerDuration`, `userID`) VALUES ('Drop', 'relatives', '23', 'DROP ....', '4', '6', 2);
INSERT INTO `Biometrics`.`queryLog` (`queryID`, `queryType`, `queryUsedTable`, `queryDuration`, `query`, `queryTimeStamping`, `queryServerDuration`, `userID`) VALUES (3, 'Select', 'City', '5', 'SELECT ...', '3', '77', 3);


-- -----------------------------------------------------
-- Table `Biometrics`.`Voice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biometrics`.`Voice` (
  `PersonID` INT NOT NULL ,
  `ToneHeight` VARCHAR(45) NULL,
  `Depth` VARCHAR(45) NULL,
  `Timber` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonID`),
    FOREIGN KEY (personID)
    REFERENCES `Biometrics`.`Person` (personID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Biometrics`.`Voice` (`PersonID`, `ToneHeight`, `Depth`, `Timber`) VALUES (1,'12','1',NULL);
INSERT INTO `Biometrics`.`Voice` (`PersonID`, `ToneHeight`, `Depth`, `Timber`) VALUES (2,'22','2',NULL);
INSERT INTO `Biometrics`.`Voice` (`PersonID`, `ToneHeight`, `Depth`, `Timber`) VALUES (3,'32','3',NULL);
INSERT INTO `Biometrics`.`Voice` (`PersonID`, `ToneHeight`, `Depth`, `Timber`) VALUES (4,'42','4',NULL);
INSERT INTO `Biometrics`.`Voice` (`PersonID`, `ToneHeight`, `Depth`, `Timber`) VALUES (5,'52','5',NULL);

-- --------------
-- INDEXES
-- --------------


CREATE INDEX `personName` ON `Biometrics`.`Person` (personName);
CREATE INDEX `personGender` ON `Biometrics`.`Person` (personGender);
CREATE INDEX `personPriority` ON `Biometrics`.`Person` (personPriority);
CREATE INDEX `personBirthDate` ON `Biometrics`.`Person` (personBirthDate);
CREATE INDEX `personRace` ON `Biometrics`.`Person` (personRace);
CREATE INDEX `name_bdate` ON `Biometrics`.`Person` (personName,personBirthDate);
#CREATE UNIQUE INDEX `personID` ON `Biometrics`.`BodyInfo` (personID);


#CREATE UNIQUE INDEX `personID` ON `Biometrics`.`FaceInfo` (personID);


CREATE INDEX `fingerImage` ON `Biometrics`.`Fingerprints` (fingerImage);


CREATE INDEX `contactPhoneNumber` ON `Biometrics`.`contact` (contactPhoneNumber);
CREATE INDEX `contactAddress` ON `Biometrics`.`contact` (contactAddress);
CREATE INDEX `contactEmail` ON `Biometrics`.`contact` (contactEmail);

CREATE INDEX `medicalSocialSecurityNr` ON `Biometrics`.`MedicalInfo` (medicalSocialSecurityNr);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
