CREATE database Mixed;
use mixed;
create table cats(
name varchar(50),
age int
);
insert into cats(name,age) 
values('ask''s',32);

select * from cats;

desc cats;

create table cat2(
name varchar(50) DEFAULT 'UnNamed',
age int DEFAULT 69
);

insert into cat2(age) values(9);
insert into cat2(name) values('kitForKat');
desc cat2;
select * from cat2;
drop table cat3;
create table cat3(
cat_id int AUTO_INCREMENT,
Name varchar(50),
age int,
PRIMARY KEY(cat_id)
);

insert into cat3(Name,age
) values('sss',77);
desc cat3;
select * from cat3;
Create table catcat(
cat_id int AUTO_INCREMENT,
cat_name varchar(50) not null,
age int not null,
breed varchar(50) not null,
primary key(cat_id)
);

insert into catcat (cat_name,age,breed) values 
('jerry',17,'lol0'),
('kitty',2,'snify'),
('tom',9,'shitzu');

select * from catcat;
select cat_name,cat_id as id,age from catcat where cat_id = age;
update catcat set cat_name='Rony' where cat_id = 6;


create database shirt_db;
use shirt_db;
create table Shirts(
shirt_id int AUTO_INCREMENT,
article varchar(50) not null,
color varchar(50) not null,
shirt_size varchar(1) not null,
last_worn int not null,
primary key(shirt_id)
);
desc Shirts;
select * from Shirts;
insert into Shirts(article,color,shirt_size,last_worn) value
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

update shirts set article = 'off-shirt', shirt_size='L' where color='white';

select concat(article,' ',color) from shirts;
select concat(article,' ',color) as AC from shirts;

select concat_ws('__',article,color,shirt_size) from shirts;
select concat_ws('__',article,color,shirt_size) as Shirt__Code from shirts;

select substring(article , 1,4) from shirts;
select substr(article , 1,4) from shirts;

select substring(article , 4) from shirts;
select substring(article , -4) from shirts;

select concat(substr(article , 1,4),'....',substr(color,2)) as dot_mixed from shirts;

select replace(article,'-','__') from shirts;
create database Books;
use Books;
Create table books(
id int auto_increment primary key,
title varchar(50) not null, 
author_fname varchar(50) not null, 
author_lname varchar(50) not null, 
released_year int not null, 
stock_quantity int not null, 
pages int not null
); 
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'MELLO', 'Harris', 2023, 15, 365), 
           ('Cryptospider', 'Lucifer', 'malay', 2055, 654, 754),
           ('Barber with lion', 'Michel', 'Saunders', 2022, 4511, 78);

Select * from books;
select distinct author_fname,author_lname from books;
select id,author_fname,author_lname from books order by author_lname;
select id,author_fname,author_lname from books order by author_fname desc;

select id, author_fname, author_lname from books order by 2; -- 2 refers to author_fname, 3 refers to author_lname , after 3 we can put desc for descending order

select id, author_fname, released_year, pages from books order by author_fname, released_year; -- we can put desc for descending order

select id, author_fname, released_year, pages from books order by author_fname, released_year LIMIT 5; -- LIMIT used for getting limited like LIMIT 5, we can put desc for descending order
select id, author_fname, released_year, pages from books order by author_fname, released_year LIMIT 0,5; -- LIMIT 0th index to 5th index (nth index we caan use, nth means some 999)



select id, author_fname, author_lname, released_year, pages from books where author_fname like '%da%'; -- like, % is wild card - before after wild card, \ is escape char for %\%% 

select id, author_fname, author_lname, released_year, pages from books where author_fname like '___'; -- '_' means one character, '__' means 2 characher, we can includu like _a_ gives dan
-- COUNT funtion --Aggregate
Select count(*) from books;
Select count(distinct author_fname) from books;

-- Group by -it will group the identical row into one and gives count 
select author_fname, count(*) as Total_books from books group by author_fname order by total_books;

-- MIN & MAX --Aggregate
Select MIN(released_year) from books;
Select MAX(released_year) from books;

select MIN(author_fname), MAX(author_fname) from books;

select max(pages) from books;

select * from books 
where pages = (select max(pages) from books);

-- Mutiple group by 
select author_fname,author_lname, count(*) 
from books 
group by author_lname,author_fname;

