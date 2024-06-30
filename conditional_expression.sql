-- CASE

SELECT customer_id,
CASE
  WHEN (customer_id <= 100) THEN 'Premium'
  WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
  ELSE 'Normal'
END AS customer_class
FROM customer;


SELECT customer_id,
CASE customer_id
  WHEN 2 THEN 'Winner'
  WHEN 5 THEN 'Second Place'
  ELSE 'Normal'
END AS raffle_results
FROM customer;


SELECT
SUM(CASE rental_rate
  WHEN 0.99 THEN 1
  ELSE 0
END) AS number_of_bargains,
SUM(CASE rental_rate
   WHEN 2.99 THEN 1
   ELSE 0
END) AS regular,
SUM(CASE rental_rate
   WHEN 4.99 THEN 1
   ELSE 0
END) AS premium
FROM film;

-- CASE challenge task

SELECT 
SUM(CASE rating
  WHEN 'R' THEN 1
  ELSE 0
END) AS r_film_num,
SUM(CASE rating
   WHEN 'PG' THEN 1
   ELSE 0
END) AS pg_film_num,
SUM(CASE rating
   WHEN 'PG-13' THEN 1
   ELSE 0
END) AS pg_13_film_num
FROM film;


-- COALESCE

SELECT item, (price - COALESCE(discount, 0))
AS final_price FROM product;


-- CAST

SELECT CAST('5' AS INTEGER) AS new_int;
SELECT '10'::INTEGER;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;


-- NULLIF

CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO depts(
	first_name,
	department
)
VALUES 
('Vinton', 'A'),
('Lauren', 'A'),
('Claire', 'B');

SELECT (
	SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
	SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

DELETE FROM depts
WHERE department = 'B';

SELECT (
	SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
	NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
) AS department_ratio
FROM depts;


Views

CREATE VIEW customer_info AS 
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO c_info;


Import and Export

CREATE TABLE simple(
a INTEGER,
b INTEGER,
c INTEGER
);

SELECT * FROM simple;
