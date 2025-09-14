with t1 as (
SELECT
ticker, to_char(date,'Mon-YYYY') as highest_mth,
max(open) over(PARTITION by ticker) as highest_open
from stock_prices 
order by date desc), t2 as (
SELECT
ticker, to_char(date,'Mon-YYYY') as date,max(open) over(PARTITION by ticker)
from stock_prices
order by date desc)
select t1.ticker, t1.highest_mth,t1.highest_open,t2.lowest_mth,t2.lowest_open
from t1
inner join t2 on t1.ticker=t2.ticker
