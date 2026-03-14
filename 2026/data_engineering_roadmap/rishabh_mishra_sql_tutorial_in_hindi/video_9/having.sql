-- Here first it will perform the aggregation on the data
-- And then it will add the having filter after grouping data.
-- In the having clause we can't perform operation on aggregated derived fields.
-- Like here total_amount is an aggregated derived field and we can't use it in having.
SELECT customer_id, mode, SUM(amount) as total_amount
FROM payment
GROUP BY customer_id, mode
HAVING mode = 'Credit Card'
ORDER BY customer_id;

-- Here the order of execution will be this
-- FROM first, It will first read the payment table
-- Group By second, It will apply the clauses in the order
-- HAVING third
-- Select fourth, it will select the data by applying aggregation
-- Order by
