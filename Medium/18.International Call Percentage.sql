with t1 as (
select DISTINCT caller_id, country_id from phone_info
order by caller_id asc), paises as (
select t2.caller_id,t1.country_id,t2.receiver_id, t3.country_id as country_receiver from phone_calls as t2
inner join t1 on t2.caller_id=t1.caller_id
inner join t1 as t3 on t2.receiver_id=t3.caller_id
order by t2.caller_id ASC)
select 
Round(
CAST(
sum(case when country_id=country_receiver then 0 else 1 END)*100.0/count(*)
AS DECIMAL(10,3))
,1) as international_calls_pct
from paises

/* Usar 100.0 cuando se multiplique decimales porque de lo contario se pierde el decimal, adicional se puede hacer 2 conexione
en una sola tabla con la misma tabla */
