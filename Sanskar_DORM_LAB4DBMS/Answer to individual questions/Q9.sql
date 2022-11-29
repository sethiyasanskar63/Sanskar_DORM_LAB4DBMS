-- Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

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
END

CALL `e_commerce`.`Supplier_Rating`();
