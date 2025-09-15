with t1 as (
SELECT item_count,order_occurrences,
dense_rank()over(order by order_occurrences desc ) as ranking
FROM items_per_order)
select item_count as mode from t1
where ranking=1
