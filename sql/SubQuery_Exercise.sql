SELECT e.last_name, e.salary
FROM employees e
WHERE e.department_id = (
	SELECT e.department_id
	FROM employees e
	WHERE e.last_name = 'Zlotkey'
);


SELECT e.employee_id, e.last_name, e.salary
FROM employees e
WHERE e.salary > (
	SELECT AVG(salary)
	FROM employees e 
);


SELECT e.employee_id, e.last_name, e.salary
FROM employees e JOIN 
	(
		SELECT AVG(salary) AS s, e.department_id
		FROM employees e 
		GROUP BY e.department_id
	) AS AvgSalary
ON e.department_id = AvgSalary.department_id
WHERE e.salary > AvgSalary.s;


SELECT e.employee_id, e.last_name
FROM employees e
WHERE e.department_id IN (
	SELECT DISTINCT e.department_id
	FROM employees e
	WHERE e.last_name LIKE '%u%'
);


SELECT e.employee_id
FROM employees e 
WHERE e.department_id IN (
	SELECT DISTINCT d.department_id
	FROM departments d 
	WHERE d.location_id = 1700
);


SELECT e.last_name, e.salary
FROM employees e
WHERE e.manager_id IN (
	SELECT employee_id 
	FROM employees 
	WHERE last_name = 'K_ing'
);


SELECT CONCAT(e.first_name, ' ', e.last_name) AS NAME
FROM employees e 
WHERE e.salary = (
	SELECT MAX(salary)
	FROM employees e
);