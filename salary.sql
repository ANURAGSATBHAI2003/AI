create database Company;
use Company;
create table Employee (Empid int(10) primary key, Name varchar(20), Basic_salary int(10), type varchar(20));
create table Salary (Empid int(10) ,basic_salary int(10),gross_salary int(10), net_salary int(10) );
insert into Employee values(101,"parimal",20000,"Permanent");
insert into Employee values(102,"Saish",21000,"Permanent");
delimiter $
create procedure salary_count(in emp_id int(10))
begin
 declare emp_type varchar(15);
 declare Basic_salary int(10);
 declare DA int(10);
 declare HRA int(10);
 declare net_salary int(10);
 declare income_tax int(10);
 declare Gross_Salary int(10); 
 declare Deduction int(10);
 declare
 exit handler for SQLEXCEPTION select'create table definition';
 select E.Basic_salary into Basic_salary from Employee E where E.Empid=emp_id;
 select type into emp_type from Employee where Empid=emp_id;
 if emp_type="Permanent" then set Deduction=2000 ;
 set DA=(Basic_salary)*0.50;
 set HRA=(Basic_salary)*0.12;
 set Gross_salary=Basic_salary+DA+HRA;
 set net_salary=Gross_salary-Deduction;
 
 insert into Salary values(emp_id,Basic_salary, Gross_salary,net_salary) ;
 end if;
end $
delimiter ;
call salary_count(101);
call salary_count(102);
select * from Employee;
select * from Salary ;
drop database Company;
