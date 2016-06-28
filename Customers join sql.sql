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

-- Day 13 - Selecting Data
select * from pet 
where age > 10;

select * from person
where age < 55;

select * from person
where age > 15;

select * from person
where age > 20 and first_name = 'Dave';

select customers.title, customers.firstname, customers.lastname, positions.position,
customers.streetaddress, cities.city, states.state from customers
inner join positions
on positions.positionID = customers.positionID
inner join states
on states.stateID = customers.stateID
inner join cities
on cities.cityID = customers.cityID
where (states.state = 'MD' and cities.city = 'Rockville') or states.state='VA';

-- create tables for MC students, courses, majors, and departments
create table MCStudent (StudentID int, FirstName varchar(50), LastName varchar(50),
Address varchar(50), City varchar(50), State varchar(2), ZIP int, Phone varchar(50), Major varchar(50));

create table Courses (CourseID int, course varchar(50));
create table Majors (majorID int, major varchar(50), departmentID int);

create table MCDepartments (departmentID int, department varchar(50), dept_head varchar(50));

update MCSTUDENTS
set major = 1
where studentID < 40;

update MCSTUDENTS
set major = 2
where studentID >= 40 and studentID < 70;

update MCSTUDENTS
set major = 3
where studentID >=70;

select MCstudents.FIRSTNAME, MCstudents.LASTNAME, MCstudents.MAJORID, majors.MAJOR from MCstudents
inner join majors
on majors.majorid = mcstudents.majorid;

-- display the major and department for all students
select MCstudents.FIRSTNAME, MCstudents.LASTNAME, MCstudents.MAJORID, MAJORS.MAJOR, MCdepartments.department
from MCstudents
inner join majors
on majors.majorid = mcstudents.majorid
inner join MCDEPARTMENTS
on MCDEPARTMENTS.DEPARTMENTID = MAJORS.DEPARTMENTID;

-- display all students in the "computer science" department
select MCstudents.FIRSTNAME, MCstudents.LASTNAME, MCstudents.MAJORID, MAJORS.MAJOR, MCdepartments.department
from MCstudents
inner join majors
on majors.majorid = mcstudents.majorid
inner join MCDEPARTMENTS
on MCDEPARTMENTS.DEPARTMENTID = MAJORS.DEPARTMENTID
where mcdepartments.departmentid = 1;

-- create registration table joining courses with students
create table Registration (courseid int, studentid int);

- display all students taking the Cybersecurity course
select MCstudents.FIRSTNAME, MCstudents.LASTNAME, MCstudents.MAJORID, MAJORS.MAJOR, MCdepartments.department
from MCstudents
inner join majors
on majors.majorid = mcstudents.majorid
inner join MCDEPARTMENTS
on MCDEPARTMENTS.DEPARTMENTID = MAJORS.DEPARTMENTID
where majors.major = 'Cybersecurity';

-- display all students in the 'Math and Physics' department
select MCstudents.firstname, mcstudents.lastname, mcstudents.majorid, majors.major, mcdepartments.department
from MCstudents
inner join majors
on majors.majorid = mcstudents.majorid
inner join mcdepartments
on mcdepartments.departmentid = majors.departmentid
where mcdepartments.department = 'Math and Physics';




