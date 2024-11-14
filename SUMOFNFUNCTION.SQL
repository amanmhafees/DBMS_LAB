--Write a function to find sum of first N even numbers 

--function creation
create or replace function sumneven(n number) return number is
i number :=2;
s number :=0;
cnt number :=1;
BEGIN
	while cnt<=n 
		loop
			s:=s+i;
			i:=i+2;
			cnt:=cnt+1;
		end loop;
	return s;
END;
/


--function calling
DECLARE
    n NUMBER;
    sum NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter the limit: ');
    n := &n;  -- Prompts the user to enter a value for n
    
    DBMS_OUTPUT.PUT_LINE('SUM = ' || sumneven(n));  -- Outputs the result
END;
/

