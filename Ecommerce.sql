CREATE DATABASE EcomProject;

USE EcomProject;

CREATE TABLE customers (
    customerID INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE products (
    productID INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT,
    stockQuantity INT
);

CREATE TABLE cart (
    cartID INT PRIMARY KEY,
    customerID INT,
    productID INT,
    quantity INT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES products(productID) ON DELETE CASCADE
);

CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    customerID INT,
    orderDate DATE,
    totalPrice DECIMAL(10, 2),
    shippingAddress VARCHAR(100),
    FOREIGN KEY (customerID) REFERENCES customers(customerID) ON DELETE CASCADE
);

CREATE TABLE orderItems (
    orderItemID INT PRIMARY KEY,
    orderID INT,
    productID INT,
    quantity INT,
    FOREIGN KEY (orderID) REFERENCES orders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES products(productID) ON DELETE CASCADE
);

INSERT INTO customers (customerID, name, email, password)
VALUES
	(1, 'John Doe', 'john.doe@example.com', 'password987'),
    (2, 'Joey Tribiani', 'joey.tribiani@example.com', 'password123'),
    (3, 'Chandler Bing', 'chandler.bing@example.com', 'sarcasm123'),
    (4, 'Ross Geller', 'ross.geller@example.com', 'scienceboy123'),
    (5, 'Rachel Green', 'rachel.green@example.com', 'shopping123'),
    (6, 'Monica Geller', 'monica.geller@example.com', 'cleaning123'),
    (7, 'Pheobe Buffay', 'pheobe.buffay@example.com', 'nestletollhouse'),
    (8, 'Taylor Swift', 'taylor.swift@example.com', 'treatmeright'),
    (9, 'Jane Doe', 'jane.doe@example.com', 'jane123'),
    (10, 'Vaibhav Sharma', 'vaibhav.sharma@example.com', 'sharmijikabeta');
	
INSERT INTO products (productID, name, price, description, stockQuantity)
VALUES
    (1, 'Laptop', 999.99, 'High-performance laptop with SSD', 50),
    (2, 'Smartphone', 499.99, 'Latest smartphone model', 100),
    (3, 'Headphones', 79.99, 'Over-ear noise-canceling headphones', 30),
    (4, 'Tablet', 299.99, '10-inch tablet with HD display', 20),
    (5, 'Smartwatch', 149.99, 'Fitness and health tracking smartwatch', 40),
    (6, 'Camera', 599.99, 'Mirrorless camera with 4K video recording', 15),
    (7, 'Wireless Mouse', 29.99, 'Ergonomic wireless mouse', 60),
    (8, 'External Hard Drive', 129.99, '2TB USB 3.0 external hard drive', 25),
    (9, 'Gaming Console', 399.99, 'Next-gen gaming console', 10),
    (10, 'Printer', 129.99, 'Color laser printer with wireless connectivity', 35);

INSERT INTO cart (cartID, customerID, productID, quantity) 
VALUES
	(1, 1, 1, 2),
	(2, 2, 2, 1),
	(3, 3, 3, 3),
	(4, 4, 4, 2),
	(5, 5, 5, 1),
	(6, 1, 6, 4),
	(7, 2, 7, 2),
	(8, 3, 8, 3),
	(9, 4, 9, 1),
	(10, 5, 10, 2);

INSERT INTO orders (orderID, customerID, orderDate, totalPrice, shippingAddress)
VALUES
  (1, 1, '01-01-2023', 50.00, '123 Delhi India'),
  (2, 2, '02-01-2023', 75.50, '456 Newyork London'),
  (3, 3, '03-01-2023', 120.25, '789 Paris France'),
  (4, 4, '04-01-2023', 30.75, '101 Mumbai India'),
  (5, 5, '05-01-2023', 90.50, '202 Banaras India'),
  (6, 1, '06-01-2023', 55.20, '303 Bhopal India'),
  (7, 3, '07-01-2023', 40.00, '404 Indore India'),
  (8, 2, '08-01-2023', 110.75, '505 Agra India'),
  (9, 5, '09-01-2023', 65.80, '606 Goa India'),
  (10, 4, '10-01-2023', 85.25, '707 Sagar India');

INSERT INTO orderItems (orderItemID, orderID, productID, quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 5, 3),
    (4, 2, 3, 1),
    (5, 3, 4, 2),
    (6, 4, 1, 1),
    (7, 4, 2, 2),
    (8, 5, 4, 1),
    (9, 5, 5, 2),
    (10, 5, 3, 1);
