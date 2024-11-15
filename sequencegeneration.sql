--To write a PL/SQL program to obtain the sequence 1, 4, 9, 16...

DECLARE
    N NUMBER := 1;
    cnt number;
    limit number;
BEGIN
    cnt:=1;
    limit:=&limit;
    while(cnt<=limit) loop
        DBMS_OUTPUT.PUT_LINE(N);
        cnt:=cnt+1;
        n:=cnt*cnt;
    end loop;
END;
/
    