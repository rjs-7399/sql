-- Update the score of customer 6 from NULL to 0
UPDATE customers
SET score = 0
WHERE id = 6;

-- Change the score of customer 10 from NULL to 0 and update the country to 'UK'
UPDATE customers
SET
	score = 0,
	country = 'UK'
WHERE id = 10;

-- Update all customers with a NULL score by setting their score to 0
UPDATE customers
SET
	score = 0
WHERE
	score IS NULL;
