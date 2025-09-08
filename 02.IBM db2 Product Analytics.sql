IBM db2 Product Analytics
with conteo_queries as(SELECT count(DISTINCT query_id) as unique_queries,
employee_id 
from queries
WHERE query_starttime >= '2023-07-01T00:00:00Z'
  AND query_starttime < '2023-10-01T00:00:00Z'
group by employee_id)
select COALESCE(cq.unique_queries,0) as unique_queries,
count(e.employee_id) as employee_count from employees as e
left join conteo_queries as cq ON e.employee_id=cq.employee_id
group by unique_queries
order by unique_queries ASC
