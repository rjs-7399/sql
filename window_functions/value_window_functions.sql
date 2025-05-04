/*
- LAG: This function is used to access the value of previous row in current row
- LEAD: This function is used to access the value of next row in current row
- FIRST_VALUE: This function is used to access the value of first row in the current row
- LAST_VALUE: This function is used to access the value of last row in the current row

- LEAD: Supports expr, offset, default
- LAG: Supports expr, offset, default
- FIRST_VALUE: expr
- LAST_VALUE: expr
- Partition is optional for all the functions.
- Order is required for all the functions.
- Frame is not allowed for LEAD and LAG. It is optional for first_value. It can be used in LAST_VALUE.
*/

select * from orders;

-- Analyze the month-over-month performance by finding percentage change in sales between the current and previous month.
select
	*,
	currentmonthsales - previousmonthsales as mom_change,
	(currentmonthsales - previousmonthsales)/previousmonthsales * 100 as percentage_change
from
(
select
	EXTRACT(MONTH FROM orderdate) as ordermonth,
	SUM(sales) as currentmonthsales,
	LAG(SUM(sales)) OVER (ORDER BY EXTRACT(MONTH FROM orderdate)) previousmonthsales
from
	orders
group by
	EXTRACT(MONTH FROM orderdate)
)

-- Analyze customer loyalty by ranking customers based on the average number of days between orders

Select * from orders

SELECT
	customerid,
	ROUND(AVG(daysuntilnextorder), 2) avgDays,
	RANK() OVER(ORDER BY AVG(daysuntilnextorder)) RankAvg
FROM (
	SELECT
	    orderid,
	    customerid,
	    orderdate,
	    LEAD(orderdate) OVER(PARTITION BY customerid ORDER BY orderdate) AS nextorder,
	    (LEAD(orderdate) OVER(PARTITION BY customerid ORDER BY orderdate) - orderdate) AS daysuntilnextorder
	FROM
	    orders
	ORDER BY
	    customerid,
	    orderdate
)
group by
	customerid