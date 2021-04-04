select
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
into retirement_titles
from employees as e
inner join titles as ti
on (e.emp_no = ti.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by emp_no;

select * from retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

select * from unique_titles;


select count(ut.title), ut.title
into retiring_titles
from unique_titles as ut
group by ut.title
order by count desc;

select * from retiring_titles;


select distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibility
from employees as e
	inner join department_employees as de
		on (e.emp_no = de.emp_no)
	inner join titles as ti
		on (e.emp_no = ti.emp_no)
where (e.birth_date between '1965-01-01' and '1965-12-31')
order by emp_no;

select * from mentorship_eligibility;