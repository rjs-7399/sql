-- Select the value `123` as lit in the customer table with current timestamp col
SELECT
	id,
	first_name,
	country,
	score,
	'123' AS lit,
	NOW() AS current_timestamp
FROM public.customers;
