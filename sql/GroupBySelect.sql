DESC employees;


SELECT AVG(salary), job_id
FROM employees
GROUP BY job_id;


SELECT COUNT(*), manager_id
FROM employees
WHERE manager_id IS NOT NULL 
GROUP BY manager_id;


SELECT MAX(salary) MaxSalary, department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;


SELECT AVG(salary) AvgSalary, manager_id
FROM employees
WHERE commission_pct IS NOT NULL	
GROUP BY manager_id;


SELECT COUNT(*) EmployeeNo, department_id
FROM employees
GROUP BY department_id
HAVING EmployeeNo > 5;


SELECT MAX(salary) AS MaxSalary, job_id
FROM employees
WHERE commission_pct IS NULL	
GROUP BY job_id
HAVING MaxSalary > 12000;


SELECT manager_id, MIN(salary) AS MinSalary
FROM employees
WHERE manager_id > 102
GROUP BY manager_id
HAVING MinSalary > 3000;


SELECT job_id, MAX(salary) AS MaxSalary
FROM employees
WHERE commission_pct IS null
GROUP BY job_id
HAVING MaxSalary > 6000
ORDER BY MaxSalary ASC;


SELECT MIN(salary) AS MinSalary, job_id, department_id
FROM employees
GROUP BY job_id, department_id
ORDER BY MinSalary DESC;














