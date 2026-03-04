-- Drop the customers table if it already exists
DROP TABLE IF EXISTS customers;

-- Create the customers table with basic customer details
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    country VARCHAR(50),
    score INT
);

-- Drop the orders table if it already exists
DROP TABLE IF EXISTS orders;

-- Create the orders table with a foreign key referencing customers
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    sales INT,
    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
        REFERENCES customers(id)
        ON DELETE CASCADE
);
