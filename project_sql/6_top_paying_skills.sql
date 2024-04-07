/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specificed salaries, regardless of location.
- Why? It reveals the most financially rewarding skills for Data Analyst.
*/


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



/*
Proficiency in version control systems like Bitbucket and 
GitLab is crucial, indicating a need for efficient collaboration 
and code management in data analytics projects.

Front-end development skills such as Angular and CSS, along with backend 
proficiency in FastAPI, are in demand, emphasizing the importance of creating 
visually appealing and interactive interfaces for data presentation and integration 
with web applications.

Deep learning expertise with frameworks like Keras and proficiency in big data processing 
tools like PySpark are highly valued, reflecting a trend towards integrating advanced analytics 
and machine learning capabilities into data analysis workflows
*/