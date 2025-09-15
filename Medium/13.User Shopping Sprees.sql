with t1 as (select user_id, amount, transaction_date,
row_number() over(partition by user_id )
from transactions
order by row_number desc)
select user_id from t1
where row_number >=3
