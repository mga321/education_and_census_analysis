-- Part 1:

-- How many public high schools are in each zip code?
-- Query:
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

-- Answer:
/*
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

-- How many high schools are in each state?
-- Query:
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
