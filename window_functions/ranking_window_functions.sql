/* Ranking
- Sorting the data is always a first thing in the ranking functions
- Type of rankings
	- Integer ranking: Here it assigns rank to all the rows having numbers in ascending order. Here the rank belongs to [0, n]
		- ROW_NUMBER()
		- RANK()
		- DENSE_RANK()
		- NTILE()
	- Percentage based ranking: Here it assigns percentage based ranks to each rows. Here the rank belongs to [0,1]
		- CUME_DIST()
		- PERCENT_RANK()

- Here is the window definition
- RANK() OVER(PARTITION BY productid ORDER BY Sales)
- Here expression is not required in the function, partition by is optional, order by is required, frame is not allowed.
- Here NTILE() only supports expression. All the other functions do not support expression.
*/


/* Row_NUMBER()
- Assigns unique number to each row.
- It doesn't handles ties. Which means if two rows shares the same value, they will not share the same rank.
- Example
100 - 1
80  - 2
80  - 3
50  - 4
20  - 5
*/


select * from orders

-- Rank the orders based on their sales from highest to lowest.
-- So here if we want the unique ranks for each rows then we use ROW_NUMBER().
-- If we want to skip the rank after the ties then we use RANK().
-- If we want don't want to skip the rank after the ties then we use DENSE_RANK().
-- ROW_NUMBER()
-- In simple terms ROW_NUMBER assigns unique rank to each row.
-- RANK handles the ties.
-- DENSE_RANK doesn't handle the ties.
select
	orderid,
	sales,
	ROW_NUMBER() OVER(ORDER BY sales) as row_unique_order_rank
from
	orders

-- RANK()
select
	orderid,
	sales,
	RANK() OVER(ORDER BY sales) as rank_skip_ties_order_rank
from
	orders

-- DENSE_RANK()
select
	orderid,
	sales,
	DENSE_RANK() OVER(ORDER BY sales) as dense_rank_dont_skip_ties_order_rank
from
	orders

select * from orders

-- Find the top highest sales for each product
SELECT * FROM
(
	select
		orderid,
		productid,
		sales,
		ROW_NUMBER() OVER(PARTITION BY productid ORDER BY sales DESC) as rank_by_sales
	from
		orders
)
WHERE rank_by_sales = 1

-- Find the lowest 2 customers based on their total sales
SELECT customerid, total_sales_per_customer, rank_as_per_sales
FROM (
    SELECT
        customerid,
        SUM(sales) AS total_sales_per_customer,
        ROW_NUMBER() OVER (ORDER BY SUM(sales) DESC) AS rank_as_per_sales
    FROM orders
    GROUP BY customerid
) ranked
WHERE rank_as_per_sales <= 2;

CREATE TABLE ordersarchive (
    OrderID INT,
    ProductID INT,
    CustomerID INT,
    SalesPersonID INT,
    OrderDate DATE,
    ShipDate DATE,
    OrderStatus VARCHAR(50),
    ShipAddress VARCHAR(100),
    BillAddress VARCHAR(100),
    Quantity INT,
    Sales DECIMAL(10, 2),
    CreationTime TIMESTAMP
);

drop table ordersarchive
INSERT INTO ordersarchive VALUES
(1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56'),
(2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04'),
(3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08'),
(4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', NULL, 2, 60, '2024-04-20 05:50:33'),
(4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', NULL, 2, 60, '2024-04-20 14:50:33'),
(5, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41'),
(6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57'),
(6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05'),
(6, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55'),
(7, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15');

-- Assign unique ids to the rows of the ordersarchive
select * from ordersarchive

select
	ROW_NUMBER() OVER(ORDER BY orderid, productid),
	*
from
	ordersarchive

-- Find distinct rows in order archive table
select * from
(
select
ROW_NUMBER() OVER(PARTITION BY orderid ORDER BY creationtime desc) rn,
* from ordersarchive
)
where rn = 1

-- Find duplicates in order archive table
select * from
(
select
ROW_NUMBER() OVER(PARTITION BY orderid ORDER BY creationtime desc) rn,
* from ordersarchive
)
where rn > 1

/* NTILE
- Divides the rows into specified number of equal groups(buckets)
- Bucket size = number of rows / number of buckets
- When we are defining even size of bucket then it perfectly fits.
- But when we have odd size then according to the rule larger groups comes in the first bucket and rest comes in the following buckets.
- In data engineering we use NTILE for equalizing load processing.
- Data segmentation: Divides a dataset into distinct subsets based on certain criteria.
*/

-- Divide the data into specific range of buckets
select
	orderid,
	sales,
	NTILE(1) OVER (ORDER BY sales DESC) one_bucket,
	NTILE(2) OVER (ORDER BY sales DESC) two_bucket,
	NTILE(3) OVER (ORDER BY sales DESC) three_bucket
from orders

select * from orders

-- Divide the data into HIGH, MEDIUM and LOW bucket range.
select
	*,
	CASE
		WHEN bucket = '1' THEN 'HIGH'
		WHEN bucket = '2' THEN 'MEDIUM'
		WHEN bucket = '3' THEN 'LOW'
	END sales_bucket_segments
	FROM
	(
		select
			orderid,
			sales,
			NTILE(3) OVER(ORDER BY sales desc) bucket
		from orders
	)