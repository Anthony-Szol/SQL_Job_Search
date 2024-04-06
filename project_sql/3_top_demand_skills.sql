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
SQL remains the top skill with the highest 
demand count (7336), crucial for efficient data 
retrieval and manipulation from relational databases.

Python follows closely behind (4442), offering versatility 
for various data analysis tasks including manipulation, 
statistical analysis, and machine learning model development.

Excel, Tableau, and Power BI maintain significant relevance 
(demand counts of 4296, 3862, and 2500 respectively), with Excel 
being fundamental for basic analysis, and Tableau and Power BI 
focusing on data visualization, facilitating informed decision-making.
*/