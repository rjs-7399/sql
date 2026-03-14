-- This query will perform group by on two columns
-- customer_id and mode and it will calculate the sum of amount
-- for a given customer id and a mode.
-- So let's say customer_id has two modes debit and credit
-- and for both the categories they have few transactions
-- So this query will give total amount for given category for a customer_id.
SELECT customer_id, mode, SUM(amount) as total_amount
FROM payment
GROUP BY customer_id, mode
ORDER BY customer_id;
