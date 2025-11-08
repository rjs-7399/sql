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


### 🧩 SELECT & FROM Clause

* We always run the **SELECT statement** together with the **FROM clause** to fetch data from a database.
* The **FROM clause** specifies the table name from which we want to retrieve the data, and using a **`*` (star)** means selecting **all fields** from that table.
* For example:

  ```sql
  SELECT * FROM salesdb.public.orders;
  ```

  This query fetches all the fields from the `orders` table inside the `public` schema of the `salesdb` database.


#### ⚙️ Order of Execution
1. **FROM clause** executes first — it accesses the table and retrieves all the data.
2. **SELECT clause** executes next — it picks the required columns based on what’s defined in the select list.

* If we write `SELECT *`, it will return **all columns**.
* If we specify **comma-separated fields**, it will return **only those specific columns**, in the given order.

So, the **execution order** is:
➡️ **FROM → SELECT**
