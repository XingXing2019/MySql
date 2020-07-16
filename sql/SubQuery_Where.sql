SELECT * 
FROM employees 
WHERE salary > (
	SELECT salary
	FROM employees
	WHERE last_name = 'Abel'
);


SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (
	SELECT job_id
	FROM employees 
	WHERE employee_id = 141
) 
AND salary > (
	SELECT salary
	FROM employees 
	WHERE employee_id = 143
);


SELECT last_name, job_id, salary 
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees
);


SELECT department_id, MIN(salary)
FROM employees 
GROUP BY department_id
HAVING MIN(salary) > (
	SELECT MIN(salary)
	FROM employees
	WHERE department_id = 50
);


SELECT last_name 
FROM employees 
WHERE department_id IN (
	SELECT department_id
	FROM departments 
	WHERE location_id = 1400 OR location_id = 1700
);


SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (
	SELECT DISTINCT Salary
	FROM employees 
	WHERE job_id = 'IT_PROG'
) AND 
job_id <> 'IT_PROG';


SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (
	SELECT DISTINCT Salary
	FROM employees 
	WHERE job_id = 'IT_PROG'
) AND 
job_id <> 'IT_PROG';


SELECT * 
FROM employees 
WHERE employee_id = (
	SELECT MIN(employee_id)
	FROM employees 
) 
AND (
	SELECT MAX(salary)
	FROM employees
);


SELECT *
FROM employees
WHERE (employee_id, salary) = (
	SELECT MIN(employee_id), MAX(salary)
	FROM employees	
);

















