SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

/** Zadanie 3 **/

use car_rental_company;

/* a) Stwórz widok który przedstawi klientów wraz z datami wypożyczeń i markami samochodów. */
CREATE VIEW customers_with_rental_data AS
SELECT cu.ID, cu.firstName, cu.surname, r.dateSince, r.dateTo, ca.brand 
FROM customers cu
JOIN rental_data r ON cu.ID = r.customerID
JOIN cars ca ON ca.ID = r.carID
ORDER BY cu.ID;

select * from customers_with_rental_data;

/* b) Stwórz dodatkowe 2 widoki pozwalające łatwiej wykonać jakieś czynności z zadania 4. */
CREATE VIEW cars_between_200000_and_300000_mileage AS
SELECT c.ID, c.carBodyType, c.brand, c.model, c.productionYear, c.engineVolume, c.power, c.mileage
FROM cars c
WHERE mileage >= 200000 and mileage <= 300000
ORDER BY mileage DESC;

CREATE VIEW customers_with_rental_number AS
SELECT c.ID, c.firstName, c.surname, count(r.ID) 
FROM customers c
JOIN rental_data r ON c.ID = r.customerID
GROUP BY c.ID
ORDER BY count(r.ID) DESC;

/** Zadanie 4 **/

/**
h) znajdź klientów, którzy wypożyczyli największą liczbę różnych samochodów
i) znajdź samochody najczęściej wypożyczane
j) znajdź klientów, którzy zapłacili najwięcej za wypożyczenia w tym roku
k) znajdź klientów, którzy wypożyczyli samochód X w dacie miedzy Y a Z.
l) zaktualizuj kolor samochodu X
m) znajdź klienta, który najczęściej wypożycza i oddaje samochody w innych miejscach
o) sprawdź w jakiej domenie klienci maja najczęściej email
p) znajdź samochody, które mają conajmniej 2 opiekunów
r) znajdź pracowników, którzy nie opiekują się żadnym samochodem
**/

/* a) znajdź pracowników starszych niż 25 lat */
select *, (year(curdate()) - year(dateOfBirth)) from employees where (year(curdate()) - year(dateOfBirth)) > 25 order by ID;

/* b) znajdź pracowników, których nazwisko jest dłuższe niż N znaków - przyjęto N = 7 */
select *, char_length(surname) from employees where char_length(surname) > 7 order by ID;

/* c) znajdź pracowników, w których nazwisku na drugim miejscu wystepuje duża litera 'F'*/
select * from employees where char_length(substring_index(surname, 'F', 1)) = 1;

/* d) znajdź samochody z największym przebiegiem - przyjęto, że chodzi o 3 samochody */
select * from cars order by mileage desc limit 3;

/* e) policz ilość samochodów których przebieg jest pomiędzy 200 a 300 tys. */
select count(*) from cars_between_200000_and_300000_mileage;

/* f) znajdź wszystkich kierowników */
select agencyID, firstName, surname, positionID from employees where positionID = 3 order by agencyID;

/* g) znajdź klientów z największa liczbą wypożyczeń - przyjęto, że chodzi o 5 klientów */
select * from customers_with_rental_number limit 5;