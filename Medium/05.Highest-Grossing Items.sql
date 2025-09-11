with t1 as (
select category,product, sum(cast(spend as float)) as total_spend, 
rank() over(partition by category order by spend DESC ) as ranking
from product_spend
where extract(year from transaction_date)=2022
group by category,product)
select category,product,total_spend from t1
where ranking BETWEEN 1 and 2
order by CATEGORY,total_spend DESC
