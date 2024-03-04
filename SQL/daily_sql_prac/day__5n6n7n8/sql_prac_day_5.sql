-- ### Easy Questions:

-- 1. Retrieve all columns from the `geo` table.

SELECT *
FROM geo;

-- 2. Retrieve all columns from the `people` table.

SELECT *
FROM people;

-- 3. Retrieve all columns from the `products` table.

SELECT *
FROM products;

-- 4. Retrieve all columns from the `sales` table.

SELECT *
FROM sales;
WHERE Cateogry == "Bar"
GROUP BY SPID
ORDER BY GeoID

-- 5. Retrieve the total number of records in the `geo` table.

SELECT COUNT(*)
FROM geo;

-- 6. Retrieve the total number of records in the `people` table.

SELECT COUNT(*)
FROM people;

-- 7. Retrieve the total number of records in the `products` table.

SELECT COUNT(*)
FROM products;

-- 8. Retrieve the total number of records in the `sales` table.

SELECT COUNT(*)
FROM sales;

-- 9. Retrieve the salesperson names from the `people` table.

SELECT COUNT(*)
FROM people;

-- 10. Retrieve the unique product categories from the `products` table.

SELECT DISTINCT(Category)
FROM products;

-- 11. Retrieve the sales amount from the `sales` table for each salesperson.

SELECT *
FROM sales;

-- 12. Retrieve the total cost of products sold for each category.



-- 13. Retrieve the total number of customers for each salesperson.



-- 14. Retrieve the total number of boxes sold for each product.



-- 15. Retrieve the total amount of sales made in each region.



-- 16. Retrieve the average cost per box for each product category.



-- 17. Retrieve the sales amount for each salesperson in each region.



-- 18. Retrieve the salesperson name and the number of customers they have.



-- 19. Retrieve the product name and its category.



-- 20. Retrieve the salesperson name and the total sales amount for each.



-- 21. Retrieve the total number of boxes sold for each product category.



-- 22. Retrieve the salesperson name and their team.



-- 23. Retrieve the product name and its size.



-- 24. Retrieve the salesperson name and the total number of boxes sold for each.



-- 25. Retrieve the sales amount for each product sold.





-- ### Medium Questions:

-- 26. Retrieve the salesperson name and the total sales amount in each region, even if there are no sales.



-- 27. Retrieve the salesperson name and the total sales amount, only including sales where the amount is greater than $1000.



-- 28. Retrieve the product name, category, and the total number of boxes sold for each product, ordered by the number of boxes sold in descending order.



-- 29. Retrieve the salesperson name and the total sales amount for each, ordered by the sales amount in descending order.



-- 30. Retrieve the product name and the total number of boxes sold for each product, excluding products with no sales.



-- 31. Retrieve the salesperson name and the total sales amount for each, including sales where the salesperson does not have any sales.



-- 32. Retrieve the product name, category, and the average cost per box for each product, ordered by the average cost per box in ascending order.



-- 33. Retrieve the salesperson name and the total sales amount for each, only including sales made in regions starting with 'A'.



-- 34. Retrieve the product name, category, and the total sales amount for each product, ordered by the total sales amount in descending order.



-- 35. Retrieve the salesperson name and the total sales amount for each, only including sales made after January 1, 2023.



-- 36. Retrieve the product name, category, and the total number of boxes sold for each product, only including products where the number of boxes sold is greater than 100.



-- 37. Retrieve the salesperson name and the total sales amount for each, only including sales where the salesperson is in team 1.



-- 38. Retrieve the product name, category, and the total number of boxes sold for each product, excluding products with less than 10 boxes sold.



-- 39. Retrieve the salesperson name and the total sales amount for each, only including sales where the sales amount is between $500 and $1000.



-- 40. Retrieve the product name, category, and the total sales amount for each product, only including products with a total sales amount greater than $5000.



-- ### Hard Questions:

-- 41. Retrieve the salesperson name and the total sales amount for each, including sales made in regions where there are no salespeople.



-- 42. Retrieve the product name, category, and the total number of boxes sold for each product, including products with no sales.



-- 43. Retrieve the salesperson name and the total sales amount for each, including sales where the salesperson does not exist in the `people` table.



-- 44. Retrieve the product name, category, and the total number of boxes sold for each product, including products not present in the `sales` table.



-- 45. Retrieve the salesperson name and the total sales amount for each, including sales made on dates where there are no sales.



-- 46. Retrieve the product name, category, and the total number of boxes sold for each product, including products with NULL values in the `size` column.



-- 47. Retrieve the salesperson name and the total sales amount for each, including sales made with products not present in the `products` table.



-- 48. Retrieve the product name, category, and the total number of boxes sold for each product, excluding products with NULL values in the `category` column.



-- 49. Retrieve the salesperson name and the total sales amount for each, including sales made by salespeople not assigned to any team.



-- 50. Retrieve the product name, category, and the total number of boxes sold for each product, excluding products with NULL values in the `product` column.

