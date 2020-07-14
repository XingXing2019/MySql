DESC employees;
DESC departments;

SELECT last_name, department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;


SELECT last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;


SELECT d.department_id, d.department_name, l.city
FROM departments d JOIN locations l 
ON d.location_id = l.location_id
WHERE d.department_id > 100;


SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.commission_pct IS NOT NULL;


SELECT d.department_name, l.city 
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE l.city LIKE '_o%';


SELECT l.city, COUNT(*)
FROM departments d JOIN locations l
ON d.location_id = l.location_id
GROUP BY l.city;


SELECT d.department_name, d.manager_id, MIN(Salary)
FROM employees e JOIN departments d
ON	e.department_id = d.department_id
WHERE e.commission_pct IS NOT NULL
GROUP BY d.department_id;


SELECT j.job_title, COUNT(*) AS 'Number'
FROM employees e JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_id
ORDER BY COUNT(*) DESC;


SELECT e.last_name, d.department_name, l.city
FROM employees e, departments d, locations l
Where e.department_id = d.department_id
AND d.location_id = l.location_id;


SELECT a.last_name Employee, b.last_name Manager
FROM employees a JOIN employees b
ON a.manager_id  = b.employee_id;




