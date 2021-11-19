-- SELECT * FROM Each Table Confirming Data Entry.
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

/*
1. List the following details of each employee: 
	employee number, last name, first name, sex, and salary.
*/
CREATE VIEW EmployeeSalaries AS
SELECT emp.emp_no,emp.last_name,emp.first_name,emp.sex , sal.salary 
FROM employees AS emp
INNER JOIN salaries AS sal
ON (emp.emp_no = sal.emp_no);

--Select Query for Above Join.
SELECT * FROM EmployeeSalaries;

/*
2. List first name, last name, and hire date for employees who were hired in 1986.
*/
SELECT emp.emp_no,emp.first_name,emp.last_name,emp.hire_date
FROM employees AS emp
WHERE emp.hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY emp.hire_date;

/*
3. List the manager of each department with the following information: 
	department number, department name, the manager's employee number, last name, first name.
*/
CREATE VIEW DepartManagerDetails AS
SELECT emp.emp_no,emp.last_name,emp.first_name, dman.dept_no 
FROM employees AS emp
INNER JOIN dept_manager AS dman
ON (emp.emp_no=dman.emp_no);

-- View department Manager Details.
SELECT DepManDets.dept_no AS "Department_No",DName.dept_name AS "Department_Name",DepManDets.emp_no AS "Manager_No",
							DepManDets.last_name AS "Manager_LastName",DepManDets.first_name AS "Manager_FirstName"
FROM DepartManagerDetails AS DepManDets
INNER JOIN departments AS DName
ON (DepManDets.dept_no=DName.dept_no);

/*
4. List the department of each employee with the following information: 
	employee number, last name, first name, and department name.
*/
CREATE VIEW EmployeeDepartment AS
SELECT emp.emp_no,emp.last_name,emp.first_name,Dep.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS DepEmp
ON (emp.emp_no = DepEmp.emp_no)
INNER JOIN departments AS Dep
ON (DepEmp.dept_no = Dep.dept_no);

SELECT * FROM EmployeeDepartment;
/*
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
*/
SELECT first_name,last_name,sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

/*
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
*/
--SELECTING from VIEW (EmployeeDepartment) created above.
SELECT * FROM EmployeeDepartment
WHERE dept_name = 'Sales'
ORDER BY emp_no;
/*
7. List all employees in the Sales and Development departments, 
		including their employee number, last name, first name, and department name.
*/
--SELECTING from VIEW (EmployeeDepartment) created above.
SELECT * FROM EmployeeDepartment
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY emp_no;

/*
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
*/
SELECT count(last_name) AS "NoOfPeople", last_name
FROM employees
GROUP BY last_name 
ORDER By count(last_name) DESC;


