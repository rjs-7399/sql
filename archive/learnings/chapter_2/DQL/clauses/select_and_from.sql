-- Retrieve all the data from customers table
SELECT *
FROM public.customers;

-- Retrieve all the data from orders table
SELECT *
FROM public.orders;

-- Retrieve customer's name, country and score
SELECT
	first_name,
	country,
	score
FROM public.customers;
