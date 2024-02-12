-- SELECT
-- 	first_name,
-- 	country 
-- FROM customers

-- SELECT DISTINCT
-- 	country
-- FROM customers

-- SELECT *
-- FROM customers
-- ORDER BY 4 ASC, 5 DESC

-- SELECT *
-- FROM customers
-- WHERE score BETWEEN 100 AND 500

-- SELECT *
-- FROM customers
-- WHERE customer_id IN (1,2,5)

-- LIKE operator
-- % = matches everything
-- _ = matches exactly one character

-- SELECT *
-- FROM customers
-- WHERE first_name LIKE "%r%"
-- ORDER BY first_name DESC

-- SELECT c.customer_id AS cid
-- FROM customers AS c


-- work as FULL JOIN
-- SELECT
-- c.customer_id,
-- c.first_name,
-- o.order_id,
-- o.quantity
-- FROM customers AS c
-- LEFT JOIN orders AS O
-- ON c.customer_id = o.customer_id
-- UNION
-- SELECT
-- c.customer_id,
-- c.first_name,
-- o.order_id,
-- o.quantity
-- FROM customers AS c
-- RIGHT JOIN orders AS O
-- ON c.customer_id = o.customer_id


-- UNION = no duplicates rows
-- UNION ALL = have duplicate rows
-- SELECT
-- first_name,
-- last_name,
-- country
-- FROM customers
-- UNION
-- SELECT
-- first_name,
-- last_name,
-- emp_country
-- FROM employees


-- SELECT MIN(score) AS MAX_score_of_customers
-- FROM customers

-- SELECT MAX(order_date) as latest_date
-- FROM orders
-- UNION
-- SELECT MIN(order_date) as early_date
-- FROM orders


-- SELECT 
-- CONCAT (first_name, " ", last_name) AS customer_name,
-- LOWER(CONCAT (first_name, " ", last_name)) AS lower_customer_name,
-- UPPER(CONCAT (first_name, " ", last_name)) AS upper_customer_name
-- FROM customers
-- ORDER BY customer_name


-- SELECT 
-- last_name,
-- LENGTH(last_name) AS len,
-- TRIM(last_name) AS trimmed_last_name,
-- LENGTH(TRIM(last_name)) AS trim_len
-- FROM customers

-- SELECT SUBSTRING(last_name,2 ,3)
-- FROM customers

-- SELECT
-- MAX(score) AS highest_score,
-- MIN(score) AS lowest_score,
-- country
-- FROM customers
-- GROUP BY country
-- -- ORDER BY highest_score DESC


-- SELECT
-- COUNT(*) AS total_customers,
-- country
-- FROM customers
-- WHERE country != "USA"
-- GROUP BY country
-- HAVING COUNT(*)>1
-- ORDER BY country DESC


-- SELECT *
-- FROM orders
-- WHERE customer_id
-- IN (
-- SELECT customer_id
-- FROM customers
-- WHERE score > 500
-- )

-- SELECT *
-- FROM orders AS o
-- WHERE EXISTS (
-- SELECT 1
-- FROM customers AS C
-- WHERE c.customer_id = o.customer_id
-- AND score > 500
-- )
