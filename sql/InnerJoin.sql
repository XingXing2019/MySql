SELECT e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;


SELECT e.last_name, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE e.last_name LIKE '%e%';


SELECT l.city, COUNT(*) AS DepartmentNO
FROM departments d INNER JOIN locations l
ON d.location_id = l.location_id
GROUP BY l.city
HAVING COUNT(*) > 3;


SELECT d.department_name, COUNT(*) AS EmployeeNo
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC;


SELECT e.last_name, d.department_name, j.job_title
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id 
INNER JOIN jobs j ON e.job_id = j.job_id
ORDER BY d.department_name DESC;	


SELECT e.last_name, m.last_name
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.last_name LIKE '%k%';



