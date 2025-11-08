-- Retrieve all the customers and sort the results by the highest score first
SELECT *
FROM public.customers
ORDER BY score DESC;

-- Retrieve all the customers and sort the results by the lowest score first
SELECT *
FROM public.customers
ORDER BY score ASC;

-- Retrieve all the customers and sort the results
-- by the country and then by the highest score
SELECT *
FROM public.customers
ORDER BY
	country ASC,
	score DESC;
