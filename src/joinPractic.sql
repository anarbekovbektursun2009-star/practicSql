CREATE TABLE Reader
(
    id            SERIAL PRIMARY KEY,
    full_name     VARCHAR(100)        NOT NULL,
    gender        VARCHAR(10) CHECK (gender IN ('male', 'female')),
    email         VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE                NOT NULL
);
-- Таблица Book
CREATE TABLE Book
(
    id             SERIAL PRIMARY KEY,
    book_name      VARCHAR(100) NOT NULL,
    genre          VARCHAR(50),
    published_year INT,
    price          NUMERIC(10, 2),
    is_booked      BOOLEAN DEFAULT false
);
-- Таблица Author
CREATE TABLE Author
(
    id        SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender    VARCHAR(10) CHECK (gender IN ('male', 'female')),
    book_id   INT REFERENCES Book (id)
);
-- Таблица Library
CREATE TABLE Library
(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    book_id   INT REFERENCES Book (id),
    reader_id INT REFERENCES Reader (id)
);

-- Readers
INSERT INTO Reader (full_name, gender, email, date_of_birth)
VALUES ('Elnura Arapova', 'female', 'elnura@gmail.com', '2002-05-20'),
       ('Sanjar Suanbekov', 'male', 'sanjar@gmail.com', '1995-03-14'),
       ('Chyngyz Zalkarbekov', 'male', 'chyngyz@gmail.com', '1999-10-30'),
       ('Symbat Salyamov', 'male', 'symbat@gmail.com', '1990-11-11'),
       ('Fatima Altynbek kyzy', 'female', 'fati@gmail.com', '2001-07-22'),
       ('Baitenir Busurmanov', 'male', 'baitenir@gmail.com', '1988-01-05'),
       ('Sanjar Orozobekov', 'male', 'sanjar.o@gmail.com', '1994-06-09'),
       ('Nurpazyl Nabiev', 'male', 'nurpazyl@gmail.com', '1998-02-14'),
       ('Junusbek Abdurahmanov', 'male', 'junus@gmail.com', '2004-01-14'),
       ('Abdulkudus Imarov', 'male', 'abdu@gmail.com', '1998-12-14'),
       ('Artur Rakhmanov', 'male', 'artur@gmail.com', '2000-09-04');
-- Books
INSERT INTO Book (book_name, genre, published_year, price, is_booked)
VALUES ('War and Peace', 'Historical', 1869, 1500.00, true),         -- 1
       ('Harry Potter', 'Fantasy', 2001, 900.00, false),             -- 2
       ('Clean Code', 'Programming', 2008, 1200.00, true),           -- 3
       ('1984', 'Dystopian', 1949, 800.00, false),                   -- 4
       ('Python Crash Course', 'Programming', 2016, 1300.00, false), -- 5
       ('The Great Gatsby', 'Classic', 1925, 950.00, true),          -- 6
       ('The Hobbit', 'Fantasy', 1937, 1000.00, false),              -- 7
       ('Sapiens', 'History', 2011, 1600.00, true);
-- 8
-- Authors
INSERT INTO Author (full_name, gender, book_id)
VALUES ('Leo Tolstoy', 'male', 1),
       ('J.K. Rowling', 'female', 2),
       ('Robert C. Martin', 'male', 3),
       ('George Orwell', 'male', 4),
       ('Eric Matthes', 'male', 5),
       ('F. Scott Fitzgerald', 'male', 6),
       ('J.R.R. Tolkien', 'male', 7),
       ('Yuval Noah Harari', 'male', 8);
-- Libraries
INSERT INTO Library (name, book_id, reader_id)
VALUES ('Central Library', 1, 1),
       ('Youth Library', 2, 2),
       ('Tech Library', 3, 3),
       ('City Library', 4, 4),
       ('IT Library', 5, 5),
       ('Classic Library', 6, 6),
       ('Children Library', 7, 7),
       ('Historical Library', 8, 8),
       ('Central Library', 2, 9),
       ('Tech Library', 5, 10),
       ('Youth Library', 6, 11),
       ('City Library', 1, 2);


SELECT * FROM Library;

SELECT l.name , a.gender, a.full_name from Library l
    join Book b on l.book_id = b.id
    join Author a on a.book_id=b.id
    where gender='male';

SELECT l.id, l.name from Library l join Book B on B.id = l.book_id;

