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


WITH scores_by_zip_code AS (  -- Create a temporary table with the average score for each zip code
SELECT schools.zip_code,
		ROUND(AVG(school_statistics.pct_proficient_math), 2) pct_prof_math,
		ROUND(AVG(school_statistics.pct_proficient_reading), 2) pct_prof_read
FROM school_statistics
JOIN schools
ON school_statistics.school_id = schools.school_id
GROUP BY 1
),
income_brackets_by_zip_code AS (  -- Create a temporary table with the income bracket for each zip code
SELECT	zip_code,
		CASE WHEN median_household_income < 50000 THEN '<$50K'
			WHEN median_household_income BETWEEN 50000 AND 100000 THEN '$50-$100K'
			WHEN median_household_income > 100000 THEN '>$100K'
			ELSE NULL END AS income_bracket
FROM census_statistics
)
SELECT income_brackets_by_zip_code.income_bracket,  -- Select the columns needed in the final table
		ROUND(AVG(scores_by_zip_code.pct_prof_math), 2) avg_pct_prof_math,
		ROUND(AVG(scores_by_zip_code.pct_prof_read), 2) avg_pct_prof_math
FROM income_brackets_by_zip_code
JOIN scores_by_zip_code
ON income_brackets_by_zip_code.zip_code = scores_by_zip_code.zip_code  -- Join the two temporary tables together
WHERE income_brackets_by_zip_code.income_bracket IS NOT NULL  -- Remove all records where we had no income data
GROUP BY 1;
 /*
Answer:
Yes, household income does appear to play a role in academic performance. As income bracket increases, math and reading proficiencies increase.
>$100K average proficiencies - math 67.39 and reading 76.81
$50-$100K average proficiencies - math 53.03 and reading 64.54
<$50K average proficiencies - math 43.97 and reading 55.47
 */
