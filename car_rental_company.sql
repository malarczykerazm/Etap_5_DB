use car_rental_company;
/*
select * from address;
select * from customer;
*/

delete from address where id < 100;
ALTER TABLE address AUTO_INCREMENT = 1;

/** -------------------- AGENCYS' ADDRESSES -------------------- **/
insert into address(number, street, postcode, city, country)
values (1, "Kirkmanshulme Ln", "M12 4WB", "Manchester", "UK");

insert into address(number, street, postcode, city, country)
values (377, "Alwalton St", "PE2 0XE", "Peterborough", "UK");

insert into address(number, street, postcode, city, country)
values (312, "Ashey Rd", "PO33 4BH", "Isle of Wight", "UK");

insert into address(number, street, postcode, city, country)
values (101, "Wimborne Rd", "BH15 2BP", "Poole", "UK");

insert into address(number, street, postcode, city, country)
values (18, "Lady Ln", "SN25 4DN", "Swindon", "UK");

insert into address(number, street, postcode, city, country)
values (76, "Rye Rd", "EN11 0EH", "Hoddeson", "UK");

insert into address(number, street, postcode, city, country)
values (45, "Rugby Rd", "CV8 3GJ", "Coventry", "UK");

/** -------------------- CUSTOMERS' ADDRESSES -------------------- **/
insert into address(number, street, postcode, city, country)
values (23, "Sutherland Av", "WV2 2JJ", "Wolverhampton", "UK");

insert into address(number, street, postcode, city, country)
values (54, "Penistone Rd", "S6 2DE", "Sheffield", "UK");

insert into address(number, street, postcode, city, country)
values (18, "Fossway Rd", "NE6 2XJ", "Newcastle", "UK");

insert into address(number, street, postcode, city, country)
values (82, "Hawthorn St", "G22 6RU", "Glasgow", "UK");

insert into address(number, street, postcode, city, country)
values (11, "Bathgate Rd", "EH48 2PD", "Edinburgh", "UK");

insert into address(number, street, postcode, city, country)
values ("16A", "Abbey Road", "NW8 9BD", "London", "UK");

insert into address(number, street, postcode, city, country)
values ("443", "Aldborough Road South", "IG3 8JN", "Ilford", "UK");

insert into address(number, street, postcode, city, country)
values ("7", "Wells Road", "BS27 3SW", "Cheddar", "UK");

insert into address(number, street, postcode, city, country)
values ("11", "Parkins Garth", "DL8 3HD", "Leyburn", "UK");

insert into address(number, street, postcode, city, country)
values ("1", "The Hill", "DG16 5HG", "Dumfries and Galloway", "UK");

insert into address(number, street, postcode, city, country)
values ("43", "Grafton Way", "W1T 5DG", "London", "UK");

insert into address(number, street, postcode, city, country)
values ("60", "Purser Road", "NN1 4PQ", "Northampton", "UK");

insert into address(number, street, postcode, city, country)
values ("15", "Lytham Avenue", "S25 2TB", "Sheffield", "UK");

insert into address(number, street, postcode, city, country)
values ("22", "Nant Hall Road", "LL19 9LN", "Prestatyn", "UK");

insert into address(number, street, postcode, city, country)
values ("15", "Great Percy Street", "WC1X 9RD", "London", "UK");

insert into address(number, street, postcode, city, country)
values ("39", "Westray Street", "TS13 4EL", "Saltburn-by-the-Sea", "UK");

insert into address(number, street, postcode, city, country)
values ("128", "West End Road", "UB1 1JN", "Southall", "UK");

insert into address(number, street, postcode, city, country)
values ("14", "Park Lane", "TF6 6BA", "Telford", "UK");

insert into address(number, street, postcode, city, country)
values ("28", "Earlsway", "NE11", "Tyne and Wear", "UK");

insert into address(number, street, postcode, city, country)
values ("2", "Howes Road", "AB16 7RH", "Aberdeen City", "UK");

insert into address(number, street, postcode, city, country)
values ("21", "Batsmans Drive", "NN10 6EW", "Rushden", "UK");

