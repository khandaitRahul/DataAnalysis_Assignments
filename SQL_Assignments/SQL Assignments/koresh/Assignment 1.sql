create database assignment;
use assignment;


##Q3
CREATE TABLE COUNTRIES(
NAME CHAR(30),
POPULATION INT,
CAPITAL VARCHAR(30)
);
##Q3A
INSERT INTO COUNTRIES VALUES ('CHINA',1382,'BEJING'),
							('INDIA',1326,'DELHI'),
                            ('UNITED STATES',324,'WASHINGTON D.C'),
                            ('INDONESIA',260,'JAKARTA'),
                            ('BRAZIL',209,'BRASILIA'),
                            ('Pakistan',193,'Islamabad'),
                            ('Nigeria',	187,'AbujaNigeria'),
                            ('Bangladesh',163, 'Dhaka'),
                            ('Russia',143,'Moscow'),
                            ('Mexico',128,'Mexico City');
##Q3B
INSERT INTO COUNTRIES VALUES ('Myanmar',54,'Naypyidaw'),
							('South Africa',55,'Pretoria'),
                            ('United Kingdom',65,'London');

##Q3C

SET SQL_SAFE_UPDATES =0;
UPDATE  COUNTRIES SET CAPITAL ='NEW DELHI' WHERE NAME = 'INDIA';
##Q4
ALTER TABLE COUNTRIES RENAME big_countries ;
select * from Big_COUNTRIES;

#Q5A
CREATE TABLE Product(
Product_id INT PRIMARY KEY auto_increment,
Product_name varchar(30) not null,
supplier_id INT ,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
##Q5B
CREATE TABLE Suppliers(
supplier_id INT PRIMARY KEY,
supplier_name CHAR(30),
location VARCHAR(30)
);
##Q5C
 CREATE TABLE Stock(
 ID INT PRIMARY KEY,
 product_id INT,
 balance_stock INT
 ) ;  
 INSERT INTO Product VALUES (1,'CHICKEN',201),
							(2,'FISH',202);
 INSERT INTO   Suppliers VALUES (201,'APAN','KOLKATA'),
								(202,'RAMULU','BHUBANESWAR');
SELECT * FROM Suppliers;

INSERT INTO Stock VALUES (4,1,10000),
						(5,2,12000);
SELECT * FROM Stock;
##Q7

ALTER TABLE Suppliers MODIFY supplier_name VARCHAR(30) UNIQUE NOT NULL;

#Q8a
ALTER TABLE emp ADD COLUMN deptno INT;
DESC emp;

##8b
UPDATE emp
SET deptno = 
(CASE 
WHEN emp_no % 2 = 0 THEN 20
WHEN emp_no % 3 = 0 THEN 30
WHEN emp_no % 4 = 0 THEN 40
WHEN emp_no % 5 = 0 THEN 50
ELSE 10
END);
SELECT * FROM emp;

##Q9
CREATE UNIQUE INDEX EmpIndex ON employee(empid);

##Q10
CREATE VIEW emp_sal as
SELECT emp_no, first_name, last_name, salary
FROM emp
ORDER BY salary DESC;

# Checking the created view-> 
SELECT * FROM emp_sal;

