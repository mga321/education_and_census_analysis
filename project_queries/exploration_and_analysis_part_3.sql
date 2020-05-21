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
