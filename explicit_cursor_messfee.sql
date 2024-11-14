--creating tables
CREATE TABLE hostel_mess (
    stud_no NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    messfee NUMBER(8, 2),
    food_pref VARCHAR2(10) CHECK (food_pref IN ('veg', 'nonveg'))
);


CREATE TABLE vegetarian (
    stud_no NUMBER,
    name VARCHAR2(50),
    raise_in_fee NUMBER(8, 2),
    raise_date DATE,
    FOREIGN KEY (stud_no) REFERENCES hostel_mess(stud_no)
);

CREATE TABLE non_vegetarian (
    stud_no NUMBER,
    name VARCHAR2(50),
    raise_in_fee NUMBER(8, 2),
    raise_date DATE,
    FOREIGN KEY (stud_no) REFERENCES hostel_mess(stud_no)
);

--inserting data
INSERT INTO hostel_mess (stud_no, name, messfee, food_pref) VALUES (1, 'Alice', 1000, 'veg');
INSERT INTO hostel_mess (stud_no, name, messfee, food_pref) VALUES (2, 'Bob', 1200, 'nonveg');
INSERT INTO hostel_mess (stud_no, name, messfee, food_pref) VALUES (3, 'Charlie', 1100, 'veg');
INSERT INTO hostel_mess (stud_no, name, messfee, food_pref) VALUES (4, 'David', 1300, 'nonveg');

--pl\sql program
DECLARE
	cursor c1 is select * from hostel_mess;
	no number;
	name varchar(50);
	messfee number;
	food_pref varchar(10);
	r number;
BEGIN
	open c1;
		loop
		fetch c1 into no,name,messfee,food_pref;
		if food_pref='veg' then
			r:=messfee*0.1;
			messfee:=messfee+r;
			insert into vegetarian values(no,name,messfee,SYSDATE);
		else
			r:=messfee*0.2;
			messfee:=messfee+r;
			insert into non_vegetarian values(no,name,messfee,SYSDATE);
		end if;
	exit when c1%NOTFOUND;
	end loop;
END;
/

