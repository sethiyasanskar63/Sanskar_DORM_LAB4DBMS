-- Q7 - Display the Id and Name of the Product ordered after “2021-10-05”.

use e_commerce;

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