--To create a table student with fields - rollno, stud_name, sessionals, univ_mark. If sessionals + univ_mark 
-->150, raise an error message. Also handle all the possible exceptions. 

create table student(rollno int primary key,stud_name varchar(10),sessionals int,univ_mark int);

--inserting data
insert into student values(1,'NORAH',100,100);
insert into student values(2,'ALEX',50,50);
insert into student values(3,'EMILY',150,150);

DECLARE
    SESSIO NUMBER;
    MARK NUMBER;
    E1 EXCEPTION;
BEGIN
    SELECT SESSIONAL,UNIV_MARKS INTO SESSIO,MARK FROM student WHERE ROLLNO=1;
    IF(SESSIO+MARK>150) THEN
        RAISE E1;
    END IF;
EXCEPTION
    WHEN E1 THEN
        DBMS_OUTPUT.PUT_LINE('NOT ALLOWED');

    --for all other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR');
END;
/

--can use trigger also
CREATE OR REPLACE TRIGGER check_marks
BEFORE INSERT OR UPDATE ON student
FOR EACH ROW
DECLARE
    invalid_marks EXCEPTION;
BEGIN
    -- Check if the sum of sessionals and univ_mark exceeds 150
    IF :NEW.sessionals + :NEW.univ_mark > 150 THEN
        RAISE invalid_marks;
    END IF;
EXCEPTION
    WHEN invalid_marks THEN
        -- Raise an error with a meaningful message
        RAISE_APPLICATION_ERROR(-20001, 'Total marks (sessionals + univ_mark) cannot exceed 150.');
    WHEN OTHERS THEN
        -- Handle any other unexpected exceptions
        RAISE_APPLICATION_ERROR(-20002, 'An unexpected error occurred: ' || SQLERRM);
END;
/
