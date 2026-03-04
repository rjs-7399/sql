# 🧱 Understanding Data Manipulation Language (DML)

* In SQL, **DML** (Data Manipulation Language) is used to **manage and manipulate existing data** in tables within a database.
* DML commands work at the **row level**.
* These commands **do not operate** at the database, schema, or table level.

## 📥 Insert

* Once a table is created, we can **insert data manually** using the `INSERT` command.
* We can insert data in **two ways**:

  * Into **all columns** (omit column names).
  * Into **specific columns** (must specify column names in order).
* When specifying columns and values, the **number of columns must match the number of values**, otherwise the query fails.
* We can insert **multiple rows** in a single statement.
* If we insert values into **specific columns only**, the **remaining columns will be set to `NULL`** by default.
* We can **skip insertion** only for **nullable columns**.
* If we try to insert `NULL` into a **non-nullable column**, the query will fail.
* This is the **manual way** of inserting one or more records into a table.
* Alternatively, data can be inserted **from one table to another** using the `USING` clause.
* This method is often used when **backing up data** from one table to another.

## ✏️ Update

* The `UPDATE` command is used to **modify existing records** in a table.
* It works using the **`SET`** and **`WHERE`** clauses.
* If the `WHERE` clause is **omitted**, the update applies to **all rows** in the table, updating every record.

## 🗑️ Delete & Truncate

* The `DELETE` command removes **specific records** that meet a given condition.
* Be careful with the **`WHERE`** clause — if it’s missing, **all records** will be deleted.
* To remove all rows, you can either:

  * Run `DELETE` without a `WHERE` clause, or
  * Use the **`TRUNCATE`** command.
* `DELETE` is **less efficient** for large datasets.
* `TRUNCATE` is **faster** because it removes all records but **keeps the table structure** intact.
