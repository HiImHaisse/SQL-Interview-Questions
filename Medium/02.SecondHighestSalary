select t1.salary as second_highest_salary from (
select employee_id,salary,
dense_rank() over(order by salary DESC) as second_highest_salary
from employee) as t1
where second_highest_salary=2
