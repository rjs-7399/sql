-- Here we have customer and payment tables
-- customer table is having customer data
-- payment table is having payment data
-- We need to perform left join between customer and payment
-- So that it must reflect all the data from customer.
SELECT
	c.customer_id,
	first_name,
	last_name,
	address_id,
	amount,
	mode,
	payment_date
FROM
    customer AS c
LEFT JOIN
    payment AS p
    ON c.customer_id = p.customer_id;
