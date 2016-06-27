create table person_car (
person_id integer,
car_id integer
);
insert into pet (id, name, breed, age, dead)
values (0, 'Fluffy', 'Unicorn', 1000, 0);
insert into pet values (1, 'Gigantor', 'Robot', 1, 1);
insert into person (id, first_name, last_name, age)
values (1, 'Frances', 'Blendermann', 33);
insert into person (id, first_name, last_name, age)
values (2, 'Dave', 'Wolf', 40);
insert into pet (id, name, breed, age, dead)
values (3, 'Sandy', 'Pointer Mix', 9, 0);
insert into pet values (4, 'Cali', 'Louchin', 5, 0);
delete from person where age=40;
select * from person;
delete from person where id=2;
delete from person where age=25;
insert into person values (0, 'Dave', 'Wolf', 25);
insert into person_pet (person_id, pet_id, prior_owner)
values (0, 0, 1);
insert into person_pet values (0, 1, 1);
insert into person_pet values (1, 3, 0);
insert into person_pet values (1, 4, 0);




