USE vit;

SHOW TABLES;

SELECT * FROM worker1;
DESC worker1;

CREATE TABLE worker (
    worker_id     INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    salary        INT,
    joining_date  DATETIME,
    department    VARCHAR(50)
);

INSERT INTO worker VALUES
    (101, 'Anjali', 'Mehra',   120000, '2015-03-10 09:00:00', 'HR'),
    (102, 'Rohit',  'Sharma',   95000,  '2016-05-15 09:00:00', 'Admin'),
    (103, 'Sneha',  'Gupta',   110000,  '2017-01-20 09:00:00', 'Finance'),
    (104, 'Karan',  'Patel',    70000,  '2015-09-30 09:00:00', 'IT'),
    (105, 'Neha',   'Kapoor',  130000,  '2018-07-22 09:00:00', 'HR'),
    (106, 'Arjun',  'Mehta',    80000,  '2019-11-12 09:00:00', 'Finance'),
    (107, 'Pooja',  'Singh',    85000,  '2020-04-05 09:00:00', 'Admin'),
    (108, 'Raj',    'Malhotra', 99000,  '2021-08-16 09:00:00', 'IT');

SELECT * FROM worker1 WHERE worker_id IN (1, 2);
SELECT * FROM worker1 WHERE worker_id NOT IN (1, 2);
SELECT * FROM worker1 WHERE salary BETWEEN 100000 AND 200000;
SELECT * FROM worker1 WHERE salary NOT BETWEEN 100000 AND 200000;
SELECT * FROM worker1
 WHERE salary BETWEEN 100000 AND 300000
   AND worker_id IN (1, 2, 3, 4);

SELECT MIN(salary)   AS min_salary   FROM worker1;
SELECT MAX(salary)   AS max_salary   FROM worker1;
SELECT SUM(salary)   AS total_salary FROM worker1;
SELECT AVG(salary)   AS avg_salary   FROM worker1;
SELECT * FROM worker1
 WHERE salary = (SELECT MIN(salary) FROM worker1);

SELECT department,
       SUM(salary) AS total_salary
  FROM worker1
 GROUP BY department
 HAVING SUM(salary) > 100000;

SELECT DISTINCT department FROM worker1;

SELECT department FROM worker
UNION
SELECT department FROM worker1;

SELECT department FROM worker
UNION ALL
SELECT department FROM worker1;

SELECT * FROM worker1 WHERE worker_id IN (1, 2, 3)
UNION
SELECT * FROM worker WHERE worker_id IN (101, 102, 103);

SELECT * FROM worker1
 WHERE salary <= 200000
 ORDER BY salary ASC;

SELECT * FROM worker1
 WHERE salary <= 200000
 ORDER BY salary DESC;

SELECT * FROM worker1 WHERE first_name LIKE '_i%l';
SELECT * FROM worker1 WHERE first_name LIKE '__i%';
SELECT * FROM worker1 WHERE first_name LIKE '%a_a';
SELECT * FROM worker1 WHERE first_name LIKE '_aa%';
SELECT * FROM worker1
 WHERE first_name LIKE 'M%' OR first_name LIKE 'N%';

CREATE VIEW admin_team AS
  SELECT * FROM worker1
   WHERE department = 'Admin'
     AND salary < 100000;

CREATE OR REPLACE VIEW admin_team AS
  SELECT * FROM worker1
   WHERE department = 'Admin'
     AND salary > 200000;

SELECT * FROM admin_team;
DROP VIEW admin_team;

SELECT first_name,
       salary,
       CASE
         WHEN salary > 300000 THEN 'Rich people'
         WHEN salary BETWEEN 100000 AND 300000 THEN 'MIDDLE CLASS'
         WHEN salary BETWEEN 0 AND 100000   THEN 'POOR CLASS'
         ELSE 'Data not found'
       END AS Status_checksalary
  FROM worker;

SELECT * FROM worker;

CREATE TABLE product (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID  INT,
    CategoryID  INT,
    Unit        VARCHAR(50),
    Price       DECIMAL(10,2)
);

INSERT INTO product VALUES
    (1, 'Chais',                       1, 1, '10 boxes x 20 bags',    18.00),
    (2, 'Chang',                       1, 1, '24 - 12 oz bottles',     19.00),
    (3, 'Aniseed Syrup',               1, 2, '12 - 550 ml bottles',   10.00),
    (4, 'Chef Anton''s Cajun Seasoning',1, 2, '48 - 6 oz jars',       22.00),
    (5, 'Chef Anton''s Gumbo Mix',     1, 2, '36 boxes',             21.35);

CREATE TABLE orders (
    OrderID    INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate  DATE,
    ShipperID  INT
);

INSERT INTO orders VALUES
    (10248, 90, 5,  '1996-07-04', 3),
    (10249, 81, 6,  '1996-07-05', 1),
    (10250, 34, 4,  '1996-07-08', 2),
    (10251, 84, 3,  '1996-07-09', 1),
    (10252, 76, 4,  '1996-07-10', 2);
