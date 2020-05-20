-- Part 1:

--Question 1:

-- How many public high schools are in each zip code?
-- Query 1:
WITH individual_counts AS (
	SELECT COUNT(*) AS count_of_schools
	FROM schools
	GROUP BY zip_code
	ORDER BY 1 DESC
)

SELECT count_of_schools, COUNT(*)
FROM individual_counts
GROUP BY 1
ORDER BY 1;

/* Answer:
11148 zip codes have 1 school
11148 zip codes have 1 school
1621 zip codes have 2 schools
411 zip codes have 3 schools
111 zip codes have 4 schools
50 zip codes have 5 schools
18 zip codes have 6 schools
11 zip codes have 7 schools
8 zip codes have 8 schools
4 zip codes have 9 schools
1 zip code has 10 schools
1 zip code has 11 schools
*/



-- Question 2:

-- How many public high schools are in each state?
-- Query 1:
SELECT st.state_name, COUNT(sc.*) num_of_schools
FROM schools sc
JOIN states st
ON st.state_code = sc.state_code
GROUP BY 1
ORDER BY 2 DESC;

-- Answer:
/*
California has 1294 schools
Texas has 1199 schools
New York has 933 schools
Ohio has 770 schools
Illinois has 704 schools
...
...
...
Rhode Island has 48 schools
Vermont has 45 schools
Hawaii has 39 schools
District of Columbia" has 28 schools
Delaware has 28 schools
*/



-- Question 3:

-- How many public high schools are in each locale?
-- Query 1:
CREATE TABLE locales (
	locale_code		CHAR(2)		PRIMARY KEY,
	locale_type		CHAR(6),
	locale_size		CHAR(7)
);

INSERT INTO locales
VALUES (11, 'City', 'Large'),
		(12, 'City', 'Midsize'),
		(13, 'City',  'Small'),
		(21, 'Suburb', 'Large'),
		(22, 'Suburb', 'Midsize'),
		(23, 'Suburb', 'Small'),
		(31, 'Town', 'Fringe'),
		(32, 'Town', 'Distant'),
		(33, 'Town', 'Remote'),
		(41, 'Rural', 'Fringe'),
		(42, 'Rural', 'Distant'),
		(43, 'Rural', 'Remote');

-- Query 2:
SELECT l.locale_type, l.locale_size, COUNT(school_id) num_of_schools
FROM schools s
JOIN locales l
ON l.locale_code = s.locale_code
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Answer:
/*
Suburb Large has 3554 schools
Rural Distant	has 2349 schools
City Large has 2024 schools
Rural Fringe has 2004 schools
Rura Remote has 1754 schools
Town Distant has 1219 schools
City Small has 879 schools
Town Remote has 764 schools
City Midsize has 745 schools
Town Fringe has 549 schools
Suburb Midsize has 464 schools
Suburb Small has 311 schools
*/
