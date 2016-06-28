-- List all the people in the customer's table who's last name is Smith.
select * from customers
where lastname = 'Smith';

-- List all the customers and their employers and positions
select customers.firstname, customers.lastname, companies.company, positions.position
from customers
inner join companies
on companies.companyid = customers.COMPANYID
inner join positions
on positions.POSITIONID = customers.POSITIONID;

-- List all the customers and their employers and positions that live in Toledo
select customers.firstname, customers.lastname, companies.company, positions.position, cities.city
from customers
inner join companies
on companies.companyid = customers.COMPANYID
inner join positions
on positions.POSITIONID = customers.POSITIONID
inner join cities
on cities.cityid = customers.cityid
where cities.city = 'Toledo';

-- List all the customers and their employers and positions that live in Virginia Beach
select customers.firstname, customers.lastname, companies.company, positions.position, cities.city
from customers
inner join companies
on companies.companyid = customers.COMPANYID
inner join positions
on positions.POSITIONID = customers.POSITIONID
inner join cities
on cities.cityid = customers.cityid
where cities.city = 'Virginia Beach';

-- Change the name of Paula Hill of Anaheim, CA. She just got married to Mr. Smith so she is now Paula Smith.
--UPDATE table-Name [[AS] correlation-Name]
--        SET column-Name = Value
--        [ , column-Name = Value} ]*
--        [WHERE clause] |
update customers
set lastname = 'Smith'
where firstname = 'Paula' and lastname = 'Hill';

-- Vanessa Brown also married Mr. Smith (not the same guy). Update her record as well.
update customers
set lastname = 'Smith'
where firstname = 'Vanessa' and lastname = 'Brown';

-- Now I want to know how many people in the database are named Smith?
-- Example: select count(distinct company) as "Distinct Companies" from customers;
select count(*) from customers
where lastname = 'Smith';

-- How many people have last names beginning with S? 
-- Select * from customers where LastName like 'S%';
select * from customers where lastname like 'S%';

--count how many people have a particular last name
select lastname, count(*) as Total from customers group by lastname
order by Total desc;

--add sorting (order by) and limit to show only the top 5 last names
select lastname, count(*) as Total
from customers 
group by lastname
order by Total desc
FETCH FIRST 5 ROWS ONLY;

-- Your job is to count the employers by state and 
select customers.stateid, states.state, count(customers.companyid) as TotalCompanies
from customers
inner join states
on states.stateid = customers.stateid
group by customers.stateid, states.state
order by TotalCompanies desc;


-- secondly list the top five employers by state.
select customers.stateid, states.state, count(customers.companyid) as TotalCompanies
from customers
inner join states
on states.stateid = customers.stateid
group by customers.stateid, states.state
order by TotalCompanies desc
FETCH FIRST 5 ROWS ONLY;

-- Which state has the most employers?
-- CA has the most employers.

select * from customers 
inner join states
on states.stateid = customers.stateid
where states.state not in ('DC', 'MD', 'VA');

-- not working
--select stateid from customers
--inner join states
--on states.stateid = customers.stateid
--where state = 'DC' or state = 'MD';

select * from customers
where lastname LIKE 'Z_p  %';

-- '_' is a single character wild card
-- where lastname LIKE 'Z_%5';




