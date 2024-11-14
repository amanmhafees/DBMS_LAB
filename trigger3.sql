 
--To create a table with two number fields a and b and to write a trigger that satisfies the following condition: 
--a. a+b>75. 
--b. If value of b is changed, it should not be changed to a smaller value. 
--c. Also the tuples that violate these conditions should not be entered. 

create table test(a int,b int);
--table created

--inserting data
create or replace trigger test_trigger
before insert or update on test
referencing old as o new as n
for each row
when (n.a + n.b <= 75 or n.b<o.b )
DECLARE
        e1 exception;
        e2 exception;
BEGIN
         if(:n.a + :n.b<= 75 ) then
                 raise e1;
         elsif(:n.b<:o.b) then
                 raise e2;
        end if;
EXCEPTION
         when e1 then
                   raise_application_error (-20000,'Not allowed: a +b <=75');
         when e2 then
                  raise_application_error (-20001,'Present Value of b less than previous value');
END;
/
--trigger created

--SQL> INSERT INTO test (a, b) VALUES (40, 30);
--INSERT INTO test (a, b) VALUES (40, 30)
--            *
--ERROR at line 1:
--ORA-20000: Not allowed: a +b <=75