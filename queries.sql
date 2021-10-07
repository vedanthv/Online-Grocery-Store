CREATE database grocery;
USE grocery;

-- products table
CREATE TABLE products(
	prod_id int,
    price int,
    name VARCHAR(30),
    description VARCHAR(30)
);
ALTER table products CHANGE COLUMN prod_id prod_id int PRIMARY KEY;
DESC products;

ALTER table products ADD COLUMN availibility int;

-- users table
CREATE table users(
	username VARCHAR(30) NOT NULL UNIQUE,
    user_id INT(10) PRIMARY KEY,
	password VARCHAR(30) NOT NULL,
    address VARCHAR(30) NOT NULL UNIQUE
);

ALTER table users ADD COLUMN customer_name VARCHAR(50);
ALTER table users ADD COLUMN phone_no INT(10);

DESC users;

-- cart table
CREATE table cart(
	user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    product_name VARCHAR(50),
    quantity INT,
    price DOUBLE
);

ALTER table cart ADD COLUMN amount int;

-- order_details
CREATE table orderdetails(
	bill_no INT PRIMARY KEY
);

-- foerign key references to order_details
ALTER table orderdetails ADD COLUMN customer_name VARCHAR(30) REFERENCES users(customer_name);
ALTER table orderdetails ADD COLUMN address VARCHAR(30) REFERENCES users(address);
ALTER table orderdetails ADD COLUMN mobile_no int REFERENCES users(phone_no);
ALTER table orderdetails ADD COLUMN amount int REFERENCES cart(amount);



