--- Now if we want to create the table then we can expand the db in the pgadmin.
--- Then we can expand the schemas, Then we will find the tables.
--- So here in the query tool we can write the sql query to create the table.

CREATE TABLE customer (
	cust_id int8 PRIMARY KEY,
	cust_name varchar(50) NOT NULL,
	age int NOT NULL,
	city char(50),
	salary numeric
);

SELECT * FROM customer;

-- Here we have only created the table, we haven't inserted the data yet.
-- So if we select the fields from the table then it will show the column information not the data.
