-- To explore hr database structure and employee data
use hr;

show tables;
describe countries;
select* from countries;

-- find all unique departments id 

select distinct department_id   from employees;

select count(distinct department_id )  from employees;

-- creating a view 

create view emp_few_details  as 
	select employee_id e_id ,first_name name ,salary sal , department_id d_id from employees;

select * from emp_few_details;

-- remove view
drop view emp_few_details;

-- create index purpose for better or quick perfomance
create index firstname on  employees (first_name);
show index from employees;
drop index  firstname on employees;

-- Aggregate functions to alnalysis employees salary data 
select max(salary), min(salary),avg(salary),count(salary), sum(salary) from employees; 

--- partern matching using like
select * from employees where first_name  like "_a%";
select last_name from employees where last_name like "____n";

-- department-wise salary analysis 
select e.department_id, d.department_name, max(salary), min(salary) from employees e  
	join departments d on 
		d.department_id=e.department_id 
			group by department_id;	

-- sorting employees by department
select e.*, d.department_name from employees e join 
departments d on e.department_id = d.department_id  order by d.department_id desc;

-- department salary greater than 7000
select department_id , sum(salary)from employees 
	group by department_id 
		having sum(salary) >7000; 
        
select upper(first_name) from employees;
select lower(last_name) from employees;
select concat(first_name ,"-", last_name)  name from employees;

-- more than the average salary 

select * from employees where salary > (select avg (salary) from employees);

-- find employees working in the  same department as Neena
select department_id from employees where first_name = "Neena";
select employee_id, first_name,last_name, department_id from employees where department_id = 
	(select department_id from employees where first_name = "Neena");

-- find department more than 5 employees
select department_id , count(*) from employees group by department_id having count(*) > 5;
select * from employees where department_id in 
(select department_id  from employees group by department_id having count(*) > 5);