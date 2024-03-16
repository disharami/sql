create database school1;
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