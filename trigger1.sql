--To create an account table(acc_no, cname, balance, branch_name), loan table(loan_no, amt, branch_name), 
--borrower table(cname, loan_no). Create a trigger to perform the following operations: Whenever the balance 
--becomes negative, create a loan in the amount of overdraft. The loan_no is given same as acc_no.

--creating tables

create table account(acc_no int primary key,cname varchar(10),balance int,branch_name varchar(10));
create table loan(loan_no int primary key,amt int,branch_name varchar(10));
create table borrower(cname varchar(10),loan_no int,foreign key(loan_no) references loan(loan_no));

--table created
INSERT INTO account (acc_no, cname, balance, branch_name) VALUES (101, 'Alice', 5000, 'Downtown');
INSERT INTO account (acc_no, cname, balance, branch_name) VALUES (102, 'Bob', 1500, 'Midtown');
INSERT INTO account (acc_no, cname, balance, branch_name) VALUES (103, 'Charlie', 200, 'Uptown');
INSERT INTO account (acc_no, cname, balance, branch_name) VALUES (105, 'Eve', 800, 'Uptown');
--inserted 

--trigger creation

create or replace trigger loan 
after insert or update on account
for each row
when(new.balance<0)
DECLARE
    loan_amt number;
BEGIN
    loan_amt:=(:new.balance)*-1;
    insert into loan values(:new.acc_no,loan_amt,:new.branch_name);
    insert into borrower values(:new.cname,:new.acc_no);
END;
/
--trigger created

--updating value
update account set balance=-1000 where acc_no=101;