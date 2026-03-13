-- Unlike python arrays, SQL considers 1 based indexing.
-- Array supports 0 based indexing
SELECT first_name, SUBSTRING(first_name, 1, 3) FROM customer;