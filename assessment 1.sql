create database worker;
use worker;
create table worker(worker_id int primary key,
first_name varchar(80),
last_name varchar(90),
salary int,
joining_date timestamp,
department text);

select * from worker;
select worker_id,first_name,last_name,salary,joining_date,department from worker;
insert into worker(worker_id,first_name,last_name,salary,joining_date,department)
values(1,'monika','arora',100000,'2014-02-20 9:00','hr'),
(2,'niharika','verma',80000,'2014-06-11 9:00','admin'),
(3,'vishal','singhal',300000,'2014-02-20 9:00','hr'),
(4,'amitabh','singh',500000,'2014-02-20 9:00','admin'),
(5,'vivek','bhati',500000,'2014-06-11 9:00','admin'),
(6,'vipul','diwan',200000,'2014-06-11 9:00','account'),
(7,'satish','kumar',75000,'2014-01-20 9:00','account'),
(8,'geetika','chauhan',90000,'2014-04-11 9:00','admin');
select * from worker;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker
order by first_name asc , department desc;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
select * from worker
where first_name like 'vipul' and last_name like 'satish';

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from worker
where first_name like '%h' and length(first_name)=6;

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
select * from worker
where salary between 60000 and 100000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT first_name,last_name, COUNT(*)
FROM employees
GROUP BY first_name,last_name
HAVING COUNT(*) > 1;

-- 6. Write an SQL query to show the top 6 records of a table. 
select * from worker
order by worker_id limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them. 
Select count(*),department from worker group by worker_id having count(*)>5;

-- 8. Write an SQL query to show all departments along with the number of people in there. 
select * from worker
group by worker_id having count(*);

-- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
select * from worker
where salary in (select max(salary) from worker group by department);

use school1;

create table schl(std_id int primary key,
std_name varchar(100),
sex varchar (15),
percentage int,
class int,
sec varchar (12),
streams varchar(30),
dob date);

select * from schl;
insert into schl(std_id,std_name,sex,percentage,class,sec,streams,dob)
values(1001,'surekha joshi','female',82,12,'A','science','1998-03-08'),
(1002,'maahi agarwal','female',56,11,'c','commerce','2008-11-23'),
(1003,'sanam verma','male',59,11,'c','commerce','2006-06-29'),
(1004,'rohit kumar','male',63,11,'c','commerce','1997-11-05'),
(1005,'dipesh pulkit','male',78,11,'b','science','2003-09-14'),
(1006,'jahnvi puri','female',60,11,'b','commerce','2008-11-07'),
(1007,'sanam kumar','male',23,12,'f','commerce','1998-03-08'),
(1008,'sahil saras','male',56,11,'c','commerce','2008-11-07'),
(1009,'akshra agarwal','female',72,12,'b','commerce','1996-10-01'),
(1010,'shruti mishra','female',39,11,'f','science','2008-11-23'),
(1011,'harsh agarwal','male',42,11,'c','science','1998-03-08'),
(1012,'nikunj agarwal','male',49,12,'c','commerce','1998-11-28'),
(1013,'akriti saxena','female',89,12,'a','science','2008-11-23'),
(1014,'tani rastogi','female',82,12,'a','science','2008-11-23');

-- 1 To display all the records form STUDENT table.
select * from schl;

-- To display any name and date of birth from the table STUDENT. 
select  std_name,dob from schl;

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. 
select * from schl
where percentage >=80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80 
select std_name,streams,percentage from schl
where percentage>80;

-- 5. To display all records of science students whose percentage is more than 75 form student table. 
select * from schl
where streams='science' and percentage >75;