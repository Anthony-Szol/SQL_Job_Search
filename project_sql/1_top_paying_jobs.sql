/*
Questions:What are the top-paying jobs for my desired role?
- Identify the top 10 highest-paying Data Analyst and Business Analyst roles that are available remotely or in California.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst and Business Analyst
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_posting_fact