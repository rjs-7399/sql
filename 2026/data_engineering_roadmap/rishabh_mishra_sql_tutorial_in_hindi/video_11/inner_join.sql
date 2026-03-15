-- Here we have customer and payment tables
-- customer table is having customer data
-- payment table is having payment data
-- And we need to find amount, mode of payment and payment_date where customer name is Madan.
-- So here we will simply join the customer and payment table on customer_id
-- And then we will apply the filter where customer name is Madan.
SELECT
	c.customer_id,
	first_name,
	last_name,
	amount,
	mode,
	payment_date
FROM
    customer c
INNER JOIN
    payment p
    ON c.customer_id = p.customer_id
WHERE first_name = 'Madan';
