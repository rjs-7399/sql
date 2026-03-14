-- First this will take the distinct modes from the payment table
-- And then it will count the total number of modes of it.
SELECT COUNT(DISTINCT(mode)) FROM payment;

-- When we simply do count(*) then it will give total number of rows
SELECT COUNT(*) FROM payment;
