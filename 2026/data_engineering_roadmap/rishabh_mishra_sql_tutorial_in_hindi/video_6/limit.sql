-- This will first select all the records from table
-- then it will apply order by on the entire data and
-- then it will apply the limit on it.
SELECT * FROM customers
ORDER BY score DESC
LIMIT 2;
