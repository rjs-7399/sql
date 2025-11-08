# 🧾 Understanding SQL Query Clauses

When we need to **retrieve data from a database**, we use the **`SELECT` statement** along with various **clauses** to define what and how to fetch the data.

* The **SELECT statement** is executed against the database as a **query**, which the database then processes.
* Once processed, the **results are returned in a tabular form** (rows and columns).
* Every SQL query can include different **components**, known as **clauses**, each serving a specific purpose.



## 🔍 Common SQL Clauses

Here are the most commonly used clauses you’ll encounter while writing SQL queries:

* **`SELECT`** — Specifies the columns to retrieve.
* **`DISTINCT`** — Removes duplicate records from the result set.
* **`TOP`** — Limits the number of rows returned.
* **`FROM`** — Defines the table(s) from which to fetch data.
* **`JOIN`** — Combines rows from two or more tables based on related columns.
* **`WHERE`** — Filters records based on specified conditions.
* **`GROUP BY`** — Groups rows that have the same values in specified columns.
* **`HAVING`** — Filters groups based on conditions (like WHERE, but for groups).
* **`ORDER BY`** — Sorts the results in ascending or descending order.


### 🧩 SELECT & FROM

* We always run the **SELECT statement** together with the **FROM clause** to fetch data from a database.
* The **FROM clause** specifies the table name from which we want to retrieve the data, and using a **`*` (star)** means selecting **all fields** from that table.
* For example:

  ```sql
  SELECT * FROM salesdb.public.orders;
  ```

  This query fetches all the fields from the `orders` table inside the `public` schema of the `salesdb` database.


**Order of Execution:**

1. **FROM clause** executes first — it accesses the table and retrieves all the data.
2. **SELECT clause** executes next — it picks the required columns based on what’s defined in the select list.

* If we write `SELECT *`, it will return **all columns**.
* If we specify **comma-separated fields**, it will return **only those specific columns**, in the given order.

So, the **execution order** is:
➡️ **FROM → SELECT**

* The select statement with * selects all fields.
* If we want to select specific fields, the FROM clause still retrieves all data, and SELECT filters only the required columns.


### 🔎 WHERE

* **WHERE clause** applies a filter based on conditions.
* **Execution flow:**

  * FROM clause retrieves the entire data.
  * SELECT clause selects specific fields.
  * WHERE clause filters the data based on conditions.


### 📊 ORDER BY

* **ORDER BY clause** sorts your data.
* **Sorting characteristics:**

  * Ascending (`ASC`) or Descending (`DESC`).
  * Field(s) to sort on.
* If not specified, sorting defaults to ascending.
* Execution flow:

  * FROM → SELECT → ORDER BY
* This sorts filtered data after selection.


### 🔁 Nested ORDER BY

* We can apply **ORDER BY** on multiple columns.
* Example: sort first by `country`, then by `score`.
* Execution flow:

  * FROM → SELECT → ORDER BY (field1) → ORDER BY (field2)
* This allows secondary sorting when values of the first field are identical.


### 🧮 GROUP BY

* Appears between **WHERE** and **ORDER BY** in the SQL flow.
* Used for **aggregations** (SUM, COUNT, AVG, etc.).
* **Execution flow:**

  * FROM → GROUP BY → aggregation → SELECT → ORDER BY
* **Key points:**

  * The grouped field appears once in the result.
  * Other fields must use aggregation functions.
  * Use **alias** for aggregated columns (`AS column_name`).
  * Every column in SELECT (except aggregate fields) must appear in GROUP BY.
  * Either apply aggregation or include the field in GROUP BY.


### 🧱 HAVING

* Comes **after GROUP BY** and **before ORDER BY**.
* Used to **filter groups**, not individual rows.
* **Execution flow:**

  * FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
* **Key differences between WHERE and HAVING:**

  * WHERE filters **before** grouping.
  * HAVING filters **after** grouping.
* **Notes:**

  * You can’t use column aliases in HAVING because aliases are resolved after SELECT.
  * To filter grouped results, use HAVING instead of WHERE.
  * Example use case: filtering groups where SUM(col) > value.


### 🧩 DISTINCT

* Removes **duplicate rows** and ensures unique values.
* **Execution flow:**

  * FROM → SELECT → DISTINCT
* **Notes:**

  * It applies to the selected fields only.
  * Avoid using DISTINCT unnecessarily — it’s computationally expensive.
  * If your data is already unique, skip DISTINCT.


### 🎯 TOP / LIMIT

* Restricts **number of rows returned** in the result.
* Returns the **first N records** from the result set.
* **Execution flow:**

  * FROM → SELECT → LIMIT
* **Notes:**

  * This is a **row-level filter**, not a condition-based filter.
  * It only applies after all other operations are completed.
  * Example:

    ```sql
    SELECT * FROM orders LIMIT 10;
    ```


### ⚙️ Coding Order vs Execution Order

```sql
SELECT DISTINCT
  col_1,
  SUM(col_2)
FROM table
WHERE col_1 = 10
GROUP BY col_1
HAVING SUM(col_2) > 30
ORDER BY col_1 ASC
LIMIT 2;
```

**Coding Order:**

1. SELECT
2. DISTINCT
3. AGG → SUM
4. FROM
5. WHERE
6. GROUP BY
7. HAVING
8. ORDER BY
9. LIMIT

**Execution Order:**

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. AGG → SUM
7. DISTINCT
8. ORDER BY
9. LIMIT


### 💡 Some Quick Tricks

* In **pgAdmin** (PostgreSQL), separate each query with a **semicolon (`;`)**.
* You can also **select literals** directly in SQL:

  * `SELECT 123 AS lit;`
  * `SELECT NOW() AS current_timestamp;`

