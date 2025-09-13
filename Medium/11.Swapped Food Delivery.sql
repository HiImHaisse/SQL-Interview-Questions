with impares as(
select item,row_number()over()*2-1 as corrected_order_id  
from orders
where order_id%2=0),pares as (select item, order_id,
row_number() over()as corrected_order_id, 
count(*) over() as total_filas
from orders
where order_id%2=1), ultimo_impar as (
select CASE when p.corrected_order_id= p.total_filas then up.order_id else
p.corrected_order_id*2 end as corrected_order_id,p.item
from pares as p
join  orders as up ON p.order_id= up.order_id
) 
SELECT corrected_order_id,item  FROM ultimo_impar
UNION ALL 
select corrected_order_id,item from impares
order by corrected_order_id
