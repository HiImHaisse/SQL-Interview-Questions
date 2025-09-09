select user_id,spend,transaction_date
from (
select user_id,spend,transaction_date,
row_number() over( partition by user_id order by transaction_date ASC) as conteo
FROM transactions) as conteo
where conteo=3
