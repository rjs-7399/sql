-- Drop customers table if it exists (including dependent objects)
DROP TABLE IF EXISTS customers CASCADE;

-- Create customers table
CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    country VARCHAR(50),
    score INT
);

-- Drop employees table if it exists (including dependent objects)
DROP TABLE IF EXISTS employees CASCADE;

-- Create employees table with self-referencing manager relationship
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    department VARCHAR(50),
    birthdate DATE,
    gender CHAR(1),
    salary INT,
    managerid INT,
    CONSTRAINT fk_employees_manager
        FOREIGN KEY (managerid)
        REFERENCES employees (employeeid)
        ON DELETE SET NULL
);

-- Create index on employees.managerid for faster manager lookups
CREATE INDEX idx_employees_managerid ON employees (managerid);

-- Drop products table if it exists (including dependent objects)
DROP TABLE IF EXISTS products CASCADE;

-- Create products table
CREATE TABLE products (
    productid INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    price INT
);

-- Drop orders table if it exists (including dependent objects)
DROP TABLE IF EXISTS orders CASCADE;

-- Create orders table with foreign keys to products, customers, and employees
CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    productid INT,
    customerid INT,
    salespersonid INT,
    orderdate DATE,
    shipdate DATE,
    orderstatus VARCHAR(50),
    shipaddress VARCHAR(255),
    billaddress VARCHAR(255),
    quantity INT,
    sales INT,
    creationtime TIMESTAMP,
    CONSTRAINT fk_orders_product
        FOREIGN KEY (productid)
        REFERENCES products (productid)
        ON DELETE SET NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customerid)
        REFERENCES customers (customerid)
        ON DELETE SET NULL,
    CONSTRAINT fk_orders_employee
        FOREIGN KEY (salespersonid)
        REFERENCES employees (employeeid)
        ON DELETE SET NULL
);

-- Create index on orders.productid for query optimization
CREATE INDEX idx_orders_productid ON orders (productid);

-- Create index on orders.customerid for query optimization
CREATE INDEX idx_orders_customerid ON orders (customerid);

-- Create index on orders.salespersonid for query optimization
CREATE INDEX idx_orders_salespersonid ON orders (salespersonid);

-- Drop orders_archive table if it exists (including dependent objects)
DROP TABLE IF EXISTS orders_archive CASCADE;

-- Create orders_archive table (for historical order records)
CREATE TABLE orders_archive (
    orderid INT,
    productid INT,
    customerid INT,
    salespersonid INT,
    orderdate DATE,
    shipdate DATE,
    orderstatus VARCHAR(50),
    shipaddress VARCHAR(255),
    billaddress VARCHAR(255),
    quantity INT,
    sales INT,
    creationtime TIMESTAMP
);

-- Create index on orders_archive.productid for faster lookups
CREATE INDEX idx_orders_archive_productid ON orders_archive (productid);

-- Create index on orders_archive.customerid for faster lookups
CREATE INDEX idx_orders_archive_customerid ON orders_archive (customerid);

-- Create index on orders_archive.salespersonid for faster lookups
CREATE INDEX idx_orders_archive_salespersonid ON orders_archive (salespersonid);

