SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

/** Zadanie 3 **/

use car_rental_company;

/* a) Stwórz widok który przedstawi klientów wraz z datami wypożyczeń i markami samochodów. */
CREATE VIEW customers_with_all_rentals_data AS
SELECT cu.ID, cu.firstname, cu.surname, r.dateSince, r.dateTo, ca.brand 
FROM customers cu
JOIN rental_data r ON cu.ID = r.customerID
JOIN cars ca ON ca.ID = r.carID
ORDER BY cu.ID, ca.brand;

/* b) Stwórz dodatkowe 2 widoki pozwalające łatwiej wykonać jakieś czynności z zadania 4. */
CREATE VIEW cars_between_200000_and_300000_mileage AS
SELECT c.ID, c.carBodyType, c.brand, c.model, c.productionYear, c.engineVolume, c.power, c.mileage
FROM cars c
WHERE mileage >= 200000 and mileage <= 300000
ORDER BY mileage DESC;

CREATE VIEW customers_with_all_rentals_number AS
SELECT c.ID, c.firstname, c.surname, count(r.ID) 
FROM customers c
JOIN rental_data r ON c.ID = r.customerID
GROUP BY c.ID
ORDER BY count(r.ID) DESC, ID;

/** Zadanie 4 **/

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
select agencyID, firstname, surname, positionID from employees where positionID = 3 order by agencyID;

/* g) znajdź klientów z największa liczbą wypożyczeń - przyjęto, że chodzi o 5 klientów */
select * from customers_with_all_rentals_number limit 5;

/* h) znajdź klientów, którzy wypożyczyli największą liczbę różnych samochodów - interpretuję różne samochody jako różne marki samochodów
dla większego zróżnicowania uzyskanych wyników, przyjęto, że chodzi o 5 klientów */
select ID, firstname, surname, count(distinct brand)
from customers_with_all_rentals_data
group by ID
order by count(distinct brand) desc, ID
limit 5;

/* i) znajdź samochody najczęściej wypożyczane - przyjęto, że chodzi o 3 samochody rozróżniane po ich ID */
select c.ID, c.brand, c.model, c.productionYear, c.engineVolume, c.mileage, count(r.ID)
from cars c
join rental_data r on c.ID = r.carID
group by c.ID
order by count(r.ID) desc, c.ID
limit 3;

/* j) znajdź klientów, którzy zapłacili najwięcej za wypożyczenia w tym roku - przyjęto, że chodzi o 5 klientów */
select r.customerID, c.firstname, c.surname, sum(r.price)
from customers c
join rental_data r on c.ID = r.customerID
where year(r.dateSince) = year(curdate())
group by r.customerID
order by sum(r.price) desc
limit 5;

/* k) znajdź klientów, którzy wypożyczyli samochód X w dacie miedzy Y a Z. - przyjęto, że chodzi o samochód o ID równym 6 i daty między 2016-01-01 a 2017-07-31 */
select r.customerID, cu.firstname, cu.surname, r.carID, ca.brand, ca.model, r.dateSince, r.dateTo
from customers cu
join rental_data r on cu.ID = r.customerID
join cars ca on ca.ID = r.carID
where r.carID = 6 and r.dateSince >= date('2016-01-01') and r.dateSince <= date('2017-07-31')
order by r.customerID;

/* l) zaktualizuj kolor samochodu X - przeyjęto, że chodzi o samochód o ID równym 6 */
update cars set colour = 'blue' where ID = 6;

/* m) znajdź klienta, który najczęściej wypożycza i oddaje samochody w innych miejscach */
select c.ID, c.firstname, c.surname, count(r.ID) as 'number of rentals from-to different agencies'
from customers c
join rental_data r on c.ID = r.customerID
where (r.fromAgencyID <> r.toAgencyID) and (r.toAgencyID is not null)
group by c.ID
order by count(r.ID) desc, c.ID
limit 1;

/* o) sprawdź w jakiej domenie klienci maja najczęściej email */
select substring_index(email, '@', -1) as 'email domain', count(cu.ID) as 'number of customers on the domain'
from customers cu
join contact_data cd on cu.contactID = cd.ID
group by substring_index(email, '@', -1)
order by count(cu.ID) desc
limit 1;

/* p) znajdź samochody, które mają conajmniej 2 opiekunów */
select cs.carID, ca.brand, ca.model, count(cs.employeeID) as 'number of supervisors'
from car_supervisors cs
join cars ca on cs.carID = ca.ID
where dateSince <= curdate() and (dateTo >= curdate() or dateTo is null)
group by carID
having count(cs.employeeID) >= 2
order by cs.carID;

/* r) znajdź pracowników, którzy nie opiekują się żadnym samochodem */
select e.ID, e.firstname, e.surname
from employees e
left join car_supervisors cs on e.ID = cs.employeeID
where carID is null
order by cs.employeeID;

/** Zadanie 5 **/

/* a) użytownik user_ro może tylko odczytywać dane z wszystkich tabel */
CREATE USER 'user_ro'@'localhost' IDENTIFIED BY 'ro';
GRANT select ON car_rental_company.* TO 'user_ro'@'localhost';
GRANT delete ON car_rental_company.* TO 'user_ro'@'localhost';
REVOKE delete ON car_rental_company.* FROM 'user_ro'@'localhost';
FLUSH PRIVILEGES;

/* b) użytownik user_rw_projekt ma pełny dostęp do tabeli z samochodami (tzn. może wstawiać i usuwać  dane), do innych tabel w projekcie dostępu nie ma. */
CREATE USER 'user_rw'@'localhost' IDENTIFIED BY 'rw';
GRANT select ON car_rental_company.cars TO 'user_rw'@'localhost';
GRANT drop ON car_rental_company.cars TO 'user_rw'@'localhost';
GRANT delete ON car_rental_company.cars TO 'user_rw'@'localhost';
GRANT insert ON car_rental_company.cars TO 'user_rw'@'localhost';
GRANT update ON car_rental_company.cars TO 'user_rw'@'localhost';
FLUSH PRIVILEGES;
