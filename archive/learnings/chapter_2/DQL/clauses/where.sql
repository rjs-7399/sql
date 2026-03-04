-- Retrieve customer's name, country and score where the score >= 500
SELECT
	first_name,
	country,
	score
FROM public.customers
WHERE score >= 500;

-- Retrieve customer's name, country and score where the score != 0
SELECT
	first_name,
	country,
	score
FROM public.customers
WHERE score <> 0;

-- Retrieve customer's name, where the country is Germany
SELECT
	first_name,
	country,
	score
FROM public.customers
WHERE country = 'Germany';
