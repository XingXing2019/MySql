SELECT d.*, (
	SELECT COUNT(*)
	FROM employees e 
	WHERE e.department_id = d.department_id
) AS EmployeeNo
FROM departments d;


SELECT d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 102;


SELECT (
	SELECT d.department_name
	FROM  employees e JOIN departments d
	ON e.department_id = d.department_id
	WHERE e.employee_id = 102
) AS DepartmentName;


SELECT avg_dep.AvgSalary, avg_dep.department_id, g.grade_level
FROM (
		SELECT AVG(salary) AvgSalary, e.department_id
		FROM employees e
		GROUP BY e.department_id
	) AS avg_dep JOIN job_grades g
	ON avg_dep.AvgSalary BETWEEN g.lowest_sal AND g.highest_sal;


SELECT d.department_name
FROM departments d
WHERE EXISTS(
	SELECT * 
	FROM employees e 
	WHERE d.department_id = e.department_id
);


SELECT d.department_name
FROM departments d
WHERE d.department_id IN (
	SELECT e.department_id
	FROM employees e
);


SELECT b.*
FROM boys b
WHERE b.id NOT IN (
	SELECT boyfriend_id
	FROM beauty 
);


SELECT b.*
FROM boys b
WHERE NOT EXISTS (
	SELECT boyfriend_id
	FROM beauty 
	WHERE b.id = boyfriend_id
);