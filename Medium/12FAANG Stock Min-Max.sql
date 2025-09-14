with t1 as (
SELECT
ticker, to_char(date,'Mon-YYYY') as highest_mth, open as highest_open,
row_number() over(PARTITION by ticker order by open desc) as ranking
from stock_prices 
order by ranking asc), t2 as (
SELECT
ticker, to_char(date,'Mon-YYYY') as lowest_mth, low as lowest_open,
row_number() over(PARTITION by ticker order by open ASC) as ranking
from stock_prices 
order by ranking asc), t3 as (
select ticker,highest_mth,highest_open from t1
where ranking=1), t4 as (
select ticker,lowest_mth,lowest_open from t2
where ranking=1) 
select t2.ticker,t1.highest_mth,t1.highest_open,t2.lowest_mth,t2.lowest_open
from t1
inner join t2 on t1.ticker=t2.ticker
