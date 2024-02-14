-- SELECT name, age, gender, blood_type
-- FROM healthcare_dataset
-- WHERE medical_condition IN (
-- SELECT
-- 	medical_condition
-- FROM healthcare_dataset
-- GROUP BY medical_condition
-- HAVING COUNT(*) < 1700
-- );

-- Subquery to get medical conditions with counts less than 1700
SELECT name, age, gender, blood_type, medical_condition
FROM healthcare_dataset
WHERE medical_condition IN (
    SELECT medical_condition
    FROM (
        SELECT medical_condition, COUNT(*) AS condition_count
        FROM healthcare_dataset
        GROUP BY medical_condition
    ) AS subquery
    WHERE condition_count < 1700
)
ORDER BY medical_condition;