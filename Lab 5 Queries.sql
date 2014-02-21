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
where cid not in (select cid
	          from orders);
	         
--QUERY 4
select customers.name
from customers LEFT JOIN orders
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

--QUERY 7
--I couldn't figure out how to write  query for this one
--using joins instead of subqueries. 
select name, city
from customers 
where city in (select city
               from products
               where quantity in (select min(quantity)
                                  from products));