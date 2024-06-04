
-- for each category which month had highest sales 


with cte as (
select category,format(order_date,'yyyyMM') as order_year_month
, sum(cost_price) as sales 
from retail_orders_data
group by category,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a
where rn=1;