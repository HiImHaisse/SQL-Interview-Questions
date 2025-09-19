WITH yearly_spend AS (
    SELECT
        EXTRACT(YEAR FROM transaction_date) AS year,
        product_id,
        ROUND(SUM(spend), 2) AS curr_year_spend
    FROM user_transactions
    GROUP BY EXTRACT(YEAR FROM transaction_date), product_id
),
spend_with_lag AS (
    SELECT
        year,
        product_id,
        curr_year_spend,
        LAG(curr_year_spend) OVER (PARTITION BY product_id ORDER BY year) AS prev_year_spend
    FROM yearly_spend
)
SELECT
    year,
    product_id,
    curr_year_spend,
    prev_year_spend,
    ROUND(
        CASE
            WHEN prev_year_spend IS NULL THEN NULL
            ELSE ((curr_year_spend - prev_year_spend) / prev_year_spend) * 100
        END, 2
    ) AS yoy_rate
FROM spend_with_lag
ORDER BY product_id, year;
