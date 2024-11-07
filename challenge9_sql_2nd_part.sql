
--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, 
e.last_name,
e.first_name,
e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s 
	ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from "Employees"
where hire_date
between '1986-01-01' 
and '1986-12-31';


--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from "Dept_manager" dm
join "Employees" e
on dm.emp_no = e.emp_no
join "Departments" d
on dm.dept_no = d.dept_no;



--List the department number for each employee along with that employee’s 
--employee number,last name,first name, and department name.

select dpt.dept_no, e.emp_no, e.last_name, e.first_name, dpt.dept_name
from "Employees" e
join "Dept_emp" d
 	on e.emp_no = d.emp_no
join "Departments" dpt 
  	on dpt.dept_no = d.dept_no;




--List first name, last name, and sex of each employee 
--whose first name, is Hercules and whose last name begins with the letter B.

select e.first_name, e.last_name, e.sex
from "Employees" as e
where first_name = 'Hercules' and last_name like 'B%';

 

--List each employee in the Sales department, 
--including their employee number, last name, and first name.

select dpt.dept_name, e.emp_no, e.last_name, e.first_name
from "Employees" e
join "Dept_emp" d
	on e.emp_no = d.emp_no
join "Departments" dpt
	on dpt.dept_no = d.dept_no
where dpt.dept_name = 'Sales';
		

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, dpt.dept_name
from "Employees" e
join "Dept_emp" d 
on e.emp_no = d.emp_no
join "Departments" dpt
on dpt.dept_no = d.dept_no
where dpt.dept_name = 'Sales' or dpt.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name).

select last_name, 
count(emp_no) as frequent_last_name
from "Employees"
group by last_name
order by frequent_last_name desc;


