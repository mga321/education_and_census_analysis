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
