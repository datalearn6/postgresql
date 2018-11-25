select * from cd.members;

select count(*) from cd.members;

select count(*), surname from cd.members 
group by surname 
--having count(*) > 1
order by count(*) desc;

select * from cd.facilities;

select sum(initialoutlay) from cd.facilities;

select avg(initialoutlay) from cd.facilities;

select max(initialoutlay) from cd.facilities;

select min(initialoutlay) from cd.facilities;

--Select count by surname and provide max(recommendedby) 
--for each surname grouping
select count(*), max(recommendedby) ,surname from cd.members 
group by surname 
--having count(*) > 1
order by count(*) desc;

-- Cross Join 2 tables
select * from cd.members, cd.bookings order by cd.bookings.memid;

-- Inner join 2 tables and filter using the surname with name Smith
select * from cd.members m join
cd.bookings b on m.memid = b.memid
where m.surname = 'Smith'
order by b.memid;

-- Natural Join (column names should match)
select * from cd.members m natural join
cd.bookings b;

-- Left Join 
select * from cd.members m left join
cd.bookings b on m.memid = b.memid;

-- Right Join 
select * from cd.members m right join
cd.bookings b on m.memid = b.memid;

--Full join
select * from cd.members m full join
cd.bookings b on m.memid = b.memid;





