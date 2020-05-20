-- Part 1:

--Question 1:

-- What is the minimum, maximum, and average median household income for the nation?
-- Query 1:
-- Alter the colun data type because the money data type doesn't support the AVG()
ALTER TABLE census_statistics
ALTER COLUMN median_household_income TYPE NUMERIC;


SELECT 'minimum' x,
		MIN(median_household_income) AS y
FROM census_statistics
UNION
SELECT 'maximum',
		MAX(median_household_income)
FROM census_statistics
UNION
SELECT 'average',
		ROUND(AVG(median_household_income), 2)
FROM census_statistics;

/* Answer:
maximum median household income 250001.00
average median household income 54683.12
minimum median household income 2499.00
*/





-- Question 2: Do characteristics of the zip code area, such as median household income, influence students' performance in high school?
-- Query 1:
SELECT COUNT (DISTINCT school_id)
FROM schools;  -- There are 16623 distinct schools


SELECT COUNT(DISTINCT zip_code)
FROM schools;  -- There are only 13384 distinct zip codes in the schools table, which means only 13384 zip codes have a school


SELECT COUNT(DISTINCT schools.zip_code)
FROM school_statistics
JOIN schools
ON school_statistics.school_id = schools.school_id;  -- After we join the tables on zip code, we have the correct number of zip codes represented


SELECT schools.zip_code,
		ROUND(AVG(school_statistics.pct_proficient_math), 2),
		ROUND(AVG(school_statistics.pct_proficient_reading), 2)
FROM school_statistics
JOIN schools
ON school_statistics.school_id = schools.school_id
GROUP BY 1;  -- After getting the average scores for each zip code, we still have the correct number of zip codes represented (13384) and the average is correctly formatted


WITH scores_by_zip_code AS (
SELECT schools.zip_code,
		ROUND(AVG(school_statistics.pct_proficient_math), 2) pct_prof_math,
		ROUND(AVG(school_statistics.pct_proficient_reading), 2) pct_prof_read
FROM school_statistics
JOIN schools
ON school_statistics.school_id = schools.school_id
GROUP BY 1
)

SELECT *
FROM scores_by_zip_code;  -- Turn the previous query into a temporary table and confirm with worked with a SELECT statement


WITH scores_by_zip_code AS (
SELECT schools.zip_code,
		ROUND(AVG(school_statistics.pct_proficient_math), 2) pct_prof_math,
		ROUND(AVG(school_statistics.pct_proficient_reading), 2) pct_prof_read
FROM school_statistics
JOIN schools
ON school_statistics.school_id = schools.school_id
GROUP BY 1
),
income_brackets_by_zip_code AS (
SELECT	zip_code,
		CASE WHEN median_household_income < 50000 THEN '<$50K'
			WHEN median_household_income BETWEEN 50000 AND 100000 THEN '$50-$100K'
			WHEN median_household_income > 100000 THEN '>$100K'
			ELSE NULL END AS income_bracket
FROM census_statistics
)
SELECT *
FROM income_brackets_by_zip_code;  -- Add income brackets by zip code temporary table, this table will have records for all 33120 zip codes regardless of whether there is a shool there
