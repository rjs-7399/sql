CREATE TABLE payment(
	customer_id int8 PRIMARY KEY,
	amount bigint,
	mode VARCHAR(50),
	payment_date date
);
