create database employee;
use employee;

select * from data_science_team;
select * from emp_record_table;
select * from proj_table;

-- E-R MODEL DONE

-- 3
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT from emp_record_table;

-- 4
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING,
   case
     when EMP_RATING < 2 THEN ' LESS THAN TWO'
     WHEN EMP_RATING <= 4 THEN 'BETWEEN TWO AND FOUR'
     ELSE
       'GREATER THAN FOUR'
	END AS RATING_STATUS
from emp_record_table;

-- 5
select CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME from emp_record_table 
     WHERE DEPT = 'FINANCE';
	
-- 6
select m.FIRST_NAME as ManagerNmae, e.EMP_ID, e.FIRST_NAME,
   COUNT(*) OVER(partition by m.FIRST_NAME) as count
   from emp_record_table e
   JOIN
   emp_record_table m 
   on e.Manager_ID = m.Emp_id;
   
   -- 7 
select * from emp_record_table where dept = 'healthcare'
union
select * from emp_record_table where dept = 'finance';

-- 8
select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING,
  max(Emp_rating) OVER (partition by dept) as Max_rating
from emp_record_table;

-- 9
select Role, min(salary) as Minsalary, max(salary) as Maxsalary from emp_record_table 
 GROUP BY Role;
 
 -- 10
select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, Exp,
 dense_rank() over (order by exp desc) as RankbyExp
from Emp_Record_table;

-- 11
CREATE VIEW emp_salary
 AS 
select EMP_ID, FIRST_NAME, LAST_NAME, Role, DEPT, Exp, Salary
 from emp_record_table 
   where Salary > 6000;
   
-- 12
select * from emp_record_table where Emp_id in(
  select Emp_id from emp_record_table where exp > 10);
  
-- 13
select * from emp_record_table where exp>3;
call getemployeeexp;

-- 14
select exp, emp_role(Exp) as Employee_role from data_science_team;

-- 15
select * from emp_record_table where FIRST_NAME = 'Eric';

-- 16
-- Use the formula: 5% of salary * employee rating)
select * from emp_record_table;

select Emp_rating, Salary, 0.05 * salary * Emp_rating as Bonus from emp_record_table;

-- 17
select country, continent, avg (salary) as Averagesalary
from emp_record_table 
group by country, continent;


 
 
 











































































































































































































































































































































































































































































































































































