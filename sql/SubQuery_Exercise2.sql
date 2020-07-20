SELECT e.last_name, e.salary
FROM employees e
WHERE e.salary = (
	SELECT MIN(salary)
	FROM employees e
);


SELECT e.last_name 
FROM employees e 
WHERE e.employee_id IN (
	SELECT e.manager_id
	FROM employees e
);


SELECT *
FROM departments d 
WHERE d.department_id = 
(SELECT e.department_id
FROM employees e 
GROUP BY e.department_id
ORDER BY AVG(salary)
LIMIT 1);


SELECT d.`*`, ag.s
FROM departments d JOIN (
SELECT AVG(salary) s, e.department_id
FROM employees e 
GROUP BY e.department_id) AS ag
ON d.department_id = ag.department_id
ORDER BY s
LIMIT 1;


SELECT AVG(e.salary) AS AvgSalary, j.*
FROM jobs j JOIN employees e
ON j.job_id = e.job_id
GROUP BY j.job_id
ORDER BY AvgSalary DESC
LIMIT 1;


SELECT *
FROM (
SELECT AVG(salary) AS ag, d.*
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
) AS a
WHERE a.ag > (
SELECT AVG(e.salary)
FROM employees e)


SELECT *
FROM employees
WHERE employee_id 
IN (
SELECT manager_id
FROM employees
);


SELECT MIN(salary)
FROM employees e
WHERE e.department_id = (
SELECT e.department_id
FROM employees e 
GROUP BY e.department_id
ORDER BY MAX(salary)
LIMIT 1);

SELECT e.last_name, e.department_id, e.email, e.salary
FROM employees e
WHERE e.employee_id = (
		SELECT manager_id
		FROM departments d
		WHERE d.department_id = (
		SELECT e.department_id
		FROM employees e
		GROUP BY e.department_id
		ORDER BY AVG(salary) DESC
		LIMIT 1
	)
);















