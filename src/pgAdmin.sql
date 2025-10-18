CREATE TABLE company_profile (
                                 company_id SERIAL PRIMARY KEY,
                                 company_name VARCHAR(100) UNIQUE NOT NULL,
                                 founded_year INT CHECK (founded_year > 1900)
);

INSERT INTO company_profile (company_name, founded_year)
VALUES ('Tesla', 2003),
       ('Google', 1998),
       ('Amazon', 1994);

CREATE TABLE branch_office (
                               branch_id SERIAL PRIMARY KEY,
                               location VARCHAR(100),
                               company_id INT REFERENCES company_profile(company_id)
);

INSERT INTO branch_office (location, company_id)
VALUES ('California', 1),
       ('New York', 3),
       ('Texas', 1);

CREATE TABLE staff_records (
                               staff_id SERIAL PRIMARY KEY,
                               full_name VARCHAR(100),
                               role VARCHAR(50),
                               salary NUMERIC(10,2) CHECK (salary > 500),
                               branch_id INT REFERENCES branch_office(branch_id)
);

INSERT INTO staff_records (full_name, role, salary, branch_id)
VALUES ('Elon Musk', 'CEO', 15000, 1),
       ('Jeff Bezos', 'Manager', 12000, 2),
       ('John Wayne', 'Engineer', 8000, 3);

CREATE TABLE suppliers (
                           supplier_id SERIAL PRIMARY KEY,
                           supplier_name VARCHAR(100),
                           country VARCHAR(100)
);

INSERT INTO suppliers (supplier_name, country)
VALUES ('Intel', 'USA'),
       ('Sony', 'Japan'),
       ('LG', 'Korea');

CREATE TABLE products (
                          product_id SERIAL PRIMARY KEY,
                          product_name VARCHAR(100),
                          price NUMERIC(8,2) CHECK (price > 0),
                          supplier_id INT REFERENCES suppliers(supplier_id)
);

INSERT INTO products (product_name, price, supplier_id)
VALUES ('Processor', 250.00, 1),
       ('Camera Lens', 400.00, 2),
       ('Display Panel', 350.00, 3);

CREATE TABLE customer_data (
                               customer_id SERIAL PRIMARY KEY,
                               customer_name VARCHAR(100),
                               email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO customer_data (customer_name, email)
VALUES ('Alice Brown', 'alice@gmail.com'),
       ('Tom Clark', 'tomc@gmail.com'),
       ('Sara Lee', 'sara.lee@yahoo.com');

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        customer_id INT REFERENCES customer_data(customer_id),
                        product_id INT REFERENCES products(product_id),
                        quantity INT CHECK (quantity > 0)
);

INSERT INTO orders (customer_id, product_id, quantity)
VALUES (1, 1, 2),
       (2, 2, 1),
       (3, 3, 4);

CREATE TABLE payments (
  payment_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(order_id),
  total_amount NUMERIC(10,2),
  payment_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO payments (order_id, total_amount)
VALUES (1, 500.00),
       (2, 400.00),
       (3, 1400.00);

CREATE TABLE advertisements (
                                ad_id SERIAL PRIMARY KEY,
                                company_id INT REFERENCES company_profile(company_id),
                                ad_name VARCHAR(100),
                                budget NUMERIC(10,2)
);

INSERT INTO advertisements (company_id, ad_name, budget)
VALUES (1, 'CyberTruck Promo', 100000),
       (2, 'Search Engine Ads', 50000),
       (3, 'Prime Day Sale', 120000);

CREATE TABLE investors (
                           investor_id SERIAL PRIMARY KEY,
                           investor_name VARCHAR(100),
                           invested_company INT REFERENCES company_profile(company_id),
                           amount NUMERIC(12,2)
);

INSERT INTO investors (investor_name, invested_company, amount)
VALUES ('BlackRock', 1, 2000000),
       ('SoftBank', 2, 1500000),
       ('Tiger Global', 3, 2500000);