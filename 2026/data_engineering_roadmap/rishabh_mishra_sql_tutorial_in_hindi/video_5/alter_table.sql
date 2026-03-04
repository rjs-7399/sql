ALTER TABLE customer
ADD COLUMN sample varchar(500);

ALTER TABLE customer
DROP COLUMN age;

ALTER TABLE customer
ALTER COLUMN cust_name TYPE varchar(500);

SELECT * from customer;
