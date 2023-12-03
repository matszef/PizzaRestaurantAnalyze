select *
from pizza_sales
order by order_id asc

select 
sum(total_price) / count(distinct order_id) as AvgOrderValue
from pizza_sales

select 
sum(quantity) as TotalPizzaSold
from pizza_sales

select 
count(distinct order_id) as TotalOrders from pizza_sales

select 
cast(cast(sum(quantity) as decimal(10, 2)) / 
cast(count(distinct order_id)as decimal(10, 2)) as decimal(10,2)) as AvgPizzaPerOrder
from pizza_sales

select 
datename(dw, order_date) as OrderDay,
count(distinct order_id) as TotalOrders
from pizza_sales
group by datename(dw, order_date)

select 
DATEPART(hour, order_time) as OrderHour,
count(distinct order_id) as TotalOrders
from pizza_sales
group by DATEPART(hour, order_time)
order by DATEPART(hour, order_time)

select
pizza_category,
sum(total_price) as TotalSales,
sum(total_price) * 100 / 
						(select 
						sum(total_price) 
						from pizza_sales 
						where MONTH(order_date) = 2) as PercentageOfOrderedPizzaCategory
from pizza_sales
where MONTH(order_date) = 2
group by pizza_category

select 
pizza_size,
cast(sum(total_price) as decimal(10,2)) as TotalSales,
cast(sum(total_price) * 100 / (select
                          sum(total_price)
						  from pizza_sales
						  where DATEPART(quarter, order_date) = 1) as decimal(10,2)) as PercentageOfOrderedPizzaSizes
from pizza_sales
where DATEPART(quarter, order_date) = 1
group by pizza_size
order by 3 desc

select 
pizza_category,
sum(quantity) as TotalPizzasOrderedByCategory
from pizza_sales
group by pizza_category

select top 5
pizza_name,
sum(quantity) as TotalPizzasSold
from pizza_sales
group by pizza_name
order by 2 desc