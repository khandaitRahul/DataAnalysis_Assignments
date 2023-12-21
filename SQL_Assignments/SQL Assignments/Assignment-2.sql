USE Assignment;
SELECT * FROM emp WHERE salary > 3000 AND Dept_no = 10;
SELECT * FROM students;
ALTER TABLE students ADD COLUMN grade VARCHAR(15);
UPDATE students
		SET grade = CASE
			WHEN marks BETWEEN 40 AND 50 THEN "Third Class"
            WHEN marks BETWEEN 51 AND 60 THEN "Second Class"
            WHEN marks BETWEEN 61 AND 80 THEN "First Class"
            WHEN marks BETWEEN 81 AND 100 THEN "Distinctions"
            ELSE "Failed"
		END;
SET sql_safe_Updates = 0;
SELECT * FROM students;
SELECT COUNT(*) AS Students_Graduated_with_FirstClass FROM students WHERE grade="First Class";
SELECT COUNT(*) AS Students_Obtained_Distinctions FROM students WHERE grade="Distinctions";
SELECT * FROM station;
SELECT * FROM station WHERE id % 2 = 0 GROUP BY id,city,state,lat_n,long_w HAVING COUNT(*)=1;
SELECT COUNT(city) AS City FROM station;
SELECT COUNT(DISTINCT(city)) AS DistinctCity FROM station;
SELECT COUNT(city) - COUNT(DISTINCT(city)) AS Diff_Btw FROM station;
SELECT DISTINCT(city) FROM station WHERE UPPER(LEFT(city,1)) IN ("A","E","I","O","U") ORDER BY city ASC;
SELECT DISTINCT(city) FROM station WHERE UPPER(LEFT(city,1)) IN ("A","E","I","O","U") AND UPPER(RIGHT(city,1)) IN ("A","E","I","O","U") ORDER BY city DESC;
SELECT DISTINCT(city) FROM station WHERE LOWER(city) NOT REGEXP '^[aeiou]'GROUP BY city ORDER BY city ASC;
SELECT DISTINCT(city) FROM station WHERE LOWER(city) NOT REGEXP "^[aeiou]" AND lower(city) NOT REGEXP "[aeiou]$" GROUP BY city ORDER BY city DESC;
SELECT first_name,hire_date,TIMESTAMPDIFF(MONTH,hire_date,NOW()) AS "total_month" FROM emp;
SELECT first_name,hire_date,TIMESTAMPDIFF(MONTH,hire_date,NOW()) AS "total_month" FROM emp WHERE salary > 2000 HAVING total_month < 36 ORDER BY salary DESC;
SELECT Dept_no, SUM(salary) AS total_salary FROM emp GROUP BY Dept_no;
SELECT * FROM city;
SELECT name AS city, population FROM city WHERE population > 100000 ORDER BY population DESC;
SELECT district, SUM(population) AS total_population FROM city WHERE district = "California" GROUP BY district;
SELECT district, AVG(population) AS avg_population FROM city GROUP BY district;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT o.orderNumber,o.status,c.customerNumber,c.customerName,o.comments FROM customers AS c JOIN orders AS o ON c.customerNumber = o.customerNumber WHERE o.status = "Disputed";




