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