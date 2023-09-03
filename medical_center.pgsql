
DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    specialty TEXT
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    doctor_id INTEGER NOT NULL REFERENCES doctors (id),
    patient_id INTEGER NOT NULL REFERENCES patients (id)
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL REFERENCES visits (id),
    disease_id INT NOT NULL REFERENCES diseases (id)
);