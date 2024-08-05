CREATE TABLE IF NOT EXISTS customers(
   customer_id INT NOT NULL PRIMARY KEY,
   cust_name  VARCHAR(50) NOT NULL, 
   city    VARCHAR(50) NOT NULL,
   grade    INT,
   salesman_id INT NOT NULL
);


INSERT INTO customers (customer_id, cust_name, city,grade, salesman_id) 
VALUES (3005, "Graham Zusi", "California" ,200 ,5002);

INSERT INTO customers (customer_id, cust_name, city,grade, salesman_id) 
VALUES (3008, "Julian Green", "London" ,300 ,5002);

INSERT INTO customers (customer_id, cust_name, city,grade, salesman_id) 
VALUES (3004, "Fabian Johson", "Paris" ,800 ,5006);

INSERT INTO customers (customer_id, cust_name, city,grade, salesman_id)
 VALUES (30012, "Harvey Specter", "New York" ,100 ,5009);

SELECT customer_id, cust_name, city, grade,salesman_id FROM customers WHERE grade >100;

SELECT * FROM customers WHERE city="New YorK" AND grade > 100;

SELECT * FROM customers WHERE city="New York" OR grade > 100;

SELECT * FROM customers WHERE city="New York" OR NOT grade>100;

SELECT * FROM customers WHERE  NOT ("New York" OR grade > 100);

SELECT salesman_id, name, city, commission FROM salesman WHERE commission BETWEEN  0.10 AND 0.12;

SELECT ord_no, purch_amt, ord_date, customer_id , salesman_id 
FROM orders
WHERE NOT ((ord_date = '2012-09-10' AND salesman_id > 5005) OR purch_amt >1000);  

8. SELECT ord_no, purch_amt, ord_date, customer_id , salesman_id
FROM orders
WHERE purch_amt  < 200

SELECT Count(city) AS NumberOfCities FROM customers;

SELECT COUNT(DISTINCT city) FROM customers;

SELECT * FROM customers ORDER BY grade DESC, city ASC;

SELECT * FROM customers WHERE city NOT IN ('Paris', 'New York');

SELECT SUM(grade) AS TotalGrades FROM customers;

SELECT AVG(grade) AS MeanOfGrades FROM customers;


SELECT COUNT(DISTINCT city) FROM customers;

INSERT INTO customers (customer_id, cust_name, city,grade, salesman_id)
 VALUES (30013, "Mike Ross", "Chicago", NULL,5009);


SELECT * FROM customers WHERE grade IS NOT NULL;


SELECT COUNT(grade) FROM customers WHERE grade IS NOT NULL;

SELECT MAX(grade) AS MaxGrade FROM customers;

SELECT cust_name FROM customers WHERE grade = (SELECT MAX(grade) FROM customers);




SELECT city, (SELECT MAX(grade) FROM customers) AS MaxGrade 
FROM customers 
WHERE grade = (SELECT MAX(grade) FROM customers);

SELECT name ,population , area 
FROM World
WHERE area >= 3000000 OR area >= 25000000;



SELECT * FROM employees WHERE FIRST_NAME LIKE 'D%';

SELECT * FROM employees WHERE SALARY IS NULL;


SELECT * FROM employees WHERE FIRST_NAME LIKE 'D__i%';


SELECT * FROM employees WHERE FIRST_NAME LIKE '%n';

SELECT * FROM employees WHERE FIRST_NAME LIKE 'B%';

SELECT * FROM employees WHERE FIRST_NAME NOT LIKE 'A%' AND  FIRST_NAME NOT LIKE 'M%';


SELECT * FROM employees WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'M%';


SELECT FIRST_NAME , (SELECT MAX(SALARY) FROM employees) AS HighSalaryEmployees
FROM employees
WHERE SALARY = (SELECT MAX(SALARY) FROM employees)


SELECT SUM(SALARY) AS TotalSalry FROM employees;


SELECT DISTINCT FIRST_NAME FROM employees;

SELECT COUNT(EMPLOYEE_ID) AS TotalNumberOfEmploees FROM employees;

SELECT COUNT(EMPLOYEE_ID) AS TotalNumberOfEmploees FROM employees WHERE SALARY >  3600;

