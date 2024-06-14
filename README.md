# Introduction
 Dive into the data job market! Focusing on data analyst roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salaries in data analytics. 
 SQL queries? Check them out here [project_sql](/project_sql/)
# Background
Driven to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining other works to find optimal jobs. 
Data hails 
from [SQL Course] (htpps://lukebarousse.com/sql). It's packed with insights on job titles, salaries, location, and essential skills. 
### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:
-**SQL**: The backbone of my analysis, allowing me to query the database and unheart critical insights.
-**PostgreSQL**: The chosen database management system, ideal for handling the job posting data. 
-**Visual Studio Code**: My go-to for database management and executing SQL queries.
-**Git and Github**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking. 
# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question: 
### 1. Top-paying Data Analyst jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on jobs in Italy. This query highlights the high-paying opportunities in the field. 
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short= 'Data Analyst' AND
    job_location LIKE '%Italy' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in Italy in 2023:
- **Salary range**: Top 10 paying data analyst roles span from $51,014 to $111,175 indicating significant salary potential in the field.
- **Diverse Employers**: companies like Satispay, Adevinta, iGenius, Bosch Group are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety**: There's a high diversity in job titles, from Data Analyst to Application Developer & Data Analyst, reflecting varied roles and specializations within data analytics.
### 2. Skills for Top Paying Jobs
To understand what skills are required in Italy for the top-paying jobs, I joined the job postings with the skills data, and insights into what employers value for high-compensation roles.
```sql
WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short= 'Data Analyst' AND
    job_location LIKE '%Italy' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)
SELECT top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
```
![frequency_skills](https://github.com/LapoStopponi/Data-analysis-sql./assets/166521228/0fb8337a-6138-4e79-9b09-10090277dfc0)


**Insights**: 
-Python is the skill most frequently mentioned, appearing in 7 postings. 
-Sql is the second most common, found in 6 postings. 
-Tableau appears in 4 postings. 
-R found in 3 postings. 
-Oracle, Java, and BigQuery are mentioned in 2 postings. 
-Other notable skills are Azure, AWS, Crystal, Looker, Qlik, SAP, Flow, C#, JavaScript, 
VBA, Excel, MATLAB, Spark, and Hadoop, were each mentioned once. 
These insights suggest that proficiency in Python and SQL is highly valued among data analyst roles, 
with a significant emphasis on data visualization skills like those provided by Tableau. 
Knowledge of specific programming languages and database management systems is also in demand.
### 3. In-demand skills for Data Analysts
This query helped identify the skills most frequently requested in job postings in Italy, directing focus to areas with high demand. 
```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_location LIKE '%Italy%'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
![in_demand_skills_for_d_a](https://github.com/LapoStopponi/Data-analysis-sql./assets/166521228/b4244d23-10b9-4be2-b417-e908820aa858) 

Here's the breakdown of the most demanded skills for data analysts in 2023 in Italy:
-**Excel** and **SQL** are fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation. 
-**Programming** and **Visualization Tools** like **Python** and **Power BI**, are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support. 
### 4. Skills based on salary
Exploring the average salaries associated with different skills revealed the highest-paying skills. 
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL 
      AND job_location LIKE '%Italy%'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
![skills_based_on_salary](https://github.com/LapoStopponi/Data-analysis-sql./assets/166521228/152f1d97-cebe-4ffc-8305-f6009a5f095e)

Here's a breakdown of the results for top-paying skills. 
- **Top Paying Skills**: SAP; Azure, AWS, Looker, Crystal, Qlik. These technologies are heavily
  used in enterprise solutions, cloud computing, and advanced data analytics, reflecting a 
  focus on high-level, integrated business operations and cloud services.
- **Mid-Range skills**: R, Flow, SQL, Oracle. These skills are related to data manipulation, statistical analysis, and database 
  management, essential tools for robust data analytics and integration processes.
- **Lower-Range skills**: Python, Tableau, BigQuery, Java, Excel. This group includes general-purpose 
  programming languages, data visualization tools, and widely used data manipulation tools, reflecting fundamental
  skills necessary for data analysis but with broader applications beyond specialized enterprises' needs.
## 5.Most optimal skills to learn
Combining insights from demand and salary data, this query is aimed to pinpoint those that are both in high demand and have high salaries, offering a strategic focus for skill development. 
```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%Italy%'
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) >= 2
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
![most_optimal_skills_to_learn_2023](https://github.com/LapoStopponi/Data-analysis-sql./assets/166521228/09bf6088-3f2a-407a-9f10-bd7c47cf2f86)

Here's a breakdown of the most optimal skills for Data Analysts in 2023:
- High-demand skills: Python and SQL have the highest demand but offer moderate salaries compared to R.
- High salary skills: R offers the highest average salary among the listed skills but has moderate demand.
- Balanced skills: Oracle and BigQuery have moderate demand and salaries, making them balanced in terms of both metrics.
- Low demand skills: Excel has both low demand and low salary, indicating it may be less valuable for high-paying data analyst roles 
  in Italy.
These insights suggest that focusing on skills like Python, SQL, and Tableau can be beneficial due to high demand while mastering R can lead to higher salaries even if the demand is slightly lower.

# What I learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:
- **Complex query crafting** Mastered the art of advanced SQL, merging tables, and wielding WITH clauses.
- **Data aggregation**. Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing 
  sidekicks.
- **Analytical abilities** Leveld up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.  
# Conclusions
From the analysis, several general insights emerged:
1.**Top-paying Data Analysts jobs**: The highest-paying jobs for data analysts in Italy offer a wide range of salaries, the highest at $111,175.
2.**Skills for top-paying jobs**: High-paying data analyst jobs require proficiency in Python and SQL, suggesting those are critical skills for earning a top salary.
3.**Most in-demand skills**: SQL and Excel are the most demanded skills in the data analyst job market, thus making them essential for the job market
4.**Skills with higher Salaries**: Specialized skills, such as SAP, Azure, AWS, Looker, Crystal, and Qlik are associated with the highest average salaries, indicating a premium on niche expertise. 
5.**Optimal skills for job market value**: Python and SQL have the highest demand but offer moderate salaries compared to R.
### Closing thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation of emerging trends in the field of data analytics. 
