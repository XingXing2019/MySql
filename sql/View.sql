SELECT s.stu_name, m.major_name
FROM stu_info s INNER JOIN major m 
ON s.major_id = m.id
WHERE s.stu_name LIKE '%Tim';

CREATE VIEW v1
AS 
SELECT stu_name, major_name
FROM stu_info s INNER JOIN major m 
ON s.major_id = m.id;

SELECT * FROM v1
WHERE stu_name LIKE '%Tim';

DROP VIEW v1;

USE myemployees;

CREATE VIEW v1
AS 
SELECT e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id;

SELECT * FROM v1 WHERE last_name LIKE '%a%';


DROP VIEW aveSalary;

CREATE VIEW avgSalary
AS 
SELECT AVG(e.salary) AS ag, e.department_id
FROM employees e
GROUP BY e.department_id;

SELECT department_id, ag, jd.grade_level 
FROM avgSalary a JOIN job_grades jd
ON a.ag BETWEEN jd.lowest_sal AND jd.highest_sal;


SELECT d.*, a.ag
FROM avgsalary a LEFT JOIN departments d
ON a.department_id = d.department_id
ORDER BY a.ag
LIMIT 1;

CREATE VIEW minSalary
AS 
SELECT * FROM avgsalary a ORDER BY a.ag LIMIT 1;

SELECT d.* FROM departments d JOIN minSalary m ON d.department_id = m.department_id;

DROP VIEW avgsalary, v1, minSalary;


SHOW CREATE VIEW avgsalary;

