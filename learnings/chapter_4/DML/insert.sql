-- Insert records in the customers table
INSERT INTO customers
VALUES
	(6, 'Anna', 'USA', NULL),
	(7, 'Sam', NULL, 100);

-- Insert values for two fields: id, first_name only in the customers table
INSERT INTO customers
VALUES
	(8, 'Andreas'),
	(9, 'Sahra');

INSERT INTO customers
VALUES
	(10, 'John');


-- Insert data from customers into persons, In auto mode
INSERT INTO persons
SELECT
	id,
	first_name,
	NULL,
	'Unknown'
from customers;
