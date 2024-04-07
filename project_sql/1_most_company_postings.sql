/*
Question: What companies have the highest remote Data Analyst openings?
- Identify the top 10 companies with the most remote Data Analyst positions. 
- Focuses on roles with average yearly salaries of $90,000 < 
- Why? Identifying companies with the highest demand for remote Data Analyst
    for entry level job seekers.
*/

SELECT
    COUNT(jp.job_id) AS openings,
    c.name AS company_name,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact AS jp
LEFT JOIN
    company_dim AS c
    ON jp.company_id = c.company_id
WHERE
    job_title_short LIKE '%Data Analyst%' AND
    salary_year_avg > 100000 AND 
    job_work_from_home IS TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    c.name
ORDER BY
    openings DESC
LIMIT 10;


/*
Summary

- Company with the Most Openings: Get It Recruit - Information Technology with 46 openings.

- Highest Average Salary: Uber with an average salary of $151,063.

- Variation in Openings: Companies have varying numbers of openings ranging from 46 to 5.

- Salary Range: Average salaries range from $109,360 to $151,063.

- Industry Distribution: Companies span across various industries including Information Technology, 
    Healthcare, Finance, and more.
*/