/*
Answer: What are the top skills based on salary?
- Look at the average salary associatedwitheach skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysis 
  and helps identify the most financially rewarding skills to acquire or improve
*/

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

/*
Here's a breakdown of the results for top paying skills. 
- Top Paying Skills: SAP; Azure, AWS, Looker, Crystal, Qlik. These technologies are heavely
  used in enterprise solutions, cloud computing, and advanced data analytics, reflecting a 
  focus on high-level, integrated business operations and cloud services.
- Mid-Range skills: R, Flow, SQL, Oracle. These skills are related to data manipulation, statistical analysis
  an database management, essential tools for robust data analytics and integration processes.
- Lower-Range skills: Python, Tableau, BigQuery, Java, Excel. This group includes general-purpose 
  programming languages, data visualization tools and widely-used data manipulation tools, refletcting fundamental
  skills necessary for data analysis but with broader application beyond specialize enterpries need. 

[
  {
    "skills": "sap",
    "avg_salary": "111175.00"
  },
  {
    "skills": "azure",
    "avg_salary": "102500.00"
  },
  {
    "skills": "aws",
    "avg_salary": "102500.00"
  },
  {
    "skills": "looker",
    "avg_salary": "102500.00"
  },
  {
    "skills": "crystal",
    "avg_salary": "100500.00"
  },
  {
    "skills": "qlik",
    "avg_salary": "100500.00"
  },
  {
    "skills": "r",
    "avg_salary": "97366.67"
  },
  {
    "skills": "flow",
    "avg_salary": "89100.00"
  },
  {
    "skills": "sql",
    "avg_salary": "87864.83"
  },
  {
    "skills": "oracle",
    "avg_salary": "84337.50"
  },
  {
    "skills": "python",
    "avg_salary": "79091.71"
  },
  {
    "skills": "tableau",
    "avg_salary": "77257.00"
  },
  {
    "skills": "bigquery",
    "avg_salary": "75757.00"
  },
  {
    "skills": "java",
    "avg_salary": "73300.00"
  },
  {
    "skills": "c#",
    "avg_salary": "57500.00"
  },
  {
    "skills": "hadoop",
    "avg_salary": "53014.00"
  },
  {
    "skills": "matlab",
    "avg_salary": "53014.00"
  },
  {
    "skills": "javascript",
    "avg_salary": "53014.00"
  },
  {
    "skills": "vba",
    "avg_salary": "53014.00"
  },
  {
    "skills": "spark",
    "avg_salary": "53014.00"
  },
  {
    "skills": "excel",
    "avg_salary": "49007.00"
  }
]
*/