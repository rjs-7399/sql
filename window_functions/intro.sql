/* What is window function
- It allows us to perform the aggregation on a specific subset of the data, without losing the level of details of rows.
*/

/* Difference between window and group by
- Groupby performs the aggregation over the categories so number of rows in the result will be less then the number of rows in the original table.
- But window performs the aggregation at each row level. so each category in original table will have the aggregated value in the result table.
- So in window aggregation we are doing row level calculations.
- For simple aggregations we choose group by.
- But if we want to perform aggregation with some level of detail we do window aggregations.
*/

/* Function difference between group by and window
- Group By
	- Aggregate
		- COUNT
		- SUM
		- AVG
		- MIN
		- MAX

- WINDOW
	- Aggregate
		- COUNT
		- SUM
		- AVG
		- MIN
		- MAX
	- Rank
		- ROW_NUMBER()
		- RANK()
		- DENSE_RANK()
		- CUME_DIST()
		- PERCENT_RANK()
		- NTILE(n)
	- Value
		- LEAD(expr, offset, default)
		- LAG(expr, offset, default)
		- FIRST_VALUE(expr)
*/

/*
- For simple analysis we use group by.
- But for more complicated analytical scenarios we use window aggregations.
*/

-- Get the total sales from orders table:
SELECT * from orders;

-- Get the total sales from orders table for each customer:
SELECT customerid, SUM(sales) FROM public.orders GROUP BY customerid;


-- Get the total sales from orders table for each product:
SELECT productid, SUM(sales) FROM public.orders GROUP BY productid ORDER BY productid;


-- Find the total sales for each product additionally provide details such order id, order date.
/*
- here we can think of adding all the columns in selection and in the group by condition but it won't actually work.
- it will actually consider unnecessary fields in group by conditions. So we need to go for the window aggregations in this case.
*/
-- Here we defined the window function over the productid and performed the aggregation function so we can select the multiple fields.
SELECT
	orderid,
	orderdate,
	productid,
	SUM(Sales) OVER(PARTITION BY productid) TotalSalesByProducts
FROM
	orders

SELECT * from orders

/*
- Window syntax
- First we define the function to be performed over the window definition.
- Inside the function we define the field on which we want to perform the function.
- In the window definition we use clause that can be partition, order or frame.
*/



/*
- PARTITION BY clause
- It divides entire dataset into partitions.
- So if we don't define the partition by field then the calculation will be performed over all the rows.
- In the example above the productid is used as a partition by field so the calculations were performed on the specific partition of it.
- If we don't define anything then calculation will happen over the entire partition.
*/


-- Find the total sales across all orders, additionally provide details such as order id and order date.
-- Here the question asks about getting total salse overall so we don't need to define the window here.
select
	orderid,
	orderdate,
	sum(sales) over() totalsales
FROM
	orders

-- Find the total sales for each product, additionally provide the details such as order id and order date.
select
	orderid,
	orderdate,
	productid,
	sum(sales) over(partition by productid) totalsales
from
	orders

select * from orders

-- Find the total sales across all the orders, and for each product, additionally provide the details such as order id and order date.
select
	orderid,
	orderdate,
	productid,
	sales,
	sum(sales) over() totalSalesOverall,
	sum(sales) over(partition by productid) totalSalesByProduct
from
	orders


-- Find the total sales for each combination of product and order status
select
	orderid,
	productid,
	orderstatus,
	sales,
	sum(sales) over() totalSalesOverall,
	sum(sales) over(partition by productid) totalSalesByProduct,
	sum(sales) over(partition by productid, orderstatus) salesByProductAndStatus
from
	orders


/*
- ORDER BY clause
- This clause sorts the data within a window, ascending or descending.
- Whenever we need to apply RANK or Value, then the order by clause is must.
- Because we are calculating the RANK for particular conditions.
*/

select * from orders

-- Rank each order based on their sales from highest to lowest. Additionally provide the details like orderid and orderdate
select
	orderid,
	orderdate,
	sales,
	RANK() OVER(ORDER BY sales desc) rank
from
	orders

/*
- Frame clause
- It is an another window inside the defined window.
- Frame clause can only be used with order by clause only.
- Here we have these things:
- Frame Types: ROWS, RANGE
- Frame Boundary(lower value): CURRENT ROW, N PRECEDING, UNBOUNDED PRECEDING
- Frame Boundary(higher value): CURRENT ROW, N FOLLOWING, UNBOUNDED FOLLOWING
- Lower value must be before higher boundary.
- Here N preceeding and N following means selected boundaries.
- UNBOUNDED preceeding and UNBOUNDED following means range without any limit.
*/

select * from orders;
-- Get the total sales for a given order status considering two following row count.
SELECT
	orderid,
	orderdate,
	orderstatus,
	sales,
	SUM(sales) OVER(
		PARTITION BY orderstatus
		ORDER BY orderdate
		ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
	) TotalSales
FROM
	Orders