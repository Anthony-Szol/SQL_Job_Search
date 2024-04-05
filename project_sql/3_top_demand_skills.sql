/*
Question: What are the most in-demand skills for data analysts?
- Join the job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a Data Analyst.
- Focus on all job postings.
- Why is this important? Retrieves the top 5 skills with the highest demand in the job market,
    providing insight on skills that are most valuable.
*/

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

/*
Edit later with conclusion
*/