DELIMITER \\
CREATE FUNCTION func1() RETURNS INT 
BEGIN
	DECLARE c INT DEFAULT 0;
	SELECT COUNT(*) INTO c FROM employees;
	RETURN c;
END \\

SELECT func1();

DELIMITER \\
CREATE FUNCTION func2(empName VARCHAR(20)) RETURNS DOUBLE 
BEGIN 
	SET @salary = 0;
	SELECT e.salary INTO @salary
	FROM employees e
	WHERE e.last_name = empName;
	RETURN @salary;
END \\

SELECT func2('Kochhar');

DELIMITER \\
CREATE FUNCTION func3(deptName VARCHAR(20)) RETURNS DOUBLE 
BEGIN
	SET @sal = 0;
	SELECT AVG(e.salary) INTO @sal
	FROM employees e JOIN departments d
	ON e.department_id = d.department_id
	WHERE d.department_name = deptName;
	RETURN @sal;
END \\

SELECT func3('IT');


SHOW CREATE FUNCTION func3;

DROP FUNCTION func1;
DROP FUNCTION func2;
DROP FUNCTION func3;

DELIMITER \\
CREATE FUNCTION test_func1(num1 FLOAT, num2 FLOAT) RETURNS FLOAT
BEGIN 
	DECLARE SUM FLOAT DEFAULT 0;
	SET SUM = num1 + num2;
	RETURN SUM;
END \\

SELECT test_func1(1, 2);
