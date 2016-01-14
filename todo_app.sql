-- create database (database name)
-- *** to create database:***
--    run psql postgres
--    run 'create database chazl'

-- \c (database name)
-- psql -f test.sql (to test the page)

-- create a user table 
CREATE TABLE users(
   id          int primary key  not null,
   first_name text              not null,
   last_name  text              not null,
   email      text              not null
);

DROP USER IF EXISTS michael;

CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

-- create task table
CREATE TABLE tasks(
   id serial NOT NULL,
   title char (50) NOT NULL,
   description text NULL,
   created_at timestamp NOT NULL DEFAULT now(),
   updated_at timestamp NULL,
   completed boolean NOT NULL DEFAULT false
);

ALTER TABLE IF EXISTS tasks ADD PRIMARY KEY (id);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();