-- create Books table	
create table Books (sku varchar(50), title varchar(50), author varchar(50), description varchar(50), 
  price float, isInStock number, group_price float);

-- insert records into the book table
-- isInStock: 0 for false, 1 for true
insert into books (sku, title, author, description, price, isInStock)
values ('Java1001', 'Head First Java', 'Kathy Sierra and Bert Bates', 'Easy to read Java workbook', 47.50, 1);
          
insert into books (sku, title, author, description, price, isInStock)
values ('Java1002', 'Thinking in Java', 'Bruce Eckel', 
						'Details about Java under the hood', 20.00, 1);

insert into books (sku, title, author, description, price, isInStock)
values ('Orcl1003', 'OCP: Oracle Certified Professional Java SE', 'Jeanne Boyarsky',
						'Everything you need to know in one place', 45.00, 1)00000;
            

insert into books (sku, title, author, description, price, isInStock)
values ('Python1004', 'Automate the Boring Stuff with Python', 'Al Sweigart', 
						'Fun with Python', 10.50, 1);

insert into books (sku, title, author, description, price, isInStock)
values ('Zombie1005','The Maker''s Guide to the Zombie Apocalypse','Simon Monk',
						'Zombie book', 10.00, 1);

insert into books (sku, title, author, description, price, isInStock)
values ('Rasp1006', 'Raspberry Pi Projects for the Evil Genius', 'Donal Norris', 
						'A dozen fiendishly fun projects for the Raspberry Pi!', 10.00, 1);
            
            

