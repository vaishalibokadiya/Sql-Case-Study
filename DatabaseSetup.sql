CREATE DATABASE TechShop;
USE TechShop;

CREATE TABLE Customer (
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(250),
    lastName VARCHAR(250),
    email VARCHAR(250),
    phone VARCHAR(20),
    address VARCHAR(250)
);
INSERT INTO Customer (firstName, lastName, email, phone, address)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Main St'),
    ('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', '555-9012', '789 Pine St'),
    ('Alice', 'Williams', 'alice.williams@example.com', '555-3456', '987 Elm St'),
    ('Charlie', 'Brown', 'charlie.brown@example.com', '555-7890', '654 Birch St');
    
CREATE TABLE Product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250),
    description TEXT,
    price DECIMAL(10, 2)
);

INSERT INTO Product (name, description, price)
VALUES
    ('Laptop', 'High-performance laptop with fast processor and large storage capacity.', 1200.00),
    ('Smartphone', 'Latest smartphone with high-resolution camera and large display.', 800.50),
    ('Smart TV', '4K Ultra HD Smart TV with built-in streaming apps.', 1500.99),
    ('Wireless Headphones', 'Over-ear wireless headphones with noise-canceling feature.', 199.99),
    ('Coffee Maker', 'Automatic coffee maker with programmable brewing options.', 75.49);

CREATE TABLE Orders (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT,
    orderDate VARCHAR(20),
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId) ON DELETE CASCADE
);

INSERT INTO Orders (customerId, orderDate, totalAmount)
VALUES
    (1, '2023-01-15', 1200.00),
    (2, '2023-02-20', 800.50),
    (3, '2023-03-10', 1500.99),
    (4, '2023-04-05', 199.99),
    (5, '2023-05-12', 75.49);
    
CREATE TABLE OrderDetail (
    orderDetailId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT,
    productId INT,
    quantity INT,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId) ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES Product(productId) ON DELETE CASCADE
);

INSERT INTO OrderDetail (orderId, productId, quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (3, 4, 1),
    (4, 5, 2);

CREATE TABLE Inventory (
    inventoryId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    quantityInStock INT,
    lastStockUpdate VARCHAR(20),
    FOREIGN KEY (productId) REFERENCES Product(productId) ON DELETE CASCADE
);

INSERT INTO Inventory (productId, quantityInStock, lastStockUpdate)
VALUES
    (1, 50, '2023-01-15 09:30:00'),
    (2, 30, '2023-02-20 14:45:00'),
    (3, 25, '2023-03-10 11:00:00'),
    (4, 40, '2023-04-05 16:20:00'),
    (5, 15, '2023-05-12 13:10:00');
