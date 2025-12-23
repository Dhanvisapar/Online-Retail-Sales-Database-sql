create database project2;
use project2;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(100),
  price DECIMAL(10,2)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers(name,email)
VALUES ('Ravi','ravi@gmail.com'),('Anu','anu@gmail.com');

INSERT INTO products(product_name,price)
VALUES ('Laptop',60000),('Mouse',500);
-- Total sales per customer
SELECT c.name, SUM(p.price * oi.quantity) AS total
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
GROUP BY c.name;

-- Top selling products
SELECT p.product_name, SUM(oi.quantity)
FROM products p
JOIN order_items oi ON p.product_id=oi.product_id
GROUP BY p.product_name;

