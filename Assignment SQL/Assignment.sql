-- 1. Display all information in the tables employees and departments
Select
      E.*,
      D.*
From Employees E
Join Departments D
On E.Department_id = D.Department_id;

--  2. Display only hire date and employee name for each employee
Select concat(first_name,' ',last_name) as full_name, Hire_date
From Employees;

-- 3. Display the ename concated with the job id, separated by comma and space, and name the column employee and title
Select Concat(First_name,' ',last_name,',',' ',Job_id) as Employee_and_title
From Employees;

-- 4. Display the hire date, name and department number for all clerks.
Select Concat(First_name,' ',last_name) as Full_name, Hire_date, Department_id
From Employees;

-- 5. Create a query to display all the data from the employee table. Separate each column by a comma. Name the column The Output
Select
concat(
Employee_id,',',
First_name,',',
last_name,',',
email,',',
phone_number,',',
hire_date,',',
job_id,',',
salary,',',
commission_pct,',',
manager_id,',',
department_id,','
) as The_Output
From Employees;

-- 6. Display the names and salaries of all the employees with a salary greater than 2000
select Concat(First_name,' ',last_name) as Full_name, Salary
From Employees
Where Salary > '2000';

-- 7. Display the names and dates of employees with the column headers "name" and "start date"
Select Concat(First_name,' ',last_name) as 'Name', Hire_date as Start_date
From Employees;

-- 8. Display the names and hire dates of all employees in the order they were hired
select Concat(First_name,' ',last_name) as Full_Name, Hire_date
From employees
order by Hire_date;

-- 9. Display the name and salaries of all employees in reverse salary order
select Concat(First_name,' ',last_name) as Full_Name, salary
From Employees
order by salary desc;

-- 10. Display ename and deptno who are all earned commission and display salary in reverse order
select Concat(First_name,' ',last_name) as 'Ename', Department_id as 'Deptno'
From employees
where commission_pct is not null
order by salary desc;

-- 11. Display the last name and job title of all employees who do not have a manager
Select E.last_name, J.Job_title
From Employees E
Join Jobs J
On E.Job_id = J.Job_id
where manager_id is null;

-- 12. Display the last name, job and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to 2500, 3500 or 5000
Select E.last_name, E.Salary, J.Job_title
From Employees E
Join Jobs J
Using (Job_id)
Where J.Job_title in ('Sales representative','stock clerk') and salary not in (2500, 3500,5000);

--  End of Page 1 -- 

-- 1. Display the maximum, minimum and average salary and commission earned
Select avg(E.salary), E.commission_pct, J.max_salary, J.min_salary
From Employees E
Join Jobs J
On E.Job_id = J.Job_id
Group by E.commission_pct, J.max_salary, J.min_salary;

-- 2. Display the department number, total salary payout and total commission payout for each department.
Select Department_id, sum(salary), sum(commission_pct)
From employees
Group by department_id;

-- 3. Display the department number and number of employees in each department
Select count(Employee_id), Department_id
From Employees
Group by Department_id;

-- 4. Display the department number and total salary of employees in each department
Select Department_id, sum(salary)
From employees
group by department_id;

-- 5. Display the employees name who doesnot earn commission. Order the result set without using the column name
Select Concat(First_name,' ',last_name) as Full_Name
From Employees
where Commission_pct is null
order by 1;	

-- 6. Display the employees name, department id and commission. If an employee doesnot earn the commission, then display as 'no commission'. Name the column appropriately
Select Concat(First_name,' ',last_name) as Full_Name, Department_id,
Case
    when Commission_pct is null then 'No Commission'
    Else (commission_pct)
End as Commission    
From employees;

-- 7. Display the employees name, salary andcommission multiplied by 2. If an employee doesnot earn th commission, then display no commission. Name the columns appropriately
Select Concat(First_name,' ',last_name) as Full_Name, Salary,
Case
    When Commission_pct is null then 'No Commission'
    Else (Commission_pct*2)
End as Commission
From Employees;    

-- 8. Display the employees name, department id who have first name same as another employee in the same department
Select E1.First_name, E1.Department_id
From Employees E1
Join Employees E2
    On E1.First_name = E2.First_name
    and E1.Department_id = E2.Department_id
    and E1.Employee_id <> E2.Employee_id;
    
-- 9. Display the sum of salaries of the employees working under each manager
Select Manager_id, sum(salary)
From Employees
Group by manager_id;

-- 10. Select the manager name, the count of employees working under and the department id of the manager
Select First_name as Manager_name, count(employee_id) as employee_count, department_id
From employees 
Group by Employee_id;

