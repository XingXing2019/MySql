SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d 
WHERE e.department_id = d.department_id;


SELECT e.job_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id 
AND d.department_id = 90;


SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.commission_pct IS NOT NULL;


SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.city = 'Toronto';


SELECT j.job_title, MIN(e.salary)
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id
GROUP BY j.job_id, d.department_id;


SELECT l.country_id, COUNT(*) DepartmentNo
FROM departments d, locations l 
WHERE d.location_id = l.location_id
GROUP BY l.country_id
HAVING COUNT(*) > 2;


SELECT e.last_name "EmpName", e.employee_id "Emp#", m.last_name "MgrName", m.employee_id "Mgr#"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;







