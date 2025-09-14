with t1 as (
SELECT
ticker, to_char(date,'Mon-YYYY') as highest_mth, open as highest_open,
row_number() over(PARTITION by ticker order by open desc) as ranking
from stock_prices 
order by ranking asc), t2 as (select
ticker, to_char(date,'Mon-YYYY') as lowest_mth, open as lowest_open,
row_number() over(PARTITION by ticker order by open asc) as ranking
from stock_prices 
order by ranking asc)
select t1.ticker as ticker, t1.highest_mth, t1.highest_open,
t2.lowest_mth, t2.lowest_open from t1
JOIN t2 on t1.ticker=t2.ticker
where t1.ranking =1 and t2.ranking=1
order by ticker asc
