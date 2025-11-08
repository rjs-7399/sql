-- Retrieve the top 3 customers
SELECT
	first_name
FROM public.customers
LIMIT 3;

-- Retrieve the top 3 customers with the highest score
SELECT
	first_name,
	score
FROM public.customers
ORDER BY score DESC
LIMIT 3;

-- Retrieve the lowest 2 customers based on the score
SELECT
	*
FROM public.customers
ORDER BY score ASC
LIMIT 2;

-- Get the two most recent orders
SELECT
	order_id,
	order_date
FROM public.orders
ORDER BY order_date DESC
LIMIT 2;
