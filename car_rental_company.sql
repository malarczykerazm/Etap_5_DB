show databases;
use car_rental_company;
show tables;
select * from address;
select * from customer;

update address set ID = 22 where ID = 4;
delete from address where ID = 2;
ALTER TABLE address AUTO_INCREMENT = 2;

/** -------------------- AGENCYS' ADDRESSES -------------------- **/
insert into address(number, street, postcode, city, country)
values (1, "Kirkmanshulme Ln", "M12 4WB", "Manchester", "UK");
/**Greyhound Stadium,
Kirkmanshulme Lane,Gorton,
Manchester, M18 7BA.
Tel: 0161 877 8908**/

/**insert into address(number, street, postcode, city, country)
values (377, "Alwalton St", "PE2 0XE", "Peterborough", "UK");
East of England Showground, 
Alwalton,
Peterborough, PE2 0XE.
Tel: 01384 635948**/

insert into address(number, street, postcode, city, country)
values (312, "Ashey Rd", "PO33 4BH", "Isle of Wight", "UK");
/**Smallbrook Stadium, 
Ashey Road, Ryde, 
Isle of Wight, PO33 4BH
Tel: 01983 811180**/

insert into address(number, street, postcode, city, country)
values (101, "Wimborne Rd", "BH15 2BP", "Poole", "UK");
/**The Stadium, 
Wimborne Road, Poole,
Dorset, BH15 2BP.
Tel: 01202 681145**/

/**insert into address(number, street, postcode, city, country)
values (18, "Lady Ln", "SN25 4DN", "Swindon", "UK");
Abbey Stadium, 
Lady Lane, Blunsdon,
Swindon, SN25 4DN.
Tel: 07003 921235**/

/**insert into address(number, street, postcode, city, country)
values (90, "Arterial Rd", "RM19 1NX", "Essex", "UK");
Arena-Essex Raceway, 
A1306 Arterial Road, Thurrock,
Essex, RM19 1NX.
Tel: 01708 863443**/

/**insert into address(number, street, postcode, city, country)
values (76, "Rye Rd", "EN11 0EH", "Hoddeson", "UK");
/**Rye House Stadium, 
Rye Road, Hoddeson,
Hertfordshire, EN11 0EH.
Tel: 01992 440400**/

/**insert into address(number, street, postcode, city, country)
values (76, "Saddlebow Rd", "PE34 3AG", "Norfolk", "UK");
The Stadium
Saddlebow Road, Kings Lynn
Norfolk, PE34 3AG
Tel: 01553 771111**/

insert into address(number, street, postcode, city, country)
values (45, "Rugby Rd", "CV8 3GJ", "Coventry", "UK");
/**Coventry Stadium, 
Rugby Road, Brandon, 
Coventry CV8 3GJ.
Tel: 02476 540400**/

/**insert into address(number, street, postcode, city, country)
values (23, "Sutherland Av", "WV2 2JJ", "Wolverhampton", "UK");
Monmore Green Stadium, 
Sutherland Avenue, Monmore Green,
Wolverhampton, WV2 2JJ.
Tel: 01902 870400**/

insert into address(number, street, postcode, city, country)
values (54, "Penistone Rd", "S6 2DE", "Sheffield", "UK");
/**Sheffield Sports Stadium, 
Penistone Road,
Sheffield, S6 2DE.
Tel: 0114 285 3142**/

/**insert into address(number, street, postcode, city, country)
values (12, "Hailsham Rd", "BN27 3RE", "East Sussex", "UK");
Arlington Stadium, 
Hailsham Road West, 
East Sussex, BN27 3RE.
Tel: 01323 841642**/

insert into address(number, street, postcode, city, country)
values (18, "Fossway Rd", "NE6 2XJ", "Newcastle", "UK");
/**Brough Park, 
Fossway, Byker,
Newcastle-uon-Tyne, NE6 2XJ.
Tel: 0191 265 6581**/

insert into address(number, street, postcode, city, country)
values (82, "Hawthorn St", "G22 6RU", "Glasgow", "UK");
/**Ashfield Stadium, 
Saracen Park, Hawthorn Street, 
Possilpark, Glasgow, G22 6RU.
Tel: 0141 849 6088**/

insert into address(number, street, postcode, city, country)
values (11, "Bathgate Rd", "EH48 2PD", "Edinburgh", "UK");
/**Armadale Stadium, 
Bathgate Road, Armadale
West Lothian, EH48 2PD.
Tel: 01501 734 404**/


/** -------------------- CUSTOMERS' ADDRESSES -------------------- **/

insert into address(number, street, postcode, city, country)
values (10, "Piccadilly Circus", "W1J 9HS", "London", "UK");

insert into address(number, street, postcode, city, country)
values (112, "Downing St", "SW1A 2AA", "London", "UK");

insert into address(number, street, postcode, city, country)
values (228, "Princess St", "EH1 2EW", "Edinburgh", "UK");

insert into address(number, street, postcode, city, country)
values (89, "Craiglea Dr", "EH10 5PF", "Edinburgh", "UK");


















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