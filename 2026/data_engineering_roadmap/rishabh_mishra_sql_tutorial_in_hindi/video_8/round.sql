-- Now if you see in the avg function it will give multiple 0's after decimal point.
-- This doesn't looks good, in the data engineering practices we would like to keep
-- the round off figures that's why we use the round off function.
SELECT ROUND(AVG(amount), 2), customer_id
FROM payment
WHERE customer_id = 101
GROUP BY customer_id;
