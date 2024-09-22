-- Question 1 --  

Create database Assessment;
Use Assessment;

Create table Worker(
      Worker_id int primary key,
      First_name varchar(50),
      Last_name varchar(50),
      Salary decimal(8, 2) not null,
      Joining_date Datetime,
      Department varchar(80) not null
      );
	      
Insert into Worker 
(Worker_id, First_name, Last_name, Salary, Joining_date, Department)
value 
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

-- 1. Write a SQL query to print all worker details from the Worker table order by First_name ascending and department descending
Select *
From Worker 
order by First_name and Department desc;

-- 2. Write a SQL query to print detials for workers with the first name "vipul and satish" from the worker table
Select *
From Worker
Where First_name in ('Vipul','Satish');

-- 3. Write a SQL query to print details of the workers whose first name ends with 'h' and contains six alphabets
Select *
From Worker
Where First_name like '______h';

-- 4. Write a SQL query to print details of the workers whose salary lies between 1.
Select *
From Worker
Where Salary between 75000 and 100000;

-- 5. Write a SQL query to fetch duplicate records having matching data is some fields of a table
Select *
From Worker
where (Salary, Joining_date, Department) in
      (Select Salary, Joining_date, Department
      From Worker
Group by Salary, Joining_date, Department
having count(*)>1
);

-- 6. Write a SQL query to show the top 6 rows of a table
Select *
From Worker
Limit 6;

-- 7. Write a SQL query to fetch departments that have less than 5 people in them
Select Department, count(*) as Count
From Worker
Group by Department
Having count(*)<5;

-- 8. Write a SQL query to show all departments along with the number of people in there
Select Department, count(*) as Count
From Worker
Group by Department;

-- 9. Write a SQL query to print the name of employees having the highest salary in each department
Select concat(First_name,' ',Last_name) as Full_name, salary, department 
From Worker
Order by Salary desc;

-- Question 2 --  
Create Database School;
Use School;

Create Table Student(
             StdID int Primary key,
             StdName Varchar(50),
             Sex Varchar (20),
             Percentage decimal(2),
             Class decimal (2),
             Sec varchar (20),
             Stream Varchar (20),
             DOB date not null
);

Insert into Student
(StdID, StdName, Sex, Percentage, Class, Sec, Stream, DOB)
value
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'Maahi Agarwal', 'Female', 56, 11, 'C', 'Commerce', '2008-11-22'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-05-11'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Commerce', '2006-06-29'),
(1006, 'Jahanvi Puri', 'Female', 60, 11, 'B', 'Commerce', '2006-06-29'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '2006-06-29'),
(1008, 'Sahil Saras', 'Male', 56, 11, 'C', 'Commerce', '2006-06-29'),
(1009, 'Akshra Agarwal', 'Female', 72, 12, 'B', 'Commerce', '2006-06-29'),
(1010, 'Stuti Mishra', 'Female', 39, 11, 'F', 'Commerce', '2006-06-29'),
(1011, 'Harsh Agarwal', 'Male', 42, 11, 'C', 'Commerce', '2006-06-29'),
(1012, 'Nikunj Agarwal', 'Male', 49, 12, 'C', 'Commerce', '2006-06-29'),
(1013, 'Akriti Saxena', 'Female', 89, 12, 'A', 'Commerce', '2006-06-29'),
(1014, 'Tani Rastogi', 'Female', 82, 12, 'C', 'Commerce', '2006-06-29');

-- 1. To display all records from Student table.
Select * From Student;

-- 2. To display any name and date of birth from the table Student
Select StdName, DOB
From Student;

-- 3. To display all students record where percentage is greater or equal to 80 from student table
Select * 
From Student
Where Percentage >=80;

-- 4. To display student name, stream, and percentage where percentage of student is more than 80
Select StdName, Stream, Percentage
From Student
Where Percentage >80;

-- 5. To display all records of science students whose percentage is more than 75 form student table
Select *
From Student
Where Stream = 'Science' and percentage = 75;      
             
             
             
             

  
  

 
   

       
      
      
      
      

