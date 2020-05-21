-- Part 3:

--Question 1:

-- On average, do students perform better on math or reading?
-- Query 1:
WITH top_subject AS (
	SELECT CASE WHEN pct_proficient_math > pct_proficient_reading THEN 1
				ELSE 0 END AS math_greater,
			CASE WHEN pct_proficient_reading > pct_proficient_math THEN 1
				ELSE 0 END AS reading_greater,
			CASE WHEN pct_proficient_math = pct_proficient_reading THEN 1
				ELSE 0 END AS tie_scores
	FROM school_statistics
	WHERE pct_proficient_math IS NOT NULL AND pct_proficient_reading IS NOT NULL
)

SELECT ROUND((1.0 * SUM(math_greater))/COUNT(*), 4) pct_schools_with_math_greater,
		ROUND((1.0 * SUM(reading_greater))/COUNT(*), 4) pct_schools_with_reading_greater,
		ROUND((1.0 * SUM(tie_scores))/COUNT(*), 4) pct_schools_with_tied_scores
FROM top_subject;

/*
Answer:
percent of schools with greater math scores = 18.23%
percent of schools with greater reading scores = 67.75%
percent of schools with tied scores = 14.01%
*/





-- Question 2:

-- In what states do students score better on math? How about reading?
-- Query 1:
-- Part 3:

--Question 1:

-- On average, do students perform better on math or reading?
-- Query 1:
WITH top_subject AS (
	SELECT CASE WHEN pct_proficient_math > pct_proficient_reading THEN 1
				ELSE 0 END AS math_greater,
			CASE WHEN pct_proficient_reading > pct_proficient_math THEN 1
				ELSE 0 END AS reading_greater,
			CASE WHEN pct_proficient_math = pct_proficient_reading THEN 1
				ELSE 0 END AS tie_scores
	FROM school_statistics
	WHERE pct_proficient_math IS NOT NULL AND pct_proficient_reading IS NOT NULL
)

SELECT ROUND((1.0 * SUM(math_greater))/COUNT(*), 4) pct_schools_with_math_greater,
		ROUND((1.0 * SUM(reading_greater))/COUNT(*), 4) pct_schools_with_reading_greater,
		ROUND((1.0 * SUM(tie_scores))/COUNT(*), 4) pct_schools_with_tied_scores
FROM top_subject;

/*
Answer:
percent of schools with greater math scores = 18.23%
percent of schools with greater reading scores = 67.75%
percent of schools with tied scores = 14.01%
*/





-- Question 2:

-- In what states do students score better on math? How about reading?
-- Query 1:
WITH top_subject AS (
	SELECT ss.school_id school_id,
			sc.state_code state_code,
			CASE WHEN ss.pct_proficient_math > ss.pct_proficient_reading THEN 1
				ELSE 0 END AS math_greater,
			CASE WHEN ss.pct_proficient_reading > ss.pct_proficient_math THEN 1
				ELSE 0 END AS reading_greater,
			CASE WHEN ss.pct_proficient_math = ss.pct_proficient_reading THEN 1
				ELSE 0 END AS tie_scores
	FROM school_statistics ss
	JOIN schools sc
	ON ss.school_id = sc.school_id
	WHERE ss.pct_proficient_math IS NOT NULL AND ss.pct_proficient_reading IS NOT NULL
)

SELECT state_code,
		ROUND((1.0 * SUM(math_greater))/COUNT(*), 4) pct_schools_with_math_greater,
		ROUND((1.0 * SUM(reading_greater))/COUNT(*), 4) pct_schools_with_reading_greater,
		ROUND((1.0 * SUM(tie_scores))/COUNT(*), 4) pct_schools_with_tied_scores
FROM top_subject
GROUP BY 1
ORDER BY 1;





-- Question 3:
 -- What is the average proficiency on state assessment exams for each zip code?
 -- How do they compare to other zip codes in the same state?
SELECT sc.zip_code,
				sc.state_code,
				ROUND(AVG(pct_proficient_math), 2) avg_math_proficiency,
				ROUND(AVG(pct_proficient_reading), 2) avg_reading_proficiency
FROM school_statistics ss
RIGHT JOIN schools sc
ON ss.school_id = sc.school_id
GROUP BY 2, 1;
