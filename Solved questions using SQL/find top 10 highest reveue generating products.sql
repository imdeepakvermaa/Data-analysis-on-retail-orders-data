-- find top 10 highest reveue generating products 


select product_id,sum(cost_price) as sales
from retail_orders_data
group by product_id
order by sales desc Limit 10;