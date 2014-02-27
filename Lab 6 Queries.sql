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
order by dollars desc

--QUERY 5

  