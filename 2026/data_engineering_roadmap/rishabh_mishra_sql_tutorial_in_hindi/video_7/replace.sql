-- This replace statement will iterate through all the records in the table and
-- It will search the given keyword wherever it is written and it will replace it with the new one
SELECT first_name, REPLACE(first_name, 'Mary', 'New Name') AS temp_name FROM customer;
