--Create a table student with following fields roll no int (primary key), Name char (20) not null (first letter as 
--either B,S E,P), sex char (1) accept only m or f, dob date not null, course (values must be MCA, CSE ME), 
--sem(values must be S3, S4), Date_of_Join.  

create table studentdatabase(rollno int primary key,name varchar(20) not null check(name like 'B%'or name like 'S%'or name like 'E%'or name like 'p%'),sex char(1) check(sex in('f','m')),dob date not null,course varchar(5) check(course in('MCA','CSE','ME')),sem varchar(5) check(sem in('S3','S4')),date_of_join date not null);

--Create second table marks with following data Mid in (primary key), roll no int (foreign key) referencing 
--student tables). Sub_code char (5) not null and marks int not null (>=0 &<=100). Insert the data into these 
--tables. 
create table marks(mid int primary key,rollno int,sub_code char(5) not null,marks int not null check(marks>=0 and marks<=100),foreign key(rollno) referencing studentdatabase(rollno));

 insert into studentdatabase values(1,'Babu','m','12-oct-1975','CSE','S3','13-jan-1989');
 insert into studentdatabase values(2,'praveen','m','20-feb-1967','MCA','S4','15-aug-1998');
 insert into studentdatabase values(3,'Emili','f','18-july-1977','ME','S4','20-mar-2000');

 insert into marks values(100,1,'JA23',95);



insert into marks values(102,2,'JA13',89);



insert into marks values(103,3,'CS13',90);

--a. List the name of students joined in mca after 10-10-1990. 
--b. List the name of students who are not in CS department. 
--c. List the names of students whose names start with ‘E’ and ‘P as 3rd character 
--d. List all marks of the students Emily from ME. 

select studentdatabase.name,marks.marks from studentdatabase join marks on studentdatabase.rollno=marks.rollno where studentdatabase.name='Emili' and studentdatabase.course='ME';

--e. List all roll no from two table (avoid duplicate roll no). 

select distinct studentdatabase.rollno from studentdatabase join marks on studentdatabase.rollno=marks.rollno;

--or

select distinct rollno from studentdatabase;

--distinct -->used for avoiding dupliaction


--f. List all roll no which is common in both tables. 

select distinct studentdatabase.rollno from studentdatabase join marks on studentdatabase.rollno=marks.rollno;

--g. List name from student table and all marks from marks of roll no 2 in student table. 

select studentdatabase.name,marks.marks from studentdatabase join marks on studentdatabase.rollno=marks.rollno where marks.rollno=2;

--h. List the roll no and total marks of each roll no from mark table. 

select rollno,avg(marks) from marks group by rollno;

--group by used to find the total marks of each roll no


--i. Display name and roll no of students, where marks are entered in marks table. 

select distinct studentdatabase.name,studentdatabase.rollno from studentdatabase join marks on studentdatabase.rollno=marks.rollno;

--j. Display the name, roll no, sex, dob, sub_code and mark of highest subject mark.

select studentdatabase.name,studentdatabase.rollno,studentdatabase.sex,studentdatabase.dob,marks.sub_code,marks.marks from studentdatabase join marks on studentdatabase.rollno=marks.rollno  where marks.marks=(select max(marks) from marks);

--k. List the student name and Date of Join in format dd/mm/yy 

select name,to_char(date_of_join,'dd/mm/yy') from studentdatabase;

--l. List all students joined during the year 1998 

select name from studentdatabase where date_of_join=to_date(1975,'yyyy');

--m. List the minimum mark of various  students in various having minimum mark greater than 60. 


--n. List all the students in the college other than  CS Department 


--o. Count the number of students in each department whose mark in greater than 60