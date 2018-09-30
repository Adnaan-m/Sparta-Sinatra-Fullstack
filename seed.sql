DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS cities CASCADE;

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  continent VARCHAR(30),
  main_language VARCHAR(20),
  population INT
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  capital VARCHAR(1),
  place_of_interest VARCHAR(40),
  country_id INT REFERENCES countries(id)
);

INSERT INTO countries (name, continent, main_language, population) VALUES ('England', 'Europe', 'English', 53.01);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Scotland', 'Europe', 'English', 5.295);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Wales', 'Europe', 'Welsh', 3.063);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Germany', 'Europe', 'German', 82.67);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Italy', 'Europe', 'Italian', 60.60);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Spain', 'Europe', 'Spanish', 46.56);
INSERT INTO countries (name, continent, main_language, population) VALUES ('South Africa', 'Africa', 'English', 55.91);
INSERT INTO countries (name, continent, main_language, population) VALUES ('India', 'Asia', 'Hindi', 1320);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Brazil', 'South America', 'Brazilian-Portuguese', 207.70);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Portugal', 'Europe', 'Portuguese', 10.32);
INSERT INTO countries (name, continent, main_language, population) VALUES ('Australia', 'Oceania', 'English', 24.13);


INSERT INTO cities (name, capital, place_of_interest, country_id) VALUES ('London', 'Y', 'London Eye', 1);
INSERT INTO cities (name, capital, place_of_interest, country_id) VALUES ('Leeds', 'N', 'Leeds City Museum', 1);
INSERT INTO cities (name, capital, place_of_interest, country_id) VALUES ('Rio De Janeiro', 'N', 'Christ The Redeemer', 9);
INSERT INTO cities (name, capital, place_of_interest, country_id) VALUES ('Barcelona', 'N', 'Nou Camp', 6);
