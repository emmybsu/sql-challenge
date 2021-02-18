-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--Employee Details
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_manager m
ON d.dept_no = m.dept_no
INNER JOIN employees e
ON m.emp_no = e.emp_no
ORDER BY dept_no ASC;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN departments d
ON d.dept_no = de.dept_no
LEFT JOIN employees e
ON e.emp_no = de.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN departments d
ON d.dept_no = de.dept_no
LEFT JOIN employees e
ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN departments d
ON d.dept_no = de.dept_no
LEFT JOIN employees e
ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
FROM employees 
GROUP BY last_name
ORDER BY count desc;