SELECT FIRST_NAME , (SELECT MIN(SALARY) FROM employees) AS EmployeesWithMinWage 
FROM employees
WHERE SALARY = (SELECT MIN(SALARY) FROM employees);


SELECT MAX(SALARY) FROM employees ORDER BY SALARY DESC;

SELECT FIRST_NAME, MAX(SALARY)
FROM employees
GROUP BY FIRST_NAME;


SELECT c.cust_name , city
FROM salesman
INNER JOIN customers ON salesman.city = customers.city;


5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

salesman_id |    name    |   city   | commission 

CREATE TABLE IF NOT EXISTS salesman (
   salesman_id INT PRIMARY KEY NOT NULL, 
   name VARCHAR(50) NOT NULL,
   city VARCHAR(50) NOT NULL,
   commission DECIMAL(10, 2)
);


INSERT INTO salesman (salesman_id, name, city, commission) 
VALUES
(5001, "James Hoog", "New York", 0.15),
(5002, "Nail Knite", "Paris", 0.13),
(5006, "Pit Alex", "Tashkent", 0.15),
(5007, "Mc Lyon", "Paris", 0.15),
(5003, "Paul Adam", "Rome", 0.15);




SELECT customers.cust_name, salesman.name, salesman.city
FROM customers, salesman
WHERE customers.city = salesman.city;


SELECT customers.cust_name, salesman.name
FROM customers, salesman
WHERE customers.cust_name = salesman.name;


SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM customers, salesman, orders
WHERE customers.city <> salesman.city
AND orders.customer_id = customers.customer_id
AND orders.salesman_id = salesman.salesman_id; 


CREATE TABLE IF NOT EXISTS orders (
   ord_no INT NOT NULL,
   purch_amt  DECIMAL(10, 2),
   ord_data DATE, 
   customer_id INT NOT NULL,
   salesman_id INT NOT NULL
);



SELECT customers.cust_name AS "Customer" , customers.grade AS "Grade"
FROM customers, salesman, orders
WHERE 


CREATE TABLE IF NOT EXISTS departments (
   DEPARTMENT_ID INT NOT NULL PRIMARY KEY,
   DEPARTMENT_NAME VARCHAR(50) NOT NULL,
   MANAGER_ID INT NOT NULL,
   LOCATION_ID INT NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
   EMPLOYEE_ID INT NOT NULL,
   FIRST_NAME VARCHAR(50) NOT NULL,
   LAST_NAME VARCHAR(50) NOT NULL,
   EMAIL VARCHAR(50) NOT NULL,
   PHONE_NUMBER VARCHAR(50) NOT NULL,
   HIRE_DATE DATE NOT NULL,
   JOB_ID VARCHAR(50) NOT NULL,
   SALARY DECIMAL(10, 2),
   COMMISSION_PCT DECIMAL(10, 2),
   MANAGER_ID INT,
   DEPARTMENT_ID INT 
);




SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM employees E
JOIN departments D  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


CREATE TABLE IF NOT EXISTS locations (
   LOCATION_ID INT NOT NULL PRIMARY KEY,
   STREET_ADDRESS VARCHAR(250) NOT NULL,
   POSTAL_CODE INT NOT NULL,
   CITY VARCHAR(50) NOT NULL,
   STATE_PROVINCE VARCHAR(100),
   COUNTRY_ID VARCHAR(50) NOT NULL
);


ALTER TABLE orders
CHANGE COLUMN old_column_name new_column_name column_definition;

ALTER TABLE locations
CHANGE COLUMN POSTAL_CODE POSTAL_CODE VARCHAR(250);

 
 

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM employees E
JOIN departments D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN locations L ON D.LOCATION_ID = L.LOCATION_ID;



SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM employees E 
JOIN departments D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND E.DEPARTMENT_ID IN (80, 40);


write a SQL query to find those employees whose first name contains the letter ‘z’.
Return first name, last name, department, city, and state province.


SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY, L.STATE_PROVINCE
FROM employees E
JOIN departments D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID
JOIN locations L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.FIRST_NAME LIKE '%Z%';