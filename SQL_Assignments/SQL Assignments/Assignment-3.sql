USE Assignment;
SELECT * FROM payments;

SELECT c.customerNumber, c.customerName, purchase_status(c.customerNumber) AS purchase_status FROM customers c;

SELECT * FROM movies;
SELECT * FROM rentals;

DELIMITER //
CREATE TRIGGER delete_cascade
AFTER DELETE on movies FOR EACH ROW 
BEGIN
	UPDATE rentals
	SET movieid = NULL
	WHERE movieid
	NOT IN	( SELECT distinct id FROM movies );
END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_cascade;
SELECT * FROM movies;
INSERT INTO movies ( id, title, category ) VALUES ( 11, 'The Dark Knight', 'Action/Adventure');
INSERT INTO rentals ( memid, first_name, last_name, movieid ) VALUES ( 9, 'Moin', 'Dalvi', 11 );
SET sql_safe_updates = 0;
DELETE FROM movies WHERE id = 11;
SELECT id FROM movies;
SELECT * FROM rentals;

DELIMITER //
CREATE TRIGGER update_cascade
AFTER UPDATE on movies FOR EACH ROW 
BEGIN
UPDATE rentals
SET movieid = new.id
WHERE movieid = old.id;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_cascade;
INSERT INTO movies ( id, title, category ) VALUES ( 12, 'The Dark Knight', 'Action/Adventure'); 
UPDATE rentals SET movieid = 12 WHERE memid = 9;
UPDATE movies SET id = 11 WHERE title REGEXP 'Dark Knight';
SELECT * FROM movies;
SELECT * FROM rentals;

SELECT * FROM employee;
SELECT * FROM employee ORDER BY salary DESC LIMIT 3;
SELECT *, dense_rank() OVER (ORDER BY salary DESC) AS rank_salary FROM employee;