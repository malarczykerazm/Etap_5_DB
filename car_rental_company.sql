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
  `number` INT NOT NULL,
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
  `engineVolume` INT NOT NULL,
  `power` INT NOT NULL,
  `mileage` INT NOT NULL,
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

/** -------------------- CUSTOMERS' ADDRESSES -------------------- **/
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
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Betta', 'Enderwick', '1991-01-21', 2, 11, 13, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Odilia', 'Cumming', '1954-03-20', 2, 13, 14, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Arnaldo', 'Puddan', '1988-02-27', 4, 15, 15, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Theadora', 'Sketchley', '1985-12-16', 1, 14, 16, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Earle', 'Jakobsson', '1979-06-14', 4, 12, 17, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Bernie', 'Jakobsson', '1985-09-26', 4, 12, 18, 4);
insert into employees (name, surname, dateOfBirth, agencyID, addressID, contactID, positionID) values ('Ingrid', 'Ulster', '1969-07-08', 3, 19, 19, 4);
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
insert into customers (name, agencyID, correspondenceAddressID, receiptAddressID, contactID) values ('Tú Gmbh', 3, 60, 71, 64);
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


