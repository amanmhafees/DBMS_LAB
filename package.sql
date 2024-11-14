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
        i number:=2;
        sum number:=0;
        cnt number:=1;
    BEGIN
        while cnt<=n 
            loop
            sum := sum + i;
            i := i + 2;
            cnt := cnt + 1;
        end loop;
        return sum;
    END sumneven;

    PROCEDURE display_sumneven(N NUMBER) IS
        sumN number;
    BEGIN
        sumN := sumneven(n);
        dbms_output.put_line('sum= '|| sumN);
    END display_sumneven;
END my_package;
/

---not running has compilation errors

