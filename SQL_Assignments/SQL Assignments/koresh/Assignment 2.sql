##1 Select all employees in department 10 whose salary is greater than 3000. [table: employee]
SELECT * 
FROM employee 
WHERE deptno =10 AND salary > 3000;

##2 grading of students based on the marks they have obtained is done as follows:-

ALTER TABLE students ADD COLUMN GRADE VARCHAR(30);


SET SQL_SAFE_UPDATES =0;
UPDATE students
SET GRADE = 
(case
when marks<= 50 then "Second Class"
when marks <=80 then "First Class"
else "Distinctions"
end);

select * FROM students;

##2a  How many students have graduated with first class:-
SELECT DISTINCT(COUNT(id))
FROM students
WHERE GRADE = "First Class";

##2b How many students have obtained distinction? [table: students]:-
SELECT DISTINCT(COUNT(id))
FROM students
WHERE GRADE = "Distinctions";


##3 Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]

SELECT DISTINCT(city),id
FROM STATION
WHERE id % 2 = 0;

##4 Find the difference between the total number of city entries in the table and the number of distinct city entries in the table.In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.

SELECT COUNT(city)  - COUNT(DISTINCT(city))
FROM STATION;


##5a Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
SELECT DISTINCT(CITY)
FROM station
WHERE LEFT(CITY, 1) IN ("a","e","i","o","u"); 

##5b Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates
 SELECT DISTINCT(CITY)
FROM station
WHERE LEFT(CITY, 1) IN ("a","e","i","o","u") AND RIGHT(CITY, 1) IN ("a","e","i","o","u");

##5c Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT(CITY)
FROM station
WHERE LEFT(CITY,1) NOT IN ('a','e','i','o','u');

##5d Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]
SELECT DISTINCT(CITY)
FROM station
WHERE LEFT(CITY, 1) NOT IN ("a","e","i","o","u") AND RIGHT(CITY, 1) NOT IN ("a","e","i","o","u");

##6 Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]
SELECT first_name, last_name
FROM emp
WHERE salary > 2000 AND TIMESTAMPDIFF(MONTH, hire_date,NOW())<=36
ORDER BY salary DESC;


##7  How much money does the company spend every month on salaries for each department? [table: employee]
SELECT deptno, SUM(salary) as Monthly_Salary
FROM employee
GROUP BY deptno;

##8  How many cities in the CITY table have a Population larger than 100000. [table: city]

SELECT count(DISTINCT(name))
FROM city
WHERE population > 100000;

##9 What is the total population of California? [table: city]

SELECT SUM(population) as Total_Population
FROM city
WHERE district = "California";

##10  What is the average population of the districts in each country? [table: city]

SELECT district, round(avg(population),2) as AVG_Population
FROM city
GROUP BY district;

##11-> . Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]

SELECT o.orderNumber, o.status, c.customerNumber, c.customerName, o.comments
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber
WHERE o.status = "Disputed";
