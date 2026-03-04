--- We can update multi-field values in the same query
UPDATE customer
set
	cust_name = 'Rutvik',
	city = 'vadodara',
	age = '28'
where
	cust_id = '4';

SELECT * FROM customer;
