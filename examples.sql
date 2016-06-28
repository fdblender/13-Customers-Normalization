-- use Dual (temp table) to get today's date
select sysdate as "Today" from dual;

select count(distinct stateid) from customers;

select * from customers where rownum <= 5;

-- where date = '03-jan-2016'

-- SYSDATE returns the date and time (default 0:00:00 time)

-- where state = 'NJ' and city = "Springfield"

-- where NOT (total >= 5000 OR ...)

-- where terms_id IN (1,3,4)
-- where state NOT IN ('CA', 'NV')

-- where id IN
--(select id from invoices where inv_date = '01-MAY-2014')




