--To write a PL/SQL program to update salary of all employees by 20%. If total salary>100000 then rollback else 
--commit. 



DECLARE
    total_salary NUMBER;
BEGIN
    -- Update all employees' salary by 20%
    UPDATE income1
    SET salary = salary * 1.2;

    -- Calculate the total salary
    SELECT SUM(salary) INTO total_salary FROM income1;

    -- Check if the total salary exceeds 100,000
    IF total_salary > 100000 THEN
        -- Rollback the transaction if condition is met
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaction rolled back: Total salary exceeds 100,000.');
    ELSE
        -- Commit the transaction otherwise
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transaction committed: Total salary is within limits.');
    END IF;
END;
/




