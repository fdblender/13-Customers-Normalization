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
-- secondly list the top five employers by state.
-- Which state has the most employers?
select customers.stateid, states.state, count(customers.companyid) as TotalCompanies
from customers
inner join states
on states.stateid = customers.stateid
group by customers.stateid, states.state
order by TotalCompanies desc
FETCH FIRST 5 ROWS ONLY;



