/*
Questions:What are the top-paying jobs for my desired role?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst
*/

SELECT
    job_id,
    job_title AS desired_role,
    cd.name AS company,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_via
FROM
    job_postings_fact AS jp
LEFT JOIN
    company_dim AS cd
    ON jp.company_id = cd.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
Summary

Highest Paying Data Analyst Roles:

1. Mantys: Data Analyst - $650,000/year
2. Meta: Director of Analytics - $336,500/year 
3. AT&T: Associate Director, Data Insights - $255,829.5/year 
4. Pinterest Job Advertisements: Data Analyst, Marketing - $232,423/year

These roles offer lucrative salaries ranging from $232,423 to $650,000 per year, p
osted via various platforms including Y Combinator, LinkedIn, ZipRecruiter, and Indeed.
*/