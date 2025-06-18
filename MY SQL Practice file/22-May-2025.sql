USE vit;

SELECT * FROM worker1;
SELECT * FROM worker;

SELECT department
FROM worker1
GROUP BY department
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT department,
       SUM(salary) AS total_salary
FROM worker1
GROUP BY department
ORDER BY total_salary
LIMIT 1;

SELECT department,
       SUM(salary) AS total_salary
FROM worker1
GROUP BY department;

SELECT department,
       COUNT(*) AS employee_count
FROM worker1
GROUP BY department
HAVING employee_count > 3;

SELECT department,
       SUM(salary) AS total_salary
FROM worker1
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

SELECT department,
       SUM(salary) AS total_salary
FROM worker1
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1 OFFSET 1;

SELECT first_name,
       department
FROM worker1
WHERE salary = (SELECT MAX(salary) FROM worker1);

SELECT first_name,
       department,
       salary
FROM worker1
WHERE salary > (SELECT AVG(salary) FROM worker1);

CREATE TABLE student (
    s_id   INT,
    s_name VARCHAR(25)
);

INSERT INTO student VALUES
    (101, 'jayanth'),
    (102, 'karthik'),
    (103, 'Praveen'),
    (105, 'Mahesh'),
    (106, 'Arun');

CREATE TABLE address (
    s_id      INT,
    s_address VARCHAR(25)
);

INSERT INTO address VALUES
    (101, 'coimbatore'),
    (104, 'chennai'),
    (105, 'pune');

SELECT * FROM student;
SELECT * FROM address;

SELECT *
FROM student
CROSS JOIN address;

SELECT *
FROM student AS s
INNER JOIN address AS a
  ON s.s_id = a.s_id;

SELECT *
FROM student AS s
LEFT JOIN address AS a
  ON s.s_id = a.s_id;

SELECT *
FROM student AS s
RIGHT JOIN address AS a
  ON s.s_id = a.s_id;

SELECT *
FROM student
FULL JOIN address;

SELECT DISTINCT w1.salary
FROM worker1 AS w1
WHERE (
    SELECT COUNT(DISTINCT w2.salary)
    FROM worker1 AS w2
    WHERE w2.salary > w1.salary
) = 4;
