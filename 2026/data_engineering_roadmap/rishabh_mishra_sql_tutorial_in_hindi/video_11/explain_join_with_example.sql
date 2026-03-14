-- Here we have customer and payment tables
-- customer table is having customer data
-- payment table is having payment data
-- And we need to find amount, mode of payment and payment_date where customer name is Madan.
-- So here we will simply join the customer and payment table on customer_id
-- And then we will apply the filter where customer name is Madan.
CREATE TABLE customer(
	customer_id int8 PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	address_id bigint
);

INSERT INTO customer
(customer_id, first_name, last_name, address_id)
VALUES
(1, 'Mary', 'Smith', 5),
(2, 'Madan', 'Mohan', 6),
(3, 'Linda', 'Williams', 7),
(4, 'Barbara', 'Jones', 8),
(5, 'Elizabeth', 'Brown', 9);

CREATE TABLE payment(
	customer_id int8 PRIMARY KEY,
	amount bigint,
	mode VARCHAR(50),
	payment_date date
)

INSERT INTO payment
(customer_id, amount, mode, payment_date)
VALUES
(1, 60, 'Cash', '2020-09-24'),
(2, 30, 'Credit Card', '2020-04-27'),
(3, 90, 'Credit Card', '2020-07-07'),
(4, 50, 'Debit Card', '2020-02-12'),
(5, 40, 'Mobile Payment', '2020-11-20');


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
ON
c.customer_id = p.customer_id
WHERE first_name = 'Madan';
