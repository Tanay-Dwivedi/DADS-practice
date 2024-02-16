-- 1. Write a SQL query to select all columns from the dataset.

SELECT *
FROM customer_product_shipping;

-- 2. Retrieve only the first 10 rows from the dataset using SQL LIMIT.

SELECT *
FROM customer_product_shipping
LIMIT 10;

-- 3. Select all products where the cost is greater than $100.

SELECT *
FROM customer_product_shipping
WHERE Cost_of_the_Product > 100;

-- 4. Retrieve products with customer ratings greater than or equal to 4.

SELECT *
FROM customer_product_shipping
WHERE Customer_rating >= 4;

-- 5. Select products shipped by flight or road.

SELECT *
FROM customer_product_shipping
WHERE Mode_of_Shipment IN ("Flight", "Road");

-- 6. Retrieve products with customer ratings between 3 and 5.

SELECT *
FROM customer_product_shipping
WHERE Customer_rating BETWEEN 3 AND 5;

-- 7. Select products with customer care calls greater than the average number of calls.

SELECT *
FROM customer_product_shipping
WHERE Customer_care_calls > (
	SELECT AVG(Customer_care_calls)
	FROM customer_product_shipping
);

-- 8. Retrieve products with weights between 1500 and 2000 grams.

SELECT *
FROM customer_product_shipping
WHERE Weight_in_gms BETWEEN 1500 AND 2000;

-- 9. Select products where the warehouse block is not specified (NULL).

SELECT *
FROM customer_product_shipping
WHERE Warehouse_block IS NULL;

-- 10. Retrieve products shipped by ship and delivered on time.

SELECT *
FROM customer_product_shipping
WHERE Mode_of_Shipment = "Ship" AND Reached_on_Time = 1;

-- 11. Select products with a discount offered greater than 10%.

SELECT *
FROM customer_product_shipping
WHERE (Discount_offered/Cost_of_the_Product) * 100 > 10;

-- 12. Retrieve products with a customer rating of 5 and a weight less than 1350 grams.

SELECT *
FROM customer_product_shipping
WHERE Customer_rating = 5 AND Weight_in_gms < 1350;

-- 13. Select products with the highest cost and lowest cost.

SELECT *
FROM customer_product_shipping
WHERE Cost_of_the_Product  = (
	SELECT MAX(Cost_of_the_Product)
	FROM customer_product_shipping
)
OR Cost_of_the_Product = (
	SELECT MIN(Cost_of_the_Product)
	FROM customer_product_shipping
);

-- 14. Retrieve the count of products shipped by each mode of shipment.

SELECT Mode_of_Shipment, COUNT(Mode_of_Shipment)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment;

-- 15. Select the sum of costs for products with a high importance rating.

SELECT Product_importance, SUM(Cost_of_the_Product)
FROM customer_product_shipping
WHERE Product_importance = "high"
GROUP BY Product_importance;

-- 16. Retrieve the minimum and maximum number of prior purchases.

SELECT *
FROM customer_product_shipping
WHERE Prior_purchases = (
SELECT MIN(Prior_purchases)
FROM customer_product_shipping
)
OR Prior_purchases = (
SELECT MAX(Prior_purchases)
FROM customer_product_shipping
);

-- 17. Select the average weight of products for each gender.

SELECT Gender, AVG(Weight_in_gms)
FROM customer_product_shipping
GROUP BY Gender;

-- 18. Retrieve the count of products in each warehouse block.

SELECT Warehouse_block, COUNT(Warehouse_block)
FROM customer_product_shipping
GROUP BY Warehouse_block;

-- 19. Select the average discount offered for products with a customer rating of 3 or lower.

SELECT AVG(Discount_offered)
FROM customer_product_shipping
WHERE Customer_rating <= 3;

-- 20. Retrieve the sum of weights for products shipped by road in each warehouse block.

SELECT Warehouse_block, SUM(Weight_in_gms)
FROM customer_product_shipping
WHERE Mode_of_Shipment = "Road"
GROUP BY Warehouse_block;

-- 21. Select the count of products that did not reach on time for each mode of shipment.

SELECT Mode_of_Shipment, COUNT(*)
FROM customer_product_shipping
WHERE Reached_on_Time = 0
GROUP BY Mode_of_Shipment;

-- 22. Retrieve the average cost of products for each warehouse block with a customer rating of 4 or higher.

SELECT Warehouse_block, AVG(Cost_of_the_Product)
FROM customer_product_shipping
WHERE Customer_rating >= 4
GROUP BY Warehouse_block;

-- 23. Select the total number of customer care calls made for products with a low importance rating.

SELECT SUM(Customer_care_calls)
FROM customer_product_shipping
WHERE Product_importance = "low";

-- 24. Retrieve the count of male and female customers who have rated products with a rating of 5.

SELECT Gender, COUNT(*)
FROM customer_product_shipping
WHERE Customer_rating = 5
GROUP BY Gender;

-- 25. Select the sum of costs for products shipped by each mode of shipment where the discount offered is greater than 5%.

SELECT Mode_of_Shipment, SUM(Cost_of_the_Product)
FROM customer_product_shipping
WHERE (Discount_offered/Cost_of_the_Product)*10 > 5
GROUP BY Mode_of_Shipment;

-- 26. Retrieve the average weight of products for each mode of shipment with a customer rating of 4 or higher.

SELECT Mode_of_Shipment, AVG(Weight_in_gms)
FROM customer_product_shipping
WHERE Customer_rating >= 4
GROUP BY Mode_of_Shipment;

-- 27. Select the maximum cost of a product in each warehouse block where the product reached on time.

SELECT Warehouse_block, MAX(Cost_of_the_Product)
FROM customer_product_shipping
WHERE Reached_on_Time = 1
GROUP BY Warehouse_block;

-- 28. Retrieve the minimum number of prior purchases made by male customers.

SELECT MIN(Prior_purchases)
FROM customer_product_shipping
WHERE gender = "M";

-- 29. Select the warehouse block with the highest average customer rating.

SELECT Warehouse_block
FROM customer_product_shipping
GROUP BY Warehouse_block
ORDER BY AVG(Customer_rating) DESC
LIMIT 1;

-- 30. Retrieve the count of products with a customer rating of 1 or 2 that did not reach on time.

SELECT COUNT(*)
FROM customer_product_shipping
WHERE Customer_rating IN (1,2) AND Reached_on_Time = 0;
