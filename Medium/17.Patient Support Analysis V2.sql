select 
ROUND(
CAST(sum(case when call_category='n/a' or call_category is null 
then 1 else 0 END) AS DECIMAL(10,2))*100.0/
COUNT(case_id)
,1) AS uncategorised_call_pct
from callers
