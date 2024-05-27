SELECT first_name, last_name, email FROM customer;
SELECT DISTINCT (rental_rate) FROM film;
SELECT DISTINCT(rating) FROM film;
SELECT COUNT(DISTINCT rating) from film;
SELECT COUNT(amount) FROM payment;
SELECT COUNT(DISTINCT amount) FROM payment;
SELECT * FROM customer WHERE first_name = 'Jared';
SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT COUNT(title) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT COUNT(*) FROM film WHERE rating = 'R' OR rating = 'PG-13';
SELECT * FROM film WHERE rating != 'R';
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
SELECT description FROM film WHERE title = 'Outlaw Hanky';
SELECT phone FROM address WHERE address = '259 Ipoh Drive';
SELECT * FROM customer ORDER BY first_name ASC;
SELECT * FROM customer ORDER BY first_name DESC;
SELECT store_id, first_name, last_name FROM customer ORDER BY store_id DESC, first_name ASC;
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;
SELECT customer_id, payment_date FROM payment ORDER BY payment_date ASC LIMIT 10;
SELECT title, length FROM film ORDER BY length ASC LIMIT 10;
SELECT COUNT(title) FROM film WHERE length <= 50;
SELECT COUNT(*) FROM payment 
WHERE amount BETWEEN 8 AND 9;
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
SELECT DISTINCT(amount) FROM payment
ORDER BY amount;
SELECT * FROM payment WHERE amount IN (0.99, 1.98, 1.99);
SELECT COUNT(*) FROM payment WHERE amount NOT IN (0.99, 1.98, 1.99);
SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');
SELECT * FROM customer
WHERE first_name LIKE 'J%'
AND last_name LIKE 'S%';
SELECT * FROM customer
WHERE first_name ILIKE '_her%';
SELECT * FROM customer
WHERE first_name LIKE 'A%'
AND last_name NOT LIKE 'B%'
ORDER BY last_name
SELECT COUNT(amount) FROM payment WHERE amount > 5;
SELECT COUNT(*) FROM actor WHERE first_name LIKE 'P%';
SELECT COUNT(DISTINCT(district)) FROM address;
SELECT DISTINCT(district) FROM address;
SELECT * FROM film;
SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;
SELECT COUNT(*) FROM film;
SELECT ROUND(AVG(replacement_cost), 2) FROM film;
SELECT SUM(replacement_cost) FROm film;
SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id 
ORDER BY SUM(amount) DESC;
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id, staff_id;
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;
SELECT staff_id, COUNT(*) FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC;
SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film
GROUP BY rating;
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184, 87, 477)
GROUP BY customer_id
HAVING SUM(amount) > 100;
SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;
SELECT customer_id, COUNT(payment_id) FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40
ORDER BY COUNT(payment_id) DESC;
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;
SELECT customer_id, SUM(amount) from payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;
SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';
SELECT first_name, last_name FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
SELECT COUNT(amount) AS num_transactions FROM payment;
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
SELECT payment_id, payment.customer_id, first_name 
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;
SELECT film.film_id, title, inventory_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id
WHERE inventory.film_id IS null
SELECT district, email FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

SELECT film.title, actor.first_name, actor.last_name from actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE actor.first_name = 'Nick'
AND actor.last_name = 'Wahlberg';
SHOW ALL;
SHOW TIMEZONE;
SELECT NOW();
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;
SELECT EXTRACT(YEAR FROM payment_date) AS year
FROM payment;
SELECT payment_date, EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;
SELECT EXTRACT(QUARTER FROM payment_date) AS pay_quarter
FROM payment;
SELECT AGE(payment_date)
FROM payment;
SELECT TO_CHAR(payment_date, 'MONTH   YYYY')
FROM payment
SELECT TO_CHAR(payment_date, 'mon/dd/YYYY')
FROM payment;
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

SELECT COUNT(*) FROM payment
WHERE TO_CHAR(payment_date, 'D') = '2';
SELECT ROUND(rental_rate/replacement_cost, 4)* 100 AS percent_cost FROM film;
SELECT LENGTH(first_name) FROM customer;
SELECT first_name || ' ' || last_name AS full_name FROM customer;
SELECT upper(first_name) || ' ' || upper(last_name) AS full_name FROM customer;
SELECT LOWER(LEFT(first_name, 1)) || LOWER(last_name) || '@gmail.com' FROM customer;
SELECT title, rental_rate FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);
SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE rental.return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY film_id;
SELECT first_name, last_name 
FROM customer AS c 
WHERE EXISTS
(SELECT * FROM payment AS p 
 WHERE p.customer_id = c.customer_id 
 AND amount > 11);

SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length;

SELECT * FROM payment;








