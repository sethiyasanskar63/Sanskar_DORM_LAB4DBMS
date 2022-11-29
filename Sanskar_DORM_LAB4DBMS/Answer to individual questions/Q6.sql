-- Q6 - Find the least expensive product from each category and print the table with category id, name, product name and price of the product

use e_commerce;

select distinct category.cat_id as Category_ID, category.cat_name as Category_Name, pro.product_name as Product_Name, Min(pro.price) over (partition by category.cat_id) as Price_of_Product from category right join (select product.cat_id as cat_id, product.pro_name as product_name, pricing.price as price from product right join (select supplier_pricing.pro_id as pro_id, supplier_pricing.supp_price as price from supplier_pricing) as pricing on (product.pro_id=pricing.pro_id)) as pro on (pro.cat_id=category.cat_id);