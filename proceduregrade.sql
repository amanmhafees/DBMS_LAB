--question
--Write a PL/SQL program to display the grade of a particular student from student database. Use a stored 
--procedure to display the grade. 
--TOTAL MARK  GRADE   
-->100    A 
--70-100    B 
--50-70    C 
--<50     Fail 


--answer 

--create table
CREATE TABLE student (
    stud_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    total_mark NUMBER(5)
);

--insert data
INSERT INTO student (stud_id, name, total_mark) VALUES (1, 'Alice', 105);
INSERT INTO student (stud_id, name, total_mark) VALUES (2, 'Bob', 85);
INSERT INTO student (stud_id, name, total_mark) VALUES (3, 'Charlie', 65);
INSERT INTO student (stud_id, name, total_mark) VALUES (4, 'David', 45);


--PROCEDURE CREATION 

create or replace procedure pr(n number) is --'IS' FOR SHOWIN THE BEGINING OF PROCEDURE
tot number;
begin
	select total_mark into tot from student where stud_id=n;
	if tot > 100 then
		dbms_output.put_line('A');
	elsif (tot>70 and tot<100) then
		dbms_output.put_line('B');
	elsif (tot>50 and tot<70) then
		dbms_output.put_line('C');
	elsif (tot<50) then
		dbms_output.put_line('FAIL');
	end if;
end;
/

--PL\SQL PROGRAM TO CALL THE PROCEDURE

DECLARE
	r number;
BEGIN
	dbms_output.put_line('Enter the roll number: ');
	r:=&r;
	pr(r);
END;
/



