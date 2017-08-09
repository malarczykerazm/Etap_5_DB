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
  `email` VARCHAR(45),
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
  `name` CHAR NOT NULL,
  `surname` CHAR NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `agencyID` INT NOT NULL,
  `addressID` INT NOT NULL,
  `positionID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (agencyID) REFERENCES agencies(ID),
  FOREIGN KEY (addressID) REFERENCES addresses(ID),
  FOREIGN KEY (positionID) REFERENCES positions(ID));
  
  CREATE TABLE `car_rental_company`.`customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` CHAR NOT NULL,
  `surname` CHAR,
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
insert into addresses(number, street, postcode, city, country) values ('1', 'Kirkmanshulme Ln', 'M12 4WB', 'Manchester', 'UK');

insert into addresses(number, street, postcode, city, country) values ('11', 'Bathgate Rd', 'EH48 2PD', 'Edinburgh', 'UK');

insert into addresses(number, street, postcode, city, country) values ('312', 'Ashey Rd', 'PO33 4BH', 'Isle of Wight', 'UK');

insert into addresses(number, street, postcode, city, country) values ('101', 'Wimborne Rd', 'BH15 2BP', 'Poole', 'UK');

insert into addresses(number, street, postcode, city, country) values ('18', 'Lady Ln', 'SN25 4DN', 'Swindon', 'UK');

/** -------------------- CUSTOMERS' ADDRESSES -------------------- **/
insert into addresses(number, street, postcode, city, country) values ('76', 'Rye Rd', 'EN11 0EH', 'Hoddeson', 'UK');

insert into addresses(number, street, postcode, city, country) values ('377', 'Alwalton St', 'PE2 0XE', 'Peterborough', 'UK');

insert into addresses(number, street, postcode, city, country) values ('45', 'Rugby Rd', 'CV8 3GJ', 'Coventry', 'UK');

insert into addresses(number, street, postcode, city, country) values ('23', 'Sutherland Av', 'WV2 2JJ', 'Wolverhampton', 'UK');

insert into addresses(number, street, postcode, city, country) values ('54', 'Penistone Rd', 'S6 2DE', 'Sheffield', 'UK');

insert into addresses(number, street, postcode, city, country) values ('18', 'Fossway Rd', 'NE6 2XJ', 'Newcastle', 'UK');

insert into addresses(number, street, postcode, city, country) values ('82', 'Hawthorn St', 'G22 6RU', 'Glasgow', 'UK');

insert into addresses(number, street, postcode, city, country) values ('16A', 'Abbey Road', 'NW8 9BD', 'London', 'UK');

insert into addresses(number, street, postcode, city, country) values ('443', 'Aldborough Road South', 'IG3 8JN', 'Ilford', 'UK');

insert into addresses(number, street, postcode, city, country) values ('7', 'Wells Road', 'BS27 3SW', 'Cheddar', 'UK');

insert into addresses(number, street, postcode, city, country) values ('11', 'Parkins Garth', 'DL8 3HD', 'Leyburn', 'UK');

insert into addresses(number, street, postcode, city, country) values ('1', 'The Hill', 'DG16 5HG', 'Dumfries and Galloway', 'UK');

insert into addresses(number, street, postcode, city, country) values ('43', 'Grafton Way', 'W1T 5DG', 'London', 'UK');

insert into addresses(number, street, postcode, city, country) values ('60', 'Purser Road', 'NN1 4PQ', 'Northampton', 'UK');

insert into addresses(number, street, postcode, city, country) values ('15', 'Lytham Avenue', 'S25 2TB', 'Sheffield', 'UK');

insert into addresses(number, street, postcode, city, country) values ('22', 'Nant Hall Road', 'LL19 9LN', 'Prestatyn', 'UK');

insert into addresses(number, street, postcode, city, country) values ('15', 'Great Percy Street', 'WC1X 9RD', 'London', 'UK');

insert into addresses(number, street, postcode, city, country) values ('39', 'Westray Street', 'TS13 4EL', 'Saltburn-by-the-Sea', 'UK');

insert into addresses(number, street, postcode, city, country) values ('128', 'West End Road', 'UB1 1JN', 'Southall', 'UK');

insert into addresses(number, street, postcode, city, country) values ('14', 'Park Lane', 'TF6 6BA', 'Telford', 'UK');

insert into addresses(number, street, postcode, city, country) values ('28', 'Earlsway', 'NE11', 'Tyne and Wear', 'UK');

insert into addresses(number, street, postcode, city, country) values ('2', 'Howes Road', 'AB16 7RH', 'Aberdeen City', 'UK');

insert into addresses(number, street, postcode, city, country) values ('21', 'Batsmans Drive', 'NN10 6EW', 'Rushden', 'UK');

insert into addresses(number, street, postcode, city, country) values ('B8035', 'Isle of Mull', 'PA68 6EJ', 'Scotland', 'UK');

insert into addresses(number, street, postcode, city, country) values ('99', 'Shakespeare Street', 'PR8 5AJ', 'Southport', 'UK');

insert into addresses(number, street, postcode, city, country) values ('44-64', 'Severn Way', 'MK3', 'Milton Keynes', 'UK');

insert into addresses(number, street, postcode, city, country) values ('175', 'Sarehole Road', 'B28 8EL', 'Birmingham', 'UK');

insert into addresses(number, street, postcode, city, country) values ('17', 'Brunel Close', 'CF82 8HT', 'Hengoed', 'UK');

insert into addresses(number, street, postcode, city, country) values ('1', 'Beath Grove', 'TS25 3BY', 'Hartlepool', 'UK');

insert into addresses(number, street, postcode, city, country) values ('18', 'Pine View', 'DT6 5AE', 'Bridport', 'UK');

insert into addresses(number, street, postcode, city, country) values ('7', 'Farmview Close', 'L27 1XZ', 'Liverpool', 'UK');

insert into addresses(number, street, postcode, city, country) values ('2', 'Bank Street', 'NP19 7HF', 'Newport', 'UK');

insert into addresses(number, street, postcode, city, country) values ('2', 'Woodview Terrace', 'SA10', 'Neath Port Talbot', 'UK');

insert into addresses(number, street, postcode, city, country) values ('1', 'Iberian Way', 'GU15 1LU', 'Camberley', 'UK');

insert into addresses(number, street, postcode, city, country) values ('18', 'Vowels Lane', 'RH19 4LD', 'West Sussex', 'UK');

insert into addresses(number, street, postcode, city, country) values ('221', 'Guildford Road', 'GU18 5RE', 'Lightwater', 'UK');

insert into addresses(number, street, postcode, city, country) values ('50', 'Fernicombe Road', 'TQ3 3XD', 'Paignton', 'UK');

insert into addresses(number, street, postcode, city, country) values ('11', 'Ennis Close', 'AL5 1SS', 'Harpenden', 'UK');

insert into addresses(number, street, postcode, city, country) values ('114', 'Bruce Grove', 'N17 6UR', 'London', 'UK');

insert into addresses(number, street, postcode, city, country) values ('12', 'Marygate', 'TD15 1BN', 'Berwick-upon-Tweed', 'UK');

insert into addresses(number, street, postcode, city, country) values ('8', 'Nether Court', 'DG5 4EY', 'Dalbeattie', 'UK');

insert into addresses(number, street, postcode, city, country) values ('5-7', 'Wood End', 'UB3 2SB', 'Hayes', 'UK'); 

insert into addresses(number, street, postcode, city, country) values ('4', 'Chapel Street', 'WV2 3EU', 'Wolverhampton', 'UK');

insert into addresses(number, street, postcode, city, country) values ('7', 'Sandylands Drive', 'M25 9SH', 'Manchester', 'UK');

insert into addresses(number, street, postcode, city, country) values ('7A', 'Glenferness Avenue', 'BH4 9ND', 'Bournemouth', 'UK');

insert into addresses(number, street, postcode, city, country) values ('1B', 'Tiree Avenue', 'PA4 0EP', 'Renfrew', 'UK');

insert into addresses(number, street, postcode, city, country) values ('4', 'Leithhead', 'EH27 8DJ', 'Edinburgh', 'UK');

insert into addresses(number, street, postcode, city, country) values ('78', 'Gloucester Street', 'SN1', 'Swindon', 'UK');

insert into addresses(number, street, postcode, city, country) values ('51', 'A244', 'KT10', 'Esher', 'UK');

insert into addresses(number, street, postcode, city, country) values ('12', 'Keills Cottages', 'PA46 7RG', 'Isle of Islay', 'UK');

insert into addresses(number, street, postcode, city, country) values ('9', 'Greenbank Road', 'DL3 6EJ', 'Darlington', 'UK');

insert into addresses(number, street, postcode, city, country) values ('8', 'Tottenham Mews', 'W1T 4AE', 'London', 'UK');

insert into addresses(number, street, postcode, city, country) values ('18', 'Newport Street', 'OL8 4AJ', 'Oldham', 'UK');

insert into addresses(number, street, postcode, city, country) values ('5', 'Southgate Court', 'S21 4LA', 'Sheffield', 'UK');

insert into addresses(number, street, postcode, city, country) values ('21', 'Hazel Grove', 'CH61 4UY', 'Wirral', 'UK');

insert into addresses(number, street, postcode, city, country) values ('41', 'Walter Street', 'TS18 3PP', 'Stockton-on-Tees', 'UK');

insert into addresses(number, street, postcode, city, country) values ('9', 'Fenn Close', 'IP19 8LD', 'Halesworth', 'UK');

insert into addresses(number, street, postcode, city, country) values ('299', 'Edgefauld Road', 'G21 4XB', 'Glasgow', 'UK');

insert into addresses(number, street, postcode, city, country) values ('17', 'Carlton Gardens', 'LS7 1HF', 'Leeds', 'UK');

insert into addresses(number, street, postcode, city, country) values ('31A', 'Main Road', 'KA29 0DL', 'Largs', 'UK');

insert into addresses(number, street, postcode, city, country) values ('6', 'Richmond Terrace', 'CA28 7QR', 'Whitehaven', 'UK');

insert into addresses(number, street, postcode, city, country) values ('27', 'Wheelers Lane', 'B13 0SB', 'Birmingham', 'UK');

insert into addresses(number, street, postcode, city, country) values ('15', 'Borough Road', 'TQ4', 'Paignton', 'UK');

insert into addresses(number, street, postcode, city, country) values ('4', 'Heyford Road', 'OX5 3HU', 'Kidlington', 'UK');

insert into addresses(number, street, postcode, city, country) values ('4', 'Fairfield Road', 'RH15 8NR', 'Burgess Hill', 'UK');

insert into addresses(number, street, postcode, city, country) values ('146', 'Dashwood Avenue', 'HP12 3EB', 'High Wycombe', 'UK');

insert into addresses(number, street, postcode, city, country) values ('109', 'Monkton Lane', 'NE32 5NS', 'Jarrow', 'UK');

insert into addresses(number, street, postcode, city, country) values ('13', 'Park Lane', 'TW9 2RA', 'Richmond', 'UK');

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


