/** Zadanie 1 **/

CREATE DATABASE car_rental_company;

CREATE TABLE `car_rental_company`.`addresses` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `addressNumber` VARCHAR(10) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(10) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  CREATE TABLE `car_rental_company`.`contact_data` (
   `ID` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (`ID`));
  
  CREATE TABLE `car_rental_company`.`agencies` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `addressID` INT NOT NULL,
  `contactID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (addressID) REFERENCES addresses(ID),
  FOREIGN KEY (contactID) REFERENCES contact_data(ID));
  
  CREATE TABLE `car_rental_company`.`positions` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `positionfirstname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  CREATE TABLE `car_rental_company`.`employees` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(80) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `agencyID` INT NOT NULL,
  `addressID` INT NOT NULL,
  `contactID` INT NOT NULL,
  `positionID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (agencyID) REFERENCES agencies(ID),
  FOREIGN KEY (addressID) REFERENCES addresses(ID),
  FOREIGN KEY (contactID) REFERENCES contact_data(ID),
  FOREIGN KEY (positionID) REFERENCES positions(ID));
  
  CREATE TABLE `car_rental_company`.`customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(80) NOT NULL,
  `surname` VARCHAR(80),
  `dateOfBirth` DATE,
  `agencyID` INT NOT NULL,
  `correspondenceAddressID` INT NOT NULL,
  `receiptAddressID` INT NOT NULL,
  `contactID` INT,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (contactID) REFERENCES contact_data(ID),
  FOREIGN KEY (correspondenceAddressID) REFERENCES addresses(ID),
  FOREIGN KEY (receiptAddressID) REFERENCES addresses(ID));
  
  CREATE TABLE `car_rental_company`.`credit_cards` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `cardNumber` VARCHAR(16) NOT NULL UNIQUE,
  `expirationDate` DATE,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (customerID) REFERENCES customers(ID));

CREATE TABLE `car_rental_company`.`car_statuses` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `carStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));

  CREATE TABLE `car_rental_company`.`cars` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `statusID` INT NOT NULL,
  `carBodyType` VARCHAR(25) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `productionYear` INT NOT NULL,
  `colour` VARCHAR(45) NOT NULL,
  `engineVolume` DECIMAl(2,1) NOT NULL,
  `power` INT NOT NULL,
  `mileage` INT NOT NULL,
  `plateNumber` VARCHAR(7),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (statusID) REFERENCES car_statuses(ID));
  
  CREATE TABLE `car_rental_company`.`rental_data` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `carID` INT NOT NULL,
  `dateSince` DATE NOT NULL,
  `dateTo` DATE NOT NULL,
  `fromAgencyID` INT NOT NULL,
  `toAgencyID` INT,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (customerID) REFERENCES customers(ID),
  FOREIGN KEY (carID) REFERENCES cars(ID),
  FOREIGN KEY (fromAgencyID) REFERENCES agencies(ID),
  FOREIGN KEY (toAgencyID) REFERENCES agencies(ID));
  
  CREATE TABLE `car_rental_company`.`car_supervisors` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `employeeID` INT NOT NULL,
  `carID` INT NOT NULL,
  `dateSince` DATE NOT NULL,
  `dateTo` DATE,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (employeeID) REFERENCES employees(ID),
  FOREIGN KEY (carID) REFERENCES cars(ID));