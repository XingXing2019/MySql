SELECT *
FROM employees 
WHERE email LIKE '%a%' OR department_id > 90;


SELECT *
FROM employees 
WHERE email LIKE '%a%'
UNION 
SELECT *
FROM employees 
WHERE department_id > 90;