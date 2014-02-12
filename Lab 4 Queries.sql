--Tyler Cavera
﻿--2/12/14
--SQL file for Lab 4
--QUERY 1
select city
from  agents
where aid in (select aid
	      from orders
	      where cid in (select cid
		            from customers
		            where name = 'Basics'));
--QUERY 2
select distinct pid
from orders
where aid in (select aid
              from orders
              where cid in (select cid
			    from customers 
			    where city = 'Kyoto'));
--QUERY 3
select cid, name
from customers
where cid not in (select cid
                  from orders
                  where aid = 'a03');
--QUERY 4
select cid, name
from customers
where cid in (select cid
              from orders
              where pid = 'p01'
              or pid = 'p07');
--QUERY 5
select distinct pid
from orders
where cid in (select cid
              from orders
              where aid = 'a03');
--QUERY 6
select name, discount
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
	                    from agents
	                    where city = 'Dallas'
	                    or city = 'Duluth'));
--QUERY 7
select name
from customers
where discount in (select discount 
                   from customers
                   where city = 'Dallas'
                   or city = 'Kyoto');
