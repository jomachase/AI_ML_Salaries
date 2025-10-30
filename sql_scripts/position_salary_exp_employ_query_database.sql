USE AI_ML_SAlaries;
-- What are the min/max salary based on company size

SELECT
    cs.name AS company_size,
    MAX(j.salary) AS highest_salary,
    MIN(j.salary) AS lowest_salary
FROM
    job j
JOIN
    company_size cs ON j.size_id = cs.size_id
GROUP BY
    cs.name;
    
-- What are the salary based on position
SELECT
    p.position AS position_name,
    ROUND(AVG(j.salary), 2) AS average_salary
FROM
    job j
JOIN
    positions p ON j.position_id = p.position_id
GROUP BY
    p.position;

-- How does the average salary vary based on the company size for a particular year?
SELECT
    cs.name AS company_size,
    j.year,
    ROUND(AVG(j.salary), 2) AS average_salary
FROM
    job j
JOIN
    company_size cs ON j.size_id = cs.size_id
GROUP BY
    cs.name,
    j.year;

-- Which position has the highest average salary for senior-level positions?

SELECT
    cs.name AS company_size,
    j.year,
    ROUND(AVG(j.salary), 2) AS average_salary
FROM
    job j
JOIN
    company_size cs ON j.size_id = cs.size_id
GROUP BY
    cs.name,
    j.year;
    

-- Which position has the highest average salary for senior-level positions?
SELECT
    p.position AS position_name,
    AVG(j.salary) AS average_salary
FROM
    job j
JOIN
    positions p ON j.position_id = p.position_id
JOIN
    experience_level el ON j.experience_id = el.experience_id
WHERE
    el.name = 'Senior Level '
GROUP BY
    p.position
ORDER BY
    average_salary DESC
LIMIT 1;
    
-- Which position has the highest average salary for Mid Level positions?
SELECT
    p.position AS position_name,
    AVG(j.salary) AS average_salary
FROM
    job j
JOIN
    positions p ON j.position_id = p.position_id
JOIN
    experience_level el ON j.experience_id = el.experience_id
WHERE
    el.name = 'Mid Level '
GROUP BY
    p.position
ORDER BY
    average_salary DESC
LIMIT 1;

-- Combinination of a list of high-paying jobs with a list of jobs that are remote.
SELECT
    p.position AS position_name,
    AVG(j.salary) AS average_salary
FROM
    job j
JOIN
    positions p ON j.position_id = p.position_id
JOIN
    experience_level el ON j.experience_id = el.experience_id
WHERE
    el.name = 'Senior Level '
GROUP BY
    p.position
ORDER BY
    average_salary DESC
LIMIT 1;

-- Which positions have salaries higher than the overall average salary for the year 2025?
SELECT position
FROM positions
WHERE position_id IN (
    SELECT position_id
    FROM job
    WHERE year = 2025
    AND salary > (SELECT AVG(salary) FROM job WHERE year = 2025)
);
-- Which positions have salaries higher than the overall average salary for the year 2024?
SELECT position
FROM positions
WHERE position_id IN (
    SELECT position_id
    FROM job
    WHERE year = 2024
    AND salary > (SELECT AVG(salary) FROM job WHERE year = 2024)
);
-- Which positions have salaries higher than the overall average salary for the year 2024?
SELECT position
FROM positions
WHERE position_id IN (
    SELECT position_id
    FROM job
    WHERE year = 2023
    AND salary > (SELECT AVG(salary) FROM job WHERE year = 2023)
);
-- Highest paying position 2022
SELECT position
FROM positions
WHERE position_id IN (
    SELECT position_id
    FROM job
    WHERE year = 2022
    AND salary > (SELECT AVG(salary) FROM job WHERE year = 2022)
);
-- Highest paying position 2021
SELECT position
FROM positions
WHERE position_id IN (
    SELECT position_id
    FROM job
    WHERE year = 2021
    AND salary > (SELECT AVG(salary) FROM job WHERE year = 2021)
);
-- Highest paying position 2020
SELECT position
FROM positions
WHERE position_id IN (
    SELECT position_id
    FROM job
    WHERE year = 2020
    AND salary > (SELECT AVG(salary) FROM job WHERE year = 2020)
);

-- Created a view that displays job details with the corresponding company size.
DROP VIEW JobDetailsWithSize;
CREATE view JobDetailsWithSize AS
SELECT j.job_id, j.year, j.salary, p.position, cs.name AS company_size
FROM job j
JOIN positions p ON j.position_id = p.position_id
JOIN company_size cs ON j.size_id = cs.size_id;

