CREATE DATABASE aws_course;

\c aws_course;

CREATE TABLE users(
    ID SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR NOT NULL,
    LAST_NAME VARCHAR NOT NULL,
    COMPANY VARCHAR
);

INSERT INTO users (FIRST_NAME, LAST_NAME, COMPANY)
VALUES
    ('Bill', 'Gates', 'Microsoft'),
    ('Elon', 'Musk', 'SpaceX');

SELECT * FROM users;