create database e_commerce;

use e_commerce;

-- Q1
-- Schema Creation
create table supplier(
supp_id int not null primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null
);

create table customer(
cus_id int not null primary key,
cus_name varchar(20) not null,
cus_phone varchar(10) not null,
cus_city varchar(30) not null,
cus_gender char
);

create table category(
cat_id int primary key,
cat_name varchar(20) not null
);

create table product(
pro_id int not null primary key,
pro_name varchar(20) not null default "Dummy",
pro_desc varchar(60),
cat_id int,
foreign key (cat_id) references category (cat_id)
);

create table supplier_pricing(
pricing_id int not null primary key,
pro_id int not null,
supp_id int not null,
supp_price int default 0,
foreign key (pro_id) references product (pro_id),
foreign key (supp_id) references supplier (supp_id)
);

create table orders(
ord_id int not null primary key,
ord_amount int not null,
ord_date date not null,
cus_id int,
pricing_id int,
foreign key (cus_id) references customer (cus_id),
foreign key (pricing_id) references supplier_pricing (pricing_id)
);

create table rating(
rat_id int not null primary key,
ord_id int not null,
rat_ratstars int not null,
foreign key (ord_id) references orders (ord_id)
);

-- Q2
-- Data Insertion
insert into supplier values(1, "Rajesh Retails", "Delhi", "1234567890");
insert into supplier values(2, "Appario Ltd.", "Mumbai", "2589631470");
insert into supplier values(3, "Knome products", "Banglore", "9785462315");
insert into supplier values(4, "Bansal Retails", "Kochi", "8975463285");
insert into supplier values(5, "Mittal Ltd.", "Lucknow", "7898456532");

select * from supplier;

insert into customer values(1, "AAKASH", "9999999999", "DELHI", 'M');
insert into customer values(2, "AMAN", "9785463215", "NOIDA", 'M');
insert into customer values(3, "NEHA", "9999999999", "MUMBAI", 'F');
insert into customer values(4, "MEGHA", "9994562399", "KOLKATA", 'F');
insert into customer values(5, "PULKIT", "7895999999", "LUCKNOW", 'M');

select * from customer;

insert into category values(1, "BOOKS");
insert into category values(2, "GAMES");
insert into category values(3, "GROCERIES");
insert into category values(4, "ELECTRONICS");
insert into category values(5, "CLOTHES");

select * from category;

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

select * from product;

insert into supplier_pricing values(1, 1, 2, 1500);
insert into supplier_pricing values(2, 3, 5, 30000);
insert into supplier_pricing values(3, 5, 1, 3000);
insert into supplier_pricing values(4, 2, 3, 2500);
insert into supplier_pricing values(5, 4, 1, 1000);

select * from supplier_pricing;

insert into orders values(101, 1500, '2021-10-06', 2, 1);
insert into orders values(102, 1000, '2021-10-12', 3, 5);
insert into orders values(103, 30000, '2021-09-16', 5, 2);
insert into orders values(104, 1500, '2021-10-05', 1, 1);
insert into orders values(105, 3000, '2021-08-16', 4, 3);

-- To be inserted from here

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

select * from orders;

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

select * from rating;

-- Answers

-- Q3
select gender, count(gender) from (select customer.cus_id, customer.cus_gender as gender, amt.sum_amount from customer right join (
select cus_id, sum_amount from (select cus_id, SUM(ord_amount) as sum_amount from orders group by cus_id) a where a.sum_amount >1000) as amt
on (amt.cus_id=customer.cus_id)) as gend group by gender;

-- Q4
select ord.*, pro_name from product right join(
select o.*, pro_id from supplier_pricing right join(
select ord_id, cus_id, pricing_id from orders where cus_id=2) o 
on (o.pricing_id = supplier_pricing.pricing_id)) ord 
on (ord.pro_id=product.pro_id);

-- Q5
select supplier.*, count.no_of_product from supplier right join (
select supp_id, count(supp_id) as no_of_product from supplier_pricing group by supp_id) as count
on (count.supp_id=supplier.supp_id) where count.no_of_product >1;

-- Q6

-- Q7
select prod.pro_id, product.pro_name from product right join (
select pro_id from supplier_pricing right join(
select ord_id, pricing_id from orders where ord_date > '2021-10-05') as o 
on (supplier_pricing.pricing_id=o.pricing_id)) as prod 
on (prod.pro_id=product.pro_id);

-- Q8
select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A';

-- Q9