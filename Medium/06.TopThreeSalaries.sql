with t1 as (
SELECT employee_id, 
name,
salary,
department_id,
dense_rank() over(partition by department_id order by salary DESC) as ranking
from employee
order by ranking,name)
select t2.department_name,t1.name,t1.salary from t1
inner join department as t2 ON t1.department_id= t2.department_id
where ranking BETWEEN 1 and 3
order by department_name,salary desc
