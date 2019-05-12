--Had to clean up the data to make it easier to import the data csvs. 
--Therefore dropped the non-unique PK and just added a serial ID PK.
Alter table "Dept_emp" drop constraint primary_key_constraint;
Alter table "Titles" drop constraint primary_key_constraint;
Alter table "Dept_emp" add column ID Serial Primary Key;
Alter table "Titles" add column ID Serial Primary Key;

--1)list emp_no,first,last name, Gender and Salary
select e."Emp_no", e."First_name",e."Last_name",e."Gender",s."Salary"
from "Employees" e
full join "Salaries" s
on (e."Emp_no"=s."Emp_no");

--2)list employees who were hired in 1986
Select "First_name","Last_name", 
extract (year from "Hire_date") as year
from "Employees"
where extract (year from "Hire_date")='1986'
;

--3)List manager of each Dept:dept_no,dept_name,Emp_no,first_name,last_name,start & to date
Create view Combined as
Select "Employees"."Emp_no","Employees"."First_name",
"Employees"."Last_name","Dept_emp"."Dept_no","Dept_emp"."from_date",
"Dept_emp"."to_date","Dept"."Dept_name"
from "Employees"
full join "Dept_emp"
on ("Dept_emp"."Emp_no"="Employees"."Emp_no")
full join "Dept"
on ("Dept_emp"."Dept_no"="Dept"."Dept_no");

Select * ,
( Select "Dept_manager"."Dept_no"
 	from "Dept_manager"
	where Combined."Dept_no"="Dept_manager"."Dept_no") 
from Combined;

--4)List the department of each employee: emp_no, last name, first name, and dept_name.
Select "Employees"."Emp_no","Employees"."First_name",
"Employees"."Last_name","Dept"."Dept_name"
from "Employees"
full join "Dept_emp"
on ("Dept_emp"."Emp_no"="Employees"."Emp_no")
full join "Dept"
on ("Dept_emp"."Dept_no"="Dept"."Dept_no");

--5)List all employees whose first name is "Hercules" and last names begin with "B."
Select *
from "Employees"
where "First_name" like 'Hercules' and "Last_name" like'B%';

--6)List all Sales department:emp_no, last name, first name, and dep_name.
Create view Dept_overview As
Select "Employees"."Emp_no","Employees"."First_name",
"Employees"."Last_name","Dept"."Dept_name"
from "Employees"
full join "Dept_emp"
on ("Dept_emp"."Emp_no"="Employees"."Emp_no")
full join "Dept"
on ("Dept_emp"."Dept_no"="Dept"."Dept_no");

Select *
from Dept_overview
where "Dept_name" like 'Sales';

--7)List employees Sales and Development departments:emp_no, last name, first name,dept_name
Select *
from Dept_overview
where 
	"Dept_name"='Development' 
	or "Dept_name"='Sales';
	
--8)In descending order frequency count of employee last names, i.e., how many employees share each last name.
Select "Last_name",count("Last_name") As "value_count"
from "Employees"
Group by "Last_name"
Order by "value_count" desc;