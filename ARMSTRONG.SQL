--write a PL/SQL program to check given number is Armstrong or not.

DECLARE 
    n number;
    m number;
    rem number;
    s number;
BEGIN
    n:=&n;
    m:=n;
    s:=0;
    while n>0 loop
        rem:=n mod(10);--can also be written as mod(n,10);
        s:=s+(rem*rem*rem);
        n:=n/10;
        n:=trunc(n);
    END loop;
    if s=m then
        dbms_output.put_line('Armstrong');
    else
        dbms_output.put_line('Not Armstrong');
    end if;
END;
/