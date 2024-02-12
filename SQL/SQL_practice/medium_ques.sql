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

SELECT
  patient_id,
  attending_doctor_id,
  diagnosis
FROM admissions
WHERE (
    patient_id % 2 <> 0
    AND attending_doctor_id IN (1, 5, 19)
  ) OR (
    attending_doctor_id LIKE '%2%'
    AND LENGTH(patient_id) = 3
  )

-- Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been attended by a doctor.

SELECT
  d.first_name,
  d.last_name,
  COUNT(a.attending_doctor_id) AS total_admissions_attended
FROM
  doctors d
JOIN
  admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY
  d.doctor_id, d.first_name, d.last_name

-- For each doctor, display their id, full name, and the first and last admission date they attended.

SELECT
  d.doctor_id,
  CONCAT(d.first_name, ' ', d.last_name) AS full_name,
  MIN(a.admission_date) AS first_admission_date,
  MAX(a.admission_date) AS last_admission_date
FROM
  doctors d
JOIN
  admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY
  d.doctor_id, full_name

  -- Display the total amount of patients for each province. Order by descending.

  SELECT
  p.province_name,
  COUNT(*) AS total_patients
FROM
  patients pat
JOIN
  province_names p ON pat.province_id = p.province_id
GROUP BY
  p.province_name
ORDER BY
  total_patients DESC

  -- For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

  SELECT
  CONCAT(p.first_name, ' ', p.last_name) AS patient_full_name,
  a.diagnosis AS admission_diagnosis,
  CONCAT(d.first_name, ' ', d.last_name) AS doctor_full_name
FROM
  patients p
JOIN
  admissions a ON p.patient_id = a.patient_id
JOIN
  doctors d ON a.attending_doctor_id = d.doctor_id

-- display the first name, last name and number of duplicate patients based on their first name and last name. Ex: A patient with an identical name can be considered a duplicate.

SELECT
  first_name,
  last_name,
  COUNT(*) AS duplicate_count
FROM
  patients
GROUP BY
  first_name, last_name
HAVING
  COUNT(*) > 1


-- Display patient's full name,height in the units feet rounded to 1 decimal,weight in the unit pounds rounded to 0 decimals,birth_date,gender non abbreviated.Convert CM to feet by dividing by 30.48.Convert KG to pounds by multiplying by 2.205.

SELECT
  CONCAT(first_name, ' ', last_name) AS full_name,
  ROUND(height / 30.48, 1) AS height_in_feet,
  ROUND(weight * 2.205, 0) AS weight_in_pounds,
  birth_date,
  CASE
    WHEN gender = 'M' THEN 'Male'
    WHEN gender = 'F' THEN 'Female'
    ELSE 'Other'
  END AS gender_non_abbreviated
FROM patients

-- Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.)

SELECT
  patient_id,
  first_name,
  last_name
FROM
  patients
WHERE
  NOT EXISTS (
    SELECT 1
    FROM admissions
    WHERE admissions.patient_id = patients.patient_id
  )