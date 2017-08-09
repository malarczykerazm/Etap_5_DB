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
  `price` INT NOT NULL,
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
  `dateTo` DATE NOT NULL,
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
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Pancho', 'Naerup', '1993-01-09', 4, 6, 6, 3);
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
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Hubie', 'Lamy', '1988-09-03', 2, 21, 26, 4);
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
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'compact', 'Honda', 'Accord', 2000, 'Maroon', 2.4, 152, 59101, 'GL59491');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'sport', 'Toyota', 'Sienna', 2010, 'Red', 2.0, 195, 54694, 'CV67200');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Lexus', 'IS', 2005, 'Indigo', 2.1, 114, 25747, 'ED62948');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'hatchback', 'Dodge', 'Ram 2500 Club', 1998, 'Orange', 2.5, 190, 39116, 'CV70691');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Chevrolet', 'Tahoe', 2013, 'Orange', 2.0, 141, 55076, 'IW66961');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Chevrolet', 'Corvette', 2007, 'Red', 2.2, 169, 10253, 'IW37781');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mazda', 'B-Series', 1987, 'Aquamarine', 1.7, 217, 44262, 'PO40837');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Chevrolet', 'Corvette', 1962, 'Orange', 1.5, 139, 57684, 'ED43417');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Acura', 'NSX', 2001, 'Yellow', 1.6, 151, 45610, 'ED87350');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (3, 'sport', 'Audi', '5000S', 1986, 'Puce', 1.1, 138, 49941, 'CV19350');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'compact', 'Ford', 'Excursion', 2005, 'Teal', 2.2, 214, 23029, 'IW29866');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'crossover', 'Dodge', 'Grand Caravan', 1995, 'Puce', 1.0, 218, 61304, 'PO45878');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Fillmore', 'Fillmore', 1960, 'Indigo', 2.2, 92, 38379, 'LN61188');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Nissan', 'Pathfinder', 2007, 'Purple', 2.1, 162, 20925, 'ED41289');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'pickup', 'Chrysler', '200', 2011, 'Turquoise', 2.0, 179, 20402, 'IW27203');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'minivan', 'Ford', 'Ranger', 2011, 'Maroon', 2.2, 158, 57828, 'GL66842');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Ford', 'GT', 2005, 'Aquamarine', 1.1, 163, 47310, 'SW71133');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Infiniti', 'FX', 2011, 'Pink', 2.2, 90, 60532, 'LN41612');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'sport', 'Audi', '4000s Quattro', 1986, 'Aquamarine', 1.4, 177, 11063, 'GL62179');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Subaru', 'Impreza', 2012, 'Blue', 1.6, 162, 16171, 'IW34188');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Ford', 'Expedition', 2006, 'Pink', 1.1, 152, 34143, 'CV17691');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'pickup', 'Suzuki', 'Forenza', 2006, 'Violet', 2.4, 131, 45792, 'CV81968');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mercury', 'Grand Marquis', 1996, 'Turquoise', 2.3, 211, 44983, 'IW25101');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Pontiac', 'Grand Prix', 1999, 'Maroon', 1.7, 196, 50393, 'GL20596');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Chevrolet', 'Volt', 2012, 'Orange', 2.0, 220, 40313, 'GL62753');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Chevrolet', 'Suburban 2500', 2007, 'Red', 2.5, 128, 26834, 'ED64917');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Chevrolet', 'Beretta', 1995, 'Teal', 2.3, 219, 38220, 'PO57058');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Saab', '900', 1989, 'Mauv', 0.9, 91, 57895, 'MN79242');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Isuzu', 'Ascender', 2009, 'Red', 1.4, 107, 12830, 'CV63836');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Pontiac', 'Firebird', 1994, 'Maroon', 0.9, 212, 37138, 'ED47571');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Cadillac', 'Escalade ESV', 2011, 'Yellow', 2.3, 216, 10504, 'ED33344');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Lincoln', 'Town Car', 2000, 'Yellow', 1.2, 93, 12055, 'ED53933');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Chrysler', 'Cirrus', 1996, 'Green', 1.1, 110, 40528, 'PO35707');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Oldsmobile', 'Alero', 1999, 'Purple', 1.2, 196, 59699, 'PO58065');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Chevrolet', 'Silverado 2500', 2000, 'Goldenrod', 2.5, 141, 62678, 'MN22622');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Scion', 'xD', 2011, 'Red', 1.1, 140, 54616, 'IW21881');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'coupe', 'Chevrolet', 'Lumina APV', 1992, 'Orange', 1.1, 198, 29568, 'MN82565');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Jaguar', 'XJ Series', 1994, 'Pink', 2.5, 153, 33468, 'IW59654');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'minivan', 'Pontiac', 'Bonneville', 2000, 'Mauv', 1.9, 82, 52223, 'IW20789');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Volkswagen', 'Routan', 2009, 'Pink', 1.7, 150, 22531, 'IW25593');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Pontiac', 'Firefly', 1992, 'Violet', 2.1, 136, 33496, 'PO18303');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mercury', 'Cougar', 1989, 'Teal', 1.8, 116, 16297, 'LN20720');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Lincoln', 'MKS', 2012, 'Aquamarine', 1.6, 89, 26737, 'IW28546');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Cadillac', 'Fleetwood', 1996, 'Red', 2.0, 83, 60700, 'LN76152');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'SUV', 'Honda', 'Accord', 1983, 'Pink', 2.0, 128, 58965, 'CV48431');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Oldsmobile', '88', 1996, 'Khaki', 1.9, 206, 23445, 'ED76341');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mercedes-Benz', 'CLS-Class', 2010, 'Yellow', 1.5, 118, 62814, 'GL80057');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Audi', '5000S', 1987, 'Crimson', 1.5, 176, 37473, 'GL33490');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Toyota', '4Runner', 1994, 'Fuscia', 1.9, 90, 60964, 'SW45151');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Lotus', 'Elise', 2009, 'Green', 1.6, 146, 43719, 'ED48626');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'hatchback', 'Ford', 'Transit Connect', 2013, 'Green', 1.4, 143, 41706, 'PO49708');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Pontiac', 'Bonneville', 1965, 'Fuscia', 2.3, 89, 43318, 'SW22156');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Saturn', 'S-Series', 1999, 'Puce', 1.0, 88, 43436, 'IW49713');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'crossover', 'Maserati', 'GranSport', 2005, 'Orange', 1.2, 140, 15388, 'GL70465');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Audi', 'A8', 1998, 'Orange', 2.2, 192, 40952, 'IW15920');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Dodge', 'D150', 1993, 'Red', 2.2, 94, 22876, 'LN48443');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'minivan', 'Honda', 'Insight', 2004, 'Aquamarine', 1.6, 197, 30187, 'IW68620');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Ford', 'F350', 2004, 'Teal', 1.2, 151, 31285, 'ED21926');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'BMW', 'Z3', 2002, 'Fuscia', 1.7, 111, 39049, 'GL68152');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Mazda', 'MX-3', 1992, 'Green', 1.6, 148, 61699, 'LN38688');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Dodge', 'Dakota', 2010, 'Goldenrod', 2.3, 144, 29938, 'SW74470');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'coupe', 'Honda', 'Odyssey', 2009, 'Teal', 2.2, 185, 16602, 'PO51090');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Pontiac', 'Firefly', 1995, 'Blue', 1.5, 147, 23343, 'SW56731');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Toyota', 'Tacoma', 2001, 'Violet', 1.3, 102, 62227, 'LN78026');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Dodge', 'Dakota Club', 1993, 'Purple', 2.2, 202, 39784, 'PO63249');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'GMC', '3500', 1993, 'Turquoise', 2.2, 97, 11258, 'LN18701');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Pontiac', 'Firebird Trans Am', 1986, 'Indigo', 1.0, 203, 39610, 'CV86907');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'compact', 'Nissan', 'Sentra', 1991, 'Red', 2.4, 171, 19496, 'IW84861');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'sport', 'Mazda', 'RX-7', 1994, 'Teal', 1.6, 182, 31140, 'CV21612');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Lincoln', 'Town Car', 2001, 'Purple', 2.3, 202, 49067, 'IW17673');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Audi', 'S6', 2009, 'Crimson', 1.1, 135, 23200, 'IW15578');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Dodge', 'Ram 2500 Club', 1997, 'Blue', 2.5, 81, 61206, 'GL41836');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'family', 'BMW', 'Z4', 2011, 'Crimson', 1.1, 196, 13032, 'GL63330');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mazda', 'MX-6', 1996, 'Turquoise', 1.3, 173, 19656, 'ED19126');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'GMC', 'Yukon XL 2500', 2009, 'Maroon', 2.5, 206, 63926, 'GL19453');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Ford', 'Thunderbird', 1993, 'Mauv', 1.3, 165, 35347, 'ED87167');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Toyota', 'Venza', 2010, 'Yellow', 1.7, 168, 54868, 'CV51354');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'SUV', 'Suzuki', 'Sidekick', 1989, 'Turquoise', 1.0, 97, 38358, 'MN27360');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Subaru', 'XT', 1990, 'Orange', 2.2, 96, 31810, 'CV86060');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Dodge', 'Colt', 1993, 'Khaki', 1.1, 90, 43915, 'MN17755');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Honda', 'Passport', 2001, 'Turquoise', 1.3, 112, 15969, 'CV38128');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'coupe', 'Mitsubishi', 'Pajero', 1986, 'Mauv', 2.0, 106, 31161, 'SW38853');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Chevrolet', 'Corvette', 1969, 'Aquamarine', 1.3, 205, 56615, 'ED20849');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Ford', 'Explorer', 2012, 'Blue', 2.3, 95, 53639, 'LN67645');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'pickup', 'Buick', 'Rendezvous', 2004, 'Purple', 0.9, 207, 31165, 'SW20645');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Kia', 'Optima', 2008, 'Khaki', 1.0, 189, 11149, 'CV63183');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Chrysler', 'Concorde', 1996, 'Khaki', 2.0, 87, 10078, 'ED51858');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Pontiac', 'Grand Prix', 2005, 'Mauv', 2.5, 106, 60447, 'PO77021');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'coupe', 'Geo', 'Tracker', 1993, 'Indigo', 1.5, 95, 48634, 'SW38474');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Cadillac', 'DeVille', 1995, 'Teal', 1.0, 176, 40667, 'IW23515');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Isuzu', 'Rodeo', 2000, 'Violet', 2.4, 141, 60836, 'ED19839');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'SUV', 'Chevrolet', 'Express 2000', 1999, 'Mauv', 2.0, 132, 13597, 'IW24124');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mazda', 'B-Series', 1999, 'Fuscia', 2.5, 151, 49287, 'GL52412');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'sport', 'Chrysler', 'Town & Country', 1999, 'Crimson', 1.4, 131, 26062, 'SW66151');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Pontiac', 'Grand Prix', 1989, 'Blue', 1.4, 134, 63842, 'CV58491');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Subaru', 'Outback', 2005, 'Maroon', 2.2, 91, 17373, 'CV39182');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'compact', 'Mitsubishi', 'Lancer', 2008, 'Crimson', 1.6, 130, 42170, 'IW44694');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Ferrari', '599 GTB Fiorano', 2007, 'Red', 1.9, 100, 52225, 'LN22472');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'hatchback', 'Subaru', 'Justy', 1992, 'Turquoise', 1.6, 120, 19523, 'SW76441');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'pickup', 'Mazda', '626', 1984, 'Purple', 2.5, 152, 56749, 'SW48705');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'compact', 'Acura', 'RL', 2005, 'Turquoise', 1.1, 103, 42718, 'ED71728');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Kia', 'Carens', 2007, 'Indigo', 1.4, 178, 12673, 'SW74493');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'crossover', 'Pontiac', 'Grand Prix', 1998, 'Green', 2.3, 101, 11293, 'CV54944');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Buick', 'Terraza', 2007, 'Violet', 1.9, 80, 21803, 'LN80228');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Lexus', 'GS', 2003, 'Pink', 1.7, 211, 29918, 'ED59101');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'family', 'Ford', 'E-Series', 2004, 'Indigo', 2.2, 94, 39130, 'GL83175');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Hyundai', 'Genesis Coupe', 2011, 'Fuscia', 1.4, 203, 13826, 'PO68824');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Mercury', 'Grand Marquis', 2005, 'Mauv', 1.0, 117, 55315, 'IW20950');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Maserati', 'Karif', 1990, 'Green', 1.2, 140, 47900, 'ED29248');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Saab', '9-7X', 2007, 'Puce', 1.3, 114, 13189, 'SW66558');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'crossover', 'Toyota', 'Tercel', 1997, 'Teal', 1.7, 220, 12021, 'ED68051');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Volvo', 'V70', 2007, 'Indigo', 1.9, 128, 30059, 'ED79495');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Chevrolet', 'Suburban', 2007, 'Aquamarine', 1.1, 96, 20480, 'ED55515');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mazda', 'RX-7', 1994, 'Puce', 1.7, 206, 59403, 'GL55793');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Plymouth', 'Reliant', 1981, 'Turquoise', 1.2, 111, 18209, 'LN78497');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Dodge', 'Nitro', 2011, 'Yellow', 2.3, 103, 34899, 'IW55445');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Dodge', 'Stratus', 2001, 'Maroon', 1.1, 206, 31334, 'ED68503');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'luxury', 'Nissan', 'Murano', 2003, 'Teal', 2.1, 95, 27596, 'SW71125');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'SUV', 'Kia', 'Sorento', 2011, 'Red', 1.5, 219, 19409, 'IW59814');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'hatchback', 'Mitsubishi', 'Expo', 1994, 'Crimson', 1.4, 143, 47547, 'IW62135');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'coupe', 'Mercury', 'Mariner', 2005, 'Red', 1.0, 132, 46616, 'MN73553');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'family', 'Dodge', 'Intrepid', 2002, 'Yellow', 1.5, 193, 62332, 'MN26954');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Spyker', 'C8 Spyder', 2004, 'Mauv', 1.1, 95, 37085, 'CV87107');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (2, 'pickup', 'Mitsubishi', 'Montero Sport', 2002, 'Indigo', 1.5, 145, 46129, 'CV54696');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'minivan', 'Chevrolet', 'Corvette', 1997, 'Goldenrod', 2.2, 173, 32687, 'PO57911');
insert into cars (statusID, type, brand, model, productionYear, colour, engineVolume, power, mileage, plateNumber) values (1, 'luxury', 'Mercury', 'Cougar', 1997, 'Red', 2.0, 211, 64593, 'SW32125');

select * from cars;