-- MIN/MAX with GROUP BY --Aggregate
select author_fname from books group by author_fname;
select author_fname, min(released_year) from books group by author_fname;

SELECT 
    author_fname, MIN(released_year)
FROM
    books
GROUP BY author_fname;

SELECT 
    author_fname,
    author_lname,
    MIN(released_year),
    MAX(released_year),
    COUNT(*),
    MAX(pages)
FROM
    books
GROUP BY author_fname , author_lname;
-------------------------------------------------

-- SUM function --Aggregate
 SELECT 
    author_fname, SUM(pages), COUNT(*)
FROM
    books
GROUP BY author_fname;

select 2+3;

-- Average AVG --Aggregate
select avg(released_year) from books;
select avg(pages) from books;
select avg(stock_quantity) from books;

SELECT 
    released_year, AVG(stock_quantity), COUNT(*)
FROM
    books
GROUP BY released_year;
--------------------------------------------------------------------

-- Dates and times-------------------------------------------------
use books;

CREATE TABLE IF NOT EXISTS people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthDT DATETIME
);

insert into people 
(name, birthdate,birthtime, birthDT) values 
('Jagadeesh','1999-01-02','08:26:55','1999-01-02 08:26:55');

insert into people 
(name, birthdate,birthtime, birthDT) values 
('Poorna','2001-04-18','18:45:12','2001-04-18 18:45:12');

insert into people 
(name, birthdate,birthtime, birthDT) values 
('Venkat kumar','1996-02-28','22:05:32','1996-02-28 22:05:32');

select * from people;

select curdate(); -- current date
select curtime(); -- current time
select now(); -- current datetime

insert into people 
(name, birthdate,birthtime, birthDT) values 
('Rolex',curdate(),curtime(),now());

