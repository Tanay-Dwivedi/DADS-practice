-- 1. Retrieve all earthquake events from the table.

SELECT *
FROM earthquake;

-- 2. Retrieve earthquake events with a magnitude greater than 5.0.

SELECT *
FROM earthquake
WHERE magnitude > 5.0;

-- 3. Retrieve earthquake events with a depth less than 50 kilometers.

SELECT *
FROM earthquake
WHERE depth < 50;

-- 4. Retrieve earthquake events that occurred after January 1, 1970.

SELECT *
FROM earthquake
WHERE occurred_on > "1970-01-01";

-- 5. Retrieve earthquake events that occurred in the Solomon Islands.

SELECT *
FROM earthquake
WHERE place = "Solomon Islands";

-- 6. Retrieve earthquake events with a magnitude between 4.0 and 6.0.

SELECT *
FROM earthquake
WHERE magnitude BETWEEN 4.0 AND 6.0;

-- 7. Retrieve earthquake events with a depth greater than 100 kilometers.

SELECT *
FROM earthquake
WHERE depth > 100;

-- 8. Retrieve earthquake events that occurred in between latitude -50 and 50.

SELECT *
FROM earthquake
WHERE latitude BETWEEN -50 AND 50;

-- 9. Retrieve earthquake events that occurred in between longitude -150 and 150.

SELECT *
FROM earthquake
WHERE longitude BETWEEN -150 AND 150;

-- 10. Retrieve the top 10 earthquake events based on magnitude.

SELECT *
FROM earthquake
ORDER BY magnitude DESC
LIMIT 10;

-- 11. Retrieve  the latest 100 earthquake events that occurred.

SELECT *
FROM earthquake
ORDER BY occurred_on DESC
LIMIT 100;

-- 12. Retrieve earthquake events with a magnitude equal to 7.0.

SELECT *
FROM earthquake
WHERE magnitude = 7.0;

-- 13. Retrieve earthquake events with a depth equal to 0 kilometers.

SELECT *
FROM earthquake
WHERE depth = 0;

-- 14. Retrieve earthquake events that occurred using a calculation method "mb".

SELECT *
FROM earthquake
WHERE calculation_method = "mb";

-- 15. Retrieve earthquake events with a magnitude greater than 6.0 and depth less than 50 kilometers.

SELECT *
FROM earthquake
WHERE magnitude > 6 AND depth < 50;

-- 16. Retrieve earthquake events that occurred due to explosion.

SELECT *
FROM earthquake
WHERE cause = "explosion";

-- 17. Retrieve the 5 earliest earthquake events in the table.

SELECT *
FROM earthquake
ORDER BY occurred_on
LIMIT 5;

-- 18. Retrieve earthquake events with a magnitude greater than 5.0 and occurred after January 1, 2000.

SELECT *
FROM earthquake
WHERE magnitude > 5 AND occurred_on > "2000-01-01";

-- 19. Retrieve earthquake events that occurred in a year 2000.

SELECT *
FROM earthquake
WHERE YEAR(occurred_on) = "2002";

-- 20. Retrieve earthquake events that occurred in a fiji.

SELECT *
FROM earthquake
WHERE place = "fiji";

-- 21. Retrieve earthquake events with a magnitude less than 4.0 or depth greater than 200 kilometers.

SELECT *
FROM earthquake
WHERE magnitude < 4 OR depth > 200;

-- 22. Retrieve earthquake events that occurred due to nuclear explosion.

SELECT *
FROM earthquake
WHERE cause = "nuclear explosion";

-- 23. Retrieve earthquake events with a magnitude not equal to 6.0.

SELECT *
FROM earthquake
WHERE magnitude != 6;

-- 24. Retrieve earthquake events with a depth not between 50 and 100 kilometers.

SELECT *
FROM earthquake
WHERE NOT depth BETWEEN 50 AND 100;

-- 25. Retrieve earthquake events that occurred in a specific region and have a magnitude greater than 4.5.

SELECT *
FROM earthquake
WHERE place = "fiji" AND magnitude > 4.5;

-- 26. Retrieve earthquake events that occurred on a latitude < 50 and longitude < 50.

SELECT *
FROM earthquake
WHERE latitude < 50 AND longitude < 50;

-- 27. Retrieve earthquake events with a magnitude greater than 6.0 and occurred after March 25, 1950, ordered by magnitude in descending order.

SELECT *
FROM earthquake
WHERE magnitude > 6 AND occurred_on > "1950-03-25";

-- 28. Retrieve earthquake events that occurred before March 25, 1950 on fiji and have a magnitude less than 5.0.

SELECT *
FROM earthquake
WHERE magnitude > 6 AND occurred_on > "1950-03-25" AND place = "fiji";

-- 29. Retrieve earthquake events that occurred having a network ID "iscgemsup812819"

SELECT *
FROM earthquake
WHERE network_id = "iscgemsup812819";

-- 30. Retrieve earthquake events with a magnitude greater than 5.0 and occurred before August 15, 1970, limited to 20 records.

SELECT *
FROM earthquake
WHERE magnitude > 5 AND occurred_on < "1970-08-15"
LIMIT 20;