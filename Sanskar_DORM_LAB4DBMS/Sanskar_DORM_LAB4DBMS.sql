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

-- Q2 - Insert the following data in the table created before

-- Data insertion in Supplier table
insert into supplier values(1, "Rajesh Retails", "Delhi", "1234567890");
insert into supplier values(2, "Appario Ltd.", "Mumbai", "2589631470");
insert into supplier values(3, "Knome products", "Banglore", "9785462315");
insert into supplier values(4, "Bansal Retails", "Kochi", "8975463285");
insert into supplier values(5, "Mittal Ltd.", "Lucknow", "7898456532");

-- Data insertion in Customer table
insert into customer values(1, "AAKASH", "9999999999", "DELHI", 'M');
insert into customer values(2, "AMAN", "9785463215", "NOIDA", 'M');
insert into customer values(3, "NEHA", "9999999999", "MUMBAI", 'F');
insert into customer values(4, "MEGHA", "9994562399", "KOLKATA", 'F');
insert into customer values(5, "PULKIT", "7895999999", "LUCKNOW", 'M');

-- Data insertion in Category table
insert into category values(1, "BOOKS");
insert into category values(2, "GAMES");
insert into category values(3, "GROCERIES");
insert into category values(4, "ELECTRONICS");
insert into category values(5, "CLOTHES");

-- Data insertion in Product table
insert into product values(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values(4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product values(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values(6, "MILK", "1L Toned MIlk", 3);
insert into product values(7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
insert into product values(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values(9, "Project IGI", "compatible with windows 7 and above", 2);
insert into product values(10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into product values(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into product values(12, "Train Your Brain", "By Shireen Stephen", 1);

-- Data insertion in Supplier_pricing table because of insufficient data arbitrary data also inserted
insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,12,2,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,31000);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);


-- Data insertion in Orders table
insert into orders values(101, 1500, '2021-10-06', 2, 1);
insert into orders values(102, 1000, '2021-10-12', 3, 5);
insert into orders values(103, 30000, '2021-09-16', 5, 2);
insert into orders values(104, 1500, '2021-10-05', 1, 1);
insert into orders values(105, 3000, '2021-08-16', 4, 3);

insert into orders values(106, 1450, '2021-08-18', 1, 9);
insert into orders values(107, 789, '2021-09-01', 3, 7);
insert into orders values(108, 780, '2021-09-07', 5, 6);
insert into orders values(109, 3000, '2021-00-10', 5, 3);
insert into orders values(110, 2500, '2021-09-10', 2, 4);
insert into orders values(111, 1000, '2021-09-15', 4, 5);
insert into orders values(112, 789, '2021-09-16', 4, 7);
insert into orders values(113, 31000, '2021-09-16', 1, 8);
insert into orders values(114, 1000, '2021-09-16', 3, 5);
insert into orders values(115, 3000, '2021-09-16', 5, 3);
insert into orders values(116, 99, '2021-09-17', 2, 14);

-- Data insertion in Rating table
insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

-- Q3 - Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT 
    gender, COUNT(gender)
FROM
    (SELECT 
        customer.cus_id,
            customer.cus_gender AS gender,
            amt.sum_amount
    FROM
        customer
    RIGHT JOIN (SELECT 
        cus_id, sum_amount
    FROM
        (SELECT 
        cus_id, SUM(ord_amount) AS sum_amount
    FROM
        orders
    GROUP BY cus_id) a
    WHERE
        a.sum_amount > 3000) AS amt ON (amt.cus_id = customer.cus_id)) AS gend
GROUP BY gender;

-- Q4 - Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT 
    ord.*, pro_name
FROM
    product
        RIGHT JOIN
    (SELECT 
        o.*, pro_id
    FROM
        supplier_pricing
    RIGHT JOIN (SELECT 
        ord_id, cus_id, pricing_id
    FROM
        orders
    WHERE
        cus_id = 2) o ON (o.pricing_id = supplier_pricing.pricing_id)) ord ON (ord.pro_id = product.pro_id);
        
 -- Q5 - Display the Supplier details who can supply more than one product.
 
SELECT 
    supplier.*, count.no_of_product
FROM
    supplier
        RIGHT JOIN
    (SELECT 
        supp_id, COUNT(supp_id) AS no_of_product
    FROM
        supplier_pricing
    GROUP BY supp_id) AS count ON (count.supp_id = supplier.supp_id)
WHERE
    count.no_of_product > 1;
    
-- Q6 - Find the least expensive product from each category and print the table with category id, name, product name and price of the product

select distinct category.cat_id as Category_ID, category.cat_name as Category_Name, pro.product_name as Product_Name, Min(pro.price) over (partition by category.cat_id) as Price_of_Product from category right join (select product.cat_id as cat_id, product.pro_name as product_name, pricing.price as price from product right join (select supplier_pricing.pro_id as pro_id, supplier_pricing.supp_price as price from supplier_pricing) as pricing on (product.pro_id=pricing.pro_id)) as pro on (pro.cat_id=category.cat_id);

-- Q7 - Display the Id and Name of the Product ordered after “2021-10-05”.

SELECT 
    prod.pro_id, product.pro_name
FROM
    product
        RIGHT JOIN
    (SELECT 
        pro_id
    FROM
        supplier_pricing
    RIGHT JOIN (SELECT 
        ord_id, pricing_id
    FROM
        orders
    WHERE
        ord_date > '2021-10-05') AS o ON (supplier_pricing.pricing_id = o.pricing_id)) AS prod ON (prod.pro_id = product.pro_id);
        
-- Q8 - Display customer name and gender whose names start or end with character 'A'.

SELECT 
    cus_name, cus_gender
FROM
    customer
WHERE
    cus_name LIKE 'A%' OR cus_name LIKE '%A';
    
-- Q9 - Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

use e_commerce;

CREATE DEFINER=`root`@`localhost` PROCEDURE `Supplier_Rating`()
BEGIN

select  supplier_id.order_id as Order_ID, supplier_id.supp_id as Supplier_ID,supplier.supp_name as Supplier_Name, supplier_id.rating as Order_Rating, case
		when rating = 5 THEN 'Excellent Service'
		when rating > 3 THEN 'Good Service'
		when rating > 2 THEN 'Average Service'
	ELSE 'Poor Service'
	end as Type_of_Service from supplier right join (
select ord_details.order_id as order_id, supplier_pricing.pro_id as pro_id, supplier_pricing.supp_id as supp_id, ord_details.rating as rating from supplier_pricing right join (
select orders.ord_id as order_id, orders.pricing_id as pric_id, rating.rat_ratstars as rating from orders right join (
select * from rating) as rating 
on (rating.ord_id=orders.ord_id)) as ord_details 
on (ord_details.pric_id=supplier_pricing.pricing_id)) as supplier_id 
on (supplier.supp_id=supplier_id.supp_id);

-- Please create a stored procedure with above query

END

CALL `e_commerce`.`Supplier_Rating`();