SELECT 
  ROUND(
    (SUM(CASE WHEN call_category IS NULL OR call_category = 'n/a' THEN 1 ELSE 0 END) * 100.0) 
    /COUNT(*), 
    1
  ) AS porcentaje_no_categorizadas
FROM callers
