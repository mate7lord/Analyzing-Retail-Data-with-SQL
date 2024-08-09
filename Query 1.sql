show databases;
create database techcorp;
show databases;
use techcorp;

show tables from techcorp;

create table Products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
    );
    SELECT * FROM Products;