-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

#1 the details of_each employees: fiist_name, last_name, sex and_salary

select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e
join salaries s on e.emp_no = s.emp_no;

#2 the details of_employees who were hired in_1986

select first_name,last_name,hire_date
from employees 
where extract (year from hire_date) = 1986;

#3 List of_the manager of_each departments

select d.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
from employees e
join dept_manager dm on dm.emp_no = e.emp_no
join department d on d.dept_no = dm.dept_no;

#4 the list of_each employees and_their departments

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join department d on d.dept_no = de.dept_no;

#5 list of_employees whose their fisrt_name is_"Hercules" and_their last_name start_with "B"

select first_name,last_name,sex
from employees
where first_name like 'Hercules' and last_name like 'B%'

#6 list of_the employees in_sales departments

select e.emp_no,e.last_name,e.first_name,dn.dept_name
from employees e
join dept_emp d on d.emp_no = e.emp_no
join department dn on dn.dept_no = d.dept_no and dn.dept_no like 'd007';

#7 list of_employees in_sales departments and_developments departments

select e.emp_no,e.last_name,e.first_name,dn.dept_name
from employees e
join dept_emp d on d.emp_no = e.emp_no
join department dn on dn.dept_no = d.dept_no and dn.dept_no like 'd007'or dn.dept_no like 'd005';

#8 In_descending order_,how many employees share_each last_name.

select last_name,
count(last_name) as "frequency"
from employees
group by last_name
order by count(last_name) desc;



