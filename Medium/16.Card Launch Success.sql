with t1 as(
select card_name, issued_amount,
dense_rank() over(partition by card_name order by issued_amount asc ) as rank
from monthly_cards_issued)
select card_name, issued_amount from t1 
where rank=1
order by issued_amount desc
