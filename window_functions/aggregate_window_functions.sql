select * from products

/* Aggregate functions
- Aggregate
	- COUNT(expr) - all datatype
	- SUM(expr)   - only numeric
	- AVG(expr)   - only numeric
	- MIN(expr)   - only numeric
	- MAX(expr)   - only numeric
- For all the functions partition by, order by and frame all the clause are optional.
*/

/* COUNT Function
- It will return the total number of rows in each window
- Here in the count function if we define the field name then it will ignore the cells with NULL values.
- But if we use * then it will consider the NULL value too in the counting.
*/

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    ProductID INTEGER NOT NULL,
    Product VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, Product, Category, Price) VALUES
(101, 'Bottle', 'Accessories', 10),
(102, 'Tire', 'Accessories', 15),
(103, 'Socks', 'Clothing', 20),
(104, 'Caps', 'Clothing', 25),
(105, 'Gloves', 'Clothing', 30),
(106, 'Helmet', NULL, 45),           -- NULL Category
(107, 'Water Bottle', 'Accessories', NULL),  -- NULL Price
(108, NULL, 'Equipment', 50),        -- NULL Product name
(109, 'Jersey', 'Clothing', NULL);   -- NULL Price

select * from orders;

-- Find the total number of orders
select count(orderid) as order_count from orders;

-- Find the total number of orders, additionally provide orderid and orderdate
SELECT
	orderid,
	orderdate,
	COUNT(orderid) OVER() as order_count_total
FROM
	orders

-- Find the total orders for each customers
SELECT
	customerid,
	orderid,
	orderdate,
	COUNT(orderid) OVER(PARTITION BY customerid) as order_count_by_customers
FROM
	orders

