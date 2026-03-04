--- With this statement we can insert the values in existing table.
--- Here the field names are case sensitive.
--- number of values in each bracket should match the number of fields defined.
INSERT INTO customer
(cust_id, cust_name, age, city, salary)
VALUES
(1, 'Sam', 25, 'Delhi', 9000),
(2, 'Ram', 37, 'Bangalore', 11000),
(3, 'Pam', 41, 'Mumbai', 6000),
(4, 'Jam', 52, 'Pune', 10000);


SELECT * FROM customer;