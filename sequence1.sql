--To create a table student with the following fields: roll number, name, mark. Create a sequence that will 
--increment value by 1, start with 101, max value up to 200 and comes in a cycle manner. 

create table studenetsequence(roll_no int primary key,name varchar(10),mark int);
create sequence sequence1 start with 101 increment by 1 maxvalue 200 min value 101 cycle;

--a) Display the next value of sequence. 

    select sequence1.nextval from dual;

--b) Display current value of sequence.

    select sequence1.currval from dual;

--c) Alter the sequence by updating increment value by 2. 

alter sequence sequence increment by 2;


--d) Insert values into table and use sequence to enter values in roll number field.

insert into studenetsequence values(sequence1.nextval,'NORAH',90);
insert into studenetsequence values(sequence1.nextval,'ALEX',80);
insert into studenetsequence values(sequence1.nextval,'EMILY',70);