-- Day()
select birthdate, day(birthdate) from people;
SELECT 
    birthdate,
    DAY(birthdate),
    DAYNAME(birthdate),
    MONTHNAME(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFMONTH(birthdate),
    DAYOFYEAR(birthdate)
FROM
    people;

SELECT 
    CONCAT(MONTHNAME(birthDT),
            ' ',
            DAY(birthDT),
            ' ',
            YEAR(birthDT)) AS DOB
FROM
    people;

-- Datediff x-y
SELECT 
    birthDT, DATEDIFF(NOW(), birthDT) as 'How many days from born date'
FROM
    people;

SELECT DATE_ADD('2018-08-11', INTERVAL 1 DAY); -- Increase the one day 2018-08-12
SELECT DATE_ADD('2018-08-11', INTERVAL 1 YEAR); -- Increase the one year 2019-08-11
SELECT DATE_ADD('2018-08-11', INTERVAL 1 MONTH); -- Increase the one month 2018-09-11

SELECT DATE_SUB('2018-08-11', INTERVAL 1 DAY); -- Increase the one year 2018-08-10
SELECT DATE_SUB('2018-08-11', INTERVAL 1 YEAR); -- Increase the one year 2017-08-11
SELECT DATE_SUB('2018-08-11', INTERVAL 1 MONTH); -- Increase the one year 2018-07-11
SELECT DATE_ADD('2018-08-11 22:55:45', INTERVAL 1 SECOND); -- Increase the one year '2018-08-11 22:55:46'
SELECT DATE_SUB('2018-08-11 22:55:45', INTERVAL 1 SECOND); -- Increase the one year '2018-08-11 22:55:44'

SELECT TIMEDIFF(CURTIME(),'02:22:22'); -- CURRENT TIME - GIVEN TIME
SELECT NOW() - INTERVAL 18 YEAR; -- CURRENT YEAR - 18 YEARS

use books;
CREATE TABLE captions (
    text VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into captions (text) values ('I am jagadeesh');
select * from captions;

CREATE TABLE captions2 (
    text VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at Timestamp on update current_timestamp
);
insert into captions2 (text) values ('Hello there!!!');
select * from captions2;
update captions2 set text='Updated timestamp';

-- AND, OR, >=, <=, BETWEEN x AND y, NOT LIKE, NOT BETWEEN x AND y
select * from books;

select * from books where released_year between 2014 and 2023;

-- CAST('9:00:00' as TIME)
SELECT CAST('9:00:00' AS TIME);
SELECT CAST('1998/02/22' AS date);

-- IN & NOT IN
SELECT * FROM BOOKS WHERE author_fname in ('kelly','mello','lucifer');
SELECT 
    *
FROM
    BOOKS
WHERE
    author_fname NOT IN ('kelly' , 'mello', 'lucifer');

-- CASE WHEN THEN ELSE END AS (IF condition) ----------------------------------------------------
SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2006 THEN 'It booms'
        ELSE 'Beginner stage'
    END AS Genere
FROM
    books; 

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 1 AND 20 THEN '*'
        WHEN stock_quantity BETWEEN 20 AND 300 THEN '**' -- we can add multiple ''when'' conditions based on the ranges
        ELSE '***'
    END AS Quantity_symbol
FROM
    books;

-- IS NULL, IS NOT NULL
CREATE TABLE book_null (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tt VARCHAR(50),
    pages VARCHAR(50),
    genere VARCHAR(50)
);
insert into book_null (tt,pages,genere) values ('RRR','954','Action/Adventure');

SELECT 
    *
FROM
    book_null
WHERE
    pages IS NULL;

SELECT 
    *
FROM
    book_null
WHERE
    pages IS NOT NULL;

SELECT 
    author_fname, author_lname, 
    case 
    when count(*) = 1 then '1 book' 
    else concat(count(*),' books')
    end as Books_count
FROM
    books
GROUP BY author_fname , author_lname;
-- -------------------------------------------------------------

-- Constraints & ALT TABLE -------------------------------------------------
-- UNIQUE
use mixed;
CREATE table contacts(
name varchar(50) not null,
phoneNumber varchar(10) not null unique
);

insert into contacts (name, phoneNumber) values ('Jagadeesh','8745632147');
insert into contacts (name, phoneNumber) values ('JagadeeshM','8745632147');
select * from contacts;

-- CHECK
CREATE table Users(
name varchar(25) not null,
age int check (age>0)
);
insert into Users (name,age) values ('JagadeeshM',22);
insert into Users (name,age) values ('Malleswarapu',45);
insert into Users (name,age) values ('Neg',-55);


CREATE TABLE palindromes (
    word VARCHAR(50) CHECK (REVERSE(word) = word)
);
insert into palindromes (word) values ('ollo');
select * from palindromes;

CREATE TABLE user2 (
    name VARCHAR(50) NOT NULL,
    age INT,
    CONSTRAINT VOTE_RIGHT CHECK (age >= 18) -- VOTE_RIGHT is a custom error msg
);
insert into user2 (name,age) value ('Narasimha Murthy', 17);

-- Multiple CONSTRAINTS -- -------------------------------------
CREATE TABLE supplier (
    supplier_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(10) NOT NULL UNIQUE,
    address VARCHAR(200) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT NAME_ADDRESS UNIQUE (name , address)
);

insert into supplier (name,phone,address) value ('M.Jagadeesh','9788654412','11/23 first street,hyderabad');
insert into supplier (name,phone,address) value ('M.Jagadeesh','9788654412','11/23 first street,hyderabad');

select * from supplier;
-- --------------------------------------------------------------------------------

-- ALTER -- --------------------------------------------------
ALTER TABLE supplier
add column city varchar(50) default 'NA';

ALTER TABLE supplier
add column STATE varchar(50) NOT NULL;

ALTER TABLE supplier
add column pin_code int not null;
-- drop -------------------
ALTER TABLE supplier
drop column city;

select * from supplier;
-- RENAME -----------------
create TABLE campus ( name varchar(50));
insert into campus (name) values ('satish');
RENAME TABLE campus to company; -- renaming from campus to company
select * from company;
ALTER TABLE company rename to campus; -- renaming back to campus
select * from campus;

-- renaming columns --------------------
ALTER TABLE supplier 
rename column pin_code to zipCode;

select * from supplier;
-- Changing only data type ------------------
ALTER TABLE supplier
MODIFY name varchar(200) default 'Unknow';

desc supplier;
-- changing both datatype and column name -------
ALTER TABLE supplier
CHANGE phone phone_Number varchar(50) default '9999999999';

desc supplier;





































