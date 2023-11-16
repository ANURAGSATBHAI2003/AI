create database library;
use library;
create table borrower (Roll_no int(10), Name varchar(20), Date_of_Issue date, Name_of_Book varchar(20), Status 
varchar(2)) ;
create table fine (Roll_no int(10), Date_ date, Amt int(8)) ;
insert into borrower values(1,'abc','2023-08-25','SEPM','I');
insert into borrower values(2,'xyz','2023-09-01','AI','I');
insert into borrower values(3,'pqr','2023-08-15','DBMS','I');
delimiter $
create procedure fine_calculator(in rollno int(10))
 begin 
 declare 
 fine1 int ;
 declare
 DOI date;
 declare
 no_of_days int;
 declare
 exit handler for SQLEXCEPTION select'create table definition'; 
 select Date_of_Issue into DOI from borrower where Roll_no=rollno ;
 select datediff(curdate(),DOI) into no_of_days;
 if no_of_days>15 and no_of_days<=30 then set fine1= (no_of_days-15) * 5;
 insert into fine values(rollno,curdate(),fine1);
 elseif no_of_days>30 then set fine1=(no_of_days-30)*50 + 15*5;
 insert into fine values (rollno,curdate(),fine1);
 else
 insert into fine values(rollno,curdate(),0); 
 end if;
 update borrower set Status='R' where Roll_no=rollno;
end $
delimiter ;
call fine_calculator(1);
call fine_calculator(2);
call fine_calculator(3);
select "⇓⇓⇓ Following is the borrower table ⇓⇓⇓" as "";
select * from borrower;
select "⇓⇓⇓ Following is the fine table ⇓⇓⇓" as "";
select * from fine;
drop database library;