insert into address(number, street, postcode, city, country)
values ("B8035", "Isle of Mull", "PA68 6EJ", "Scotland", "UK");

insert into address(number, street, postcode, city, country)
values ("99", "Shakespeare Street", "PR8 5AJ", "Southport", "UK");

insert into address(number, street, postcode, city, country)
values ("44-64", "Severn Way", "MK3", "Milton Keynes", "UK");

insert into address(number, street, postcode, city, country)
values ("175", "Sarehole Road", "B28 8EL", "Birmingham", "UK");

insert into address(number, street, postcode, city, country)
values ("17", "Brunel Close", "CF82 8HT", "Hengoed", "UK");

insert into address(number, street, postcode, city, country)
values ("1", "Beath Grove", "TS25 3BY", "Hartlepool", "UK");

insert into address(number, street, postcode, city, country)
values ("18", "Pine View", "DT6 5AE", "Bridport", "UK");

insert into address(number, street, postcode, city, country)
values ("7", "Farmview Close", "L27 1XZ", "Liverpool", "UK");

insert into address(number, street, postcode, city, country)
values ("2", "Bank Street", "NP19 7HF", "Newport", "UK");

insert into address(number, street, postcode, city, country)
values ("2", "Woodview Terrace", "SA10", "Neath Port Talbot", "UK");

insert into address(number, street, postcode, city, country)
values ("1", "Iberian Way", "GU15 1LU", "Camberley", "UK");

insert into address(number, street, postcode, city, country)
values ("18", "Vowels Lane", "RH19 4LD", "West Sussex", "UK");

insert into address(number, street, postcode, city, country)
values ("221", "Guildford Road", "GU18 5RE", "Lightwater", "UK");

insert into address(number, street, postcode, city, country)
values ("50", "Fernicombe Road", "TQ3 3XD", "Paignton", "UK");

insert into address(number, street, postcode, city, country)
values ("11", "Ennis Close", "AL5 1SS", "Harpenden", "UK");

insert into address(number, street, postcode, city, country)
values ("114", "Bruce Grove", "N17 6UR", "London", "UK");

insert into address(number, street, postcode, city, country)
values ("12", "Marygate", "TD15 1BN", "Berwick-upon-Tweed", "UK");

insert into address(number, street, postcode, city, country)
values ("8", "Nether Court", "DG5 4EY", "Dalbeattie", "UK");

insert into address(number, street, postcode, city, country)
values ("5-7", "Wood End", "UB3 2SB", "Hayes", "UK");

insert into address(number, street, postcode, city, country)
values ("4", "Chapel Street", "WV2 3EU", "Wolverhampton", "UK");

insert into address(number, street, postcode, city, country)
values ("7", "Sandylands Drive", "M25 9SH", "Manchester", "UK");

insert into address(number, street, postcode, city, country)
values ("7A", "Glenferness Avenue", "BH4 9ND", "Bournemouth", "UK");

insert into address(number, street, postcode, city, country)
values ("1B", "Tiree Avenue", "PA4 0EP", "Renfrew", "UK");

insert into address(number, street, postcode, city, country)
values ("4", "Leithhead", "EH27 8DJ", "Edinburgh", "UK");



select * from address;








/*





update address set city = "London" where id = 4;

ALTER TABLE customer
ADD COLUMN receiptAddresID int;

ALTER TABLE customer
DROP COLUMN correspondenceAddressID;

ALTER TABLE customer
ADD CONSTRAINT customerReceiptAddressID FOREIGN KEY (receiptAddressID)
REFERENCES address(ID);

insert into customer(name, surname, date_of_birth, telephone, email, correspondenceAddressID, receiptAddressID)
values ("Chriss", "Harris", "1985-02-12", 869546398, "bomber@speedway.co.uk", 3, 4);

insert into customer(name, surname, date_of_birth, telephone, email, correspondenceAddressID, receiptAddressID)
values ("Julia", "Harris", "1990-07-15", 907578432, "juliaharris@london.co.uk", 3, 3);

delete from customer where ID in (1,2);
*/