-- 11. Select the employee name, department id and the salary. Group the result with the manager name and the employee last name should have second letter 'a'
Select Concat(First_name,' ',last_name) as Manager_name, Department_id, salary
From employees
where last_name like '_a%';

-- 12. Display the average of sum of the salaries and group the result with the department_id. Order the result with the department_id
Select Department_id, avg(Total_salary) as average_salary
From (
      Select Department_id,
      sum(Salary) as Total_salary
    From Employees
    Group by Department_id
  ) as Department_Totals
Group by Department_id
Order by Department_id;

-- 13. Select the maximum salary of each department along with the department id
Select J.Max_salary, E.Department_id
From Jobs J
Join Employees E
On J.Job_id = E.Job_id; 

-- 14. Display the commission, if not null display 10% of salary, if null display a default value 1
Select Salary,
Case
    When commission_pct is null then salary*0.10
    Else 1
End as Adj_Commission
From Employees;    
 
-- End of Page 2 --   
 
-- 1. Write a query that displays the employees last names only from the strings 2-5th position with the first letter capitalized and all other lettrs lowercase. Give each column an appropirate label
Select CONCAT(UPPER(SUBSTRING(SUBSTRING(last_name, 2, 4), 1, 1)), LOWER(SUBSTRING(SUBSTRING(last_name, 2, 4), 2))) AS formatted_last_name
FROM employees;

-- 2. Write a query that displays the employees first name and last name along with a '-' in between for eg first name: Ram; last name: Kumar then Ram-Kumar. Also displays the month on which the employee has joined
Select concat(E.First_name,'-',E.Last_name) as Full_name, month(J.Start_date) as 'Month' 
From Employees E
Join Job_History J
On E.Employee_id = J.Employee_id;

-- 3. Write a query to display the employees last name and if half of the salary is greater than 10000 then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.
Select Last_name, salary as Original_Salary,
Case
    When Salary/2 > 10000 then salary*1.10
    Else Salary*1.115
End as Adj_Salary,
1500 as Bonus_Amount
From Employees;    
 
-- 4. Display the employees id by appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in upper case, if the manager name consists of 'Z' replace it with '$'.  
SELECT 
    CONCAT(SUBSTRING(employee_id, 1, 2), '00', SUBSTRING(employee_id, 3), 'E') AS formatted_employee_id,
    department_id,
    salary,
    REPLACE(UPPER(First_name), 'Z', '$') AS formatted_manager_name
FROM 
    employees;  
    
-- 5. Write a query that displays the employees last names with the first lettr capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the result by the employees last name
SELECT 
    Last_name,
    length(last_name) AS name_length
FROM 
    employees
WHERE 
    LEFT(last_name, 1) IN ('J', 'A', 'M')
ORDER BY 
    last_name;  
    
-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left padded with '$'. Label the column salary

SELECT 
    last_name,
    LPAD(CAST(salary AS CHAR), 15, '$') AS salary
FROM 
    employees;
    
-- 7. Display the employees name if it is a palindrome   
SELECT 
    last_name
FROM 
    employees
WHERE 
    REVERSE(last_name) = last_name;
    
-- 8. Display first names of all employees with initcaps
SELECT 
    CONCAT(UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2))) AS formatted_first_name
FROM 
    employees;
    
-- 9. From loations table extract the word between first and second space from the street address column     
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 3), ' ', -1) AS word_between_spaces
FROM 
    locations;
    
-- 10. Extract first letter from first name column and append it with the last name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their first name
SELECT 
    first_name,
    LOWER(CONCAT(LEFT(first_name, 1), LOWER(last_name), '@systechusa.com')) AS email_address
FROM 
    employees;
    
-- 11. Display the names and job titles of all employees with the same job as Trenna.
select concat(E.First_name,' ',E.last_name) as Full_name, J.Job_title
From Employees E
Join Jobs J
on E.Job_id = J.Job_id
where J.Job_title = (
    Select J2.Job_title
    From Employees E2
    Join Jobs J2 
    On E2.Job_id = J2.Job_id
    Where E2.First_Name = 'Trenna');
    
-- 12. Display the names and department name of all employees working in the same city as Trenna
SELECT 
    e.first_name,
    e.last_name,
    d.department_name
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
WHERE 
    l.city = (
        SELECT 
            l2.city
        FROM 
            employees e2
        JOIN 
            departments d2 ON e2.department_id = d2.department_id
        JOIN 
            locations l2 ON d2.location_id = l2.location_id
        WHERE 
            e2.first_name = 'Trenna'
    );

