-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

--departments table

CREATE TABLE departments (
  dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(40) NOT NULL
)
;

-- titles table


CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY NOT NULL,
  title VARCHAR(30)
)
;

-- employee table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(10) references titles(title_id),
	birth_date DATE, 
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(5),
	hire_date DATE
)
;
-- dept_emp table
CREATE TABLE dept_emp (
  emp_no INT references employees(emp_no),
  dept_no VARCHAR(10) references departments(dept_no)
)
;

--dept_manager table


CREATE TABLE dept_manager (
	dept_no VARCHAR(10) references departments(dept_no),
  	emp_no INT references employees(emp_no)
)
;

-- salaries table


CREATE TABLE salaries (
  emp_no INT references employees(emp_no),
  salary INT
)
;