SELECT * FROM JobDetailsWithSize WHERE year = 2025;

-- Find the top 3 highest paying positions for each company size.
WITH RankedSalaries AS (
    SELECT DISTINCT j.job_id, p.position, cs.name AS company_size, j.salary,
           ROW_NUMBER() OVER (PARTITION BY cs.name ORDER BY j.salary DESC) AS salary_rank
    FROM job j
    JOIN positions p ON j.position_id = p.position_id
    JOIN company_size cs ON j.size_id = cs.size_id
)

SELECT job_id, position, company_size, salary
FROM RankedSalaries
WHERE salary_rank <= 3;


-- Create a temporary table of positions with the highest salaries for each experience leveL
DROP TEMPORARY TABLE TempHighestSalaries;
CREATE TEMPORARY TABLE IF NOT EXISTS TempHighestSalaries AS
WITH RankedSalaries AS (
    SELECT p.position, el.name AS experience_level, j.salary,
           ROW_NUMBER() OVER (PARTITION BY el.name ORDER BY j.salary DESC) AS salary_rank
    FROM job j
    JOIN positions p ON j.position_id = p.position_id
    JOIN experience_level el ON j.experience_id = el.experience_id
)

SELECT position, experience_level, salary
FROM RankedSalaries
WHERE salary_rank = 1;

SELECT * FROM TempHighestSalaries;


-- Which positions in the US have salaries higher than the average salary for senior-level positions in the US?

SELECT ROUND(AVG(salary), 2) AS average_salary FROM job_salary_exp_country_position
WHERE experience_level = "Senior Level ";

SELECT DISTINCT(position) FROM job_salary_exp_country_position;

SELECT p.position, ROUND(AVG(j.salary), 2) AS average_salary
FROM job j
JOIN positions p ON j.position_id = p.position_id
JOIN countries c ON j.country_id = c.country_id
JOIN experience_level el ON j.experience_id = el.experience_id
WHERE c.name = 'US' AND el.name = 'Senior Level ' 
GROUP BY p.position
HAVING AVG(j.salary) > (SELECT AVG(salary) FROM job j2 JOIN experience_level el2 ON j2.experience_id = el2.experience_id JOIN countries c2 ON j2.country_id = c2.country_id WHERE c2.name = 'US' AND el2.name = 'Senior Level ');

-- How does the average salary in the US vary based on the employment type for each position?

SELECT p.position, et.name AS employment_type, ROUND(AVG(j.salary), 2) AS average_salary
FROM job j
JOIN positions p ON j.position_id = p.position_id
JOIN employment_type et ON j.employment_id = et.employment_id
JOIN countries c ON j.country_id = c.country_id
WHERE c.name = 'US'
GROUP BY p.position, et.name;


-- Created a temporary table of positions in the US with salaries above $80,000 and employment type 'Full-Time', then list the positions
DROP TEMPORARY TABLE HighPayingFullTimeUSJobs;
CREATE TEMPORARY TABLE IF NOT EXISTS HighPayingFullTimeUSJobs AS
SELECT p.position
FROM job j
JOIN positions p ON j.position_id = p.position_id
JOIN employment_type et ON j.employment_id = et.employment_id
JOIN countries c ON j.country_id = c.country_id
WHERE c.name = 'US' AND j.salary > 80000 AND et.name = 'Full-Time';

SELECT DISTINCT position FROM HighPayingFullTimeUSJobs;

-- Listed the top 3 highest-paying positions in the US for remote jobs, and displayed their average salaries.
WITH RankedRemoteUSJobs AS (
    SELECT
        p.position,
        et.name AS employment_type,
        el.name AS experience_level,
        ROUND(AVG(j.salary), 2) AS average_salary,
        RANK() OVER (ORDER BY AVG(j.salary) DESC) AS salary_rank
    FROM
        job j
    JOIN
        positions p ON j.position_id = p.position_id
    JOIN
        countries c ON j.country_id = c.country_id
    JOIN
        remote r ON j.remote_id = r.remote_id
    JOIN
        employment_type et ON j.employment_id = et.employment_id
    JOIN
        experience_level el ON j.experience_id = el.experience_id
    WHERE
        c.name = 'US' AND r.percentage = 100
    GROUP BY
        p.position, et.name, el.name
)
SELECT
    position,
    employment_type,
    experience_level,
    average_salary
FROM
    RankedRemoteUSJobs
WHERE
    salary_rank <= 3;