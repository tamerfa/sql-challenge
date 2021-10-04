--1. List employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex, (
	SELECT s.salary
	FROM salaries AS s
	WHERE s.emp_no = e.emp_no
	) 
FROM employees AS e;

--2. List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date LIKE '%/1986';

--Checking available columns
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM employees;

--3. For each manager, list: department number, department name, employee number, last name, first name
SELECT d.dept_no AS "Department No.", 
	   d.dept_name AS "Department Name",
	   e.emp_no AS "Employee No.",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name"
FROM dept_manager AS dm
LEFT JOIN departments AS d
ON dm.dept_no = d.dept_no
LEFT JOIN employees AS e
ON dm.emp_no = e.emp_no;

--4. For each employee, list: employee number, last name, first name, department name
-- Creating a view to answer questions no. 6 and 7
CREATE VIEW emp_dept AS
SELECT e.emp_no AS "Employee No.",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM employees AS e
RIGHT JOIN dept_emp AS de
ON e.emp_no = de.employee_no
RIGHT JOIN departments as d
ON de.dept_no = d.dept_no;

--5. List first name, last name, sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT *
FROM emp_dept
WHERE "Department Name" = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT *
FROM emp_dept
WHERE "Department Name" = 'Sales'
OR "Department Name" = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;