select first_name, last_name, departments.department_name
from employees
inner join departments
on employees.department_id = departments.department_id
where department_name = 'Marketing';

select count(*) from customers;

select count(distinct company) as "Distinct Companies" from customers;

-- add foreign key
alter table customers add CompanyID int;

select companyID, company from customers;

select rownum, company from customers;

create table Companies (company varchar(50));
select * from Companies;

insert into companies(Company) values ('Frances Company');
select * from Companies;

insert into Companies (Company) select distinct company from customers;
select * from Companies;

select companyID, Company from customers;

update customers c set c.companyID = (select t.companyID from
Companies t where t.company = c.company);

select * from customers;

alter table customers drop column company;
select * from customers;

-- Normalize Customers by breaking out city, state, position into 3 sep. tables

-- add id fields to customers table
alter table customers add cityID int;
alter table customers add stateID int;
alter table customers add positionID int;

-- create lookup tables for cities, states, positions
create table cities (city varchar(50));
create table states (state varchar(50));
create table positions (position varchar(50));

insert into cities (city) select distinct city from customers;
insert into states (state) select distinct state from customers;
insert into positions (position) select distinct position from customers;

-- add unique identifiers for each table:
-- edit the table, add a number field for the ID
-- add a unique identifier for that field, select primary key

select * from positions;
select * from cities;
select * from states;

-- add unique id values for the id fields in customers
update customers c set c.positionID = (select t.positionID from
Positions t where t.position = c.position);

update customers c set c.cityID = (select t.cityID from
Cities t where t.city = c.city);

update customers c set c.stateID = (select t.stateID from
States t where t.state = c.state);

select * from customers;

-- remove columns in customers containing redudant descriptions for ID fields
alter table customers drop column state;
alter table customers drop column position;
alter table customers drop column city;
alter table customers drop column fullname;

-- display select fields for joined data in customers, positions, states, cities
select customers.title, customers.firstname, customers.lastname, positions.position,
customers.streetaddress, cities.city, states.state from customers
inner join positions
on positions.positionID = customers.positionID
inner join states
on states.stateID = customers.stateID
inner join cities
on cities.cityID = customers.cityID;

select * from customers
inner join companies
on companies.companyID = customers.companyID;





