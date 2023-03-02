--Titles Table
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);

--Employees Table
CREATE TABLE employees (
	emp_no int PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date date NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date date NOT NULL
);

--This line is required in order to successfully import the Employees CSV. The date format is different between PostgreSQL and the CSV.
ALTER DATABASE "Module_9_db" SET datestyle TO "ISO, MDY";

--Salaries Table
CREATE TABLE salaries (
	emp_no int PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary int NOT NULL
);

--Departments Table
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY NOT NULL,
    dept_name VARCHAR   NOT NULL
);

--Dept Manager Table
CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


--Dept Employee Table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "dept_no" VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT COMPOSITE_KEY PRIMARY KEY (emp_no, dept_no)
);