-- 13. Display the name of the employees whose salary is the lowest
Select concat(First_name,' ',last_name) as Full_name, salary
From employees
Where salary = (SELECT MIN(salary) FROM employees);

-- 14. Display the names of all employees except the lowest paid
SELECT 
    first_name, 
    last_name
FROM 
    employees
WHERE 
    salary > (SELECT MIN(salary) FROM employees);     
    
-- End og Page 3 --      
        
-- 1. Write a query to display the last name, department number, department name for all employees
Select E.last_name, E.department_id, D.Department_name
From Employees E
Join Departments D
On E.department_id = D.Department_id;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output
select distinct job_title,city
from jobs j
join employees e
  on j.job_id = e.job_id
join departments d
  on e.department_id = d.department_id
join locations l 
 on d.location_id = l.location_id;
 
-- 3. Write a query to display the employee last name, department name, location id and city of all employees who earn commission
select e.last_name,d.location_id,l.city
from employees e
left join departments d
 on e.department_id = d.department_id
join locations l
 on d.location_id = l.location_id
where commission_pct is not null;

-- 4. Display the employee last name, department name of all employees who have an 'a' in their last name
select e.last_name,d.department_name
from employees e
join departments d
 on e.department_id = d.department_id
where e.last_name like "%a%";

-- 5. Write a query to display the last name, job, department number and department name for all employees who work in ATLANTA
select e.last_name,j.job_title,d.department_id,d.department_name
from jobs j
join employees e
 on j.job_id=e.job_id
join departments d
 on e.department_id = d.department_id
join locations l
 on d.location_id = l.location_id
where l.city = "ATLANTA";

-- 6. Display the employee last name and employee number along with their manager's last name and manager number
select e.last_name as employee_last_name,
e.employee_id as employee_number,
m.last_name as manager_last_name,
m.manager_id as manager_number
from employees e
left join employees m
 on e.manager_id= m.employee_id;
 
-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager)
select e.last_name as employee_last_name,
e.employee_id as employee_number,
m.last_name as manager_last_name,
m.manager_id as manager_number
from employees e
join employees m
 on e.employee_id= m.manager_id;
 
-- 8. Create a query that displays employees last name, department number and all the employees who work in the same department as a given example
select e.last_name,e.department_id,m.last_name
from employees e
join employees m
 on e.department_id = m.department_id
where e.employee_id =101 and e.employee_id <> m.employee_id;

-- 9. Create a query that displays the name, job, department name, salary, grade for all employees. Derive the grade based on salary (>=50000=A, >=30000=B, <30000=C)
select concat(e.first_name," ",e.last_name) as name,e.salary,e.job_id,d.department_name,
case
   when salary>=50000 then "A"
   when salary>=30000 then "B"
   else "C"
   end as grade
from employees e
join departments d
 on e.department_id = d.department_id;
 
-- 10. Display the names and hire date for all employees who were hired before their managers along with their manager names and hire date. Label the columns as emp_name, emp_hire_date, manager name, man_hire_date
select e.first_name as E_name,e.hire_date ,m.first_name as m_name,m.hire_date
from employees e
join employees M
on e.manager_id= m.employee_id
where e.hire_date < m.hire_date;

-- End of Page 4 --  

-- 1. Write a query to display the last name and the hire date of any employee in the same department as Sales
Select E.Last_name, E.Hire_date
From Employees E
Join Departments D
Using (Department_id)
Where Department_Name = 'Sales';

-- 2. To display the employee numbers and last names of all the employees who earn more than the average salary. Sort the results in ascending order of salary
select employee_id ,last_name
from employees
where salary>(select avg(salary) as avg_salary from employees);

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains u
select employee_id,last_name
from employees
where last_name like "%u%";

-- 4. Display the last name, department number, and job id of all the employees whose department location is Atlanta
select e.last_name,e.department_id,e.job_id
from employees e
left join departments d
 on e.department_id = d.department_id
join locations l
 on d.location_id = l.location_id
where l.city = "ATLANTA";

-- 5. Display the last name and salary of every employee who reports to Fillmore.
select last_name,salary
from employees
where manager_id = (select manager_id from employees where first_name = "fillmore");

-- 6. Display the department number, last name, and job id for every employee in the operation department
select department_id last_name,job_id
from employees
where (select department_id from departments
         where department_name  = "operations") = department_id;

