CREATE DATABASE IF NOT EXISTS Books;

ALTER DATABASE Books CHARACTER SET GBK;

DROP DATABASE if EXISTS Books

CREATE TABLE book(
	id INT,
	bName VARCHAR(20),
	price DOUBLE,
	authorId INT,
	publishDate DATETIME
);

CREATE TABLE author(
	id INT,
	au_name VARCHAR(20),
	nation VARCHAR(20)
);


ALTER TABLE book CHANGE COLUMN publishDate pub_date DATETIME;

ALTER TABLE book MODIFY COLUMN pub_date TIMESTAMP;

ALTER TABLE author ADD COLUMN salary DOUBLE; 

ALTER TABLE author DROP COLUMN salary;

DESC author

DROP TABLE if EXISTS author;


INSERT INTO author VALUES
(1, 'Tom', 'USA'),
(2, 'John', 'Australia'),
(3, 'Tim', 'New Zealand');

DROP TABLE copy;

CREATE TABLE copy1 LIKE author;

CREATE TABLE copy2 
SELECT * FROM author;


CREATE TABLE copy3
SELECT id, au_name
FROM author 
WHERE nation = 'USA';


CREATE TABLE copy4
SELECT id, au_name
FROM author
WHERE 0;


CREATE DATABASE IS NOT EXISTS test;

CREATE TABLE dept1 (
	id INT(7),
	name varchar(25)
);


CREATE TABLE dept2 
SELECT department_id, department_name
FROM myemployees.departments;


CREATE TABLE emp5(
	id INT(7),
	First_name VARCHAR(25),
	LAST_name VARCHAR(25),
	Dept_id INT(7)
);


ALTER TABLE emp5 CHANGE COLUMN LAST_name Last_name VARCHAR(50);

CREATE TABLE employees2
LIKE myemployees.employees;

DROP TABLE if EXISTS emp5;


ALTER TABLE employees2 RENAME TO emp5;


ALTER TABLE emp5 ADD COLUMN test_column VARCHAR(20);

ALTER TABLE emp5 DROP COLUMN test_column;


