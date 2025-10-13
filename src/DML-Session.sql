create table people
(
    id         INT,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(50),
    gender     VARCHAR(50),
    age        int,
    language   VARCHAR(50)
);
-- Добавим ограничение CHECK для gender
ALTER TABLE people ADD CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female', 'Other'));
-- Добавим ограничение CHECK для age
ALTER TABLE people ADD CONSTRAINT chk_age CHECK (age >= 0 AND age <= 120);
-- Установим значение по умолчанию для language
ALTER TABLE people  ALTER COLUMN language SET DEFAULT 'English';
insert into people (id, first_name, last_name, email, gender, age, language)
values (1, 'Joela', 'Cattonnet', 'jcattonnet0@nasa.gov', 'Female', 19, 'Somali');
insert into people (id, first_name, last_name, email, gender, age, language)
values (2, 'Dorothy', 'Onions', 'donions1@stumbleupon.com', 'Female', 20, 'Filipino');
insert into people (id, first_name, last_name, email, gender, age, language)
values (3, 'Conrado', 'Batstone', 'cbatstone2@clickbank.net', 'Male', 34, 'Irish Gaelic');
insert into people (id, first_name, last_name, email, gender, age, language)
values (4, 'Andre', 'MacGillespie', 'amacgillespie3@amazonaws.com', 'Male', 12, 'English');
insert into people (id, first_name, last_name, email, gender, age, language)
values (5, 'Vlad', 'Elson', 'velson4@reference.com', 'Male', 15, 'Montenegrin');
insert into people (id, first_name, last_name, email, gender, age, language)
values (6, 'Arman', 'Matejic', 'amatejic5@linkedin.com', 'Male', 19, 'Papiamento');
insert into people (id, first_name, last_name, email, gender, age, language)
values (7, 'Perkin', 'Altham', 'paltham6@hibu.com', 'Male', 45, 'Zulu');
insert into people (id, first_name, last_name, email, gender, age, language)
values (8, 'Nathan', 'Dommett', 'ndommett7@storify.com', 'Male', 23, 'Polish');
insert into people (id, first_name, last_name, email, gender, age, language)
values (9, 'Rahal', 'Dericot', 'rdericot8@twitter.com', 'Female', 48, 'Armenian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (10, 'Alonso', 'Marusik', 'amarusik9@blogtalkradio.com', 'Male', 67, 'Swahili');
insert into people (id, first_name, last_name, email, gender, age, language)
values (11, 'Clari', 'Wipper', 'cwippera@twitter.com', 'Female', 18, 'Montenegrin');
insert into people (id, first_name, last_name, email, gender, age, language)
values (12, 'Andonis', 'Pointon', 'apointonb@soundcloud.com', 'Male', 20, 'Ndebele');
insert into people (id, first_name, last_name, email, gender, age, language)
values (13, 'Orelia', 'Besson', 'obessonc@hubpages.com', 'Female', 19, 'Czech');
insert into people (id, first_name, last_name, email, gender, age, language)
values (14, 'Tulley', 'Swann', 'tswannd@tinyurl.com', 'Male', 35, 'Zulu');
insert into people (id, first_name, last_name, email, gender, age, language)
values (15, 'Kirstin', 'Driffill', 'kdriffille@smh.com.au', 'Female', 20, 'Guaraní');
insert into people (id, first_name, last_name, email, gender, age, language)
values (16, 'Garvy', 'Sherry', 'gsherryf@nyu.edu', 'Male', 26, 'Punjabi');
insert into people (id, first_name, last_name, email, gender, age, language)
values (17, 'Morgen', 'Snoxell', 'msnoxellg@bandcamp.com', 'Male', 28, 'Nepali');
insert into people (id, first_name, last_name, email, gender, age, language)
values (18, 'Janine', 'Curl', 'jcurlh@slate.com', 'Female', 27, 'Kyrgyz');
insert into people (id, first_name, last_name, email, gender, age, language)
values (19, 'Lilllie', 'Barnsdall', 'lbarnsdalli@disqus.com', 'Female', 20, 'Bulgarian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (20, 'Dynah', 'Tincombe', 'dtincombej@sciencedaily.com', 'Female', 24, 'Khmer');
insert into people (id, first_name, last_name, email, gender, age, language)
values (21, 'Sacha', 'Matthius', 'smatthiusk@ca.gov', 'Female', 22, 'Arabic');
insert into people (id, first_name, last_name, email, gender, age, language)
values (22, 'Raynard', 'Gerrans', 'rgerransl@i2i.jp', 'Male', 21, 'Ndebele');

insert into people (id, first_name, last_name, email, gender, age, language)
values (23, 'Tom', 'Machent', 'tmachentm@mlb.com', 'Male', 29, 'Polish');
insert into people (id, first_name, last_name, email, gender, age, language)
values (24, 'Fabien', 'Forrest', 'fforrestn@house.gov', 'Male', 47, 'Aymara');
insert into people (id, first_name, last_name, email, gender, age, language)
values (25, 'Mickie', 'Coal', 'mcoalo@seesaa.net', 'Male', 25, 'Aymara');
insert into people (id, first_name, last_name, email, gender, age, language)
values (26, 'Tana', 'Weeds', 'tweedsp@shinystat.com', 'Female', 36, 'Montenegrin');
insert into people (id, first_name, last_name, email, gender, age, language)
values (27, 'Ilka', 'McMichan', 'imcmichanq@bigcartel.com', 'Female', 39, 'Swahili');
insert into people (id, first_name, last_name, email, gender, age, language)
values (28, 'Mychal', 'Mapplebeck', 'mmapplebeckr@acquirethisname.com', 'Male', 30, 'Filipino');
insert into people (id, first_name, last_name, email, gender, age, language)
values (29, 'Melody', 'Beck', 'mbecks@pcworld.com', 'Female', 37, 'Kazakh');
insert into people (id, first_name, last_name, email, gender, age, language)
values (30, 'Lezley', 'Summerbell', 'lsummerbellt@cocolog-nifty.com', 'Male', 56, 'Maltese');
insert into people (id, first_name, last_name, email, gender, age, language)
values (31, 'Gaye', 'Withringten', 'gwithringtenu@discovery.com', 'Female', 43, 'Swedish');
insert into people (id, first_name, last_name, email, gender, age, language)
values (32, 'Leonelle', 'Baggallay', 'lbaggallayv@i2i.jp', 'Female', 20, 'Greek');
insert into people (id, first_name, last_name, email, gender, age, language)
values (33, 'Shir', 'Trevarthen', 'strevarthenw@pagesperso-orange.fr', 'Female', 29, 'Swahili');
insert into people (id, first_name, last_name, email, gender, age, language)
values (34, 'Ddene', 'Hamlen', 'dhamlenx@theguardian.com', 'Female', 76, 'Croatian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (35, 'Juditha', 'Yellowlea', 'jyellowleay@cafepress.com', 'Female', 54, 'Persian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (36, 'Danika', 'Stinson', 'dstinsonz@vinaora.com', 'Female', 38, 'Bosnian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (37, 'Garrek', 'Bartalini', 'gbartalini10@bing.com', 'Male', 50, 'Kazakh');
insert into people (id, first_name, last_name, email, gender, age, language)
values (38, 'Seumas', 'Silman', 'ssilman11@usda.gov', 'Male', 47, 'Indonesian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (39, 'Julius', 'Leftley', 'jleftley12@angelfire.com', 'Male', 44, 'Lithuanian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (40, 'Jeanine', 'Sprankling', 'jsprankling13@phpbb.com', 'Female', 34, 'Romanian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (41, 'Clywd', 'Cowles', 'ccowles14@prweb.com', 'Male', 75, 'Gagauz');
insert into people (id, first_name, last_name, email, gender, age, language)
values (42, 'Rahel', 'Vasilevich', 'rvasilevich15@ustream.tv', 'Female', 54, 'Zulu');
insert into people (id, first_name, last_name, email, gender, age, language)
values (43, 'Alexandr', 'Obell', 'aobell16@marriott.com', 'Male', 14, 'Filipino');
insert into people (id, first_name, last_name, email, gender, age, language)
values (44, 'Becky', 'Learoyde', 'blearoyde17@networkadvertising.org', 'Female', 35, 'Georgian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (45, 'Giustino', 'Putt', 'gputt18@vistaprint.com', 'Male', 43, 'Estonian');
insert into people (id, first_name, last_name, email, gender, age, language)
values (46, 'Uta', 'Tonbridge', 'utonbridge19@123-reg.co.uk', 'Female', 55, 'Chinese');
insert into people (id, first_name, last_name, email, gender, age, language)
values (47, 'Granthem', 'Diver', 'gdiver1a@un.org', 'Male', 76, 'Bengali');

insert into people (id, first_name, last_name, email, gender, age, language)
values (48, 'Livvy', 'Akister', 'lakister1b@nhs.uk', 'Female', 45, 'Burmese');
insert into people (id, first_name, last_name, email, gender, age, language)
values (49, 'Valle', 'Greenwood', 'vgreenwood1c@tmall.com', 'Male', 65, 'Guaraní');
insert into people (id, first_name, last_name, email, gender, age, language)
values (50, 'Nicole', 'Coey', 'ncoey1d@mail.ru', 'Female', 42, 'German');


select * from people;
update people set email = 'testUpdateEmail@gmail.com' where id=1;

insert into people (id, first_name, last_name, email, gender, age, language)
VALUES (48,'Beka','Anarbekov','beka2009@gmail.com','Male',16,'Kyrgyz');

delete from people where id = 10;

select count ( id ) from people;

select avg ( age ) as age_avg from people;

select max ( age ) from people;

select sum ( age ) from people;

select min ( age ) from people;

select gender, avg(age) from people group by gender;

select first_name,age from people where language='English';

select count(*) from people where language='Kazakh';

select last_name,email,id, gender from people where gender='Female';

select concat(first_name,' ',last_name) as full_name , gender,age
from people where gender='Male' and age < 25;

select count(*) from people where first_name like 'A%';

select*from people order by email;

select * from people offset 5 limit 20;

select language, count(language) from people group by language;

select language, avg(age)from people
group by language having count(*)>2;

select count (*) from people where email like '%.com';

select language, count (language) from people where gender = 'Female'
group by language;

update people set language = 'French' where age between 14 and 21;

select * from people where gender='Male' and language in ('Tamil','Kazakh','Nepali','Russian');

select language from people group by language ;

select * from people where length( last_name)=7 order by id;

select *from people where language not in ('French');

select min (age) from people where email like '%.com' limit 5;

select * from people where age>=18 and email like '%.com' or email like '%.uk';

