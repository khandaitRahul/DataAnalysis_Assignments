##1 Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 

set sql_safe_updates=0;

select* from orders;
Delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Call_Order_Status`(year_par INT,  month_par INT)
BEGIN
     SELECT orderNumber, orderDate, status
     FROM orders
     WHERE MONTH(orderDate)=month_par AND YEAR(orderDate) = year_par;
END
DELIMITER;
##2a Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

DELIMITER $$
CREATE FUNCTION get_customer_status(cust_num INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE status VARCHAR(20);
DECLARE total_purchase DECIMAL(10,2);

SELECT SUM(amount) INTO total_purchase FROM Payments WHERE customerNumber = cust_num;

IF total_purchase < 25000 THEN
    SET status = 'Silver';
ELSEIF total_purchase BETWEEN 25000 AND 50000 THEN
    SET status = 'Gold';
ELSEIF total_purchase > 50000 THEN
    SET status = 'Platinum';
END IF;

RETURN status;
END $$
DELIMITER ;
 
 ##b Write a query that displays customerNumber, customername and purchase_status from customers table.
SELECT c.customerNumber, c.customerName, get_customer_status(c.customerNumber) AS purchase_status
FROM customers c;

##3-> Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

DELIMITER //
CREATE TRIGGER delete_cascade
AFTER DELETE on movies
FOR EACH ROW 
BEGIN
UPDATE rentals
SET movieid = NULL
WHERE movieid
NOT IN
	  ( SELECT distinct id
		FROM movies );
END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_cascade;

SELECT *
FROM movies;

INSERT INTO movies ( id, title, category ) VALUES ( 11, 'The Dark Knight', 'Action/Adventure');

INSERT INTO rentals ( memid, first_name, last_name, movieid ) VALUES ( 9, 'Moin', 'Dalvi', 11 );

DELETE FROM movies
WHERE id = 11;

SELECT id
FROM movies;
    
SELECT *
FROM rentals;

DELIMITER //
CREATE TRIGGER update_cascade
AFTER UPDATE on movies
FOR EACH ROW 
BEGIN
UPDATE rentals
SET movieid = new.id
WHERE movieid = old.id;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_cascade;
        
INSERT INTO movies ( id, title, category ) VALUES ( 12, 'The Dark Knight', 'Action/Adventure'); 

UPDATE rentals
SET movieid = 12
WHERE memid = 9;

UPDATE movies
SET id = 11
WHERE title REGEXP 'Dark Knight';

SELECT *
FROM movies;

SELECT *
FROM rentals;

##4 Select the first name of the employee who gets the third highest salary. [table: employee]

SELECT MIN(salary) 
FROM (SELECT *
      FROM employee
      ORDER BY salary DESC
      LIMIT 3) AS 3rd_Highest_Slary;
      
##5-> Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]

SELECT *, 
DENSE_RANK () OVER (ORDER BY salary DESC) AS Rank_salary 
FROM employee;






