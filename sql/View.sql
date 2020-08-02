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

CREATE OR REPLACE VIEW emp_v1
AS 
SELECT e.last_name, e.salary, e.email
FROM employees e
WHERE e.phone_number LIKE '011%';

CREATE OR REPLACE VIEW emp_v2
AS
SELECT d.*
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id
HAVING MAX(e.salary) > 12000;


CREATE OR REPLACE VIEW  myv1
AS SELECT last_name, email
FROM employees;

SELECT * FROM myv1;

#Insert
INSERT INTO myv1 VALUES('Tim', 'tim@unsw.edu.au');

#Update
UPDATE myv1 SET last_name = 'Tom' WHERE last_name = 'Tim';

#Delete
DELETE FROM myv1 WHERE last_name = 'Tom';




