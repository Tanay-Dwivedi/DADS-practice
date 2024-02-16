-- 1. Retrieve all columns from the earthquake table.

SELECT *
FROM earthquake;

-- 2. Retrieve the first 20 earthquake occurrences from the table.

SELECT *
FROM earthquake
LIMIT 20;

-- 3. Select earthquakes with a magnitude greater than 6.

SELECT *
FROM earthquake
WHERE magnitude > 6;

-- 4. Retrieve earthquakes that occurred in the year 2005.

SELECT *
FROM earthquake
WHERE YEAR(occurred_on) = "2005";

-- 5. Retrieve earthquakes with a depth between 50 and 100 km.

SELECT *
FROM earthquake
WHERE depth BETWEEN 50 AND 100;

-- 6. Select earthquakes that occurred in the Solomon Islands.

SELECT *
FROM earthquake
WHERE place = "Solomon Islands";

-- 7. Find earthquakes with a magnitude greater than 5 and a depth less than 50 km.

SELECT *
FROM earthquake
WHERE magnitude > 5 AND depth < 50;

-- 8. Retrieve earthquakes that occurred in fiji recently.

SELECT *
FROM earthquake
WHERE place = "fiji"
ORDER BY occurred_on DESC
LIMIT 1;

-- 9. Select earthquakes where the 'cause' field is NULL.

SELECT *
FROM earthquake
WHERE cause IS null;

-- 10. Retrieve earthquakes with a magnitude of 6 or 7.

SELECT *
FROM earthquake
WHERE magnitude IN (6,7);

-- 11. Select earthquakes with a magnitude less than or equal to 5 or a depth greater than 100 km.

SELECT *
FROM earthquake
WHERE magnitude <= 5 AND depth < 100;

-- 12. Retrieve earthquakes that occurred in the year 2010 and have a magnitude greater than 6.

SELECT *
FROM earthquake
WHERE YEAR(occurred_on) = "2010" AND magnitude > 6;

-- 13. Select earthquakes with a depth less than 50 km and a magnitude greater than 7.

SELECT *
FROM earthquake
WHERE depth < 50 AND magnitude > 7;

-- 14. Retrieve earthquakes that occurred in regions other than the Kuril Islands.

SELECT *
FROM earthquake
WHERE place != "Kuril Islands";

-- 15. Select earthquakes with a magnitude between 6 and 7 and a depth less than 50 km.

SELECT *
FROM earthquake
WHERE (magnitude BETWEEN 6 AND 7) AND (depth < 50);

-- 16. Retrieve earthquakes with a magnitude greater than 6 and order them by magnitude in descending order.

SELECT *
FROM earthquake
WHERE magnitude > 6
ORDER BY magnitude DESC;

-- 17. Select earthquakes that occurred in the year 2000 and have a depth less than 50 km.

SELECT *
FROM earthquake
WHERE YEAR(occurred_on) = "2000" AND depth < 50;

-- 18. Retrieve earthquakes with a magnitude greater than 7 and order them by occurrence date in ascending order.

SELECT *
FROM earthquake
WHERE magnitude > 7
ORDER BY occurred_on;

-- 19. Select earthquakes that occurred in Banda Sea and Colombia.

SELECT *
FROM earthquake
WHERE place IN ("Banda Sea", "Colombia");

-- 20. Retrieve earthquakes with a magnitude of 5 or 6 and occurred in the Southern Hemisphere.

SELECT *
FROM earthquake
WHERE magnitude IN (5,6) AND place = "fiji";

-- 21. Select earthquakes with a depth less than 50 km or occurred in the year 2015.

SELECT *
FROM earthquake
WHERE depth < 50 OR YEAR(occurred_on) = "2015";

-- 22. Retrieve earthquakes with a depth between 50 and 100 km and a magnitude greater than 6.

SELECT *
FROM earthquake
WHERE (depth BETWEEN 50 AND 100) AND magnitude > 6;

-- 23. Select earthquakes with a calculation method other than 'mw'.

SELECT *
FROM earthquake
WHERE calculation_method = "mw";

-- 24. Retrieve earthquakes with a depth less than 50 km and order them by magnitude in descending order.

SELECT *
FROM earthquake
WHERE depth < 50
ORDER BY magnitude DESC;

-- 25. Select earthquakes that occurred in the Gulf of Alaska region and have a depth less than 50 km.

SELECT *
FROM earthquake
WHERE place = "Gulf of Alaska" AND depth < 50;

-- 26. Retrieve earthquakes with a magnitude greater than 5 and occurred in the year 2018.

SELECT *
FROM earthquake
WHERE magnitude > 5 AND YEAR(occurred_on) = "2018";

-- 27. Select earthquakes that occurred in the Pacific Ocean region and have a magnitude greater than 6.

SELECT *
FROM earthquake
WHERE place LIKE "%Pacific Ocean%" AND magnitude > 6;

-- 28. Retrieve earthquakes with a magnitude between 5 and 6 and occurred in the southern Pacific Ocean.

SELECT *
FROM earthquake
WHERE (magnitude BETWEEN 5 AND 6) AND (place = "southern Pacific Ocean");

-- 29. Select earthquakes with a depth less than 50 km and order them by occurrence date in descending order.

SELECT *
FROM earthquake
WHERE magnitude < 50
ORDER BY occurred_on DESC;

-- 30. Retrieve earthquakes with a magnitude greater than 7 and occurred in the South Sandwich Islands region.

SELECT *
FROM earthquake
WHERE magnitude >7 AND place LIKE "%Indian Ocean%";