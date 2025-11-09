# 🧱 Understanding Data Definition Language (DDL)

When we need to **define, modify, or remove database objects**, we use **Data Definition Language (DDL)** commands.
DDL focuses on the **structure** of the database rather than the **data stored** inside it.

* The **DDL statements** are used to **create, alter, or delete** objects like databases, schemas, and tables.
* These operations **change the schema definition**, not the records within.
* Once executed, DDL statements are **auto-committed**, meaning changes are **permanent** and cannot be rolled back easily.

## 🔍 Common DDL Commands

Here are the most commonly used **DDL operations** you’ll encounter while working with database structures:

* **`CREATE`** — Creates new objects like databases, schemas, or tables.
* **`ALTER`** — Modifies the existing structure of database objects.
* **`DROP`** — Deletes entire objects from the database permanently.

These commands can be applied at **database**, **schema**, or **table** levels.

### 🏗️ CREATE

* The **CREATE statement** is used when building the structure of a database from scratch.

* Typically, when starting with an empty database:

  1. You first **create a schema** to logically organize your tables.
  2. Then, you **create tables** within that schema to store data.

* Example:

  ```sql
  CREATE TABLE persons (
      id INT NOT NULL,
      person_name VARCHAR(50) NOT NULL,
      birth_date DATE NULL,
      phone VARCHAR(15) NOT NULL,
      CONSTRAINT pk_persons PRIMARY KEY (id)
  );
  ```

* This statement creates a new table `persons` with a **primary key constraint** on `id`.

**Execution Flow:**

1. Database and schema must exist.
2. The `CREATE` statement defines the object’s structure.
3. The database commits this definition immediately.

**Key Notes:**

* `CREATE` defines metadata — no data insertion happens here.
* Object names (table, column, constraint) must be **unique** within a schema.
* Some systems support **`IF NOT EXISTS`** to avoid duplication errors.


### ✏️ ALTER

* The **ALTER statement** allows modifications to an **existing database object** — like adding, modifying, or removing columns or constraints.
* It helps adapt the database schema as requirements evolve.

**Examples:**

1. **Add a new column:**

   ```sql
   ALTER TABLE persons ADD COLUMN email VARCHAR(100);
   ```
2. **Add a constraint:**

   ```sql
   ALTER TABLE persons ADD CONSTRAINT unique_phone UNIQUE (phone);
   ```
3. **Drop a column:**

   ```sql
   ALTER TABLE persons DROP COLUMN birth_date;
   ```

**Execution Flow:**

1. Table or object must already exist.
2. ALTER modifies the definition in place.
3. The database commits changes immediately.

**Key Characteristics:**

* You can **add new columns or constraints** to an existing table.
* When adding a new column, it is placed **at the end of the table** by default.
* SQL does **not support reordering columns directly** — to change column order:

  * Create a new table with the desired column sequence.
  * Copy the data using `INSERT INTO new_table SELECT ... FROM old_table`.
* Dropping a column **permanently removes the column and its data**.
* ALTER does not affect data unless the change directly involves it (e.g., dropping a column).


### 🧹 DROP

* The **DROP statement** is used to **delete entire objects** (database, schema, table, or column).
* Once executed, it **removes both the structure and all the data** stored in it.

**Examples:**

1. **Drop a table:**

   ```sql
   DROP TABLE persons;
   ```
2. **Drop a schema:**

   ```sql
   DROP SCHEMA salesdb CASCADE;
   ```
3. **Drop a database:**

   ```sql
   DROP DATABASE companydb;
   ```

**Execution Flow:**

1. Identifies the object to remove.
2. Deletes its definition and dependent objects (if specified with `CASCADE`).
3. Commits immediately — cannot be rolled back.

**Key Notes:**

* `DROP` is **irreversible** — once an object is dropped, it and its data are gone permanently.
* Use **`IF EXISTS`** to avoid errors if the object doesn’t exist.
* Be cautious when using **CASCADE**, as it removes dependent tables or constraints automatically.


### ⚙️ Levels of DDL Operations

| Level        | Operation Examples                          | Description                        |
| ------------ | ------------------------------------------- | ---------------------------------- |
| **Database** | `CREATE DATABASE`, `DROP DATABASE`          | Define or remove entire databases  |
| **Schema**   | `CREATE SCHEMA`, `DROP SCHEMA`              | Organize and manage related tables |
| **Table**    | `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE` | Define or modify data structures   |


### 💡 Some Quick Tips

* DDL operations are **auto-committed** — you can’t undo them easily.
* Always **backup critical structures** before running ALTER or DROP.
* In development environments, test schema changes using a **sandbox database**.
* Combine DDL with **DML (Data Manipulation Language)** for complete database control — structure + data.
