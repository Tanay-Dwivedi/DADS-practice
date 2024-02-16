-- 1. Calculate the total number of products in the dataset.

SELECT COUNT(*)
FROM customer_product_shipping;

-- 2. Find the warehouse block with the highest number of products.

SELECT Warehouse_block, COUNT(Warehouse_block)
FROM customer_product_shipping
GROUP BY Warehouse_block
ORDER BY Warehouse_block DESC
LIMIT 1;

-- 3. Determine the average number of customer care calls made per warehouse block.

SELECT Warehouse_block,
	SUM(Customer_care_calls) AS total_customer_care_calls,
	AVG(Customer_care_calls) AS average_customer_care_calls
FROM customer_product_shipping
GROUP BY Warehouse_block;

-- 4. Identify the mode of shipment with the highest average cost of products.

SELECT Mode_of_Shipment, AVG(Cost_of_the_Product)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment
ORDER BY AVG(Cost_of_the_Product) DESC
LIMIT 1;

-- 5. Find the minimum, maximum, and average customer rating for each warehouse block.

SELECT Warehouse_block, MIN(Customer_rating), MAX(Customer_rating), AVG(Customer_rating)
FROM customer_product_shipping
GROUP BY Warehouse_block;

-- 6. Calculate the total cost of products shipped by each mode of shipment.

SELECT Mode_of_Shipment, SUM(Cost_of_the_Product)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment;

-- 7. Identify the warehouse block with the highest total weight of products.

SELECT Warehouse_block, SUM(Weight_in_gms)
FROM customer_product_shipping
GROUP BY Warehouse_block
ORDER BY SUM(Weight_in_gms) DESC;

-- 8. Determine the average discount offered on products shipped by each mode of shipment.

SELECT Mode_of_Shipment, AVG(Discount_offered)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment;

-- 9. Find the number of male and female customers who have rated products with a rating of 5.

SELECT Gender, COUNT(Gender)
FROM customer_product_shipping
WHERE Customer_rating = 5
GROUP BY Gender;

-- 10. Calculate the total number of calls made for products with a high importance rating.

SELECT Product_importance, COUNT(Product_importance)
FROM customer_product_shipping
WHERE Product_importance = "high"
GROUP BY Product_importance;

-- 11. Identify the warehouse block with the highest average cost of products and the number of products in that block.

SELECT Warehouse_block, AVG(Cost_of_the_Product), COUNT(Warehouse_block)
FROM customer_product_shipping
GROUP BY Warehouse_block
ORDER BY AVG(Cost_of_the_Product) DESC
LIMIT 1;

-- 12. Find the average weight of products shipped by each mode of shipment.

SELECT Mode_of_Shipment, AVG(Weight_in_gms)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment;

-- 13. Determine the total cost of products for each gender.

SELECT Gender, SUM(Cost_of_the_Product)
FROM customer_product_shipping
GROUP BY Gender;

-- 14. Find the mode of shipment with the highest total number of prior purchases.

SELECT Mode_of_Shipment, SUM(Prior_purchases)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment
ORDER BY SUM(Prior_purchases) DESC
LIMIT 1;

-- 15. Calculate the average cost of products for customers who have made more than 5 prior purchases.

SELECT AVG(Cost_of_the_Product)
FROM customer_product_shipping
WHERE Prior_purchases > 5;

-- 16. Identify the warehouse block with the highest total discount offered on products.

SELECT Warehouse_block, SUM(Discount_offered)
FROM customer_product_shipping
GROUP BY Warehouse_block
ORDER BY SUM(Discount_offered) DESC
LIMIT 1;

-- 17. Determine the average number of calls made for products with a low importance rating.

SELECT Product_importance, AVG(Customer_care_calls)
FROM customer_product_shipping
WHERE Product_importance = "low"
GROUP BY Product_importance;

-- 18. Find the mode of shipment with the highest average customer rating.

SELECT Mode_of_Shipment, AVG(Customer_rating)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment
ORDER BY AVG(Customer_rating) DESC
LIMIT 1;

-- 19. Calculate the total number of products that have not reached on time for each warehouse block.

SELECT Warehouse_block, COUNT(*)
FROM customer_product_shipping
WHERE Reached_on_Time = 0
GROUP BY Warehouse_block;

-- 20. Identify the warehouse block with the highest average weight of products shipped by flight.

SELECT Warehouse_block, AVG(Weight_in_gms)
FROM customer_product_shipping
WHERE Mode_of_Shipment = "flight"
GROUP BY Warehouse_block
ORDER BY AVG(Weight_in_gms) DESC
LIMIT 1;

-- 21. Determine the average discount offered on products with a customer rating of 3 or lower.

SELECT AVG(Discount_offered)
FROM customer_product_shipping
WHERE Customer_rating <= 3;

-- 22. Find the mode of shipment with the highest total cost of products.

SELECT Mode_of_Shipment, SUM(Cost_of_the_Product)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment
ORDER BY SUM(Cost_of_the_Product) DESC
LIMIT 1;

-- 23. Calculate the total number of products shipped by road for each warehouse block.

SELECT Warehouse_block, COUNT(Warehouse_block)
FROM customer_product_shipping
WHERE Mode_of_Shipment = "road"
GROUP BY Warehouse_block;

-- 24. Identify the warehouse block with the highest total number of prior purchases.

SELECT Warehouse_block, SUM(Prior_purchases)
FROM customer_product_shipping
GROUP BY Warehouse_block
ORDER BY SUM(Prior_purchases) DESC
LIMIT 1;

-- 25. Determine the average cost of products for male customers with a customer rating of 4 or higher.

SELECT Gender, AVG(Cost_of_the_Product)
FROM customer_product_shipping
WHERE Customer_rating >= 4
GROUP BY Gender;

-- 26. Find the mode of shipment with the highest total weight of products.

SELECT Mode_of_Shipment, SUM(Weight_in_gms)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment
ORDER BY SUM(Weight_in_gms)
LIMIT 1;

-- 27. Calculate the total cost of products for male customers who have not reached on time.

SELECT SUM(Cost_of_the_Product)
FROM customer_product_shipping
WHERE Reached_on_Time = 0 AND Gender = "M";

-- 28. Determine the average customer rating for products with a weight less than 1500 grams.

SELECT AVG(Customer_rating)
FROM customer_product_shipping
WHERE Weight_in_gms < 1500;

-- 29. Find the mode of shipment with the highest average discount offered.

SELECT Mode_of_Shipment, AVG(Discount_offered)
FROM customer_product_shipping
GROUP BY Mode_of_Shipment
ORDER BY AVG(Discount_offered) DESC
LIMIT 1;

-- 30. Calculate the total number of products for each mode of shipment that have reached on time.

SELECT Mode_of_Shipment, COUNT(Mode_of_Shipment)
FROM customer_product_shipping
WHERE Reached_on_Time = 1
GROUP BY Mode_of_Shipment;
