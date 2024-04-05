



WITH tp AS(
    SELECT
    jp.job_id,
    jp.job_title AS desired_role,
    cd.name AS company,
    jp.job_schedule_type,
    jp.salary_year_avg
FROM
    job_postings_fact AS jp
LEFT JOIN
    company_dim AS cd
    ON jp.company_id = cd.company_id
WHERE
    jp.job_title_short = 'Data Analyst' AND
    jp.salary_year_avg IS NOT NULL AND
    jp.job_work_from_home = TRUE
ORDER BY
    jp.salary_year_avg DESC
LIMIT 10
)

SELECT 
    tp.*,
    sd.skills
FROM 
    tp
INNER JOIN
    skills_job_dim AS sj
    ON tp.job_id = sj.job_id
INNER JOIN
    skills_dim AS sd  
    ON sj.skill_id = sd.skill_id
ORDER BY
    salary_year_avg DESC;