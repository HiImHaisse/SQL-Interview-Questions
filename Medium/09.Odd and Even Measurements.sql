with t1 as ( 
SELECT measurement_time,DATE_TRUNc('day',measurement_time) as date , measurement_value,
row_number() over(partition by DATE_TRUNc('day',measurement_time) order by measurement_time )
as ranking
from measurements), t2 as (
select date, sum(measurement_value) as even_sure
from t1 
where ranking in(2,4,6) 
group by date), t3 as (
select date, sum(measurement_value) as odd_sure
from t1 
where ranking in(1,3,5) 
group by date)
select t2.date,t3.odd_sure, t2.even_sure 
from t2
inner join t3 on t2.date=t3.date
order by t2.date
