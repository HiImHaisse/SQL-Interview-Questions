Final Account Balance
PayPal SQL Interview Question

with depositado as (
SELECT account_id, sum(amount) as depositado
FROM transactions
WHERE transaction_type='Deposit'
group by account_id
),retirado as (SELECT account_id, sum(amount) as retirado
FROM transactions
WHERE transaction_type='Withdrawal'
group by account_id)
select rt.account_id, dp.depositado-rt.retirado as final_balance from depositado as dp 
JOIN retirado as rt ON dp.account_id= rt.account_id 
