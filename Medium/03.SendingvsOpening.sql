with t1 as(
SELECT user_id,sum(CAST(time_spent AS DECIMAL(10,2))) as send 
from activities
where activity_type='send'
GROUP BY user_id

), t2 as (
SELECT user_id,sum(CAST(time_spent AS DECIMAL(10,2))) as open
from activities 
where activity_type='open'
GROUP BY user_id)

  /* Multiplicar antes de escalar */
select ad.age_bucket,round(t1.send/(t1.send + t2.open)*100.0,2) as send_perc ,
round(t2.open/(t1.send+t2.open)*100.0,2) as open_perc
from t1

INNER JOIN t2 on t1.user_id=t2.user_id
INNER JOIN age_breakdown as ad ON t1.user_id=ad.user_id

order by age_bucket desc
