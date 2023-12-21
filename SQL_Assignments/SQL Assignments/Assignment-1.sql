CREATE DATABASE Assignment;
USE Assignment;
CREATE TABLE Countries(
	Country_name VARCHAR(30),
    Population INT,
    Country_capital VARCHAR(30)    
);
SELECT * FROM Countries;
INSERT INTO Countries VALUES("China",1382,"Beijing"),("India",1326,"Delhi"),
								("United States",324,"Washington D.C."),("Indonesia",260,"Jakarta"),
								("Brazil",209,"Brasilia"),("Pakistan",193,"Islamabad"),
								("Nigeria",187,"Abuja"),("Bangladesh",163,"Dhaka"),
								("Russia",143,"Moscow"),("Mexico",128,"Mexico City"),
								("Japan",126,"Tokyo"),("Philippines",102,"Manila"),
								("Ethiopia",101,"Addis Ababa"),("Vietnam",94,"Hanoi"),
								("Egypt",93,"Cairo"),("Germany",81,"Berlin"),
								("Iran",80,"Tehran"),("Turkey",79,"Ankara"),
								("Congo",79,"Kinshasa"),("France",64,"Paris"),
								("United Kingdom",65,"London"),("Italy",60,"Rome"),
								("South Africa",55,"Pretoria"),("Myanmar",54,"Naypyidaw");
INSERT INTO Countries VALUES("Cananda",187,"Ottawa"),("Spain",46,"Madrid"),
							("Uganda",87,"Kampala"),("Colombia",65,"Bogota"),
                            ("South Korea",23,"Seoul"),("Ukraine",63,"kyiv");
SET sql_safe_updates = 0;
UPDATE Countries SET Country_capital = "New Delhi" WHERE Country_name = "India";
ALTER TABLE Countries RENAME TO Big_countries;
SELECT * FROM Big_countries;
CREATE TABLE Product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name CHAR(50) UNIQUE NOT NULL,
    description TEXT(100),
    supplier_id INT UNIQUE NOT NULL
);
INSERT INTO Product VALUES(101,"Water Bottle","It is a drinking water bottle which can hold upto 2l",1001),
							(102,"Book","This book contains the key to sustainable development",1002),
                            (103,"Table","It is a study table which is made up of wood",1003),
                            (104,"TV","This TV is consists of 4K resolution",1004);
SELECT * FROM Product;

CREATE TABLE Suppliers(
	supplier_id INT AUTO_INCREMENT,
    FOREIGN KEY(supplier_id) REFERENCES Product(supplier_id),
    supplier_name CHAR(30),
    location VARCHAR(30) DEFAULT("INDIA")
);
INSERT INTO Suppliers VALUES(1001,"Ravi","Mysore"),(1004,"George","Goa"),
							(1003,"Ram","Ayodhya"),(1002,"Laxman","Ayodhya");
SELECT * FROM Suppliers;

CREATE TABLE Stock(
	stock_id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES Product(product_id),
    balance_stock INT
);
INSERT INTO Stock VALUES(101,101,20),(102,102,10),(103,103,15),(104,104,5);
SELECT * FROM Stock;
ALTER TABLE Suppliers MODIFY supplier_name CHAR(30) UNIQUE NOT NULL; 
ALTER TABLE emp ADD COLUMN Dept_no INT;
SELECT * FROM emp;
SET sql_safe_updates = 0;
UPDATE emp SET Dept_no = 
				CASE
					WHEN emp_no % 2 = 0 THEN 20
                    WHEN emp_no % 3 = 0 THEN 30
                    WHEN emp_no % 4 = 0 THEN 40
                    WHEN emp_no % 5 = 0 THEN 50
						ELSE 10
				END;
CREATE UNIQUE INDEX uid_emp_id ON emp(emp_no);
CREATE VIEW emp_sal AS SELECT emp_no,first_name,last_name,salary FROM emp ORDER BY salary DESC;
SELECT * FROM emp_sal;