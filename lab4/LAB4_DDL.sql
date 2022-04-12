CREATE DATABASE LAB4;
USE LAB4;

CREATE TABLE customer (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE orderr (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE item(
	item_Id INT PRIMARY KEY AUTO_INCREMENT,
    unit_price FLOAT NOT NULL
);

CREATE TABLE warehouse (
	warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_city VARCHAR(100) NOT NULL
);

CREATE TABLE order_item(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY(order_id) REFERENCES orderr(order_id),
    FOREIGN KEY(item_id) REFERENCES item(item_id)
);

CREATE TABLE shipment (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    warehouse_id INT,
    ship_date DATETIME NOT NULL,
    FOREIGN KEY(order_id) REFERENCES orderr(order_id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id)
);