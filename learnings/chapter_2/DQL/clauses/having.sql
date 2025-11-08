-- Select the score from customer table
-- For a given country, And select the first occurring alphabetical name
SELECT
	country,
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM public.customers
GROUP BY country
HAVING SUM(score) > 800;

-- Find the average score for each country
-- considering only customers with a score not equal to 0
SELECT
	country,
	ROUND(AVG(score), 2) AS avg_score
FROM public.customers
WHERE score <> 0
GROUP BY country
HAVING AVG(score) > 430;
