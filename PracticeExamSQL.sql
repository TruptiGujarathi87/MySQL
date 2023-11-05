--1.Write a Query to add a column package_stat to the table orders.

alter table orders
add column package_stat varchar(50) ;

-- 2.Write a Query to change the package_stat column of orders table with 'not available' for all orders.
update orders
set package_stat ='noy available';


-- 3.Write a Query to delete a row from customers table where credit_limit is 0.00
#do it again
delete from customers where creditLimit = 0.00;


-- Write SELECT statements to achieve the following:
-- 1.Write a Query to display the first_name with the occurrence of ‘el’ in the customers tables.
select first_name
from customers where first_name like '%el%';


-- 2.Write a Query to prepare a list with customer name ,customer_id ,order_id for the customers whose
-- delivery status is shipped.
select c.first_name, c.last_name, c.customer_id, o.order_id ,o.deliver from customers c join orders o using(customer_id) where deliver = 'shipped';


-- 3.Write a Query to get the number of customers with the creditLimit greater than 50000.
select count(*) as no_of_customer from customers where creditLimit>50000;


-- 4.Write a Query to display the customer_id, name ( first name and last name ), order_id and deliver
-- for all customers.
select c.customer_id, concat(c.first_name,' ',c.last_name) as full_name , o.order_id, o.deliver from customers c  join orders o using(customer_id); 

-- 5.Write a Query to customer name in order of creditLimit smallest to highest.
select concat(first_name,' ',last_name) as full_name, creditLimit from customers order by creditLimit asc;

-- 6.Write a stored procedure by name order_day. The procedure should show the customer_id and the day on which he had made the order.
delimiter $$
create procedure order_day ()
begin
select customer_id, order_Date from orders ;
end ;
$$
delimiter ;

call order_day() ;

-- 7.Write a stored function by the name of cutomer_search. The stored function should return the maximum creditLimit made by any customer.
drop function customer_search ;
delimiter $$
create function customer_search()
returns int
deterministic
begin
declare max_Credit_limit int ;
select max(creditLimit ) into max_Credit_limit from customers ;
return max_Credit_limit ;
end ;
$$
delimiter ;

select customer_search() as max_Credit_limit ;




