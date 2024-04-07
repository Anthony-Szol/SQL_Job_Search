/*
Questions: What skills are required for an entry level Data Analyst position?
- Identify the top 5 skills in demand for remote Data Analyst positions.
- Join the top 10 companies from query 1 with an inner join. 
- Why? Identiying the skills needed to qualify for entry level remote Data
    Analyst roles for job seekers.
*/

WITH company_in_need AS (
    SELECT
        jp.job_id,
        COUNT(c.name) AS openings,
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
        c.name, jp.job_id
)

SELECT  
    COUNT(sd.skills) AS skill_mention_count,
    sd.skills
FROM
    company_in_need AS cin
INNER JOIN
    skills_job_dim AS sj
    ON cin.job_id = sj.job_id
INNER JOIN
    skills_dim AS sd
    ON sj.skill_id = sd.skill_id
GROUP BY
    sd.skills
ORDER BY
    COUNT(sd.skills) DESC
LIMIT 5;