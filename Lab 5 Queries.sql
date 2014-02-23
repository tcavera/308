--Tyler Cavera
--2/19/14
--SQL file for Lab 5

--QUERY 1
select agents.city
from agents, customers, orders
where (agents.aid = orders.aid)
  and (orders.cid = customers.cid)
  and (customers.name = 'Basics');

--QUERY 2
select distinct o1.pid
from orders o1,
     orders o2,
     customers c,
     agents a
where (o1.aid = o2.aid)
  and (a.aid = o2.aid)
  and (o2.cid = c.cid)
  and (c.city = 'Kyoto');

--QUERY 3
select name
from customers
where cid not in (select o.cid
	          from customers c,
	          orders o
	          where o.cid = c.cid);
	         
--QUERY 4
select customers.name
from customers LEFT OUTER JOIN orders
on (customers.cid = orders.cid)
where orders.cid IS NULL;

--QUERY 5
select distinct customers.name as customer, agents.name as agent
from customers, agents, orders
where (customers.cid = orders.cid)
  and (orders.aid = agents.aid)
  and (customers.city = agents.city);

--QUERY 6
select customers.name as "Customer", agents.name as "Agent", customers.city
from customers, agents
where (customers.city = agents.city);

--QUERY 6 ALT (from class)
select city
from customers
	intersect
select city 
from agents

--QUERY 7
select customers.name, customers.city
from customers 
where customers.city in (select city
                         from (select city, sum(products.quantity) as "sumquantity"
                           from products
                           group by city) cityQuantity 
                           order by sumquantity asc
                           limit 1)