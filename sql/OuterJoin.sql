SELECT a.name, b.*
FROM beauty a LEFT OUTER JOIN boys b
ON	a.boyfriend_id = b.id
WHERE b.id IS NULL;	


SELECT b.name, a.*
FROM boys a RIGHT OUTER JOIN beauty b
ON a.id = b.boyfriend_id
WHERE a.id IS NULL;


SELECT d.*, e.employee_id
FROM departments d LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


SELECT d.*, e.employee_id
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;


SELECT a.id, b.*
FROM beauty a LEFT JOIN boys b 
ON a.boyfriend_id = b.id
WHERE a.id > 3
ORDER BY a.id;


SELECT b.id, a.*
FROM boys a RIGHT JOIN beauty b
ON a.id = b.boyfriend_id
WHERE b.id > 3;


SELECT l.city
FROM locations l LEFT JOIN departments d
ON l.location_id = d.location_id
WHERE d.department_id IS NULL;


SELECT e.*, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'SAL' OR d.department_name = 'IT';


SELECT e.*, d.department_name
FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id
WHERE d.department_name = 'SAL' OR d.department_name = 'IT';

