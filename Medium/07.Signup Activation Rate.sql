WITH t3 as (
SELECt t1.email_id,t1.user_id,t1.signup_date,t2.text_id,t2.signup_action from emails as t1
inner join texts as t2 on t1.email_id=t2.email_id
), t4 as (
select 
sum(case when signup_action='Confirmed' then 1 else 0 END) as confirmed,
sum(case when signup_action='Not Confirmed' then 1 else 1 end) as total
from t3)
select ROUND(CAST(confirmed AS decimal(10,2))/CAST(total AS decimal(10,2)),2) as confirm_rate
from t4
/* Los case si quieren se usados deben ser almacenados como un valor y se le deba asignar eltipo de valor con cast */
