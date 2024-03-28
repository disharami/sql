use hr;
-- 1 Display all information in the tables EMP and DEPT. 
select * from employees;
select * from departments;

-- 2 Display only the hire date and employee name for each employee
select hire_date,first_name from employees;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 
select concat(first_name,'',last_name,',',job_id ) as employee_title from employees;

-- 4. Display the hire date, name and department number for all clerks. 
select concat(first_name,'',last_name) as full_name,hire_date,department_id from employees;

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 
select concat(first_name,',' ,last_name ,' , ',salary,' , ',email,' , ' ,phone_number, ' , ' ,hire_date ,' , ',job_id , '  , ',commission_pct, ' ,' ,manager_id , ' , ',department_id ) as the_output from employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000.
select first_name,salary from employees
where salary>2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date" 
select concat(first_name,'',last_name,',',hire_date) as name_and_start_date from employees;

-- 8. Display the names and hire dates of all employees in the order they were hired. 
select concat(first_name,'',last_name) as full_name,hire_date from employees order by hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order. 
select concat(first_name,'',last_name) as full_name,salary from employees order by salary desc;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
select first_name,department_id from employees 
where commission_pct is not null 
order by salary desc;

-- 11. Display the last name and job title of all employees who do not have a manager 
select last_name,job_id from employees
where manager_id is null;


-- SA_REP
-- SH_CLERK
-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select last_name,job_id,salary from employees
where job_id like "SA_REP%" or job_id like "SH_CLERK" and salary!=2500 or salary!=3500 or salary!=5000;

-- 1) Display the maximum, minimum and average salary and commission earned. 
select max(salary)as max_salary,min(salary)as min_salary,avg(salary)as avg_salary from employees
where  commission_pct is not null;

-- 2) Display the department number, total salary payout and total commission payout for each department. 
select department_id,sum(salary)as sum_salary from employees group by department_id;

-- 3) Display the department number and number of employees in each department. 
select department_name,department_id,count(*)employee_id from employees group by department_id;

-- 4) Display the department number and total salary of employees in each department. 
select department_id,sum(salary)as total_salary from employees group by department_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name 
select concat(first_name,'',last_name)as full_name,commission_pct from employees
where commission_pct is null order by 1;


-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
select  concat(first_name,'',last_name)as em_name,department_id,commission_pct from employees
where commission_pct is null ;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employeedoesn't earn the commission, then display as 'No commission. Name the columnsappropriately
select concat(first_name,'',last_name) as full_name,salary, if(commission_pct is not null,commission_pct*2 ,"NO COMMISSION") AS commission from employees ;


-- 8) Display the employee's name, department id who have the first name same as anotheremployee in the same department
select  e.employee_id,e.first_name,e.department_id from employees e
join employees s on e.department_id=s.department_id and e.last_name=s.last_name;

-- 9) Display the sum of salaries of the employees working under each Manager. 
select sum(salary),manager_id from employees group by manager_id;

-- 10) Select the Managers name, the count of employees working under and the departmentID of the manager. 
select count(*),department_id from employees group by department_id;

-- 11) Select the employee name, department id, and the salary. Group the result with themanager name and the employee last name should have second letter 'a! 
select concat(first_name,'',last_name) as emp_name,department_id,salary from employees
where last_name like "__a" ;

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
select avg (salary),department_id from employees  group by department_id ;

-- 13) Select the maximum salary of each department along with the department id 
select max(salary),department_id from employees group by department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
select employee_id,first_name, if(commission_pct is not null,0.10*salary,"1") as commission from employees;

-- 1. Write a query that displays the employee's last names only from the string's 2-5th 
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label. 
select upper(substring(last_name,2,5))as modified_l_n from employees;

-- 2. Write a query that displays the employee's first name and last name along with a " in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.
select concat(first_name, ' - ' ,last_name) as full_name,month(hire_date) from employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 500 each. Provide each column an appropriate label. 
select last_name,if((salary*1/2)>10000,(salary*1.1),(salary*1.115))as modi_salary,500 as bouns_amt from employees;

-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$!
SELECT CONCAT(SUBSTRING(employee_id, 1, 2), '00', SUBSTRING(employee_id, 3), 'E') AS modified_employee_id,
department_id,salary,UPPER(REPLACE(first_name, 'z', '$!')) AS modified_first_name FROM employees;

-- 5 5. Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the
-- employees' last names 
SELECT 
    CONCAT(UPPER(SUBSTRING(last_name, 1, 1)), LOWER(SUBSTRING(last_name, 2))) AS capitalized_last_name,
    LENGTH(last_name) AS name_length
FROM 
    employees
WHERE 
    last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY 
    last_name;


select * from employees;

-- 6. Create a query to display the last name and salary for all employees. Format the salary tobe 15 characters long, left-padded with $. Label the column SALARY 
select last_name,concat(salary,'$') as salary from employees;
select last_name,lpad(salary,15,'$') as SALARY from employees;
 
