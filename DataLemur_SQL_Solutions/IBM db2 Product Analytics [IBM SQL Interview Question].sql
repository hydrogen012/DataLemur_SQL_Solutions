WITH query_count AS (
  SELECT 
    e.employee_id,
    COALESCE(COUNT(DISTINCT q.query_id),0) as unique_queries
  FROM employees e
  LEFT JOIN queries q
  ON e.employee_id = q.employee_id
    AND EXTRACT(MONTH FROM q.query_starttime) >= 7 
    AND EXTRACT(MONTH FROM q.query_starttime) < 10
  GROUP BY e.employee_id
)

SELECT 
  unique_queries,
  COUNT(employee_id) as employee_count
FROM query_count
GROUP BY unique_queries
ORDER BY unique_queries