CREATE TABLE courses(
    id SERIAL PRIMARY KEY ,
    cours_name VARCHAR,
    price INT
);

CREATE TABLE mentors (
    id SERIAL PRIMARY KEY ,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    course_id INT REFERENCES courses(id)
);

INSERT INTO courses (cours_name, price)
VALUES
    ('Java Core',18000),
    ('JS Core',18000),
    ('English',18000);

INSERT INTO mentors(first_name, last_name, email, course_id)
VALUES
    ('Urmat','Taichikov','urmat@gmail.com',1),
    ('Aizat','Duisheeva','aizat@gmail.com',2),
    ('Aijamal','Asangazieva','aijamal@gmail.com',3);

SELECT * FROM courses;
SELECT * FROM mentors;

SELECT * FROM mentors JOIN courses ON courses.id=mentors.course_id;

SELECT * FROM mentors INNER JOIN courses ON courses.id=mentors.course_id;


