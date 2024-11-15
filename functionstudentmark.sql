--Write a function which accepts the reg_no and print the total marks. The student table has the fields: reg_no, 
--name, physics_mark, chemistry_mark and maths_mark. 

create table student4(regno number(5), phy number(3), chem number(3), math number(3));

--inserting data
insert into student4 values(1, 79, 83, 81);
insert into student4 values(2, 97, 93, 100);
 insert into student4 values(3, 54, 67, 44); 

--function
create or replace function totalmarks(regno number) return number is
phy number;
chem number;
math number;
total number;
begin
select phy,chem,math into phy,chem,math from student4 where regno=regno;
total:=phy+chem+math;
return total;
END;
/

--FUNCTION CREATED

--CALLING FUNCTION
DECLARE 
	regno number;
BEGIN
	regno:=&regno;
	dbms_output.put_line('Total marks of ' || regno || 'is ' || totalmarks(regno));
END;
/