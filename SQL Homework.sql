USE SAKILA;

SELECT first_name, last_name -- 1a
FROM actor;

SELECT CONCAT(first_name, " ", last_name) AS "Actor Name" -- 1b
from actor;

SELECT actor_id, first_name, last_name -- 2a
FROM actor
WHERE first_name = "Joe";

SELECT * -- 2b
FROM actor
WHERE last_name LIKE "%GEN%";

SELECT last_name, first_name -- 2c
FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name ASC;

SELECT country_id, country -- 2d
FROM country
WHERE (country = 'China') or 
(country = 'Bangladesh') or 
(country = 'Afghanistan');

ALTER TABLE actor -- 3a 
ADD description BLOB;

ALTER TABLE actor -- 3b
DROP COLUMN description;

select last_name, count(*) as 'Last Name' -- 4a 
from actor
group by last_name;

select last_name, count(*) as 'Last Name' -- 4b
from actor
group by last_name having count(*) >1;

select * -- 4c 
from actor
where first_name = "Harpo";

UPDATE actor -- 4c 
SET first_name = 'HARPO'
WHERE actor_id = 172; 

UPDATE actor -- 4d
SET first_name = 'GROUCHO'
WHERE actor_id = 172; 

SHOW CREATE TABLE address; -- 5a

SELECT p.first_name, p.last_name, s.address -- 6a 
FROM staff as p 
INNER JOIN address AS s 
ON p.address_id = s.address_id; 

SELECT p.first_name, sum(s.amount) -- 6b
FROM staff as p
INNER JOIN payment AS s
ON p.staff_id = s.staff_id
where payment_date like '%2005-08';

SELECT p.actor_id, s.title -- 6c
FROM film_actor as p
INNER JOIN film AS s
ON p.film_id = s.film_id;

select title, film_id as 'Film Number' -- 6d 
from film
where title = 'Hunchback Impossible';

select count(inventory_id) -- 6d
from inventory 
where film_id = 439;

SELECT distinct p.first_name, p.last_name, sum(s.amount) -- 6e
FROM customer as p 
INNER JOIN payment AS s 
ON p.customer_id = s.customer_id
GROUP BY first_name, last_name
ORDER BY last_name ASC; 

select name, language_id -- 7a
from language;

SELECT title -- 7a
FROM film 
WHERE (title like 'K%') or (title like 'Q%') 
and (language_id = 1);

SELECT title, film_id -- 7b
FROM film
WHERE (title = 'Alone Trip');

SELECT P.first_name, p.last_name -- 7b
FROM actor as p 
INNER JOIN film_actor AS s 
ON p.actor_id = s.actor_id
WHERE (film_id = 17)
ORDER BY last_name ASC; 

SELECT p.country_id, p.country, s.city_id as 'City' -- 7c
FROM country as p 
INNER JOIN city AS s 
ON p.country_id = s.country_id; 

SELECT p.address, s.first_name, s.email -- 7c
FROM address as p
INNER JOIN customer as s 
ON p.address_id = s.address_id
where (city_id = 179) or
(city_id = 196) or
(city_id = 300) or
(city_id = 313) or
(city_id = 383) or
(city_id = 430) or 
(city_id = 565);

select s.title, s.rating -- 7d
from film_category as p
INNER JOIN film as s
ON p.film_id = s.film_id
WHERE (RATING = 'PG') OR 
(RATING = 'G');

SELECT title, rental_rate -- 7e
from film
ORDER BY rental_rate DESC;

SELECT p.amount; -- 7f, me falta toda esta. 

SELECT p.store_id, s.city_id -- 7g
from store as p
INNER JOIN address as s
ON p.address_id = s.address_id;

SELECT c.store_id, p.city, s.country -- 7g
from city as p
INNER JOIN country as s
ON p.country_id = s.country_id
INNER JOIN store as c
ON p.country_id = s.country_id
WHERE (city_id = 300)
or (City_id = 576);

SELECT a.name as 'Genre',  sum(e.amount) as 'Sum' -- 7h
FROM category as a
INNER JOIN film_category as b
ON a.category_id = b.category_id
INNER JOIN inventory as c
ON b.film_id = c.film_id
INNER JOIN rental as d
ON c.inventory_id = d.inventory_id
INNER JOIN payment as e
ON d.rental_id = e.rental_id
GROUP BY name
ORDER BY SUM DESC;

select amount, rental_id
from payment;

CREATE VIEW _top_five_genres as -- 8a
SELECT a.name as 'Genre',  sum(e.amount) as 'Sum'
FROM category as a
INNER JOIN film_category as b
ON a.category_id = b.category_id
INNER JOIN inventory as c
ON b.film_id = c.film_id
INNER JOIN rental as d
ON c.inventory_id = d.inventory_id
INNER JOIN payment as e
ON d.rental_id = e.rental_id
GROUP BY name
ORDER BY SUM DESC;

select * -- 8b
from _top_five_genres;

DROP VIEW sakila._top_five_genres; -- 8c