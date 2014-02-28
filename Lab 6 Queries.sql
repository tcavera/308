--Tyler Cavera
--2/26/14
--SQL file for Lab 6
--a work in progress

--QUERY 1


--QUERY 2


--QUERY 3 
select priceUSD, name
from products 
where priceUSD > (select avg(priceUSD)
                    from products);

--QUERY 4
select orders.cid, orders.pid, orders.dollars, customers.name 
from orders, customers
where (customers.cid = orders.cid)
order by dollars desc;

--QUERY 5
select customers.name, COUNT(orders.ordno) orderTotal
from orders LEFT JOIN customers
on customers.cid = orders.cid
group by customers.name;


--QUERY 6
select customers.name as customer, products.name as product, agents.name as agent
from customers, agents, products, orders
where (customers.cid = orders.cid)
  and (orders.pid = products.pid)
  and (orders.aid = agents.aid)
  and (agents.city = 'New York');

--QUERY 7
select orders.ordno, orders.dollars, ((orders.qty * products.priceUSD) - ((orders.qty * products.priceUSD) * (customers.discount / 100))) as orderCheck 
from customers, orders, products
where (customers.cid = orders.cid)
  and (orders.pid = products.pid);