--  7. Display the employee's name if it is a palindrome


-- 9. From LOCATIONS table, extract the word between first and second space from theSTREET ADDRESS column. 
select * from locations;
select substring(street_address,6,9) from locations;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name. 
select * from employees;
select concat(lower(substring(first_name,1,1)),' . ',lower(last_name), '@systechusa.com') as email_address,first_name from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna. 
select first_name,last_name,job_id from employees where job_id=(select job_id from employees where first_name like 'trenna');

-- 12. Display the names and department name of all employees working in the same city asTrenna. 
select e.first_name,d.department_name,l.city from employees e join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id  ;

-- -- 13. Display the name of the employee whose salary is the lowest. 
select first_name,last_name from employees where salary=(select min(salary) from employees) ;

-- 14. Display the names of all employees except the lowest paid.
select * from employees where salary<>(select min(salary) from employees);
 
-- 1. Write a query to display the last name, department number, department name for all employees. 
select e.last_name,e.department_id,d.department_name from employees e join departments d on e.department_id=d.department_id;

-- 2 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 
select distinct j.job_title,j.job_id,l.location_id,d.department_id from employees e join departments d on e.department_id=d.department_id and d.department_id=40 join jobs j on e.job_id=j.job_id join locations l on d.location_id=l.location_id ;
select * from departments;

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission. 
select e.last_name,d.department_name,l.location_id from employees e join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id and commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name 
select e.last_name,d.department_name from employees e join departments d on e.department_id=d.department_id and last_name like "%a%";

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
select e.last_name,d.department_id,d.department_name,j.job_id from employees e join departments d on e.department_id=d.department_id 
join jobs j on e.job_id=j.job_id and job_title="accountant";

-- 6. Display the employee last name and employee number along with their manager's last name and manager number. 
select e.last_name , e.employee_id, m.last_name , m.manager_id from employees e join employees m on e.employee_id=m.manager_id;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 
select e.employee_id,e.last_name,s.manager_id,s.last_name from employees e join employees s on e.employee_id=s.employee_id;

-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 
select last_name,department_id from employees where department_id in(select department_id from employees where employee_id=120);

-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 
select e.first_name,d.department_name,j.job_id from employees e join departments d on e.department_id=d.department_id 
join jobs j on e.job_id=j.job_id ;


-- 10. Display the names and hire date for all employees who were hired before their
-- managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date
select e.first_name as emp_name ,e.hire_date as h_date,m.hire_date as m_date from employees e join employees m on e.first_name=m.first_name where e.hire_date<m.hire_date;


-- 1. Write a query to display the last name and hire date of any employee in the same department as SALE
select e.last_name,e.hire_date,d.department_name from employees e join departments d on e.department_id=d.department_id
where department_name="sales";

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 
select employee_id,last_name,salary from employees where salary >(select avg(salary) from employees) order by salary asc;

-- 3. Write a query that displays the employee numbers and last names of all employees whowork in a department with any employee whose last name contains a' u 
select employee_id,last_name from employees where last_name like "%u";

-- 4. Display the last name, department number, and job ID of all employees whosedepartment location is ATLANTA. 
select * from employees;
select e.last_name,e.department_id,e.job_id,l.state_province from employees e join departments d on e.department_id=d.department_id join locations l on d.location_id=l.location_id where l.state_province="atlanta";
select * from locations;

-- 5. Display the last name and salary of every employee who reports to FILLMORE. 
select last_name,salary from employees where first_name="fillmore";

-- 6. Display the department number, last name, and job ID for every employee in theOPERATIONS department
select e.department_id,e.last_name,e.job_id from employees e join departments d on e.department_id=d.department_id where d.department_name="operations";

-- 	7. Modify the above query to display the employee numbers, last names, and salaries of allemployees who earn more than the average salary and who work in a department with anyemployee with a 'u'in their name. 
select employee_id,last_name,salary from employees  where salary>(select avg(salary) from employees)and last_name like "%u%";

-- 8. Display the names of all employees whose job title is the same as anyone in the salesdept. 
select e.last_name from employees e join jobs j on e.job_id=j.job_id where job_title="salesdept";

-- 9. Write a compound query to produce a list of employees showing raise percentages,
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.
select employee_id,salary,department_id,
case 
	when department_id in (10,30) then salary*0.05+salary
    when department_id in (20) then salary*0.10+salary
    when department_id in(40,50) then salary*0.15+salary
    when department_id in (60) then "no raise"
else "0"
end as "rise percdentage"
from employees;
-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their lastnames and salaries. 
select first_name,last_name,salary from employees where salary>(select max(salary) as max_salary from employees);

-- 11. Display the names of all employees with their salary and commission earned. Employeeswith a null commission should have O in the commission column 
select salary,commission_pct from employees where COALESCE(commission_pct , "0");

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.  wrong 
select concat(e.first_name,'',e.last_name)as mananger_name,e.salary from employees e join employees m on e.employee_id=m.manager_id order by salary desc limit 3;

