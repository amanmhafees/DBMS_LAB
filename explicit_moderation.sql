--To create a table T1 having 3 fields(rollno, univ_mark and sessionals). Write a PL/SQL program to do the 
--following: If sessionals is in between 30 and 34, then give necessary moderation so that it comes up to 35. If 
--univ_mark+sessionals>75, then insert those tuples into another table T2. 


--CREATING TABLE
CREATE TABLE T1
(
    ROLLNO NUMBER PRIMARY KEY,
    UNIV_MARK NUMBER,
    SESSIONALS NUMBER
);

--INSERTING DATA
INSERT INTO T1 VALUES(1,10,10);
INSERT INTO T1 VALUES(2,20,20);
INSERT INTO T1 VALUES(3,30,30);
INSERT INTO T1 VALUES(4,40,40);
INSERT INTO T1 VALUES(5,50,50);
INSERT INTO T1 VALUES(6,60,60);




DECLARE 
    T T1%ROWTYPE;
    CURSOR T_CURSOR IS SELECT * FROM T1;
BEGIN
    OPEN T_CURSOR;
     IF(T_CURSOR%ISOPEN) THEN
        LOOP
            FETCH T_CURSOR INTO T;
            EXIT WHEN T_CURSOR%NOTFOUND;
            IF(T.SESSIONALS BETWEEN 30 AND 34) THEN
                T.SESSIONALS:=35;
                INSERT INTO T2 VALUES(T.ROLLNO,T.UNIV_MARK,T.SESSIONALS);
            END IF;
            IF(T.SESSIONALS+T.UNIV_MARK>75) THEN
                INSERT INTO T2 VALUES(T.ROLLNO,T.UNIV_MARK,T.SESSIONALS);
            END IF;
        END LOOP;
    END IF;
    CLOSE T_CURSOR;
END;
/
