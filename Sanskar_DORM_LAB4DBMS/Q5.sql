-- Q5 - Display the Supplier details who can supply more than one product.

use e_commerce;

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