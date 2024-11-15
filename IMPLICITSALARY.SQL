--Write a PL/SQL program to update salary of Sindhu by 30% if she is earning salary>10000, otherwise update 
--by 20% if salary>8000, otherwise update by 10%. (Table name: income( ename, salary). 

CREATE TABLE income(ename varchar(10),salary int);

INSERT INTO income VALUES('Sindhu',10000);

DECLARE
SAL INCOME.SALARY%TYPE;
BEGIN
SELECT SALARY INTO SAL FROM INCOME WHERE ENAME='Sindhu';

IF SAL>10000 THEN
UPDATE INCOME SET SALARY=SAL*1.3 WHERE ENAME='Sindhu';
ELSIF SAL>8000 THEN
UPDATE INCOME SET SALARY=SAL*1.2 WHERE ENAME='Sindhu';
ELSE
UPDATE INCOME SET SALARY=SAL*1.1 WHERE ENAME='Sindhu';
END IF;
END;
/
