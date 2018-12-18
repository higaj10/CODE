--1.
select staff_name, staff_sal, dept_code 
from staff_master 
where dept_code in (10,20,30);


--2.
select staff_name as Name, staff_sal as Sal, dept_code as DCode 
from staff_master
where dept_code in (10,20,30);


--3.
select student_code, student_name, Subject1+Subject2+Subject3 as Total 
from student_marks;


--4.
select * 
from staff_master s, designation_master d
where s.design_code = d.design_code and design_name in ('Professor', 'Lecturer');


--5.
select staff_code, staff_name, dept_code 
from staff_master 
where round((sysdate-HireDate)/365) >18;


--6. List the name and Designations of the staff who have joined before Jan 2003.

select staff_name, design_name 
from staff_master s, designation_master d
where s.design_code = d.design_code and hiredate < '01-JAN-2003'; 


--7. List the name, designation, and income for 10 years of the employees who are working in departments 10 and 30.

select staff_name, design_name, staff_sal*10 as "income for 10 years"
from staff_master s, designation_master d
where s.design_code = d.design_code and dept_code in (10,20);


--8. List the name and experience (in years) of employees who are working as LECTURER.

select staff_name, round((sysdate-HireDate)/365)
from staff_master s, designation_master d
where s.design_code = d.design_code and design_name ='Lecturer';


--9. Display name concatenated with dept code separated by comma and space. Name the column as ‘Student Info’.

select (student_name || ',' || dept_code) as ‘Student Info’ 
from student_master;


--10. List the Name and Salary of the staff who are earning between 12000 and 25000.
--Sort them based on their salaries and name.

select staff_name, staff_sal
from staff_master 
where staff_sal between 12000 and 25000;


--11. Display employees who do not have manager.

select staff_name 
from staff_master
where staff_code not in(select distinct mgr_code from staff_master);


--12. Write a query which will display name, department code and date of birth of all
--students who were born between January 1, 1981 and March 31, 1983. Sort it based
--on date of birth (ascending).

select staff_name, dept_code, staff_dob
from staff_master
where staff_dob between '01-JAN-1981' and '31-MAR-1983'
order by staff_dob;


--13. Get the Department number, and sum of Salary of all non managers where the
--sum is greater than 20000.

select dept_code, sum(staff_sal)
from staff_master
where staff_code not in (select distinct mgr_code from staff_master)
group by dept_code 
having sum(staff_sal)>20000;


--14. Display the details of books that have not been returned and expected return date
--was last Monday.

select * 
from book_transactions
where book_actual_return_date is null and  
to_char(book_expected_return_date,'fmDay') = 'Monday';



--15. Display the name and department code of students. If student does not belong to
--any department, display “No Department”. Label the column as “Department”.

SELECT student_name, NVL(TO_CHAR(dept_code),'No Department') as “Department”
FROM student_master s;


--16. Display the name and salary of the staff. Salary should be represented as X. Each
--X represents a 1000 in salary.
--Sample Output
--JOHN 10000 XXXXXXXXXX
--ALLEN 12000 XXXXXXXXXXXX

SELECt staff_name, staff_sal, rpad('X',staff_sal/1000,'X')
FROM staff_master;
