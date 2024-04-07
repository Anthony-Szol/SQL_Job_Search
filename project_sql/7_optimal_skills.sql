/*
Question: What are the most optimal skills to learn?
- Identify skills in high demand and accociated with high average salary for remote Data Analyst roles.
- Why? High demand skills offer job security and financial benefits. 
*/

WITH skills_demand AS (
    SELECT
    sd.skills,
    COUNT(sj.job_id) AS demand_count
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sj
    ON jp.job_id = sj.job_id
INNER JOIN
    skills_dim AS sd
    ON sj.skill_id = sd.skill_id
WHERE
    job_title LIKE '%Data Analyst%' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;  
)

WITH average_salary AS (
    SELECT
    sd.skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sj
    ON jp.job_id = sj.job_id
INNER JOIN
    skills_dim AS sd
    ON sj.skill_id = sd.skill_id
WHERE
    job_title LIKE '%Data Analyst%' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10;  
)