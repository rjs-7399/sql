-- This will calculate the total of amount from the payment table
-- We can apply filters on this one with where condition to get the
-- sum of specific field for the specific category.
SELECT SUM(amount) FROM payment;