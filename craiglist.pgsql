DROP DATABASE IF EXISTS craiglist_db;

CREATE DATABASE craiglist_db;

\c craiglist_db;

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions (id)
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(20),
    text TEXT NOT NULL,
    location VARCHAR(20) NOT NULL,
    user_id INTEGER REFERENCES users (id),
    region_id INTEGER REFERENCES regions (id),
    category_id INTEGER REFERENCES categories (id)
);
