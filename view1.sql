--To create a table with following fields roll  number(primary key), name, age, place. 

create table viewtable(roll_no int primary key,name varchar(10),age int,place varchar(10));

--inserting data
insert into viewtable values( 1,'Norah',17,'Sharjah');
insert into viewtable values( 2,'Alex',18,'Dubai');
insert into viewtable values( 3,'Emily',17,'Dubai');


--a. Create a view which contains only roll number and name. 

create view view1 as select roll_no,name from viewtable;


--b. Describe the view. 

desc view1;

--c. Insert a value into the view and list the view and table.

INSERT INTO view1 values(4,'John');
--inserting value into the view will also insert into the table

--d. Update a value in the view and list the view and table. 

update view1 set name='SURA' where roll_no=4;

--e. Delete a value in the table and list the view and table. 

delete from viewtable where roll_no=4;

--f. Create another view which contains name and age column and check whether the above operations are 
--possible in this view.

create view view2 as select name,age from viewtable;

insert into view2 values('SURA',17);--cannot be entered as it does not have roll number which is a primary key
