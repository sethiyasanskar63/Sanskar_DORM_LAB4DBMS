-- Q1- You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below.

create database e_commerce;

use e_commerce;

-- Q1
-- Schema Creation
CREATE TABLE supplier (
    supp_id INT NOT NULL PRIMARY KEY,
    supp_name VARCHAR(50) NOT NULL,
    supp_city VARCHAR(50) NOT NULL,
    supp_phone VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
    cus_id INT NOT NULL PRIMARY KEY,
    cus_name VARCHAR(20) NOT NULL,
    cus_phone VARCHAR(10) NOT NULL,
    cus_city VARCHAR(30) NOT NULL,
    cus_gender CHAR
);

CREATE TABLE category (
    cat_id INT PRIMARY KEY,
    cat_name VARCHAR(20) NOT NULL
);

CREATE TABLE product (
    pro_id INT NOT NULL PRIMARY KEY,
    pro_name VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    pro_desc VARCHAR(60),
    cat_id INT,
    FOREIGN KEY (cat_id)
        REFERENCES category (cat_id)
);

CREATE TABLE supplier_pricing (
    pricing_id INT NOT NULL PRIMARY KEY,
    pro_id INT NOT NULL,
    supp_id INT NOT NULL,
    supp_price INT DEFAULT 0,
    FOREIGN KEY (pro_id)
        REFERENCES product (pro_id),
    FOREIGN KEY (supp_id)
        REFERENCES supplier (supp_id)
);

CREATE TABLE orders (
    ord_id INT NOT NULL PRIMARY KEY,
    ord_amount INT NOT NULL,
    ord_date DATE NOT NULL,
    cus_id INT,
    pricing_id INT,
    FOREIGN KEY (cus_id)
        REFERENCES customer (cus_id),
    FOREIGN KEY (pricing_id)
        REFERENCES supplier_pricing (pricing_id)
);

CREATE TABLE rating (
    rat_id INT NOT NULL PRIMARY KEY,
    ord_id INT NOT NULL,
    rat_ratstars INT NOT NULL,
    FOREIGN KEY (ord_id)
        REFERENCES orders (ord_id)
);