CREATE TABLE customers (
    -- Auto-incrementing ID is included but not used for CustomerID
    id SERIAL,
    -- CustomerID is a separate integer field as shown in your data
    CustomerID INTEGER NOT NULL,
    -- Text fields for names with reasonable length limits
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    -- Country as text field
    Country VARCHAR(100),
    -- Score as integer since all values appear to be whole numbers
    Score INTEGER,
    -- Making CustomerID the primary key since it appears to be the unique identifier
    PRIMARY KEY (CustomerID)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES
(1, 'Jossef', 'Goldberg', 'Germany', 350),
(2, 'Kevin', 'Brown', 'USA', 900),
(3, 'Mary', NULL, 'USA', 750),  -- NULL in LastName field for Mary
(4, 'Mark', 'Schwarz', 'Germany', 500),
(5, 'Anna', 'Adams', 'USA', NULL);

select * from customers

-- Find the total number of customers, additionally provide all customer details
select
	customerid,
	firstname,
	lastname,
	country,
	score,
	count(customerid) OVER() as totalCustomers
from customers

-- Find total number of scores for all customers
select
	customerid,
	count(score) OVER() as score_count_by_customer
from customers


select * from orders

select
	orderid,
	productid,
	count(productid) OVER(PARTITION BY productid),
	count(customerid) OVER(PARTITION BY customerid),
	count(salespersonid) OVER(PARTITION BY salespersonid)
from
	orders

-- Check whether the table orders contains any duplicates
SELECT
	orderid,
	COUNT(*) OVER (PARTITION BY orderid) CheckPK
FROM
	orders


CREATE TABLE ordersArchive (
    OrderID INTEGER PRIMARY KEY,
    ProductID INTEGER NOT NULL,
    CustomerID INTEGER NOT NULL,
    SalesPersonID INTEGER NOT NULL,
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    OrderStatus VARCHAR(50),
    ShipAddress VARCHAR(255),
    BillAddress VARCHAR(255),
    Quantity INTEGER,
    Sales DECIMAL(10, 2),
    CreationTime TIMESTAMP
);


INSERT INTO ordersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES
(1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56'),
(2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04'),
(3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08'),
(4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', NULL, 2, 60, '2024-04-20 05:50:33'),
(5, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', NULL, 2, 60, '2024-04-20 14:50:33'),
(6, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41'),
(7, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57'),
(8, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05'),
(9, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55'),
(10, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15');

-- Check primary key in the ordersArchive
select
	orderid,
	count(*) OVER(PARTITION BY orderid) CheckPK
from
	ordersArchive

select * from orders

-- Find the total sales across all orders and the total sales for each product. Also provide details like order id and order date.
select
	orderid,
	orderdate,
	SUM(sales) OVER() AS total_sales,
	SUM(sales) OVER(PARTITION BY productid) AS sum_of_sales_over_product
FROM
	orders

-- Find the percentage contribution of each product's sales to the total sales
SELECT
	orderid,
	sales,
	SUM(sales) OVER() AS total_sales,
	ROUND ((sales / SUM(sales) OVER() * 100), 2) AS contribution
FROM
	orders


-- Find the average sales across all orders, and the average sales for each product. Also provide details like orderid and orderdate.
SELECT
	orderid,
	orderdate,
	ROUND (AVG(sales) OVER(), 2) as overall_avg_sales,
	ROUND (AVG(sales) OVER(PARTITION BY productid), 2) as avg_sales_per_product
FROM
	orders

select * from customers

-- Find the average scores of customers, Also provide details such as customerid and lastname
SELECT
	customerid,
	lastname,
	score,
	ROUND (AVG(score) OVER(),2) as avg_score
FROM
	customers

-- Find all the orders where avg sales are higher than the average sales across all orders.

SELECT * FROM
(
	SELECT
		orderid,
		orderdate,
		sales,
		ROUND (AVG(sales) OVER(), 2) as overall_avg_sales
	FROM
		orders
) s
WHERE s.sales > s.overall_avg_sales


-- Find the highest and lowest sales across all orders, and the highest and lowest sales for each product, Also provide details like orderid and order date
select * from orders

SELECT
	orderid,
	orderdate,
	MAX(sales) OVER() as overall_max_sales,
	MIN(sales) OVER() as overall_min_sales,
	MAX(sales) OVER(PARTITION BY productid) as max_sales_per_product,
	MIN(sales) OVER(PARTITION BY productid) as min_sales_per_product
FROM
	orders


CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Department VARCHAR(50),
    BirthDate DATE,
    Gender CHAR(1),
    Salary NUMERIC(10, 2),
    ManagerID INTEGER
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES
(1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
(2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
(3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
(4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
(5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);

-- Find the employee name earning highest salary
select employeeid, firstname, lastname
from
(
	select
		employeeid,
		firstname,
		lastname,
		salary,
		MAX(salary) OVER() as max_salary
	from
		employees
) e
where e.salary = e.max_salary

-- Calculate the deviation of each sale from both the minimum and maximum sales amounts.
SELECT
	orderid,
	orderdate,
	sales,
	overall_max_sales,
	overall_min_sales,
	(overall_max_sales - sales) as deviation_of_sales_from_max_sales,
	(sales - overall_min_sales) as deviation_of_sales_from_min_sales
FROM
(
	SELECT
		orderid,
		orderdate,
		sales,
		MAX(sales) OVER() as overall_max_sales,
		MIN(sales) OVER() as overall_min_sales,
		MAX(sales) OVER(PARTITION BY productid) as max_sales_per_product,
		MIN(sales) OVER(PARTITION BY productid) as min_sales_per_product
	FROM
		orders
) orders

/*
- Running & Rolling
- This is useful for tracking current sales with target sales.
- Providing insights into historical patterns.
- They aggregate sequence of members and the aggregation is updated each time a new member is added.
- This is analysis over time.
- Running total aggregate all values from the beginning to the current point without dropping off older data.
- Rolling total aggregate all values within the fixed time window (30 days, 60 days). As the new data is added, the oldest data point will be dropped.
- For these two functions we will be using FRAME clause, and for using FRAME clause we must use the ORDER BY clause.
- If we define the ORDER BY clause without defining specific FRAME then by default it will take unbounded preceeding upto current point.
- Whenever the question of moving average is asked then this running and rolling function works.
*/

select * from orders;

-- Calculate moving average of sales for each product over the time
select
	orderid,
	productid,
	orderdate,
	sales,
	ROUND(AVG(sales) OVER(PARTITION BY productid), 2) as avg_by_product,
	ROUND(AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate), 2) as moving_avg_by_product
FROM
	orders;

-- Calculate moving average of sales for each product over time, including only the next order.
select
	orderid,
	productid,
	orderdate,
	sales,
	ROUND(AVG(sales) OVER(PARTITION BY productid), 2) as avg_by_product,
	ROUND(AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate), 2) as moving_avg_by_product,
	ROUND(AVG(sales)
		OVER(
			PARTITION BY productid
			ORDER BY orderdate
			ROWS BETWEEN 0 PRECEDING AND 1 FOLLOWING
		),
	2) as rolling_avg_by_product
FROM
	orders;