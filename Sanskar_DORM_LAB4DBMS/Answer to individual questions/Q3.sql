-- Q3 - Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

use e_commerce;

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