-- 7. Modify the above query to display the employee numbers, last names and salaries of all employees who earn more than the average salary and who works in a department with any employee with a 'u' in their name
select employee_id,last_name,salary
from employees
where salary> (select avg(salary) from employees)
and last_name like "%u%";

-- 8. Display the name of all employees whose job title is the same as anyone in the sales dept.
select concat(first_name," ",last_name) as name
from employees
where department_id = (select department_id from departments where department_name = "sales");

-- 9. Write a compound query to produce a list of employees showing raise percentage, employees id and salaries. Employees in department 1 and 3 are given a 5% raise , employees in department 2 are given 10% raise, employees in department 4 and 5 are given a 15% raise and employees in department 6 are not given raise
Select E.Employee_id, E.Salary,
Case 
    When D.Department_id in (10,30) then 0.05
    When D.Department_id in (20) then 0.10
    When D.Department_id in (40,50) then 0.15
    Else 0.00
End as Raised_Percentage
From Employees E
Join Departments D
On E.Department_id = D.Department_id;

-- 10. Write a query to display the top three earners in the Employees table. Display their last names and salaries
Select Last_name, Salary
From Employees
Order By Salary Desc
Limit 3;

-- 11. Display the names of all the employees with their salary and commission earned. Employees with a null commissio show have 0 in the commission column
Select concat(first_name,' ',last_name) as full_name, salary,
Case 
    When Commission_pct is null then 0
    Else Commission_pct
End as Commission_pct
From Employees;

-- 12. Display the managers name with top three salaries along with their salaries and deparment information
Select concat(E.first_name,' ',E.last_name) as full_name, E.salary, E.department_id, D.Department_Name
From Employees E
Join Departments D
On E.Department_id = D.Department_id
Order by salary desc
LImit 3;

-- End of Page 5 --  

-- Date function 1. Find the date difference between the hire date and resignation date for all the employees. Display in no of days, months and year (1 year 3 months 5 days)
select employee_id,start_date,end_date,
timestampdiff(day,start_date,end_date) as total_days,
concat(floor(timestampdiff(year,start_date,end_date)), " year ",
floor(timestampdiff(day,start_date,end_date)%365 / 30 ) , " months ",
floor(timestampdiff(day,start_date,end_date)%365 % 30 ) , " days ") as difference
from job_history;

-- 2. Format the hire date as mm/dd/yyyy and resignation date as mon dd,yyyy. Display the null as (dec, 01th 1900)
select date_format(start_date,"%m/%d/%Y") as hire_date,
case  when end_date is not null then date_format(end_date,"%M %d, %Y") else "DEC, 01 1900" end as end_date
from job_history;

-- 3. Calculate experience of all employees till date in years and months (example 1 year and 3 months)
select hire_date,
   concat( floor(TIMESTAMPDIFF(day, hire_date, CURDATE())/365)," year and ",
    floor(TIMESTAMPDIFF(day, hire_date, CURDATE())%365 / 30 ), " months") as experience
    from employees;
    
-- 4. Display the count of days in the previous quarter
SELECT DATEDIFF(
    last_day(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) QUARTER)),
    DATE_ADD(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL (QUARTER(CURDATE()) + 1) QUARTER)), INTERVAL 1 DAY)
) + 1 AS days_in_previous_quarter;

-- 5. Fetch the previous Quarter's second week's first day's date
SELECT DATE_ADD(
    DATE_SUB(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) QUARTER)), INTERVAL 1 MONTH), 
    INTERVAL 7 DAY
) AS first_day_second_week_previous_quarter;

-- 6 Fetch the financial year's 15th week's dates (Format: Mon DD YYYY) 
SELECT 
    DATE_FORMAT(DATE_ADD(financial_year_start, INTERVAL (15 - 1) * 7 DAY), '%a %d %Y') AS start_of_15th_week,
    DATE_FORMAT(DATE_ADD(financial_year_start, INTERVAL 15 * 7 - 1 DAY), '%a %d %Y') AS end_of_15th_week
FROM (
    SELECT IF(MONTH(CURDATE()) >= 4, 
               MAKEDATE(YEAR(CURDATE()), 91),  
               MAKEDATE(YEAR(CURDATE()) - 1, 91)) AS financial_year_start  
) AS financial_year;

-- 7.  Find out the date that corresponds to the last Saturday of January, 2015 using with clause. 
WITH january_2015 AS (
    SELECT '2015-01-31' AS last_day_january  
)
SELECT 
    DATE_SUB(last_day_january, INTERVAL WEEKDAY(last_day_january) + 1 DAY) AS last_saturday
FROM january_2015;        

 

    
     
     

    

    
 