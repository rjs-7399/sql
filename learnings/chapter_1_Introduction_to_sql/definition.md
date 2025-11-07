# 📘 Introduction to SQL, Database, Tables, ER, and DBMS

## 🧠 What is SQL, Database, Tables, and ER?

* As humans, we store a lot of data — like **name**, **PAN**, **mobile number**, **address**, etc.
* We usually maintain such information in **documents**, **spreadsheets (Excel)**, or **text files**.
* Similarly, **companies** also handle large volumes of data for **multiple customers**.

However, it’s **not scalable** for large organizations to maintain this data in Excel or text files.
To handle **huge and structured data efficiently**, they use **databases**.

### 🗃️ Databases and Tables

* A **database** is a structured collection of data organized into **tables**.
* Each **table** consists of **rows** (records) and **columns** (fields).
* Each table has a **schema** or **definition**, specifying what type of data it can store.
* A company can have **multiple databases**, and each database can have **multiple tables** — each containing large volumes of data.

### 🔗 Entity Relationship (ER)

* Sometimes, related information is stored across multiple tables.

  * Example: *Employee details* might be in one table, and *salary details* in another.
* To retrieve combined information (e.g., *“salary of employee X for a given period”*), we use **relationships** between tables.
* These relationships are defined through **Entity Relationships (ER)**.
* Using ER, we can **join** tables to extract meaningful insights.

### 💬 Structured Query Language (SQL)

* **SQL (Structured Query Language)** is used to **interact with databases** —
  to **create**, **read**, **update**, and **delete** data (CRUD operations).
* SQL allows us to query complex relationships and extract the required information efficiently.

---

## ⚙️ Database Management System (DBMS)

* In production-grade systems, many people (e.g., analysts, engineers, managers) interact with databases.
* Web applications, dashboards (like **Power BI** or **Tableau**), and automation scripts also run **SQL queries** frequently.
* As multiple systems and users access the same data, the **load on the database increases**.

### 🧩 Role of DBMS

* The **Database Management System (DBMS)** manages and optimizes this access and load.
* It ensures:

  * **Efficient query execution**
  * **Data integrity and security**
  * **Concurrent access control**
  * **Backup and recovery**

### 🏢 DBMS in Different Scales of Companies

| Company Size | DBMS Solution                                                                  | Description                                            |
| ------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------ |
| Small        | **Local Server (e.g., pgAdmin, SQLite)**                                       | Suitable for small data volumes and local testing.     |
| Medium       | **SQL Server / MySQL / PostgreSQL**                                            | On-premise or small-scale cloud deployments.           |
| Large        | **Cloud RDS or Data Warehouse (e.g., AWS RDS, Snowflake, BigQuery, Redshift)** | Scalable solutions for handling enterprise-level data. |


## 🧱 Types of Databases

* There are multiple types of databases.
### Relational Databases
- store the data in the form of **tables (rows and columns)**.
- We can connect multiple tables and run **SQL queries** to get the required results.
- These are called **relational databases**.

**Examples:**
MySQL, PostgreSQL, Oracle, SQL Server, SQLite



### Key-Value Databases

- Store data in the form of **key-value pairs**, where the key acts as an identifier (like an index) and the value contains the actual data.
- Commonly used for **fast lookups**, **session management**, and **caching**.
- **Examples:** Redis, Amazon DynamoDB

### Column-Based Databases

- Store data **by columns** instead of rows.
- Optimized for **analytical queries**, **aggregations**, and **data warehousing**.
- **Examples:** Apache Cassandra, HBase, Amazon Redshift, ClickHouse

### Graph Databases

- Store data in the form of **nodes (entities)** and **edges (relationships)**.
- Useful for modeling **networks**, **social graphs**, or **recommendation systems**.
- **Examples:** Neo4j, Amazon Neptune

### Document Databases

- Store data as **JSON-like documents**, allowing flexible and semi-structured schemas.
- Ideal for **content management systems**, **logs**, and **metadata stores**.
- **Examples:** MongoDB, CouchDB


- All of these (except relational databases) are collectively called **NoSQL databases**.
- In the **data engineering world**, we mostly use **SQL with relational databases**, but **NoSQL systems** are used for special use cases like **real-time data**, **large-scale analytics**, or **unstructured content**.


## 🧾 Summary

* **Database** → Stores data in structured tables
* **Table** → Holds rows and columns of data
* **ER (Entity Relationship)** → Defines how tables are related
* **SQL** → Language to query and manipulate data
* **DBMS** → Manages databases efficiently and handles multiple user access
