select DISTINCT extract('MONTH' from event_date) as mth, 
count(event_type) OVER(
PARTITION by extract('MONTH' from event_date) 
rows BETWEEN 1 PRECEDING and current row)
as monthly_active_users
from user_actions
where extract('MONTH' from event_date::DATE)=7 and extract('YEAR' from event_date::DATE)=2022
order by monthly_active_users DESC
LIMIT 1
