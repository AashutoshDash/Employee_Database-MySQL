show databases ;
use product;
show tables;
select * from data_science_team;
select*from emp_record_table;
select*from proj_table;

# step-2: Create ER Diagram for the given product database

#step-3: fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER and DEPARTMENT from the employee record table and make a list of employees and details of their departmnent. 
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT from emp_record_table;
select  FIRST_NAME, LAST_NAME, DEPT from emp_record_table;

#Step-4: Fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER and DEPARTMENT if EMP_RATING is less than 2, greater than 2 and 4 , between 2 and 4;

select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table
where EMP_RATING<2;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table
where EMP_RATING>4;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table
where EMP_RATING between 2 and 4;

#step-5: To concatenate the FIRST_NAME and the LAST_NAME of employees in Finance department 
#from the employee table and then give the resultant coulmn alias NAME

select concat(FIRST_NAME," ", LAST_NAME ) as NAME, dept from emp_record_table where dept="Finance";

#Step-6: List only thos empoloyees who have someone reporting to them. Also show the number of reporters (including president)
select CONCAT( FIRST_NAME," ", LAST_NAME) AS NAME, ROLE from emp_record_table where ROLE = "Manager" or ROLE= "President";

#STep-7: List down all the empoloyees from healthcare and finance department using Union. Take data from emp_record_table
Select concat(FIRST_NAME," ", LAST_NAME) AS NAME, DEPT from emp_record_table 
where DEPT = "finance" or Dept= "healthcare";

select FIRST_NAME, LAST_NAME, DEPT from emp_record_table where DEPT= "finance"
UNION
select FIRST_NAME, LAST_NAME, DEPT from emp_record_table where DEPT= "healthcare";

#Step-8: list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept
#Also include respective employee rating along with max rating for that department

select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING from emp_record_table
group by dept;

select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING from emp_record_table
where EMP_RATING in (select max(EMP_RATING) FROM emp_record_table group by dept);

#step-9: calculate minimum and maximum slaary of employees in each role. Take data from emp_record_table
select min(salary) as MINIMUM_SALARY, max(salary) as MAXIMUM_SALARY, ROLE, DEPT from emp_record_table
group by role;

#step_10: Assign ranks to each employee based on their experience. Data from emp_record_table
select emp_id, FIRST_NAME, LAST_NAME, Role, DEPT, salary, rank() over(order by salary desc) as Rank_no from emp_record_table order by salary;

#step-11: Creat a view that displays employees in various countries whose salary is more than 6000. Data from emp_record_table
select emp_id, first_name, last_name, country, salary from emp_record_table
where salary>6000;
select emp_id, first_name, last_name, country, salary, rank() over( order by salary desc) as Rank_no from emp_record_table
where salary>6000;

#Step_12: Write a nested query to find employees with experiences of more than 10 years . Data from emp_record_table
select emp_id, First_name, Last_name, EXP from emp_record_table where exp>10;

#step-13: Query to create a stored procedure to retrieve the details of employees whose experience > 3 years. data from emp_record_table
Create definer = 'root'@'localhost' procedure "exp_3_years"()
Begin
select * from emp_record_table where exp>3 years 
end
call exp_3_years;

#step-14: Query using stored fucntions in the project table to check whether the job profile assigned to each employee in the data science 
# matches the the organization's set standard 
#the standard is ::---
#employee with exp of 2 to 5 years -- assign "Asscoiate data scientist"
#employee with exp of 5 to 10 years -- assign "Senior data scientist"
#employee with exp of 10 to 12 years -- assign "Lead data scientist"





#step-15: Create an index to improve the cost andf performance of the quesry to find the employee whose FIRST_NAME is "ERIC" in tne employee table after checking the execution plan 
select * from emp_record_table where FIRST_NAME="ERIC";
create index ABC on emp_record_table(FIRST_NAME(256));

#STEP-16: Query to calculate the bonus of all the employees based on their ratings and salaries (use the formula: 5% of salary* employee rating)
select FIRST_NAME, LAST_NAME, salary, emp_rating, (salary*0.05)*emp_rating as Bonus from emp_record_table;

#Step-17: Querty to calculate the average salary distribution based pon the continent and country. Data from emp_record_table
select continent, salary, avg(salary) as Avg_salary from emp_record_table group by continent;
select continent, country, salary, avg(salary) as Avg_salary from emp_record_table group by country;

