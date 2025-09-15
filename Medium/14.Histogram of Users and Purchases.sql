with t1 as (
select transaction_date 
, user_id, 
row_number() over(partition by cast(transaction_date as DATE)) as conteo
from user_transactions
order by transaction_date ASC )
select transaction_date,user_id, COUNT(conteo) as purchase_count
from t1
WHERE transaction_date in (select max(transaction_date) as transaction_date
from user_transactions group by user_id)
group by user_id,transaction_date
order by transaction_date ASC
