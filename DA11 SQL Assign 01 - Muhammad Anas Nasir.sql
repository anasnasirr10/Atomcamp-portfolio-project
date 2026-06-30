-- -------------------------------------------------------------------
-- SQL Assignment 01
-- -------------------------------------------------------------------



-- -------------------------------------------------------------------
-- Setting up database
-- -------------------------------------------------------------------

-- 1. Create Database
CREATE DATABASE assignmentDB;

-- 2. Use database
USE assignmentDB;

-- 3. Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sales INT
);


-- 4. Create customers table
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    name VARCHAR(50), 
    location VARCHAR (50)
);


-- 5. Create products table
CREATE TABLE products (
	product_id INT PRIMARY KEY,
    name VARCHAR (100),
    category VARCHAR(50)
);

-- 6. Insert into customers
INSERT INTO customers VALUES
(1, 'Ahmed', 'Lahore'),
(2, 'Ayesha', 'Karachi'),
(3, 'Bilal', 'Islamabad'),
(4, 'Fatima', 'Faisalabad'),
(5, 'Daniyal', 'Rawalpindi'),
(6, 'Hafsa', 'Peshawar'),
(7, 'Usman', 'Quetta'),
(8, 'Zainab', 'Multan'),
(9, 'Hamza', 'Sialkot'),
(10, 'Mariam', 'Hyderabad');

-- 7. Insert into products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Mobile Phone', 'Electronics'),
(103, 'Office Chair', 'Furniture'),
(104, 'Dining Table', 'Furniture'),
(105, 'Wireless Headphones', 'Electronics'),
(106, 'LED Monitor', 'Electronics'),
(107, 'Sports Shoes', 'Fashion'),
(108, 'Casual Shirt', 'Fashion'),
(109, 'School Bag', 'Accessories'),
(110, 'Wrist Watch', 'Accessories');

-- 8. Insert into orders
INSERT INTO orders VALUES
(1001, 1, 101, 1, 1200),
(1002, 2, 102, 2, 1500),
(1003, 3, 103, 4, 6000),
(1004, 4, 104, 1, 1500),
(1005, 5, 105, 3, 4500),
(1006, 6, 106, 2, 7000),
(1007, 7, 107, 1, 8000),
(1008, 8, 108, 5, 1000),
(1009, 9, 109, 2, 1500),
(1010, 10, 110, 1, 2000);

-- ------------------------------------------------------------------
-- EDITING DATABASE
---------------------------------------------------------------------

-- 1. Update location of customer id 6
UPDATE customers
SET location = 'Lahore'
WHERE customer_id = 6;

-- 2. Delete customer id 10
DELETE FROM customers 
WHERE customer_id = 10;

-- 3. Add location_code column and update it
ALTER TABLE customers
ADD location_code VARCHAR(3);

UPDATE customers
SET location_code = LEFT(location, 3)
WHERE customer_id IS NOT NULL;

-- ------------------------------------------------------------------
-- QUERYING 
---------------------------------------------------------------------

-- 1. Show order_id, product_id, quantity
SELECT order_id, product_id, quantity
FROM orders;

-- 2. Customers from Lahore
SELECT * 
FROM customers
WHERE location = 'Lahore';

-- 3. Electronic Products sorted by name
SELECT * 
FROM products
WHERE category = 'Electronics'
ORDER BY name ASC;

-- 4. Orders with sales > 5000
SELECT customer_id, product_id, sales
FROM orders
WHERE sales > 5000;


-- 5. Orders with sales between 1500 and 5000 (descending)
SELECT customer_id, product_id, sales
FROM orders
WHERE sales BETWEEN 1500 AND 5000
ORDER BY sales DESC;

-- 6. Top 3 most expensive orders
SELECT * 
FROM orders
ORDER BY sales DESC
LIMIT 3;

-- 7. 2 least expensive orders where sales > 1500
SELECT o.order_id, o.customer_id, p.name AS product, o.sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.sales > 1500
ORDER BY o.sales ASC
LIMIT 2;