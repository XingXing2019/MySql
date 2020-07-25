SELECT * FROM beauty;
INSERT INTO beauty (id, NAME, sex, borndate, phone, boyfriend_id) VALUES (13, 'Alice', 'F', '1990-4-23', '189888', 2);

INSERT INTO beauty (NAME, sex, id, phone) VALUES ('Angela', 'F', 14, '1282222');

INSERT INTO beauty VALUES (15, 'Jane', 'F', '1980-5-5', '138625465', NULL, 2);

INSERT INTO beauty 
SET id = 19, NAME = 'Ann', phone = '98999';

INSERT INTO beauty VALUES 
(20, 'Jane', 'F', '1980-5-5', '138625465', NULL, 2),
(21, 'Jane', 'F', '1980-5-5', '138625465', NULL, 2),
(22, 'Jane', 'F', '1980-5-5', '138625465', NULL, 2),
(23, 'Jane', 'F', '1980-5-5', '138625465', NULL, 2);

UPDATE beauty 
SET phone = '123456'
WHERE NAME LIKE 'A%';

UPDATE boys b
SET b.boyName = 'Tim', userCP = 1000
WHERE id = 1;

UPDATE boys bo INNER JOIN beauty b
ON bo.id = b.boyfriend_id
SET b.photo = '0000'
WHERE bo.boyName = '张无忌';


DELETE FROM ads;
DROP TABLE activity;


DELETE FROM beauty WHERE phone LIKE '%5';


DELETE b
FROM beauty b 
JOIN boys bo ON b.boyfriend_id = bo.id
WHERE bo.boyName = '黄晓明';

