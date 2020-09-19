-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "department" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e
join salaries s on e.emp_no = s.emp_no;

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL
);
select first_name,last_name,hire_date
from employees 
where extract (year from hire_date) = 1986;

CREATE TABLE "dept_manager" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL
);
select d.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
from employees e
join dept_manager dm on dm.emp_no = e.emp_no
join department d on d.dept_no = dm.dept_no 
CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title" varchar(30)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(10)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join department d on d.dept_no = de.dept_no;
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);
select first_name,last_name,sex
from employees
where first_name like 'Hercules' and last_name like 'B%'
CREATE TABLE "titles" (
    "title_id" varchar(30)   NOT NULL,
    "title" varchar(20)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
select e.emp_no,e.last_name,e.first_name,dn.dept_name
from employees e
join dept_emp d on d.emp_no = e.emp_no
join department dn on dn.dept_no = d.dept_no and dn.dept_no like 'd007';

select e.emp_no,e.last_name,e.first_name,dn.dept_name
from employees e
join dept_emp d on d.emp_no = e.emp_no
join department dn on dn.dept_no = d.dept_no and dn.dept_no like 'd007'or dn.dept_no like 'd005';

select last_name,
count(last_name) as "frequency"
from employees
group by last_name
order by count(last_name) desc;

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

