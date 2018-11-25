--Select all the rows from table cd.members and display all the columns
select * from cd.members;

--Select all the rows from table cd.members and display only firstname / surname
select firstname, surname from cd.members;

--Concatenate surname and firstname (with comma in between) and 
--select all the rows from table cd.members
select surname || ',' || firstname as fullname, * from cd.members;

--Select all the rows from table cd.members and display all the columns
-- order by surnames
select * from cd.members order by surname;

--Select only the rows from the table with condition surname = 'Baker'
select * from cd.members where surname = 'Baker';

--Select only the rows from the table with condition surname not equal to 'Baker'
select * from cd.members where NOT surname = 'Baker';

--Select only the rows from the table with condition surname not equal to 'Baker'
select * from cd.members where surname != 'Baker' order by surname;

--Select only the rows from the table with condition memid greater than 5
select * from cd.members where memid > 5;

--Select only the rows from the table with condition memid between 5 and 10
select * from cd.members where memid between 5 and 10;

--Select only the rows from the table with condition surname is 'Baker' 
--or surname is 'Farrell'
select * from cd.members where surname = 'Baker' 
OR surname = 'Farrell' order by surname;

--Select only the rows from the table with condition surname is 'Baker' 
--and zipcode is '80743'
select * from cd.members where surname = 'Baker' AND zipcode = '80743';

--Select only the rows from the table with condition surname in 'Baker' / 'Farrell' / 'Hunt'
select * from cd.members where surname IN ('Baker','Farrell','Hunt')
order by surname;

--Select only the rows from the table with condition where recommendedby is null
select * from cd.members where recommendedby IS NULL;

--Select only the rows from the table with condition where address contains 6
select * from cd.members where address like '%6%';

--Select only the rows from the table with condition where address contains B 
--and its only 5 characters long.
select * from cd.members where surname like 'B____';

-- Extract substring from telephone by picking the first 3 characters
select substring(telephone FROM 1 FOR 3),* FROM cd.members;

-- Extract substring from telephone by picking the first 3 characters
select substring(telephone, 1, 3),* FROM cd.members;

-- Extract substring from telephone by picking the first 3 characters
-- and doesn't start with a bracket symbol '('
select substring(telephone FROM 1 FOR 3),* FROM cd.members 
where substring(telephone FROM 1 FOR 3) not like '(%';

--Select only the rows from the table with condition where joindata is greater than
--2012-09-18
select * from cd.members where joindate >= DATE'2012-09-18';

--Select the month number from joindate columns and all other columns in all rows.
select extract (month from joindate), * from cd.members;

--Select the month number from joindate columns and all other columns in rows where
-- join date month is 7
select extract (month from joindate), * from cd.members
where extract (month from joindate) = 7;

--Select the month number from joindate columns and all other columns in rows where
-- join date month is 7
select * from cd.members where memid in
(select memid from cd.members where extract (month from joindate) = 7 );

--Assignment question
select facid, name, membercost, monthlymaintenance
from cd.facilities where 
membercost < monthlymaintenance / 50.0 and 
membercost >0 ;


--Sample Insert into table cd.members
INSERT INTO cd.members(
	memid, surname, firstname, address, zipcode, telephone, recommendedby, 
	joindate)
	VALUES (40, 'GUEST2','GUEST2','Toronto', 40120, '416-000-0000', 1, DATE'2016-02-20');

--Sample update to cd.members;
UPDATE cd.members
	SET address='Montreal',
		zipcode = 00000
	WHERE memid IN (0,40);
	

--DELETE FROM cd.members
--	WHERE memid = 40;


















