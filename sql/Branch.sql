DELIMITER \\
CREATE PROCEDURE myProc(IN score INT)
BEGIN
	case 
	when score >= 90 AND score <= 100 then SELECT 'A';
	when score >= 80 then SELECT 'B';
	when score >= 70 then SELECT 'C';
	when score >= 60 then SELECT 'D';
	ELSE SELECT 'D';
	END case;
END \\

CALL myProc(85);


DELIMITER \\
CREATE FUNCTION test_if(score INT) RETURNS CHAR
BEGIN 
	if score >= 90 AND score <= 100 then RETURN 'A';
	ELSEIF score >= 80 then RETURN 'B';
	ELSEIF score >= 60 then RETURN 'C';
	ELSE RETURN 'D';
	END IF;
END \\

SELECT test_if(80);


DELIMITER \\
CREATE PROCEDURE pro_while1(IN insertCount INT)
BEGIN 
	DECLARE i INT DEFAULT 1;
	while i <= insertCount do
		INSERT INTO admin(username, password) VALUES (CONCAT('Rose', i), '66');
		SET i = i + 1;
	END while;
END \\

CALL pro_while1(100);

DELETE FROM admin;
DROP PROCEDURE pro_while2;
DELIMITER \\
CREATE PROCEDURE pro_while2(IN insertCount INT)
BEGIN 
	DECLARE i INT DEFAULT 1;
	a: while i <= insertCount DO 
			INSERT INTO admin(username, PASSWORD) VALUES (CONCAT('Rose', i), '666');
			if i >= 20 then leave a;
			END if;
			SET i = i + 1;
		END while a;
END \\	

CALL pro_while2(100);
SELECT * FROM admin;

TRUNCATE TABLE admin;
DROP PROCEDURE pro_while3;
DELIMITER \\
CREATE PROCEDURE pro_while3(IN insertCount INT)
BEGIN 
	DECLARE i INT DEFAULT 1;
	a: while i <= insertCount DO 
			SET i = i + 1;
			INSERT INTO admin(username, PASSWORD) VALUES (CONCAT('Rose', i), '666');
			if MOD(i, 2) != 0 then iterate a;
			END if;			
		END while a;
END \\

CALL pro_while3(100);

SELECT * FROM admin;

SHOW PROCESSLIST;
KILL 9;

DROP TABLE If EXISTS stringcontent;
CREATE TABLE if NOT EXISTS stringContent (
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(26)
);

DROP PROCEDURE test_randstr_insert;
DELIMITER \\
CREATE PROCEDURE test_randstr_insert(IN insertCount INT)
BEGIN 
	DECLARE i INT DEFAULT 1;
	DECLARE str VARCHAR(26) DEFAULT 'abcdefghijklmnopqrstuvwxyz';
	DECLARE startIndex INT DEFAULT 1;
	DECLARE len INT DEFAULT 1;
	while i < insertCount DO 	
		SET len = FLOOR(RAND() * (20 - startIndex + 1) + 1);
		SET startIndex = FLOOR(RAND() * 26 + 1);		
		INSERT INTO stringcontent(content) VALUES (SUBSTR(str, startIndex));		
		SET i = i + 1;
	END while;
END \\

CALL test_randstr_insert(10);
