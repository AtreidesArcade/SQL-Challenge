drop table if exists departments cascade;
drop table if exists dept_emp cascade;
drop table if exists dept_manager cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists titles cascade;

create table departments (
	dept_no varchar(10) PRIMARY KEY not null,
	dept_name varchar(100) not null
);

create table employees (
	emp_no int primary key not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	gender varchar(1) not null,
	hire_date date not null
);

create table dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(10) not null,
	foreign key (dept_no) references departments (dept_no)
);

create table dept_manager (
	dept_no varchar(10) not null,
	foreign key (dept_no) references departments (dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no)
);

create table salaries (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	salary int not null
);

create table titles (
	titles_id varchar not null,
	--foreign key (emp_no) references employees(emp_no),
	title varchar(30) not null
);

copy departments from '/Library/PostgreSQL/14/bin/Database/departments.csv'
with (format CSV, HEADER);

select * from departments;

copy employees from '/Library/PostgreSQL/14/bin/Database/employees.csv'
with (format CSV, HEADER);

select * from employees;

copy dept_emp from '/Library/PostgreSQL/14/bin/Database/dept_emp.csv'
with (format CSV, HEADER);

select * from dept_emp;

copy dept_manager from '/Library/PostgreSQL/14/bin/Database/dept_manager.csv'
with (format CSV, HEADER);

select * from dept_manager;

copy salaries from '/Library/PostgreSQL/14/bin/Database/salaries.csv'
with (format CSV, HEADER);

select * from salaries;

copy titles from '/Library/PostgreSQL/14/bin/Database/titles.csv'
with (format CSV, HEADER);

select * from titles;