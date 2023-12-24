-- Show unique birth years from patients and order them by ascending.

SELECT
distinct year(birth_date)
FROM patients
order by year(birth_date) 

-- Show unique first names from the patients table which only occurs once in the list. For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.

SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name) = 1

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

SELECT
patient_id, first_name
FROM patients
WHERE first_name LIKE "s%s" AND LENGTH(first_name) >= 6

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.

SELECT
patient_id,
first_name,
last_name
FROM patients
WHERE patient_id
IN (
  select patient_id
  FROM admissions
  WHERE diagnosis = "Dementia"
)

-- Display every patient's first_name. Order the list by the length of each name and then by alphabetically.

SELECT
first_name
FROM patients
order by LENGTH(first_name), first_name

-- Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.

SELECT
(SELECT COUNT(*) FROM patients where gender = "M"),
(SELECT COUNT(*) FROM patients where gender = "F")

-- Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

SELECT
first_name,
last_name,
allergies
FROM patients
where allergies IN ( "Penicillin", "Morphine")
order by allergies, first_name, last_name

-- Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

SELECT
patient_id,
diagnosis
FROM admissions
group by
patient_id,
diagnosis
having count(*)>1

-- Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.

SELECT
city,
Count(*)
FROM patients
group by city
order by count(*) DESC, city

-- Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"

SELECT
first_name,
last_name,
"Patient"
FROM patients
UNION ALL
select
first_name,
last_name,
"Doctor"
FROM doctors

-- Show all allergies ordered by popularity. Remove NULL values from query.

SELECT
  allergies,
  COUNT(*) AS allergy_count
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY allergy_count DESC;

-- Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

SELECT
first_name,
last_name,
birth_date
FROM patients
where YEAR(birth_date) between 1970 AND 1979
order by birth_date

-- We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order. EX: SMITH,jane

SELECT
concat(UPPER(last_name), ",", LOWER(first_name) ) AS full_name
FROM patients
order by first_name DESC

-- Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

SELECT
  province_id,
  SUM(height)
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

-- Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

SELECT 
MAX(weight)-MIN(weight)
FROM patients
WHERE last_name = "Maroni"

-- Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

SELECT 
DAY(admission_date),
COUNT(*)
FROM admissions
group by DAY(admission_date)
order by COUNT(*) DESC

-- Show all columns for patient_id 542's most recent admission_date.

SELECT  *
FROM admissions
WHERE patient_id = 542
ORDER BY admission_date DESC 
LIMIT 1

-- Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
-- 1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
-- 2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

