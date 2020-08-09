SHOW GLOBAL VARIABLES;

SHOW GLOBAL VARIABLES LIKE '%char%';

SELECT @@GLOBAL.autocommit;

SHOW SESSION VARIABLES;

SET @name = 'John';

SET @COUNT = 100;
SELECT COUNT(*) FROM employees INTO @COUNT;
SELECT @COUNT;

SET @num1 = 1;
SET @num2 = 2;
SET @SUM = @num1 + @num2;
SELECT @SUM;

BEGIN 	
	DECLARE num1 INT DEFAULT 1;
	DECLARE num2 INT DEFAULT 2;
	DECLARE SUM INT;
	SET SUM = num1 + num2;
	SELECT SUM;
END

SELECT * FROM admin;


DELIMITER \\
CREATE PROCEDURE myp1()
BEGIN 
	INSERT INTO admin(username, `password`) VALUES ('Jack', '0005');
END \\

CALL myp1();


DELIMITER \\
CREATE PROCEDURE myp2(IN beautyName VARCHAR(20))
BEGIN 
	SELECT bo.*
	FROM beauty b LEFT JOIN boys bo
	ON b.boyfriend_id = bo.id
	WHERE b.name = beautyName;	
END \\

CALL myp2('小昭');


DELIMITER \\
CREATE PROCEDURE myp3(IN username VARCHAR(20), IN PASSWORD VARCHAR(20))
BEGIN 
	DECLARE res INT DEFAULT 0;
	SELECT COUNT(*) INTO res
	FROM admin a 
	WHERE a.username = username AND a.password = PASSWORD;
	
	SELECT if(res > 0, 'Success', 'Fail'); 
END \\

CALL myp3('Jack', '0005');


DELIMITER \\
CREATE PROCEDURE myp5(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20))
BEGIN 
	SELECT bo.boyName INTO boyName
	FROM beauty b JOIN boys bo
	ON b.boyfriend_id = bo.id
	WHERE b.name = beautyName;	
END \\ 

CALL myp5('小昭', @boyName);
SELECT @boyName;

DELIMITER \\
CREATE PROCEDURE myp4(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20), OUT userCP INT)
BEGIN 
	SELECT bo.boyName, bo.userCP INTO boyName, userCP
	FROM beauty b JOIN boys bo
	ON b.boyfriend_id = bo.id
	WHERE b.name = beautyName;
END \\

CALL myp4('小昭', @boyName, @userCP);
SELECT @boyName, @userCP;


DELIMITER \\
CREATE PROCEDURE myp6(INOUT a INT, INOUT b INT)
BEGIN 
	SET a = a * 2;
	SET b = b * 2;
END \\

SET @a = 1;
SET @b = 2;
CALL myp6(@a, @b);
SELECT @a, @b;


DELIMITER \\
CREATE PROCEDURE myp7(IN username VARCHAR(20), IN passwaord VARCHAR(20))
BEGIN 
	INSERT INTO admin VALUES (NULL, username, passwaord);
END \\

CALL myp7('Angela', '0009');


DELIMITER \\
CREATE PROCEDURE myp8(IN beautyID INT, OUT beautyName VARCHAR(20), OUT phone VARCHAR(20))
BEGIN 
	SELECT b.name, b.phone INTO beautyName, phone
	FROM beauty b
	WHERE b.id = beautyID;
END \\

CALL myp8(1, @beautyName, @phone);
SELECT @beautyName, @phone;

DELIMITER \\
CREATE PROCEDURE myp9(IN birth1 DATETIME, IN birth2 DATETIME, OUT res INT)
BEGIN 
	SELECT DATEDIFF(birth1, birth2) INTO res;
END \\

CALL myp9('2020-01-02', '2020-2-20', @res);
SELECT @res;

DROP PROCEDURE myp1;
DROP PROCEDURE myp2;
DROP PROCEDURE myp3;
DROP PROCEDURE myp4;
DROP PROCEDURE myp5;
DROP PROCEDURE myp6;
DROP PROCEDURE myp7;
DROP PROCEDURE myp8;
DROP PROCEDURE myp9;

SHOW CREATE PROCEDURE myp2;

DROP PROCEDURE myp10;

DELIMITER \\
CREATE PROCEDURE myp10(IN beautyName VARCHAR(20), OUT beautyBoyNames VARCHAR(20))
BEGIN 
	SELECT CONCAT(b.name, ' and ', IFNULL(bo.boyName, 'null')) INTO beautyBoyNames
	FROM beauty b JOIN boys bo
	ON b.boyfriend_id = bo.id
	WHERE b.name = beautyName;
END \\

CALL myp10('小昭', @beautyBoyNames);
SELECT @beautyBoyNames;


DELIMITER \\
CREATE PROCEDURE myp11(IN size INT, IN startIndex INT)
BEGIN 
	SELECT * FROM beauty LIMIT startIndex, size;
END \\

CALL myp11(3, 2);



