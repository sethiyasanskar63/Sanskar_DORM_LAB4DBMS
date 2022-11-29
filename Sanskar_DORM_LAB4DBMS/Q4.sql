-- Q4 - Display all the orders along with product name ordered by a customer having Customer_Id=2

use e_commerce;

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