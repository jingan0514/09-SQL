--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from salaries as s
join employees as e
on e.emp_no = s.emp_no
order by e.emp_no;

--List employees who were hired in 1986.
select *
from employees
where employees.hire_date 
between '1986-01-01' 
and '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from dept_manager as dm
join departments as d
on d.dept_no = dm.dept_no
join employees as e
on e.emp_no = dm.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on e.emp_no = de.emp_no
join departments as d
on d.dept_no= de.dept_no
order by de.emp_no;

--List all employees whose first name is "Hercules" and 
--last names begin with "B."
select * 
from employees as e
where e.first_name = 'Hercules'
and e.last_name like 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_no in (
	select d.dept_no
	from departments as d
	where d.dept_name = 'Sales'
);

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_no in (
	select d.dept_no
	from departments as d
	where d.dept_name = 'Sales' 
	or d.dept_name = 'Development'
);

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select last_name, count(last_name) as name_count
from employees
group by last_name
order by name_count desc;

-- Bonus
select t.title, round(avg(s.salary), 2) as avg_salary
from titles as t
join salaries as s
on t.emp_no = s.emp_no
where s.from_date
between t.from_date and t.to_date
and s.to_date
between t.from_date and t.to_date
group by t.title;


