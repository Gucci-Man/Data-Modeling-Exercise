DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    home_team_score INT NOT NULL,
    away_team_score INT NOT NULL,
    home_team_id INTEGER REFERENCES teams (id),
    away_team_id INTEGER REFERENCES teams (id),
    head_referee INTEGER REFERENCES referees (id),
    season_id INTEGER REFERENCES seasons (id)
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    qty INTEGER NOT NULL,
    match_id INTEGER REFERENCES matches (id),
    player_id INTEGER REFERENCES players (id)
);

CREATE TABLE rankings(
    id SERIAL PRIMARY KEY,
    rank INTEGER NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);