CREATE TABLE faculties (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL UNIQUE,
 dean_name VARCHAR(100),
 phone VARCHAR(30),
 created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE departments (
 id SERIAL PRIMARY KEY,
 faculty_id INT REFERENCES faculties(id) ON DELETE CASCADE,
 name VARCHAR(100) NOT NULL,
 head_of_department VARCHAR(100),
 office_room VARCHAR(20)
);

CREATE TABLE teachers (
 id SERIAL PRIMARY KEY,
 department_id INT REFERENCES departments(id) ON DELETE SET NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(100) UNIQUE,
 hire_date DATE,
 salary NUMERIC(10,2) CHECK (salary >= 0)
);

CREATE TABLE students (
 id SERIAL PRIMARY KEY,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 gender CHAR(1) CHECK (gender IN ('M', 'F')),
 birth_date DATE,
 faculty_id INT REFERENCES faculties(id),
 enrollment_year INT CHECK (enrollment_year >= 2000),
 gpa NUMERIC(3,2) CHECK (gpa BETWEEN 0 AND 4.0)
);

CREATE TABLE subjects (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 credits SMALLINT CHECK (credits BETWEEN 1 AND 10),
 department_id INT REFERENCES departments(id) ON DELETE SET NULL
);

CREATE TABLE enrollments (
 id SERIAL PRIMARY KEY,
 student_id INT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
 subject_id INT NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
 grade CHAR(2) CHECK (grade IN ('A','B','C','D','F')),
 semester VARCHAR(10) NOT NULL,
 CONSTRAINT unique_enrollment UNIQUE (student_id, subject_id, semester)
);

CREATE TABLE classrooms (
 id SERIAL PRIMARY KEY,
 room_number VARCHAR(10) NOT NULL UNIQUE,
 capacity INT CHECK (capacity > 0),
 building_name VARCHAR(100)
);

CREATE TABLE schedules (
 id SERIAL PRIMARY KEY,
 subject_id INT NOT NULL REFERENCES subjects(id),
 teacher_id INT NOT NULL REFERENCES teachers(id),
 classroom_id INT REFERENCES classrooms(id),
 day_of_week VARCHAR(10) CHECK (day_of_week IN ('Mon','Tue','Wed','Thu','Fri','Sat')),
 start_time TIME NOT NULL,
 end_time TIME NOT NULL,
 CHECK (end_time > start_time)
);

CREATE TABLE library_books (
 id SERIAL PRIMARY KEY,
 title VARCHAR(255) NOT NULL,
 author VARCHAR(100),
 year_published INT CHECK (year_published > 1800),
 isbn VARCHAR(20) UNIQUE,
 available_copies INT DEFAULT 1 CHECK (available_copies >= 0)
);

CREATE TABLE borrow_records (
 id SERIAL PRIMARY KEY,
 student_id INT REFERENCES students(id) ON DELETE CASCADE,
 book_id INT REFERENCES library_books(id) ON DELETE CASCADE,
 borrow_date DATE DEFAULT CURRENT_DATE,
 return_date DATE,
 is_returned BOOLEAN DEFAULT FALSE
);

INSERT INTO faculties (name, dean_name, phone) VALUES
('Computer Science', 'Dr. Aigerim Tursunova', '+996700111222'),
('Economics', 'Dr. Ruslan Abdirasulov', '+996777555999'),
('Linguistics', 'Dr. Aisulu Toktobekova', '+996555444333');

INSERT INTO departments (faculty_id, name, head_of_department, office_room) VALUES
(1, 'Software Engineering', 'Eldar Akylbekov', 'B-101'),
(1, 'Information Security', 'Aizada Satarova', 'B-102'),
(2, 'Finance and Accounting', 'Bekzhan Erkinov', 'C-203'),
(3, 'English Philology', 'Altynai Kadyrova', 'D-305');

INSERT INTO teachers (department_id, first_name, last_name, email, hire_date, salary) VALUES
(1, 'Ermek', 'Baitik', 'ermek.baitik@uni.kg', '2018-09-01', 85000),
(2, 'Gulzat', 'Kalybekova', 'gulzat.kal@uni.kg', '2019-03-15', 90000),
(3, 'Askar', 'Nurlanov', 'askar.nur@uni.kg', '2020-02-10', 70000),
(4, 'Ainura', 'Tilekova', 'ainura.til@uni.kg', '2017-06-20', 65000);

INSERT INTO students (first_name, last_name, gender, birth_date, faculty_id, enrollment_year, gpa) VALUES
('Beka', 'Mamatov', 'M', '2003-02-11', 1, 2021, 3.7),
('Aizada', 'Asanova', 'F', '2002-08-05', 2, 2020, 3.2),
('Tilek', 'Saparov', 'M', '2004-01-25', 1, 2022, 3.9),
('Gulnur', 'Tashieva', 'F', '2001-07-30', 3, 2019, 3.5);

INSERT INTO subjects (name, credits, department_id) VALUES
('Database Systems', 5, 1),
('Cybersecurity Basics', 4, 2),
('Microeconomics', 3, 3),
('Advanced English Grammar', 3, 4);

INSERT INTO enrollments (student_id, subject_id, grade, semester) VALUES
(1, 1, 'A', 'Fall2023'),
(1, 2, 'B', 'Spring2024'),
(2, 3, 'A', 'Fall2023'),
(3, 1, 'A', 'Fall2023'),
(4, 4, 'B', 'Spring2024');

INSERT INTO classrooms (room_number, capacity, building_name) VALUES
('B-201', 40, 'Main Building'),
('C-102', 25, 'Economics Hall'),
('D-205', 30, 'Language Center');

INSERT INTO schedules (subject_id, teacher_id, classroom_id, day_of_week, start_time, end_time) VALUES
(1, 1, 1, 'Mon', '09:00', '10:30'),
(2, 2, 1, 'Tue', '11:00', '12:30'),
(3, 3, 2, 'Wed', '10:00', '11:30'),
(4, 4, 3, 'Thu', '14:00', '15:30');

INSERT INTO library_books (title, author, year_published, isbn, available_copies) VALUES
('Clean Code', 'Robert C. Martin', 2008, '9780132350884', 5),
('Introduction to Algorithms', 'Thomas H. Cormen', 2009, '9780262033848', 3),
('Economic Theory', 'John Doe', 2015, '9780001234567', 4),
('English Grammar in Use', 'Raymond Murphy', 2019, '9780521189064', 2);

INSERT INTO borrow_records (student_id, book_id, borrow_date, return_date, is_returned) VALUES
(1, 1, '2024-09-01', '2024-09-20', TRUE),
(2, 3, '2024-09-05', NULL, FALSE),
(3, 2, '2024-10-01', NULL, FALSE),
(4, 4, '2024-08-20', '2024-09-10', TRUE);