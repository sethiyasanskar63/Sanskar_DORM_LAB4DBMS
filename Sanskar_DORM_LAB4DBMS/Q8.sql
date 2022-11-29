-- Q8 - Display customer name and gender whose names start or end with character 'A'.

use e_commerce;

SELECT 
    cus_name, cus_gender
FROM
    customer
WHERE
    cus_name LIKE 'A%' OR cus_name LIKE '%A';