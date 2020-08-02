DROP TABLE if EXISTS acount;
CREATE TABLE If NOT EXISTS acount(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(20),
	balance DOUBLE
);

INSERT INTO acount (username, balance) VALUES 
('Tom', 1000),
('John', 1000);

SET autocommit = 0;
START TRANSACTION; 
UPDATE acount SET balance = 500 WHERE username = 'Tom';
UPDATE acount SET balance = 1500 WHERE username = 'John';

COMMIT;

SELECT * FROM acount;

SELECT @@tx_isolation;

SET autocommit = 0;
START TRANSACTION;
DELETE FROM acount WHERE id = 1;
SAVEPOINT a;
DELETE FROM acount WHERE id = 2;
ROLLBACK TO a;

ALTER	TABLE acount RENAME TO account;