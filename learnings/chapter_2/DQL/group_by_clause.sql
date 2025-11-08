-- Retrieve the total score for a given country
SELECT
	country,
	SUM(score) AS total_score_per_country
FROM public.customers
GROUP BY country;

-- Select the score from customer table
-- For each name in a given country
SELECT
	first_name,
	country,
	SUM(score) AS total_score_per_country
FROM public.customers
GROUP BY
	first_name,
	country;

-- Select the score from customer table
-- For a given country, And select the first occurring alphabetical name
SELECT
	MIN(first_name),
	country,
	SUM(score) AS total_score_per_country
FROM public.customers
GROUP BY country;
