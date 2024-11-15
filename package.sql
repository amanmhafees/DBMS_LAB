-- an example that creates a package containing a function to sum the first N even numbers (sumneven) 
--and a procedure to display the result (display_sumneven).

--creating a package
create or replace package my_package as

    FUNCTION sumneven(n number) return number;

    PROCEDURE display_sumneven(n number);
END my_package;
/
--package created

--creating package body

create or replace package body my_package as
    --creating the function inside package body
    FUNCTION sumneven (n number) return number is
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

    --creating the procedure inside package body
    PROCEDURE display_sumneven (n number) is
    BEGIN
        dbms_output.put_line('SUM = ' || sumneven(n));
    END;
END my_package;
/

--package body created

--calling the function and procedure
declare
    n number;
begin
    n:=&n;
    my_package.display_sumneven(n);
end;
/

