-------------------------------------
-- A. Database and Table Setup

-- 1. Create the Database:

CREATE DATABASE covid_data;

-- 2. Create the Table:

CREATE TABLE covid_19_data (
   
    country TEXT(229),
    continent TEXT(6),
    deaths INT,
    recovered INT,
    tests INT,
    time DATETIME,
    day DATE,
    population INT,
    cases INT
);

-- B. Analysis Queries

-- 1. Total Cases, Deaths, and Recoveries by Country

SELECT country, 
       SUM(cases) AS total_cases, 
       SUM(deaths) AS total_deaths, 
       SUM(recovered) AS total_recovered
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY total_cases DESC;

-- 2. Total Cases handled by Continent

 SELECT continent, 
       SUM(population) AS total_population,
       SUM(cases) As total_cases
FROM covid_data.covid_19_data
GROUP BY continent
ORDER BY total_population DESC;

-- 3. Case Fatality Rate (CFR) by Country

SELECT country, 
       SUM(deaths) * 100.0 / SUM(cases) AS case_fatality_rate
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY case_fatality_rate DESC
limit 20;


-- 4. Cases Per Capita by Country

SELECT country, 
       SUM(cases) * 1.0 / MAX(population) AS cases_per_capita
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY cases_per_capita DESC
LIMIT 20;


-- 5. Countries with Highest Testing Rate (Tests per Population)

SELECT country, 
       SUM(tests) * 1.0 / MAX(population) AS tests_per_capita
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY tests_per_capita DESC
LIMIT 20;


-- 6. Top 10 Countries by Deaths, Cases and Tests

SELECT country, 
       SUM(deaths) AS total_deaths,
       SUM(cases) AS total_cases,
       SUM(tests) AS total_tests
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY total_deaths DESC
LIMIT 10;


-- 7. Maximum 5 high Cases, Deaths, and Tests

-- Maximum High Cases
SELECT country, 
       SUM(cases) AS total_cases
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY total_cases DESC
LIMIT 5;

-- Maximum High Deaths
SELECT country, 
       SUM(deaths) AS total_deaths
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY total_deaths DESC
LIMIT 5;

-- Maximum High Tests
SELECT country, 
       SUM(tests) AS total_tests
FROM covid_data.covid_19_data
GROUP BY country
ORDER BY total_tests DESC
LIMIT 5;

