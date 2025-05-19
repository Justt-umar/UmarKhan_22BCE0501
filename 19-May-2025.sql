CREATE DATABASE VIT;
USE VIT;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
SELECT * FROM Worker;
desc Worker;

CREATE DATABASE vellore;
use vellore;

create table cse (
	id int,
    name varchar(25)
);

start transaction;
insert into cse value (1001,'Jayanth');
savepoint a11;
insert into cse values (1002,'Praveen');
savepoint a12;
delete from cse where id = 1002;
select * from cse;
rollback to a12;
select * from cse;

use VIT;

SELECT first_name,department FROM Worker WHERE SALARY > 300000;
SELECT first_name,department FROM Worker WHERE SALARY > 200000 AND DEPARTMENt ='HR';

SELECT * 
FROM Worker 
WHERE (SALARY > 100000 AND SALARY < 300000) 
AND
(DEPARTMENT ='Account' OR DEPARTMENT = 'Admin');



