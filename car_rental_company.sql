CREATE DATABASE car_rental_company;

CREATE TABLE `car_rental_company`.`addresses` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(10) NOT NULL,
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
  `positionName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  CREATE TABLE `car_rental_company`.`employees` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
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
  `name` VARCHAR(80) NOT NULL,
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
  `number` VARCHAR(16) NOT NULL UNIQUE,
  `expirationDate` DATE,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (customerID) REFERENCES customers(ID));

CREATE TABLE `car_rental_company`.`car_statuses` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));

  CREATE TABLE `car_rental_company`.`cars` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `statusID` INT NOT NULL,
  `type` VARCHAR(25) NOT NULL,
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
  `toAgencyID` INT NOT NULL,
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
  
use car_rental_company;

/* ########################################################################## ADRESSES ##########################################################################  */
/** -------------------- AGENCYS' ADDRESSES -------------------- **/
insert into addresses (number, street, postcode, city, country) values ('1', 'Kirkmanshulme Ln', 'M12 4WB', 'Manchester', 'UK');

insert into addresses (number, street, postcode, city, country) values ('11', 'Bathgate Rd', 'EH48 2PD', 'Edinburgh', 'UK');

insert into addresses (number, street, postcode, city, country) values ('312', 'Ashey Rd', 'PO33 4BH', 'Isle of Wight', 'UK');

insert into addresses (number, street, postcode, city, country) values ('101', 'Wimborne Rd', 'BH15 2BP', 'Poole', 'UK');

insert into addresses (number, street, postcode, city, country) values ('18', 'Lady Ln', 'SN25 4DN', 'Swindon', 'UK');

/** -------------------- OTHER ADDRESSES -------------------- **/
insert into addresses (number, street, postcode, city, country) values ('76', 'Rye Rd', 'EN11 0EH', 'Hoddeson', 'UK');

insert into addresses (number, street, postcode, city, country) values ('377', 'Alwalton St', 'PE2 0XE', 'Peterborough', 'UK');

insert into addresses (number, street, postcode, city, country) values ('45', 'Rugby Rd', 'CV8 3GJ', 'Coventry', 'UK');

insert into addresses (number, street, postcode, city, country) values ('23', 'Sutherland Av', 'WV2 2JJ', 'Wolverhampton', 'UK');

insert into addresses (number, street, postcode, city, country) values ('54', 'Penistone Rd', 'S6 2DE', 'Sheffield', 'UK');

insert into addresses (number, street, postcode, city, country) values ('18', 'Fossway Rd', 'NE6 2XJ', 'Newcastle', 'UK');

insert into addresses (number, street, postcode, city, country) values ('82', 'Hawthorn St', 'G22 6RU', 'Glasgow', 'UK');

insert into addresses (number, street, postcode, city, country) values ('16A', 'Abbey Road', 'NW8 9BD', 'London', 'UK');

insert into addresses (number, street, postcode, city, country) values ('443', 'Aldborough Road South', 'IG3 8JN', 'Ilford', 'UK');

insert into addresses (number, street, postcode, city, country) values ('7', 'Wells Road', 'BS27 3SW', 'Cheddar', 'UK');

insert into addresses (number, street, postcode, city, country) values ('11', 'Parkins Garth', 'DL8 3HD', 'Leyburn', 'UK');

insert into addresses (number, street, postcode, city, country) values ('1', 'The Hill', 'DG16 5HG', 'Dumfries and Galloway', 'UK');

insert into addresses (number, street, postcode, city, country) values ('43', 'Grafton Way', 'W1T 5DG', 'London', 'UK');

insert into addresses (number, street, postcode, city, country) values ('60', 'Purser Road', 'NN1 4PQ', 'Northampton', 'UK');

insert into addresses (number, street, postcode, city, country) values ('15', 'Lytham Avenue', 'S25 2TB', 'Sheffield', 'UK');

insert into addresses (number, street, postcode, city, country) values ('22', 'Nant Hall Road', 'LL19 9LN', 'Prestatyn', 'UK');

insert into addresses (number, street, postcode, city, country) values ('15', 'Great Percy Street', 'WC1X 9RD', 'London', 'UK');

insert into addresses (number, street, postcode, city, country) values ('39', 'Westray Street', 'TS13 4EL', 'Saltburn-by-the-Sea', 'UK');

insert into addresses (number, street, postcode, city, country) values ('128', 'West End Road', 'UB1 1JN', 'Southall', 'UK');

insert into addresses (number, street, postcode, city, country) values ('14', 'Park Lane', 'TF6 6BA', 'Telford', 'UK');

insert into addresses (number, street, postcode, city, country) values ('28', 'Earlsway', 'NE11', 'Tyne and Wear', 'UK');

insert into addresses (number, street, postcode, city, country) values ('2', 'Howes Road', 'AB16 7RH', 'Aberdeen City', 'UK');

insert into addresses (number, street, postcode, city, country) values ('21', 'Batsmans Drive', 'NN10 6EW', 'Rushden', 'UK');

insert into addresses (number, street, postcode, city, country) values ('B8035', 'Isle of Mull', 'PA68 6EJ', 'Scotland', 'UK');

insert into addresses (number, street, postcode, city, country) values ('99', 'Shakespeare Street', 'PR8 5AJ', 'Southport', 'UK');

insert into addresses (number, street, postcode, city, country) values ('44-64', 'Severn Way', 'MK3', 'Milton Keynes', 'UK');

insert into addresses (number, street, postcode, city, country) values ('175', 'Sarehole Road', 'B28 8EL', 'Birmingham', 'UK');

insert into addresses (number, street, postcode, city, country) values ('17', 'Brunel Close', 'CF82 8HT', 'Hengoed', 'UK');

insert into addresses (number, street, postcode, city, country) values ('1', 'Beath Grove', 'TS25 3BY', 'Hartlepool', 'UK');

insert into addresses (number, street, postcode, city, country) values ('18', 'Pine View', 'DT6 5AE', 'Bridport', 'UK');

insert into addresses (number, street, postcode, city, country) values ('7', 'Farmview Close', 'L27 1XZ', 'Liverpool', 'UK');

insert into addresses (number, street, postcode, city, country) values ('2', 'Bank Street', 'NP19 7HF', 'Newport', 'UK');

insert into addresses (number, street, postcode, city, country) values ('2', 'Woodview Terrace', 'SA10', 'Neath Port Talbot', 'UK');

insert into addresses (number, street, postcode, city, country) values ('1', 'Iberian Way', 'GU15 1LU', 'Camberley', 'UK');

insert into addresses (number, street, postcode, city, country) values ('18', 'Vowels Lane', 'RH19 4LD', 'West Sussex', 'UK');

insert into addresses (number, street, postcode, city, country) values ('221', 'Guildford Road', 'GU18 5RE', 'Lightwater', 'UK');

insert into addresses (number, street, postcode, city, country) values ('50', 'Fernicombe Road', 'TQ3 3XD', 'Paignton', 'UK');

insert into addresses (number, street, postcode, city, country) values ('11', 'Ennis Close', 'AL5 1SS', 'Harpenden', 'UK');

insert into addresses (number, street, postcode, city, country) values ('114', 'Bruce Grove', 'N17 6UR', 'London', 'UK');

insert into addresses (number, street, postcode, city, country) values ('12', 'Marygate', 'TD15 1BN', 'Berwick-upon-Tweed', 'UK');

insert into addresses (number, street, postcode, city, country) values ('8', 'Nether Court', 'DG5 4EY', 'Dalbeattie', 'UK');

insert into addresses (number, street, postcode, city, country) values ('5-7', 'Wood End', 'UB3 2SB', 'Hayes', 'UK'); 

insert into addresses (number, street, postcode, city, country) values ('4', 'Chapel Street', 'WV2 3EU', 'Wolverhampton', 'UK');

insert into addresses (number, street, postcode, city, country) values ('7', 'Sandylands Drive', 'M25 9SH', 'Manchester', 'UK');

insert into addresses (number, street, postcode, city, country) values ('7A', 'Glenferness Avenue', 'BH4 9ND', 'Bournemouth', 'UK');

insert into addresses (number, street, postcode, city, country) values ('1B', 'Tiree Avenue', 'PA4 0EP', 'Renfrew', 'UK');

insert into addresses (number, street, postcode, city, country) values ('4', 'Leithhead', 'EH27 8DJ', 'Edinburgh', 'UK');

insert into addresses (number, street, postcode, city, country) values ('78', 'Gloucester Street', 'SN1', 'Swindon', 'UK');

insert into addresses (number, street, postcode, city, country) values ('51', 'A244', 'KT10', 'Esher', 'UK');

insert into addresses (number, street, postcode, city, country) values ('12', 'Keills Cottages', 'PA46 7RG', 'Isle of Islay', 'UK');

insert into addresses (number, street, postcode, city, country) values ('9', 'Greenbank Road', 'DL3 6EJ', 'Darlington', 'UK');

insert into addresses (number, street, postcode, city, country) values ('8', 'Tottenham Mews', 'W1T 4AE', 'London', 'UK');

insert into addresses (number, street, postcode, city, country) values ('18', 'Newport Street', 'OL8 4AJ', 'Oldham', 'UK');

insert into addresses (number, street, postcode, city, country) values ('5', 'Southgate Court', 'S21 4LA', 'Sheffield', 'UK');

insert into addresses (number, street, postcode, city, country) values ('21', 'Hazel Grove', 'CH61 4UY', 'Wirral', 'UK');

insert into addresses (number, street, postcode, city, country) values ('41', 'Walter Street', 'TS18 3PP', 'Stockton-on-Tees', 'UK');

insert into addresses (number, street, postcode, city, country) values ('9', 'Fenn Close', 'IP19 8LD', 'Halesworth', 'UK');

insert into addresses (number, street, postcode, city, country) values ('299', 'Edgefauld Road', 'G21 4XB', 'Glasgow', 'UK');

insert into addresses (number, street, postcode, city, country) values ('17', 'Carlton Gardens', 'LS7 1HF', 'Leeds', 'UK');

insert into addresses (number, street, postcode, city, country) values ('31A', 'Main Road', 'KA29 0DL', 'Largs', 'UK');

insert into addresses (number, street, postcode, city, country) values ('6', 'Richmond Terrace', 'CA28 7QR', 'Whitehaven', 'UK');

insert into addresses (number, street, postcode, city, country) values ('27', 'Wheelers Lane', 'B13 0SB', 'Birmingham', 'UK');

insert into addresses (number, street, postcode, city, country) values ('15', 'Borough Road', 'TQ4', 'Paignton', 'UK');

insert into addresses (number, street, postcode, city, country) values ('4', 'Heyford Road', 'OX5 3HU', 'Kidlington', 'UK');

insert into addresses (number, street, postcode, city, country) values ('4', 'Fairfield Road', 'RH15 8NR', 'Burgess Hill', 'UK');

insert into addresses (number, street, postcode, city, country) values ('146', 'Dashwood Avenue', 'HP12 3EB', 'High Wycombe', 'UK');

insert into addresses (number, street, postcode, city, country) values ('109', 'Monkton Lane', 'NE32 5NS', 'Jarrow', 'UK');

insert into addresses (number, street, postcode, city, country) values ('13', 'Park Lane', 'TW9 2RA', 'Richmond', 'UK');

/* ########################################################################## CONTACT_DATA ##########################################################################  */
insert into contact_data (email, phone) values ('agency_manchester@car_rental.co.uk', '0-(513)725-0251');

insert into contact_data (email, phone) values ('agency_edinburgh@car_rental.co.uk', '0-(513)725-0261');

insert into contact_data (email, phone) values ('agency_islo_of_wight@car_rental.co.uk', '0-(513)725-0252');

insert into contact_data (email, phone) values ('agency_poole@car_rental.co.uk', '0-(513)725-0262');

insert into contact_data (email, phone) values ('agency_swindon@car_rental.co.uk', '0-(513)725-0255');

insert into contact_data (email, phone) values ('kfassbender0@epa.gov', '1-(513)725-0252');

insert into contact_data (email, phone) values ('kbartrop1@goo.ne.jp', '57-(576)545-9661');

insert into contact_data (email, phone) values ('tlehenmann2@yellowpages.com', '55-(464)331-7701');

insert into contact_data (email, phone) values ('eshearstone3@toplist.cz', '62-(672)185-6961');

insert into contact_data (email, phone) values ('baxelby4@house.gov', '850-(189)614-3995');

insert into contact_data (email, phone) values ('bbelcham5@gmpg.org', '56-(475)779-2030');

insert into contact_data (email, phone) values ('bperllman6@tiny.cc', '86-(324)756-0823');

insert into contact_data (email, phone) values ('bbrigstock7@si.edu', '48-(316)729-5127');

insert into contact_data (email, phone) values ('jpabst8@vkontakte.ru', '1-(415)971-0022');

insert into contact_data (email, phone) values ('stossell9@paginegialle.it', '55-(185)599-9777');

insert into contact_data (email, phone) values ('lvickermana@vkontakte.ru', '86-(233)446-9612');

insert into contact_data (email, phone) values ('chobbertb@nature.com', '86-(686)335-3895');

insert into contact_data (email, phone) values ('gdalyielc@toplist.cz', '62-(774)607-7773');

insert into contact_data (email, phone) values ('srohand@eventbrite.com', '234-(619)159-2640');

insert into contact_data (email, phone) values ('dlefeuvree@angelfire.com', '351-(960)341-3212');

insert into contact_data (email, phone) values ('csemeradf@bandcamp.com', '86-(104)340-7948');

insert into contact_data (email, phone) values ('lhaugerg@slashdot.org', '55-(102)140-7611');

insert into contact_data (email, phone) values ('tlunah@zimbio.com', '963-(156)693-0339');

insert into contact_data (email, phone) values ('plarrowayi@unc.edu', '62-(406)422-1483');

insert into contact_data (email, phone) values ('jsevernj@yahoo.co.jp', '55-(648)359-9696');

insert into contact_data (email, phone) values ('fgreenhillk@ox.ac.uk', '62-(285)999-8826');

insert into contact_data (email, phone) values ('fgiffkinsl@w3.org', '55-(485)648-0491');

insert into contact_data (email, phone) values ('ekunesm@gnu.org', '86-(768)595-2574');

insert into contact_data (email, phone) values ('knorburyn@senate.gov', '62-(624)449-1439');

insert into contact_data (email, phone) values ('cclubbo@rambler.ru', '86-(810)629-4598');

insert into contact_data (email, phone) values ('jbeyerp@cocolog-nifty.com', '62-(608)467-8059');

insert into contact_data (email, phone) values ('dmagogq@dropbox.com', '7-(130)114-2243');

insert into contact_data (email, phone) values ('abodycoter@stumbleupon.com', '964-(336)204-3411');

insert into contact_data (email, phone) values ('mgwatkinss@alexa.com', '7-(859)445-8501');

insert into contact_data (email, phone) values ('amatsont@ameblo.jp', '60-(185)234-2583');

insert into contact_data (email, phone) values ('fjacquestu@wordpress.org', '63-(555)388-6909');

insert into contact_data (email, phone) values ('elowlessv@trellian.com', '33-(697)720-5476');

insert into contact_data (email, phone) values ('froughtw@nature.com', '86-(982)271-7794');

insert into contact_data (email, phone) values ('cedmonstonx@ameblo.jp', '86-(283)516-6119');

insert into contact_data (email, phone) values ('hgheorghescuy@npr.org', '380-(556)606-0870');

insert into contact_data (email, phone) values ('ichestersz@geocities.jp', '62-(679)436-6059');

insert into contact_data (email, phone) values ('emughal10@gizmodo.com', '386-(511)975-1973');

insert into contact_data (email, phone) values ('hmcilheran11@bloglines.com', '506-(572)648-9784');

insert into contact_data (email, phone) values ('lelmhurst12@example.com', '81-(554)677-6698');

insert into contact_data (email, phone) values ('dgomar13@hostgator.com', '55-(669)495-5188');

insert into contact_data (email, phone) values ('jgovinlock14@nature.com', '47-(417)155-3261');

insert into contact_data (email, phone) values ('jfeldstein15@nba.com', '86-(623)276-9650');

insert into contact_data (email, phone) values ('screek16@goo.gl', '7-(676)506-0691');

insert into contact_data (email, phone) values ('lheasman17@salon.com', '86-(339)434-1199');

insert into contact_data (email, phone) values ('ihobble18@t.co', '967-(668)962-6357');

insert into contact_data (email, phone) values ('sgrcic19@buzzfeed.com', '63-(955)283-0886');

insert into contact_data (email, phone) values ('nbrownlea1a@example.com', '33-(110)149-0399');

insert into contact_data (email, phone) values ('isertin1b@upenn.edu', '62-(668)802-8213');

insert into contact_data (email, phone) values ('mbeyer1c@yellowpages.com', '52-(925)524-3856');

insert into contact_data (email, phone) values ('jburdus1d@wikia.com', '63-(968)756-2350');

insert into contact_data (email, phone) values ('bsparsholt1e@webeden.co.uk', '86-(730)374-4567');

insert into contact_data (email, phone) values ('btouhig1f@toplist.cz', '380-(404)992-5892');

insert into contact_data (email, phone) values ('hheiner1g@furl.net', '46-(974)302-5843');

insert into contact_data (email, phone) values ('bheaven1h@shareasale.com', '996-(313)668-4340');

insert into contact_data (email, phone) values ('sedensor1i@abc.net.au', '63-(237)132-2534');

insert into contact_data (email, phone) values ('unleashed67@salon.com', '86-(339)434-1239');

insert into contact_data (email, phone) values ('myhobby1@t.co', '967-(668)962-2247');

insert into contact_data (email, phone) values ('segritta96@buzzfeed.com', '63-(945)283-0566');

insert into contact_data (email, phone) values ('jakelea1a@example.com', '33-(111)149-0899');

insert into contact_data (email, phone) values ('isertin15b@upenn.edu', '62-(618)802-9093');

insert into contact_data (email, phone) values ('xbeyer1c@yellowpages.com', '55-(925)524-3156');

insert into contact_data (email, phone) values ('jjosh1d@wikia.com', '68-(968)756-2370');

insert into contact_data (email, phone) values ('barsholt1e@webeden.co.uk', '86-(876)354-4567');

insert into contact_data (email, phone) values ('btought@toplist.cz', '381-(454)992-1862');

insert into contact_data (email, phone) values ('hhirex2@furl.net', '16-(264)301-5043');

insert into contact_data (email, phone) values ('berni905@shareasale.com', '196-(353)664-4141');

insert into contact_data (email, phone) values ('churchill18@abc.net.au', '68-(257)152-2524');

insert into contact_data (email, phone) values ('dominique15@sjava.com', '106-(957)624-4942');

insert into contact_data (email, phone) values ('nevillus1@dot.net', '57-(240)115-7654');

insert into contact_data (email, phone) values ('marco_polo_@java.com', '12-(182)114-0570');

/* ########################################################################## AGENCIES ##########################################################################  */
insert into agencies (addressID, contactID) values (1, 1);
insert into agencies (addressID, contactID) values (2, 2);
insert into agencies (addressID, contactID) values (3, 3);
insert into agencies (addressID, contactID) values (4, 4);
insert into agencies (addressID, contactID) values (5, 5);

/* ########################################################################## POSITIONS ##########################################################################  */
insert into positions (positionName) values ('CEO');
insert into positions (positionName) values ('Company Accountant');
insert into positions (positionName) values ('Agency Chief');
insert into positions (positionName) values ('Car Dealer');

/* ########################################################################## EMPLOYEES ##########################################################################  */
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Pancho', 'oNaer', '1993-01-09', 4, 6, 6, 3);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Aili', 'Lysaght', '1961-11-25', 2, 8, 7, 3);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Niki', 'Dumbare', '1976-12-26', 4, 6, 8, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Kerianne', 'Greaser', '1973-05-12', 1, 9, 9, 3);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Aubrey', 'Goodnow', '1955-06-08', 1, 7, 10, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Nara', 'Heckner', '1999-07-26', 2, 10, 11, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Simona', 'Sleford', '1998-12-10', 2, 25, 12, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Betta', 'oFriendly', '1991-01-21', 2, 11, 13, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Odilia', 'Cumming', '1954-03-20', 2, 13, 14, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Arnaldo', 'Puddan', '1988-02-27', 4, 15, 15, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Theadora', 'Sketchley', '1985-12-16', 1, 14, 16, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Earle', 'Jakobsson', '1979-06-14', 4, 12, 17, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Bernie', 'Jakobsson', '1985-09-26', 4, 12, 18, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Ingrid', 'oFeal', '1969-07-08', 3, 19, 19, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Ardene', 'Twinberrow', '1955-07-09', 4, 17, 20, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Denys', 'Tamplin', '1995-07-31', 4, 16, 21, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Rickert', 'McIlhagga', '1968-07-08', 4, 20, 22, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Dina', 'Hegley', '1972-12-01', 5, 18, 23, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Chancey', 'Upsale', '1950-03-07', 5, 21, 24, 3);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Chance', 'Cranmore', '1979-01-19', 1, 22, 25, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Hubie', 'oLamy', '1988-09-03', 2, 21, 26, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Leesa', 'Ketteridge', '1967-05-25', 3, 23, 27, 3);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Sylvester', 'Blay', '1967-06-19', 1, 1, 28, 1);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Melonie', 'Gellately', '1986-10-05', 1, 24, 29, 2);

/* ########################################################################## CUSTOMERS ##########################################################################  */
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Liè', 'McGeachey', '1992-02-08', 1, 26, 26, 30);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Dafnée', 'Jentet', '1966-11-29', 4, 27, 27, 31);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Lén', 'Gabotti', '1990-11-06', 1, 28, 28, 32);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Maëlle', 'Torresi', '1980-01-28', 2, 29, 29, 33);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Chloé', 'Perutto', '1969-03-17', 1, 30, 30, 34);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Edmée', 'Rubberts', '1988-04-16', 2, 31, 31, 35);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Maëline', 'Karpinski', '1964-09-27', 3, 32, 32, 36);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Dà', 'Corbally', '1988-05-20', 3, 33, 33, 37);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Chloé', 'Arnoll', '1978-12-23', 3, 34, 34, 38);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Maëly', 'Labroue', '1985-01-18', 4, 35, 35, 39);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Thérèse', 'Miles', '1993-10-30', 2, 36, 36, 40);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Mylène', 'Zum Felde', '1971-07-19', 3, 37, 37, 41);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Nuó', 'Hull', '1986-07-19', 3, 38, 38, 42);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Valérie', 'Gilby', '1980-03-01', 5, 39, 39, 43);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Lài', 'Hackinge', '1992-01-24', 4, 40, 40, 44);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Esbjörn', 'Kenvin', '1977-07-16', 4, 41, 41, 45);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Mylène', 'Canadas', '1963-08-15', 3, 42, 42, 46);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Marie-Thérèse', 'Resdale', '1984-09-11', 1, 43, 43, 47);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Marco', 'Resdale', '1983-10-05', 1, 43, 43, 75);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Laurélie', 'Mordey', '1961-05-08', 4, 44, 44, 48);
insert into customers (name, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('SomeCompany Ltd', 4, 45, 72, 49);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Méghane', 'Blissitt', '1973-03-12', 2, 46, 46, 50);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Maïwenn', 'Pywell', '1996-01-19', 4, 47, 47, 51);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Marie-josée', 'Gedling', '1973-01-19', 4, 48, 48, 52);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Kù', 'Ridger', '1989-02-17', 4, 49, 49, 53);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Angélique', 'Halmkin', '1990-05-24', 3, 50, 50, 54);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Thérèsa', 'Whyke', '1971-12-01', 1, 51, 51, 55);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Maëlyss', 'Cudworth', '1973-03-10', 3, 52, 52, 56);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Laïla', 'McCarver', '1979-10-29', 1, 53, 53, 57);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Yóu', 'Spilsted', '1962-03-07', 2, 54, 54, 58);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Personnalisée', 'Jeffcoat', '1990-12-23', 5, 55, 55, 59);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Célestine', 'Siddaley', '1973-06-30', 1, 56, 56, 60);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Edmée', 'Emblen', '1977-08-18', 4, 57, 57, 61);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Adèle', 'Liddon', '1993-12-10', 5, 58, 58, 62);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Rachèle', 'Padefield', '1990-09-10', 4, 59, 59, 63);
insert into customers (name, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('TAK Gmbh', 3, 60, 71, 64);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Gaëlle', 'Milmore', '1982-02-26', 2, 61, 61, 65);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Mårten', 'Corston', '1961-09-21', 2, 62, 62, 66);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Tú', 'Edeson', '1962-03-23', 4, 63, 63, 67);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Régine', 'Bibb', '1967-09-22', 4, 64, 64, 68);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Åslög', 'Kilban', '1964-01-28', 4, 65, 65, 69);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Néhémie', 'Raise', '1969-07-11', 3, 66, 66, 70);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Mélanie', 'Keyse', '1966-03-18', 2, 67, 67, 71);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Östen', 'Galvan', '1982-12-20', 2, 68, 68, 72);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Marie-josée', 'Abby', '1982-03-16', 1, 69, 69, 73);
insert into customers (name, surname, dateOfBirth, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Thérèsa', 'McCrone', '1964-11-18', 1, 70, 73, 74);

/* ########################################################################## CREDIT_CARDS ##########################################################################  */
insert into credit_cards (customerID, number, expirationDate) values (1, 1898712488947874, '2025-03-11');
insert into credit_cards (customerID, number, expirationDate) values (1, 1898712488947875, '2022-07-15');
insert into credit_cards (customerID, number, expirationDate) values (1, 1898712488947876, '2017-09-10');
insert into credit_cards (customerID, number, expirationDate) values (2, 1459754170266391, '2019-11-11');
insert into credit_cards (customerID, number, expirationDate) values (3, 1203314486920424, '2022-12-26');
insert into credit_cards (customerID, number, expirationDate) values (4, 1317651761615591, '2023-08-27');
insert into credit_cards (customerID, number, expirationDate) values (5, 1551214339871004, '2018-09-29');
insert into credit_cards (customerID, number, expirationDate) values (6, 1489547172266669, '2024-08-07');
insert into credit_cards (customerID, number, expirationDate) values (7, 1784628178169878, '2024-06-23');
insert into credit_cards (customerID, number, expirationDate) values (8, 1087611512731377, '2018-07-27');
insert into credit_cards (customerID, number, expirationDate) values (9, 1802498364080355, '2019-06-21');
insert into credit_cards (customerID, number, expirationDate) values (10, 1267278091347393, '2020-09-01');
insert into credit_cards (customerID, number, expirationDate) values (11, 1160864987374937, '2023-07-12');
insert into credit_cards (customerID, number, expirationDate) values (12, 1615809011450621, '2025-10-19');
insert into credit_cards (customerID, number, expirationDate) values (13, 1346002374091882, '2025-06-02');
insert into credit_cards (customerID, number, expirationDate) values (14, 1307405145505041, '2020-03-22');
insert into credit_cards (customerID, number, expirationDate) values (15, 1596725605085498, '2023-09-17');
insert into credit_cards (customerID, number, expirationDate) values (16, 1181676020731340, '2020-07-08');
insert into credit_cards (customerID, number, expirationDate) values (17, 1513602799527340, '2017-07-21');
insert into credit_cards (customerID, number, expirationDate) values (18, 1732998857606294, '2024-03-09');
insert into credit_cards (customerID, number, expirationDate) values (19, 1325092027853691, '2025-07-18');
insert into credit_cards (customerID, number, expirationDate) values (20, 1251494019624559, '2018-01-10');
insert into credit_cards (customerID, number, expirationDate) values (21, 1297304736923566, '2017-01-05');
insert into credit_cards (customerID, number, expirationDate) values (22, 1521023135935819, '2018-03-15');
insert into credit_cards (customerID, number, expirationDate) values (23, 1461395796400980, '2018-11-01');
insert into credit_cards (customerID, number, expirationDate) values (24, 1164290393875218, '2019-05-03');
insert into credit_cards (customerID, number, expirationDate) values (25, 1501356814658408, '2018-03-05');
insert into credit_cards (customerID, number, expirationDate) values (26, 1496677984993051, '2021-11-18');
insert into credit_cards (customerID, number, expirationDate) values (27, 1529889202149440, '2020-04-12');
insert into credit_cards (customerID, number, expirationDate) values (28, 1690068313511966, '2017-03-08');
insert into credit_cards (customerID, number, expirationDate) values (29, 1306963274403103, '2024-12-29');
insert into credit_cards (customerID, number, expirationDate) values (30, 1240952676867353, '2021-03-22');
insert into credit_cards (customerID, number, expirationDate) values (31, 1876092238744328, '2023-12-14');
insert into credit_cards (customerID, number, expirationDate) values (32, 1535691301114459, '2017-07-09');
insert into credit_cards (customerID, number, expirationDate) values (33, 1080494503237987, '2020-06-11');
insert into credit_cards (customerID, number, expirationDate) values (34, 1065348223135277, '2025-03-18');
insert into credit_cards (customerID, number, expirationDate) values (35, 1066299802237219, '2024-02-23');
insert into credit_cards (customerID, number, expirationDate) values (36, 1414791635718007, '2016-09-20');
insert into credit_cards (customerID, number, expirationDate) values (36, 1414791635718182, '2022-09-20');
insert into credit_cards (customerID, number, expirationDate) values (36, 1414791635718912, '2024-09-20');
insert into credit_cards (customerID, number, expirationDate) values (37, 1261786444807099, '2023-04-11');
insert into credit_cards (customerID, number, expirationDate) values (38, 1155905964025152, '2018-05-06');
insert into credit_cards (customerID, number, expirationDate) values (39, 1425381967850713, '2022-01-23');
insert into credit_cards (customerID, number, expirationDate) values (40, 1302427572135209, '2021-01-04');
insert into credit_cards (customerID, number, expirationDate) values (41, 1400879906187067, '2018-06-22');
insert into credit_cards (customerID, number, expirationDate) values (42, 1012126951070127, '2020-10-05');
insert into credit_cards (customerID, number, expirationDate) values (43, 1764169689229734, '2017-04-07');
insert into credit_cards (customerID, number, expirationDate) values (44, 1380922496718699, '2018-05-09');
insert into credit_cards (customerID, number, expirationDate) values (45, 1050485802693784, '2024-02-02');
insert into credit_cards (customerID, number, expirationDate) values (45, 1050485802693792, '2020-12-02');
insert into credit_cards (customerID, number, expirationDate) values (46, 1013222647315276, '2020-11-14');

/* ########################################################################## CAR_STATUSES ##########################################################################  */
insert into car_statuses (status) values ('free');
insert into car_statuses (status) values ('loaned');
insert into car_statuses (status) values ('missing');

/* ########################################################################## CARS ##########################################################################  */
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Mazda', 'MPV', 1994, 'Aquamarine', 1.3, 117, 39521, 'CV48673');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Saab', '9-7X', 2008, 'Red', 2.2, 117, 62543, 'CV23362');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'SUV', 'Fairthorpe', 'Rockette', 1960, 'Teal', 1.9, 149, 35485, 'ED56977');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Ford', 'E-Series', 1995, 'Aquamarine', 1.6, 81, 49859, 'MN35086');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Honda', 'Accord', 2000, 'Maroon', 2.4, 152, 59101, 'GL59491');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Toyota', 'Sienna', 2010, 'Red', 2.0, 195, 54694, 'CV67200');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Lexus', 'IS', 2005, 'Indigo', 2.1, 114, 25747, 'ED62948');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Dodge', 'Ram 2500 Club', 1998, 'Orange', 2.5, 190, 39116, 'CV70691');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Chevrolet', 'Tahoe', 2013, 'Orange', 2.0, 141, 55076, 'IW66961');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Chevrolet', 'Corvette', 2007, 'Red', 2.2, 169, 10253, 'IW37781');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mazda', 'B-Series', 1987, 'Aquamarine', 1.7, 217, 44262, 'PO40837');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Chevrolet', 'Corvette', 1962, 'Orange', 1.5, 139, 57684, 'ED43417');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Acura', 'NSX', 2001, 'Yellow', 1.6, 151, 45610, 'ED87350');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (3, 'sport', 'Audi', '5000S', 1986, 'Puce', 1.1, 138, 49941, 'CV19350');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Ford', 'Excursion', 2005, 'Teal', 2.2, 214, 23029, 'IW29866');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Dodge', 'Grand Caravan', 1995, 'Puce', 1.0, 218, 61304, 'PO45878');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Fillmore', 'Fillmore', 1960, 'Indigo', 2.2, 92, 38379, 'LN61188');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Nissan', 'Pathfinder', 2007, 'Purple', 2.1, 162, 20925, 'ED41289');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Chrysler', '200', 2011, 'Turquoise', 2.0, 179, 20402, 'IW27203');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Ford', 'Ranger', 2011, 'Maroon', 2.2, 158, 57828, 'GL66842');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Ford', 'GT', 2005, 'Aquamarine', 1.1, 163, 47310, 'SW71133');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Infiniti', 'FX', 2011, 'Pink', 2.2, 90, 60532, 'LN41612');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Audi', '4000s Quattro', 1986, 'Aquamarine', 1.4, 177, 11063, 'GL62179');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Subaru', 'Impreza', 2012, 'Blue', 1.6, 162, 16171, 'IW34188');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Ford', 'Expedition', 2006, 'Pink', 1.1, 152, 34143, 'CV17691');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Suzuki', 'Forenza', 2006, 'Violet', 2.4, 131, 45792, 'CV81968');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mercury', 'Grand Marquis', 1996, 'Turquoise', 2.3, 211, 44983, 'IW25101');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Pontiac', 'Grand Prix', 1999, 'Maroon', 1.7, 196, 50393, 'GL20596');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Chevrolet', 'Volt', 2012, 'Orange', 2.0, 220, 40313, 'GL62753');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Chevrolet', 'Suburban 2500', 2007, 'Red', 2.5, 128, 26834, 'ED64917');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Chevrolet', 'Beretta', 1995, 'Teal', 2.3, 219, 38220, 'PO57058');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Saab', '900', 1989, 'Mauv', 0.9, 91, 57895, 'MN79242');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Isuzu', 'Ascender', 2009, 'Red', 1.4, 107, 12830, 'CV63836');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Pontiac', 'Firebird', 1994, 'Maroon', 0.9, 212, 37138, 'ED47571');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Cadillac', 'Escalade ESV', 2011, 'Yellow', 2.3, 216, 10504, 'ED33344');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Lincoln', 'Town Car', 2000, 'Yellow', 1.2, 93, 12055, 'ED53933');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Chrysler', 'Cirrus', 1996, 'Green', 1.1, 110, 40528, 'PO35707');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Oldsmobile', 'Alero', 1999, 'Purple', 1.2, 196, 59699, 'PO58065');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Chevrolet', 'Silverado 2500', 2000, 'Goldenrod', 2.5, 141, 62678, 'MN22622');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Scion', 'xD', 2011, 'Red', 1.1, 140, 54616, 'IW21881');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Chevrolet', 'Lumina APV', 1992, 'Orange', 1.1, 198, 29568, 'MN82565');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Jaguar', 'XJ Series', 1994, 'Pink', 2.5, 153, 33468, 'IW59654');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Pontiac', 'Bonneville', 2000, 'Mauv', 1.9, 82, 52223, 'IW20789');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Volkswagen', 'Routan', 2009, 'Pink', 1.7, 150, 22531, 'IW25593');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Pontiac', 'Firefly', 1992, 'Violet', 2.1, 136, 33496, 'PO18303');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mercury', 'Cougar', 1989, 'Teal', 1.8, 116, 16297, 'LN20720');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Lincoln', 'MKS', 2012, 'Aquamarine', 1.6, 89, 26737, 'IW28546');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Cadillac', 'Fleetwood', 1996, 'Red', 2.0, 83, 60700, 'LN76152');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Honda', 'Accord', 1983, 'Pink', 2.0, 128, 58965, 'CV48431');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Oldsmobile', '88', 1996, 'Khaki', 1.9, 206, 23445, 'ED76341');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mercedes-Benz', 'CLS-Class', 2010, 'Yellow', 1.5, 118, 62814, 'GL80057');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Audi', '5000S', 1987, 'Crimson', 1.5, 176, 37473, 'GL33490');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Toyota', '4Runner', 1994, 'Fuscia', 1.9, 90, 60964, 'SW45151');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Lotus', 'Elise', 2009, 'Green', 1.6, 146, 43719, 'ED48626');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'hatchback', 'Ford', 'Transit Connect', 2013, 'Green', 1.4, 143, 41706, 'PO49708');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Pontiac', 'Bonneville', 1965, 'Fuscia', 2.3, 89, 43318, 'SW22156');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Saturn', 'S-Series', 1999, 'Puce', 1.0, 88, 43436, 'IW49713');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Maserati', 'GranSport', 2005, 'Orange', 1.2, 140, 15388, 'GL70465');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Audi', 'A8', 1998, 'Orange', 2.2, 192, 40952, 'IW15920');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Dodge', 'D150', 1993, 'Red', 2.2, 94, 22876, 'LN48443');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Honda', 'Insight', 2004, 'Aquamarine', 1.6, 197, 30187, 'IW68620');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Ford', 'F350', 2004, 'Teal', 1.2, 151, 31285, 'ED21926');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'BMW', 'Z3', 2002, 'Fuscia', 1.7, 111, 39049, 'GL68152');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mazda', 'MX-3', 1992, 'Green', 1.6, 148, 61699, 'LN38688');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Dodge', 'Dakota', 2010, 'Goldenrod', 2.3, 144, 29938, 'SW74470');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Honda', 'Odyssey', 2009, 'Teal', 2.2, 185, 16602, 'PO51090');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Pontiac', 'Firefly', 1995, 'Blue', 1.5, 147, 23343, 'SW56731');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Toyota', 'Tacoma', 2001, 'Violet', 1.3, 102, 62227, 'LN78026');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Dodge', 'Dakota Club', 1993, 'Purple', 2.2, 202, 39784, 'PO63249');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'GMC', '3500', 1993, 'Turquoise', 2.2, 97, 11258, 'LN18701');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Pontiac', 'Firebird Trans Am', 1986, 'Indigo', 1.0, 203, 39610, 'CV86907');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Nissan', 'Sentra', 1991, 'Red', 2.4, 171, 19496, 'IW84861');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Mazda', 'RX-7', 1994, 'Teal', 1.6, 182, 31140, 'CV21612');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Lincoln', 'Town Car', 2001, 'Purple', 2.3, 202, 49067, 'IW17673');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Audi', 'S6', 2009, 'Crimson', 1.1, 135, 23200, 'IW15578');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Dodge', 'Ram 2500 Club', 1997, 'Blue', 2.5, 81, 61206, 'GL41836');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'BMW', 'Z4', 2011, 'Crimson', 1.1, 196, 13032, 'GL63330');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mazda', 'MX-6', 1996, 'Turquoise', 1.3, 173, 19656, 'ED19126');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'GMC', 'Yukon XL 2500', 2009, 'Maroon', 2.5, 206, 63926, 'GL19453');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Ford', 'Thunderbird', 1993, 'Mauv', 1.3, 165, 35347, 'ED87167');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Toyota', 'Venza', 2010, 'Yellow', 1.7, 168, 54868, 'CV51354');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'SUV', 'Suzuki', 'Sidekick', 1989, 'Turquoise', 1.0, 97, 38358, 'MN27360');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Subaru', 'XT', 1990, 'Orange', 2.2, 96, 31810, 'CV86060');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Dodge', 'Colt', 1993, 'Khaki', 1.1, 90, 43915, 'MN17755');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Honda', 'Passport', 2001, 'Turquoise', 1.3, 112, 15969, 'CV38128');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mitsubishi', 'Pajero', 1986, 'Mauv', 2.0, 106, 31161, 'SW38853');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Chevrolet', 'Corvette', 1969, 'Aquamarine', 1.3, 205, 56615, 'ED20849');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Ford', 'Explorer', 2012, 'Blue', 2.3, 95, 53639, 'LN67645');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Buick', 'Rendezvous', 2004, 'Purple', 0.9, 207, 31165, 'SW20645');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Kia', 'Optima', 2008, 'Khaki', 1.0, 189, 11149, 'CV63183');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Chrysler', 'Concorde', 1996, 'Khaki', 2.0, 87, 10078, 'ED51858');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Pontiac', 'Grand Prix', 2005, 'Mauv', 2.5, 106, 60447, 'PO77021');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Geo', 'Tracker', 1993, 'Indigo', 1.5, 95, 48634, 'SW38474');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Cadillac', 'DeVille', 1995, 'Teal', 1.0, 176, 40667, 'IW23515');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Isuzu', 'Rodeo', 2000, 'Violet', 2.4, 141, 60836, 'ED19839');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Chevrolet', 'Express 2000', 1999, 'Mauv', 2.0, 132, 13597, 'IW24124');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mazda', 'B-Series', 1999, 'Fuscia', 2.5, 151, 49287, 'GL52412');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Chrysler', 'Town & Country', 1999, 'Crimson', 1.4, 131, 26062, 'SW66151');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Pontiac', 'Grand Prix', 1989, 'Blue', 1.4, 134, 63842, 'CV58491');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Subaru', 'Outback', 2005, 'Maroon', 2.2, 91, 17373, 'CV39182');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Mitsubishi', 'Lancer', 2008, 'Crimson', 1.6, 130, 42170, 'IW44694');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Ferrari', '599 GTB Fiorano', 2007, 'Red', 1.9, 100, 52225, 'LN22472');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Subaru', 'Justy', 1992, 'Turquoise', 1.6, 120, 19523, 'SW76441');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mazda', '626', 1984, 'Purple', 2.5, 152, 56749, 'SW48705');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Acura', 'RL', 2005, 'Turquoise', 1.1, 103, 42718, 'ED71728');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'crossover', 'Kia', 'Carens', 2007, 'Indigo', 1.4, 178, 12673, 'SW74493');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Pontiac', 'Grand Prix', 1998, 'Green', 2.3, 101, 11293, 'CV54944');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Buick', 'Terraza', 2007, 'Violet', 1.9, 80, 21803, 'LN80228');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Lexus', 'GS', 2003, 'Pink', 1.7, 211, 29918, 'ED59101');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Ford', 'E-Series', 2004, 'Indigo', 2.2, 94, 39130, 'GL83175');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Hyundai', 'Genesis Coupe', 2011, 'Fuscia', 1.4, 203, 13826, 'PO68824');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Mercury', 'Grand Marquis', 2005, 'Mauv', 1.0, 117, 55315, 'IW20950');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Maserati', 'Karif', 1990, 'Green', 1.2, 140, 47900, 'ED29248');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Saab', '9-7X', 2007, 'Puce', 1.3, 114, 13189, 'SW66558');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Toyota', 'Tercel', 1997, 'Teal', 1.7, 220, 12021, 'ED68051');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Volvo', 'V70', 2007, 'Indigo', 1.9, 128, 30059, 'ED79495');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Chevrolet', 'Suburban', 2007, 'Aquamarine', 1.1, 96, 20480, 'ED55515');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mazda', 'RX-7', 1994, 'Puce', 1.7, 206, 59403, 'GL55793');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Plymouth', 'Reliant', 1981, 'Turquoise', 1.2, 111, 18209, 'LN78497');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Dodge', 'Nitro', 2011, 'Yellow', 2.3, 103, 34899, 'IW55445');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Dodge', 'Stratus', 2001, 'Maroon', 1.1, 206, 31334, 'ED68503');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Nissan', 'Murano', 2003, 'Teal', 2.1, 95, 27596, 'SW71125');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'SUV', 'Kia', 'Sorento', 2011, 'Red', 1.5, 219, 19409, 'IW59814');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Mitsubishi', 'Expo', 1994, 'Crimson', 1.4, 143, 47547, 'IW62135');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mercury', 'Mariner', 2005, 'Red', 1.0, 132, 46616, 'MN73553');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Dodge', 'Intrepid', 2002, 'Yellow', 1.5, 193, 62332, 'MN26954');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'minivan', 'Spyker', 'C8 Spyder', 2004, 'Mauv', 1.1, 95, 37085, 'CV87107');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mitsubishi', 'Montero Sport', 2002, 'Indigo', 1.5, 145, 46129, 'CV54696');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Chevrolet', 'Corvette', 1997, 'Goldenrod', 2.2, 173, 32687, 'PO57911');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mercury', 'Cougar', 1997, 'Red', 2.0, 211, 64593, 'SW32125');

/* ########################################################################## RENTAL_DATA ##########################################################################  */
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (19, 127, '2016-07-20', '2016-07-27', 3, 2, '203.51');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (34, 101, '2015-04-05', '2016-09-17', 4, 1, '259.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (11, 51, '2016-01-23', '2016-01-27', 1, 1, '297.41');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 95, '2016-09-02', '2016-09-09', 2, 5, '182.66');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (22, 106, '2014-09-27', '2016-10-16', 3, 4, '136.25');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (36, 24, '2016-10-09', '2016-10-14', 1, 1, '296.06');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 8, '2014-12-19', '2015-03-30', 4, 1, '267.60');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (22, 29, '2016-08-08', '2016-08-15', 5, 1, '238.06');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (17, 20, '2014-11-02', '2016-08-07', 3, 4, '139.83');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (8, 35, '2017-04-08', '2017-04-09', 3, 3, '141.56');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (29, 6, '2017-01-04', '2017-01-09', 2, 3, '205.28');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (5, 124, '2017-06-03', '2017-06-04', 3, 1, '227.36');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (1, 6, '2015-02-19', '2015-12-09', 2, 2, '273.77');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (7, 62, '2015-08-21', '2015-08-22', 2, 5, '135.61');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (35, 91, '2016-04-24', '2016-04-30', 4, 4, '202.96');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 102, '2015-03-27', '2017-04-11', 5, 5, '118.86');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (7, 118, '2016-04-12', '2016-04-17', 2, 1, '109.84');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 107, '2016-03-05', '2016-03-12', 5, 2, '152.12');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 77, '2016-05-28', '2017-02-05', 3, 1, '200.58');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 40, '2016-07-07', '2016-07-11', 4, 4, '231.91');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 96, '2016-07-11', '2016-07-17', 4, 2, '144.07');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (42, 121, '2016-11-28', '2017-04-24', 3, 1, '293.27');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 66, '2016-01-05', '2016-06-18', 5, 1, '215.54');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (37, 29, '2015-03-05', '2017-01-07', 4, 1, '226.72');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 63, '2014-11-12', '2015-08-20', 1, 2, '200.16');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 42, '2016-10-17', '2016-10-24', 2, 2, '244.98');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (5, 3, '2017-06-10', '2017-08-05', 3, 5, '275.30');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (4, 52, '2015-08-09', '2017-07-22', 3, 5, '216.04');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (5, 111, '2015-01-16', '2017-06-30', 2, 3, '265.06');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (10, 3, '2014-11-11', '2015-05-26', 5, 5, '282.79');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (12, 19, '2015-10-28', '2015-10-30', 4, 2, '113.12');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (15, 36, '2016-07-19', '2016-09-13', 3, 1, '213.19');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (28, 100, '2015-09-02', '2017-07-30', 3, 1, '254.70');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 92, '2015-04-25', '2015-09-25', 1, 2, '257.60');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (45, 53, '2015-06-09', '2016-11-27', 4, 3, '275.06');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (16, 82, '2016-10-31', '2016-11-02', 1, 4, '170.83');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (29, 30, '2016-11-21', '2016-11-27', 2, 2, '143.02');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 16, '2015-03-19', '2017-01-18', 5, 3, '193.67');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (9, 51, '2016-11-04', '2016-11-09', 5, 3, '207.07');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (39, 16, '2015-05-31', '2016-12-27', 5, 5, '295.50');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (18, 96, '2015-08-26', '2017-04-26', 5, 5, '248.01');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (7, 95, '2014-11-30', '2015-08-11', 3, 1, '197.79');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (31, 69, '2015-04-10', '2015-04-17', 5, 4, '135.25');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 1, '2014-12-29', '2015-02-26', 4, 4, '255.59');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 6, '2016-04-04', '2016-04-24', 4, 1, '115.13');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 84, '2016-06-29', '2016-07-12', 5, 5, '127.33');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (33, 73, '2015-09-27', '2015-09-29', 1, 2, '197.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 63, '2015-03-23', '2017-04-22', 4, 5, '189.70');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 16, '2015-05-01', '2016-11-16', 1, 5, '103.62');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (7, 52, '2017-07-05', '2017-07-06', 1, 1, '165.97');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (21, 54, '2016-01-13', '2016-02-28', 5, 2, '275.65');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 26, '2017-06-17', '2017-06-21', 2, 4, '233.25');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (23, 65, '2016-12-14', '2017-01-18', 2, 5, '159.78');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (12, 24, '2016-12-05', '2016-12-12', 2, 5, '103.53');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (37, 55, '2016-05-20', '2016-05-21', 4, 4, '163.19');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (46, 118, '2016-12-27', '2016-12-31', 3, 4, '172.55');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 73, '2015-12-27', '2015-12-31', 2, 5, '163.91');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (16, 56, '2014-10-14', '2015-04-09', 2, 1, '260.03');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 106, '2016-12-27', '2016-12-28', 4, 4, '262.33');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (33, 43, '2015-07-03', '2016-09-03', 1, 3, '149.02');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (34, 88, '2016-02-03', '2016-03-20', 2, 2, '136.34');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 11, '2016-05-20', '2016-05-24', 3, 1, '155.52');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 106, '2016-06-05', '2017-08-06', 2, 5, '199.18');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 25, '2015-02-13', '2015-02-20', 1, 5, '235.62');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (13, 30, '2015-11-25', '2015-11-29', 3, 1, '193.00');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 118, '2015-10-07', '2016-08-10', 2, 2, '180.71');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 95, '2016-02-18', '2016-02-24', 4, 1, '183.16');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (35, 1, '2015-05-12', '2017-07-11', 3, 1, '103.27');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (24, 98, '2016-10-04', '2016-10-05', 3, 5, '244.35');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (24, 112, '2016-01-07', '2016-10-21', 2, 2, '277.69');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (28, 74, '2015-07-28', '2015-07-29', 3, 2, '136.19');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (17, 111, '2015-09-10', '2015-10-10', 1, 2, '281.64');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (8, 74, '2016-05-24', '2016-05-25', 4, 2, '186.38');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (5, 75, '2015-02-24', '2017-03-05', 4, 5, '109.92');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (21, 76, '2016-08-14', '2016-08-21', 4, 2, '217.50');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 33, '2015-07-31', '2015-08-20', 2, 4, '578.23');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 106, '2017-03-14', '2017-07-13', 5, 2, '198.66');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (14, 61, '2015-07-01', '2016-09-24', 1, 1, '175.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 15, '2015-11-03', '2017-07-30', 1, 4, '281.09');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (21, 52, '2016-10-26', '2016-10-29', 5, 1, '247.52');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (10, 50, '2015-05-29', '2016-07-02', 1, 4, '263.75');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 12, '2017-07-25', '2017-07-29', 4, 2, '157.71');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 22, '2014-12-24', '2016-07-22', 5, 4, '255.60');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (31, 80, '2017-01-04', '2017-01-06', 3, 5, '218.10');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (41, 12, '2015-09-06', '2015-09-10', 1, 4, '294.72');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 118, '2017-01-11', '2017-01-13', 2, 1, '250.76');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 104, '2017-06-16', '2017-06-20', 1, 4, '152.64');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 42, '2015-02-09', '2015-02-16', 4, 3, '223.34');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (11, 27, '2017-04-10', '2017-04-11', 4, 3, '225.70');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (15, 78, '2016-11-06', '2017-05-04', 5, 2, '158.56');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (18, 9, '2015-09-02', '2015-09-03', 4, 4, '164.38');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 41, '2015-11-15', '2015-11-16', 2, 4, '201.44');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (4, 31, '2015-02-06', '2016-11-09', 2, 4, '106.11');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 90, '2017-05-22', '2017-05-25', 5, 5, '186.61');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 69, '2015-07-07', '2015-10-25', 4, 5, '182.64');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (34, 60, '2015-05-14', '2015-05-17', 2, 3, '274.55');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 54, '2016-04-12', '2016-10-23', 4, 1, '258.10');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (27, 33, '2016-11-22', '2016-11-23', 1, 2, '261.24');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (45, 27, '2015-11-16', '2017-06-04', 3, 3, '207.93');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (12, 124, '2014-12-18', '2016-11-27', 3, 4, '154.90');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (31, 105, '2015-11-21', '2015-11-26', 1, 4, '190.41');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (46, 28, '2015-04-01', '2015-04-05', 5, 3, '282.65');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 103, '2016-06-11', '2017-06-25', 2, 2, '201.11');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (31, 20, '2015-02-24', '2017-05-01', 2, 3, '288.56');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (25, 24, '2017-06-29', '2017-06-30', 1, 1, '212.71');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (41, 55, '2015-02-24', '2017-03-21', 2, 5, '226.88');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 124, '2017-02-13', '2017-02-20', 1, 3, '242.52');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (31, 109, '2017-05-26', '2017-05-28', 1, 5, '163.86');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (11, 49, '2015-01-05', '2015-11-09', 3, 4, '209.99');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (42, 36, '2016-10-29', '2016-11-10', 5, 2, '104.51');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (35, 103, '2016-06-03', '2016-10-05', 4, 5, '247.75');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (24, 115, '2016-11-16', '2016-11-22', 3, 5, '145.03');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (26, 28, '2016-03-29', '2016-03-30', 4, 5, '141.32');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (13, 52, '2017-01-11', '2017-03-18', 1, 3, '161.40');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (33, 30, '2015-07-30', '2016-04-30', 3, 1, '225.47');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (1, 69, '2015-04-10', '2015-09-19', 4, 1, '140.46');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (3, 101, '2017-03-26', '2017-06-11', 2, 2, '194.03');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (7, 60, '2017-03-18', '2017-03-19', 5, 3, '149.63');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (12, 116, '2015-06-14', '2017-05-29', 5, 4, '240.02');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 2, '2016-01-16', '2017-02-17', 1, 5, '234.25');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (21, 92, '2016-12-07', '2016-12-11', 1, 2, '219.10');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (15, 114, '2017-07-06', '2017-07-28', 1, 3, '285.59');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (37, 91, '2015-01-04', '2015-01-11', 3, 4, '131.92');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (21, 104, '2016-09-28', '2016-09-30', 1, 2, '208.94');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (14, 60, '2014-10-15', '2016-03-09', 3, 4, '111.01');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (34, 81, '2017-05-17', '2017-05-19', 2, 2, '262.62');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (29, 46, '2014-10-24', '2017-01-16', 2, 3, '151.74');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (19, 9, '2015-02-24', '2016-10-31', 5, 4, '287.51');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (41, 88, '2016-10-19', '2016-10-23', 5, 4, '126.46');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (25, 27, '2016-06-20', '2016-06-21', 3, 2, '280.83');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (27, 112, '2015-01-20', '2015-10-03', 2, 2, '299.62');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (27, 72, '2016-08-08', '2016-08-10', 1, 2, '243.80');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 18, '2015-06-15', '2016-03-23', 1, 2, '222.31');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 24, '2015-05-17', '2017-03-05', 3, 5, '146.98');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 47, '2016-12-22', '2016-12-28', 4, 1, '192.72');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (46, 124, '2016-10-02', '2016-10-07', 5, 1, '186.54');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (24, 112, '2017-03-10', '2017-03-16', 3, 4, '182.82');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (4, 27, '2017-02-22', '2017-04-27', 2, 3, '112.20');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (5, 40, '2015-05-30', '2015-05-31', 4, 3, '146.27');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (9, 17, '2017-02-07', '2017-06-18', 3, 5, '196.80');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (14, 4, '2016-06-06', '2016-09-11', 1, 5, '125.64');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 110, '2015-02-09', '2015-03-30', 2, 2, '259.84');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (15, 17, '2015-09-27', '2015-11-16', 4, 1, '168.18');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (12, 22, '2016-01-16', '2016-12-29', 3, 5, '191.65');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (42, 7, '2015-04-14', '2017-06-29', 4, 1, '102.76');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (17, 98, '2015-04-26', '2015-12-04', 5, 5, '194.22');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 9, '2015-09-16', '2015-09-21', 5, 2, '168.58');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (15, 113, '2017-07-10', '2017-07-17', 1, 4, '135.24');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (21, 18, '2015-06-26', '2017-07-11', 5, 4, '131.72');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (7, 101, '2017-06-21', '2017-07-27', 5, 2, '138.09');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (20, 42, '2016-07-31', '2016-08-12', 2, 4, '285.87');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 75, '2016-12-26', '2016-12-28', 4, 2, '123.50');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (27, 18, '2014-10-06', '2015-11-17', 2, 3, '160.07');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 110, '2015-04-08', '2015-11-10', 3, 4, '118.31');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 130, '2017-02-20', '2017-02-24', 4, 5, '165.34');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (9, 106, '2015-03-04', '2016-10-25', 4, 4, '299.99');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (3, 32, '2017-07-13', '2017-07-16', 5, 3, '272.01');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (29, 19, '2015-09-18', '2015-09-23', 4, 4, '276.37');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (19, 84, '2017-06-21', '2017-06-24', 5, 2, '258.59');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (33, 70, '2016-09-17', '2016-10-30', 1, 1, '265.62');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (2, 51, '2015-11-07', '2015-11-14', 2, 3, '276.82');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (24, 34, '2017-07-09', '2017-07-12', 2, 2, '116.01');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (34, 102, '2016-04-01', '2016-04-03', 4, 4, '239.61');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (33, 14, '2014-11-18', '2015-08-11', 5, 5, '228.18');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (4, 108, '2017-05-11', '2017-05-14', 5, 5, '225.97');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 78, '2015-03-21', '2017-02-21', 5, 5, '258.68');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 128, '2015-03-17', '2017-03-30', 5, 1, '286.18');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (24, 45, '2016-06-28', '2016-08-08', 5, 2, '137.52');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (37, 102, '2017-02-10', '2017-02-16', 5, 2, '266.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (18, 101, '2015-04-10', '2017-06-13', 5, 2, '223.04');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 16, '2015-12-06', '2015-12-09', 1, 5, '181.42');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (41, 125, '2014-10-26', '2016-08-15', 3, 5, '114.27');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (8, 34, '2017-02-08', '2017-02-09', 1, 4, '128.30');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (4, 56, '2016-05-18', '2017-02-06', 2, 2, '297.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 53, '2016-06-23', '2016-06-27', 3, 3, '100.88');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 7, '2015-01-22', '2016-08-16', 4, 2, '146.78');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (33, 21, '2016-10-22', '2017-05-13', 4, 5, '284.01');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (9, 25, '2015-07-24', '2015-07-25', 1, 4, '230.87');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (45, 129, '2016-01-04', '2016-01-09', 4, 5, '208.12');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (14, 49, '2017-01-30', '2017-03-26', 5, 3, '238.79');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (19, 41, '2015-09-21', '2017-02-07', 5, 2, '161.25');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (16, 7, '2016-03-02', '2017-03-14', 5, 5, '135.84');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (38, 109, '2016-02-21', '2016-06-30', 1, 5, '209.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (3, 28, '2015-08-21', '2016-10-12', 1, 3, '232.12');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 78, '2015-12-03', '2015-12-05', 4, 3, '169.42');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (19, 13, '2015-02-07', '2015-05-30', 1, 1, '156.18');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (22, 44, '2015-12-01', '2016-06-27', 5, 4, '228.46');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (4, 83, '2017-05-23', '2017-05-27', 5, 4, '221.02');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (10, 11, '2016-04-19', '2016-09-04', 5, 5, '114.74');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (43, 6, '2016-08-04', '2016-08-09', 2, 2, '193.26');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 35, '2015-10-11', '2015-12-09', 1, 4, '228.53');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (25, 120, '2015-02-23', '2017-03-13', 2, 2, '119.97');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (10, 21, '2017-07-16', '2017-07-19', 2, 3, '102.71');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (28, 109, '2016-02-08', '2016-02-12', 3, 1, '208.09');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (9, 9, '2016-01-19', '2016-01-24', 4, 3, '292.91');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (46, 100, '2014-11-26', '2017-06-17', 3, 3, '119.82');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (28, 27, '2014-11-04', '2016-10-22', 5, 5, '211.08');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (3, 49, '2017-04-01', '2017-04-08', 3, 2, '160.60');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (27, 76, '2016-11-15', '2016-11-19', 1, 1, '116.25');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (23, 115, '2015-03-28', '2015-05-28', 1, 4, '197.23');

insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 3, '2017-07-28', '2017-09-10', 1, 5, '300.12');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (46, 29, '2017-08-11', '2017-09-11', 2, 4, '120.23');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (23, 55, '2017-08-10', '2017-10-16', 5, 3, '340.00');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (40, 82, '2017-07-20', '2017-08-31', 3, 1, '200.45');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (6, 106, '2017-06-29', '2017-09-20', 1, 4, '340.18');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (12, 109, '2017-08-12', '2017-12-27', 3, 4, '450.00');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (32, 123, '2017-07-10', '2018-01-02', 4, 4, '520.50');
insert into rental_data (customerID, carID, dateSince, dateTo, fromAgencyID, toAgencyID, price) values (30, 127, '2017-08-12', '2017-09-02', 1, 1, '120.50');

/* ########################################################################## CAR_SUPERVISORS ##########################################################################  */
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 10, '2017-05-05', '2017-05-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 42, '2016-05-07', '2016-05-09');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 83, '2015-10-02', '2015-10-05');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 97, '2017-06-10', '2017-07-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 28, '2016-03-09', '2016-03-10');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 99, '2014-06-08', '2016-11-21');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (2, 116, '2014-04-08', '2017-01-02');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 50, '2015-11-04', '2015-11-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 5, '2014-05-20', '2016-08-10');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (13, 130, '2015-11-01', '2015-11-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (9, 111, '2015-07-09', '2016-03-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (10, 5, '2015-09-24', '2015-11-24');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 57, '2015-04-29', '2015-09-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 77, '2014-10-22', '2014-12-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 19, '2015-01-27', '2015-08-16');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 54, '2014-06-08', '2014-07-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 80, '2016-03-20', '2016-12-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (12, 96, '2017-07-02', '2017-07-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 24, '2015-07-19', '2016-04-28');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 30, '2014-12-10', '2017-07-28');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 86, '2015-12-16', '2017-02-13');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 44, '2016-09-30', '2016-10-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 127, '2015-04-28', '2016-12-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 83, '2016-12-25', '2017-09-10');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 102, '2015-09-12', '2015-09-13');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (9, 23, '2016-12-30', '2017-03-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 19, '2016-01-19', '2016-05-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 56, '2014-08-25', '2017-01-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (9, 25, '2016-10-03', '2016-10-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 3, '2017-06-10', '2017-06-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 57, '2015-09-17', '2015-09-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 20, '2015-10-16', '2017-09-01');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 100, '2016-08-20', '2016-08-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 4, '2014-07-03', '2015-01-11');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 51, '2017-10-16', '2017-10-18');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (7, 30, '2015-11-04', '2015-12-09');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (18, 118, '2017-04-16', '2017-04-17');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 7, '2016-12-09', '2016-12-11');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 69, '2017-05-24', '2017-05-25');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (18, 108, '2014-04-19', '2016-04-25');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 109, '2017-09-21', '2017-09-24');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 38, '2016-07-17', '2016-07-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (12, 94, '2017-07-12', '2017-07-13');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 45, '2017-06-22', '2017-06-25');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 81, '2016-12-27', '2016-12-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (22, 71, '2015-08-06', '2015-08-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 72, '2016-09-06', '2016-09-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (13, 43, '2017-07-03', '2017-07-04');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 84, '2014-05-06', '2014-06-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 117, '2016-08-14', '2016-08-16');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (13, 105, '2015-07-15', '2017-10-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (2, 23, '2014-05-08', '2015-03-30');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (2, 119, '2015-07-28', '2016-11-17');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 128, '2016-03-02', '2016-06-09');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (2, 57, '2017-08-23', '2017-08-25');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 80, '2014-08-18', '2015-06-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 10, '2015-04-10', '2015-07-17');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (5, 49, '2016-04-25', '2017-06-27');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (22, 27, '2014-08-02', '2015-11-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 26, '2016-08-20', '2017-02-24');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 77, '2015-06-11', '2015-06-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (13, 8, '2015-10-28', '2016-06-16');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (18, 115, '2017-08-26', '2017-08-27');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 48, '2015-08-18', '2015-08-21');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (22, 55, '2014-07-02', '2015-07-04');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 128, '2015-04-21', '2015-06-15');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 66, '2014-11-12', '2015-03-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 114, '2016-03-25', '2016-03-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (18, 126, '2015-05-12', '2017-08-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 124, '2016-05-03', '2016-05-05');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (7, 130, '2014-06-26', '2015-07-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 31, '2017-05-29', '2017-05-31');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 16, '2015-07-13', '2016-07-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (12, 123, '2015-04-22', '2015-11-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (5, 128, '2014-05-27', '2014-11-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 53, '2015-02-23', '2015-07-17');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 95, '2014-04-06', '2015-06-09');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (7, 100, '2016-04-13', '2016-04-15');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 84, '2016-02-16', '2017-09-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 40, '2015-04-08', '2015-04-11');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (2, 52, '2015-02-06', '2016-07-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 108, '2016-03-21', '2017-01-31');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 90, '2015-10-04', '2015-10-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 113, '2017-02-14', '2017-02-16');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 73, '2014-04-09', '2016-10-18');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 28, '2016-10-13', '2016-10-16');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (22, 62, '2016-09-11', '2016-12-09');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (18, 45, '2016-02-28', '2016-03-01');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (22, 37, '2016-12-05', '2016-12-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 7, '2015-08-15', '2015-11-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (10, 77, '2014-11-24', '2015-03-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 53, '2017-04-04', '2017-07-19');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 68, '2015-03-30', '2015-03-31');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 122, '2017-06-17', '2017-06-18');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (7, 130, '2014-11-28', '2016-06-16');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 100, '2014-08-02', '2017-06-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 43, '2014-10-11', '2014-10-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 126, '2016-02-06', '2016-02-09');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 69, '2015-08-16', '2017-05-25');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 97, '2017-04-17', '2017-04-18');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 39, '2016-12-04', '2016-12-10');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 95, '2016-09-25', '2016-09-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 108, '2016-09-28', '2016-09-30');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 81, '2015-02-18', '2015-02-19');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 117, '2014-05-21', '2016-10-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (10, 39, '2015-10-28', '2015-10-31');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 105, '2016-02-08', '2017-06-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (9, 87, '2016-10-05', '2016-10-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 80, '2014-11-22', '2016-06-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 22, '2016-12-26', '2016-12-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 115, '2015-06-16', '2016-02-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 101, '2016-10-31', '2017-07-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 23, '2015-12-05', '2017-10-14');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 10, '2015-09-30', '2015-10-01');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 71, '2014-11-27', '2015-11-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 104, '2015-07-17', '2017-08-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 113, '2014-04-10', '2016-04-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (13, 61, '2016-03-13', '2016-03-15');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (10, 96, '2016-08-29', '2016-12-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 78, '2014-11-26', '2016-09-07');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (7, 47, '2016-01-23', '2016-06-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 36, '2015-01-14', '2017-03-30');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 126, '2016-03-04', '2016-03-05');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (5, 47, '2014-04-15', '2014-07-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 73, '2014-07-23', '2015-09-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 116, '2016-04-25', '2016-04-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 112, '2017-02-07', '2017-07-22');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (17, 82, '2017-01-31', '2017-05-30');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 12, '2014-09-16', '2016-05-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 64, '2015-08-23', '2015-08-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (10, 78, '2014-04-01', '2017-06-17');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 108, '2014-06-26', '2015-10-04');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (7, 45, '2016-01-28', '2016-05-15');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (20, 15, '2014-07-21', '2015-08-25');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 54, '2016-06-01', '2016-06-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 57, '2015-10-18', '2016-08-21');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (8, 10, '2016-09-01', '2017-01-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 122, '2016-09-25', '2016-12-03');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 53, '2016-07-31', '2016-12-10');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 98, '2015-07-10', '2017-05-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 126, '2014-05-28', '2017-01-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 15, '2016-12-22', '2017-02-04');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 26, '2017-09-02', '2017-09-05');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 30, '2016-02-18', '2016-02-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (12, 38, '2015-09-27', '2015-09-30');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (9, 79, '2015-05-03', '2017-10-06');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (13, 49, '2016-11-10', '2016-11-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (6, 65, '2016-03-02', '2017-04-23');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (22, 37, '2015-06-21', '2016-07-14');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 48, '2016-12-18', '2016-12-21');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 81, '2016-07-18', '2016-07-20');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (16, 107, '2015-12-22', '2016-02-19');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 76, '2017-04-24', '2017-04-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 32, '2016-05-28', '2016-05-31');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 8, '2014-07-08', '2017-10-05');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 41, '2015-03-04', '2016-04-24');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 6, '2016-01-11', '2016-01-12');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (11, 65, '2016-02-11', '2016-02-14');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (5, 91, '2016-10-08', '2017-09-15');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 91, '2016-10-24', '2016-10-26');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (2, 51, '2014-10-07', '2017-05-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (19, 82, '2017-03-30', '2017-03-31');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (4, 32, '2017-06-28', '2017-06-29');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (9, 85, '2016-10-02', '2016-10-04');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 93, '2014-10-07', '2014-10-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (3, 49, '2015-03-01', '2016-09-19');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (14, 94, '2017-10-06', '2017-10-08');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (21, 128, '2014-11-14', '2014-12-02');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (15, 91, '2016-10-22', '2017-08-30');
insert into car_supervisors (employeeID, carID, dateSince, dateTo) values (1, 115, '2017-08-15', '2017-08-16');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 1, '2016-05-29');
insert into car_supervisors (employeeID, carID, dateSince) values (11, 2, '2014-11-13');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 3, '2014-11-26');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 4, '2015-09-22');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 5, '2015-01-04');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 6, '2016-10-01');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 7, '2016-08-20');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 8, '2016-10-27');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 9, '2015-04-11');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 10, '2014-09-17');
insert into car_supervisors (employeeID, carID, dateSince) values (14, 11, '2014-12-24');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 12, '2016-07-03');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 13, '2017-06-17');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 14, '2014-12-20');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 15, '2015-10-30');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 16, '2016-08-29');
insert into car_supervisors (employeeID, carID, dateSince) values (8, 17, '2014-07-10');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 18, '2015-04-30');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 19, '2014-10-13');
insert into car_supervisors (employeeID, carID, dateSince) values (5, 20, '2016-07-16');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 21, '2014-06-12');
insert into car_supervisors (employeeID, carID, dateSince) values (17, 22, '2014-07-21');
insert into car_supervisors (employeeID, carID, dateSince) values (14, 23, '2016-05-13');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 24, '2016-03-07');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 25, '2016-09-17');
insert into car_supervisors (employeeID, carID, dateSince) values (4, 26, '2015-10-29');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 27, '2015-11-20');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 28, '2016-01-28');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 29, '2017-02-08');
insert into car_supervisors (employeeID, carID, dateSince) values (5, 30, '2015-12-26');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 31, '2014-05-04');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 32, '2014-07-13');
insert into car_supervisors (employeeID, carID, dateSince) values (17, 33, '2015-07-03');
insert into car_supervisors (employeeID, carID, dateSince) values (19, 34, '2015-05-10');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 35, '2017-06-20');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 36, '2017-04-22');
insert into car_supervisors (employeeID, carID, dateSince) values (21, 37, '2017-02-08');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 38, '2015-04-05');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 39, '2014-09-09');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 40, '2016-07-14');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 41, '2015-09-25');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 42, '2016-06-20');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 43, '2016-10-24');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 44, '2014-10-02');
insert into car_supervisors (employeeID, carID, dateSince) values (17, 45, '2016-08-17');
insert into car_supervisors (employeeID, carID, dateSince) values (12, 46, '2014-05-30');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 47, '2014-07-17');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 48, '2016-04-07');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 49, '2016-08-11');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 50, '2014-06-02');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 51, '2015-01-22');
insert into car_supervisors (employeeID, carID, dateSince) values (17, 52, '2014-10-13');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 53, '2016-07-04');
insert into car_supervisors (employeeID, carID, dateSince) values (12, 54, '2015-07-05');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 55, '2015-04-25');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 56, '2016-02-16');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 57, '2016-04-28');
insert into car_supervisors (employeeID, carID, dateSince) values (16, 58, '2016-04-28');
insert into car_supervisors (employeeID, carID, dateSince) values (1, 59, '2017-01-15');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 60, '2015-02-08');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 61, '2014-06-13');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 62, '2015-11-12');
insert into car_supervisors (employeeID, carID, dateSince) values (4, 63, '2017-06-05');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 64, '2016-08-10');
insert into car_supervisors (employeeID, carID, dateSince) values (8, 65, '2015-04-17');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 66, '2014-07-10');
insert into car_supervisors (employeeID, carID, dateSince) values (1, 67, '2015-03-26');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 68, '2017-04-24');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 69, '2017-01-04');
insert into car_supervisors (employeeID, carID, dateSince) values (11, 70, '2015-02-07');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 71, '2015-10-22');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 72, '2017-06-24');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 73, '2015-06-03');
insert into car_supervisors (employeeID, carID, dateSince) values (5, 74, '2016-05-31');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 75, '2015-03-27');
insert into car_supervisors (employeeID, carID, dateSince) values (8, 76, '2016-12-03');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 77, '2017-01-08');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 78, '2015-06-23');
insert into car_supervisors (employeeID, carID, dateSince) values (8, 79, '2017-06-15');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 80, '2016-08-17');
insert into car_supervisors (employeeID, carID, dateSince) values (14, 81, '2015-02-06');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 82, '2016-02-17');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 83, '2016-12-01');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 84, '2014-06-23');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 85, '2015-05-02');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 86, '2016-09-01');
insert into car_supervisors (employeeID, carID, dateSince) values (4, 87, '2015-12-13');
insert into car_supervisors (employeeID, carID, dateSince) values (21, 88, '2015-04-01');
insert into car_supervisors (employeeID, carID, dateSince) values (5, 89, '2016-11-21');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 90, '2015-05-15');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 91, '2015-09-24');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 92, '2017-01-03');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 93, '2015-02-01');
insert into car_supervisors (employeeID, carID, dateSince) values (5, 94, '2016-04-18');
insert into car_supervisors (employeeID, carID, dateSince) values (11, 95, '2016-06-13');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 96, '2017-03-25');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 97, '2015-08-06');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 98, '2016-06-26');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 99, '2017-03-10');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 100, '2016-06-09');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 101, '2016-12-07');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 102, '2016-10-28');
insert into car_supervisors (employeeID, carID, dateSince) values (17, 103, '2014-10-01');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 104, '2015-01-24');
insert into car_supervisors (employeeID, carID, dateSince) values (8, 105, '2015-02-20');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 106, '2015-07-21');
insert into car_supervisors (employeeID, carID, dateSince) values (4, 107, '2017-04-10');
insert into car_supervisors (employeeID, carID, dateSince) values (11, 108, '2015-04-27');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 109, '2017-04-27');
insert into car_supervisors (employeeID, carID, dateSince) values (1, 110, '2015-02-20');
insert into car_supervisors (employeeID, carID, dateSince) values (19, 111, '2016-09-14');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 112, '2016-10-12');
insert into car_supervisors (employeeID, carID, dateSince) values (14, 113, '2016-11-09');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 114, '2015-08-08');
insert into car_supervisors (employeeID, carID, dateSince) values (16, 115, '2015-08-26');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 116, '2014-06-23');
insert into car_supervisors (employeeID, carID, dateSince) values (21, 117, '2016-10-21');
insert into car_supervisors (employeeID, carID, dateSince) values (11, 118, '2015-09-18');
insert into car_supervisors (employeeID, carID, dateSince) values (22, 119, '2014-08-17');
insert into car_supervisors (employeeID, carID, dateSince) values (15, 120, '2017-04-30');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 121, '2016-11-26');
insert into car_supervisors (employeeID, carID, dateSince) values (8, 122, '2015-10-10');
insert into car_supervisors (employeeID, carID, dateSince) values (1, 123, '2017-01-12');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 124, '2017-03-03');
insert into car_supervisors (employeeID, carID, dateSince) values (18, 125, '2014-12-28');
insert into car_supervisors (employeeID, carID, dateSince) values (3, 126, '2017-06-09');
insert into car_supervisors (employeeID, carID, dateSince) values (2, 127, '2016-10-17');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 128, '2015-02-25');
insert into car_supervisors (employeeID, carID, dateSince) values (17, 129, '2014-07-06');
insert into car_supervisors (employeeID, carID, dateSince) values (1, 130, '2016-08-25');
insert into car_supervisors (employeeID, carID, dateSince) values (9, 1, '2014-04-23');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 2, '2015-11-30');
insert into car_supervisors (employeeID, carID, dateSince) values (6, 5, '2015-03-31');
insert into car_supervisors (employeeID, carID, dateSince) values (10, 5, '2015-04-26');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 130, '2014-09-23');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 12, '2015-11-29');
insert into car_supervisors (employeeID, carID, dateSince) values (12, 125, '2016-12-07');
insert into car_supervisors (employeeID, carID, dateSince) values (14, 125, '2015-11-11');
insert into car_supervisors (employeeID, carID, dateSince) values (21, 125, '2016-07-25');
insert into car_supervisors (employeeID, carID, dateSince) values (14, 8, '2015-05-11');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 50, '2017-01-24');
insert into car_supervisors (employeeID, carID, dateSince) values (16, 42, '2016-01-29');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 43, '2016-12-19');
insert into car_supervisors (employeeID, carID, dateSince) values (16, 55, '2014-05-20');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 53, '2015-06-04');
insert into car_supervisors (employeeID, carID, dateSince) values (5, 32, '2017-05-01');
insert into car_supervisors (employeeID, carID, dateSince) values (20, 32, '2014-12-27');
insert into car_supervisors (employeeID, carID, dateSince) values (13, 32, '2015-03-10');
insert into car_supervisors (employeeID, carID, dateSince) values (7, 18, '2014-09-12');
insert into car_supervisors (employeeID, carID, dateSince) values (21, 48, '2015-10-16');
insert into car_supervisors (employeeID, carID, dateSince) values (12, 48, '2015-11-12');

select * from rental_data where dateTo > curdate();

select * from (cars left join rental_data on cars.ID = rental_data.carID) where rental_data.dateTo > curdate();