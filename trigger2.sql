--Create a transparent audit system for a table clientmaster. The system has to keep track of records that have 
--been removed or modified and when they have been removed or modified. Table details are given below: 
--AuditClient: name, bal_due, operation, Op_date

--creating tables

create table client(cno int primary key,cname varchar(10),addr varchar(10),due int);
create table AuditClient(cname varchar(10),bal_due int,OP varchar(10),Op_date date);

--tables created

INSERT INTO client (cno, cname, addr, due) VALUES (1, 'Alice', 'Downtown', 500);
INSERT INTO client (cno, cname, addr, due) VALUES (2, 'Bob', 'Midtown', 1000);

--rows created

--creating trigger/
    create or replace trigger t2
    after update or delete on client
    for each row
    BEGIN
    if updating then
       insert into AuditClient values(:old.cname,:old.due,'UPDATE',SYSDATE);
    else
      insert into AuditClient values(:old.cname,:old.due,'DELETE',SYSDATE);
end if;
 end;
 /

 --trigger created

 delete from client where cno=1;