--find customer who hav never order food
SELECT * FROM users$
SELECT * FROM orders$

select name from users$ 
where user_id not in
(select user_id from orders$)

select * from food$
select * from menu$
select * from order_details$

-- average price/dish

select f.f_name,avg(price) as avg_price
from menu$ m
join food$ f
on m.f_id=f.f_id
group by f.f_name
order by avg_price desc

--- find top restorant in terms of no of order  for given month
--june
SELECT r.r_name, count(*) as month 
FROM orders$ as o
join restaurants$ as r
on r.r_id=o.r_id
where DATENAME(MONTH,date) like 'June'
group by r.r_name
order by count(*) desc

--may
SELECT r.r_name, count(*) as month 
FROM orders$ as o
join restaurants$ as r
on r.r_id=o.r_id
where DATENAME(MONTH,date) like 'may'
group by r.r_name
order by count(*) desc


--restaurant whose montly sale is greather than x value
SELECT r.r_name,sum(amount) as revenue
from orders$ o
join restaurants$ r
on o.r_id=r.r_id
where DATENAME(MONTH,date) like 'June'
group by r.r_name
having sum(amount) >500



--- show all order with orde details for particular customer in particular date range
-- 
select o.order_id,r.r_name ,f.f_name
from orders$ o
join restaurants$ r
on o.r_id=r.r_id
join order_details$ od
on o.order_id=od.order_id
join food$ f
on f.f_id=od.f_id
where user_id = 
( SELECT USER_ID
FROM users$
where name like 'Ankit') and ( date >'2022-06-10' and date <'2022-07-10')


--- find restuarant with maximum repetaed customer
select user_id,r_id ,count(*) as 'visitors' 
from orders$
group by user_id,r_id 
having count(*) >1


select r.r_name, count(*) as loyal_customer
from(
		select user_id,r_id ,count(*) as 'visitors' 
		from orders$
		group by user_id,r_id 
		having count(*) >1
	) t
join restaurants$ r
on r.r_id=t.r_id
group by r.r_name
order by loyal_customer desc


--- month over month revenue growth
select month,((reveune-prev)/prev)*100 from(
	WITH sales AS
	(
		SELECT DATENAME(MONTH,date)  as 'month' ,sum(amount) as 'revenue'
		from  orders$
		group by DATENAME(MONTH,date)
		order by month desc
	)

SELECT month ,revenue, lag(revenue,1) over(order by reveune)as prev FROM  sales
)t





--month wise revenue
SELECT DATENAME(MONTH,date)  as month,sum(amount) as revenue
from  orders$
group by DATENAME(MONTH,date)
order by month desc





---customer and fav. dish


with temp as(

	select o.user_id,od.f_id,count(*) as frequency
	from orders$ o
	join order_details$ od
	on o.order_id=od.order_id
	group by o.user_id,od.f_id
	) 

select u.name, f.f_name
from temp t1
join users$ u 
on u.user_id=t1.user_id
join food$ f
on f.f_id=t1.f_id
where t1.frequency = (
	select max(frequency)
	from  temp t2
	where t2.user_id=t1.user_id)