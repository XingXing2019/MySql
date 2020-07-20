SELECT *
FROM employees
LIMIT 5;


SELECT *
FROM employees 
LIMIT 10, 15;


SELECT *
FROM employees e
WHERE e.commission_pct IS NOT NULL
ORDER BY e.salary DESC
LIMIT 10;