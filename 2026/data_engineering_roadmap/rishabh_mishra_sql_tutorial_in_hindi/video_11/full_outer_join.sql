-- Here we have customer and payment tables
-- customer table is having customer data
-- payment table is having payment data
-- We need to perform full outer join between customer and payment
-- As we want the data available in both the tables
SELECT
	c.customer_id AS customer_table_customer_id,
	p.customer_id AS payment_table_customer_id,
	first_name,
	last_name,
	address_id,
	amount,
	mode,
	payment_date
FROM
customer AS c
FULL OUTER JOIN
payment AS p
ON c.customer_id = p.customer_id;