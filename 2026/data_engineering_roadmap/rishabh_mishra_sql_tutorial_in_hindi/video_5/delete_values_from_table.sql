-- We must specify the key for which we want to perform deletion.
-- Otherwise it will delete the whole data from the table.

DELETE FROM customer where cust_id = 2;
SELECT * FROM customer;
