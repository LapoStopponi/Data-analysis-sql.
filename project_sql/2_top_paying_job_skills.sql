/*
Question: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest-paying Data Analyst job from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
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

*/
Insights: Python is the skill most frequently mentioned, appearing in 7 postings. 
Sql is the second mosto common, found in 6 postings. Tableau appears in 4 postings. 
R found in 3 popstings. Oracle, Java and BigQuery are mentioned in 2 postings. 
Other notable skills are Azure, AWS, Crystal, Looker, Qlik, SAP, Flow, C#, JavaScript, 
VBA, Excel, MATLAB, Spark and Hadoop, each mentioned once. These insights suggest that proficency 
in Python and SQL is highly valued among data analyst roles, with a significant emphasis on data visualization
skills like those provided by Tableau. Additionally, knowledge of specific programming languages and database 
managment systemns is also in demand.

[
  {
    "job_id": 245409,
    "job_title": "SAP Data Analyst",
    "job_location": "San Vendemiano, Province of Treviso, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-08 04:17:27",
    "company_name": "Méthode Srl",
    "skills": "sql"
  },
  {
    "job_id": 245409,
    "job_title": "SAP Data Analyst",
    "job_location": "San Vendemiano, Province of Treviso, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-08 04:17:27",
    "company_name": "Méthode Srl",
    "skills": "oracle"
  },
  {
    "job_id": 245409,
    "job_title": "SAP Data Analyst",
    "job_location": "San Vendemiano, Province of Treviso, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-08 04:17:27",
    "company_name": "Méthode Srl",
    "skills": "sap"
  },
  {
    "job_id": 834533,
    "job_title": "Data Analyst - Product Team",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-04-28 20:19:24",
    "company_name": "Satispay",
    "skills": "sql"
  },
  {
    "job_id": 834533,
    "job_title": "Data Analyst - Product Team",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-04-28 20:19:24",
    "company_name": "Satispay",
    "skills": "python"
  },
  {
    "job_id": 834533,
    "job_title": "Data Analyst - Product Team",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-04-28 20:19:24",
    "company_name": "Satispay",
    "skills": "r"
  },
  {
    "job_id": 834533,
    "job_title": "Data Analyst - Product Team",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-04-28 20:19:24",
    "company_name": "Satispay",
    "skills": "tableau"
  },
  {
    "job_id": 834533,
    "job_title": "Data Analyst - Product Team",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-04-28 20:19:24",
    "company_name": "Satispay",
    "skills": "looker"
  },
  {
    "job_id": 156658,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-05-03 23:41:44",
    "company_name": "Adevinta",
    "skills": "sql"
  },
  {
    "job_id": 156658,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-05-03 23:41:44",
    "company_name": "Adevinta",
    "skills": "python"
  },
  {
    "job_id": 156658,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-05-03 23:41:44",
    "company_name": "Adevinta",
    "skills": "azure"
  },
  {
    "job_id": 156658,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-05-03 23:41:44",
    "company_name": "Adevinta",
    "skills": "aws"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "sql"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "python"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "r"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "crystal"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "bigquery"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "tableau"
  },
  {
    "job_id": 805174,
    "job_title": "Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-05-26 09:30:41",
    "company_name": "iGenius",
    "skills": "qlik"
  },
  {
    "job_id": 1578032,
    "job_title": "NLP Expert (Natural Language Processing)",
    "job_location": "Ispra, VA, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-04-21 00:12:23",
    "company_name": "NRB Group",
    "skills": "python"
  },
  {
    "job_id": 1578032,
    "job_title": "NLP Expert (Natural Language Processing)",
    "job_location": "Ispra, VA, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-04-21 00:12:23",
    "company_name": "NRB Group",
    "skills": "java"
  },
  {
    "job_id": 1578032,
    "job_title": "NLP Expert (Natural Language Processing)",
    "job_location": "Ispra, VA, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-04-21 00:12:23",
    "company_name": "NRB Group",
    "skills": "r"
  },
  {
    "job_id": 1578032,
    "job_title": "NLP Expert (Natural Language Processing)",
    "job_location": "Ispra, VA, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-04-21 00:12:23",
    "company_name": "NRB Group",
    "skills": "flow"
  },
  {
    "job_id": 226771,
    "job_title": "Application Developer & Data Analyst",
    "job_location": "Nonantola, Province of Modena, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "job_posted_date": "2023-06-17 16:01:00",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 226771,
    "job_title": "Application Developer & Data Analyst",
    "job_location": "Nonantola, Province of Modena, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "job_posted_date": "2023-06-17 16:01:00",
    "company_name": "Bosch Group",
    "skills": "java"
  },
  {
    "job_id": 226771,
    "job_title": "Application Developer & Data Analyst",
    "job_location": "Nonantola, Province of Modena, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "job_posted_date": "2023-06-17 16:01:00",
    "company_name": "Bosch Group",
    "skills": "c#"
  },
  {
    "job_id": 226771,
    "job_title": "Application Developer & Data Analyst",
    "job_location": "Nonantola, Province of Modena, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "job_posted_date": "2023-06-17 16:01:00",
    "company_name": "Bosch Group",
    "skills": "oracle"
  },
  {
    "job_id": 491554,
    "job_title": "Junior Data Analyst",
    "job_location": "Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-05-05 11:33:44",
    "company_name": "Octopus Energy",
    "skills": "python"
  },
  {
    "job_id": 1000037,
    "job_title": "Data Analyst - Accounting SQL",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-03-04 21:26:08",
    "company_name": "AUTO1 Group",
    "skills": "sql"
  },
  {
    "job_id": 1000037,
    "job_title": "Data Analyst - Accounting SQL",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-03-04 21:26:08",
    "company_name": "AUTO1 Group",
    "skills": "python"
  },
  {
    "job_id": 1000037,
    "job_title": "Data Analyst - Accounting SQL",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-03-04 21:26:08",
    "company_name": "AUTO1 Group",
    "skills": "javascript"
  },
  {
    "job_id": 1000037,
    "job_title": "Data Analyst - Accounting SQL",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-03-04 21:26:08",
    "company_name": "AUTO1 Group",
    "skills": "vba"
  },
  {
    "job_id": 1000037,
    "job_title": "Data Analyst - Accounting SQL",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-03-04 21:26:08",
    "company_name": "AUTO1 Group",
    "skills": "excel"
  },
  {
    "job_id": 1000037,
    "job_title": "Data Analyst - Accounting SQL",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-03-04 21:26:08",
    "company_name": "AUTO1 Group",
    "skills": "tableau"
  },
  {
    "job_id": 1181344,
    "job_title": "Data Analyst for Consumer Sensors",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-04-14 08:54:15",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 1181344,
    "job_title": "Data Analyst for Consumer Sensors",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-04-14 08:54:15",
    "company_name": "Bosch Group",
    "skills": "matlab"
  },
  {
    "job_id": 1181344,
    "job_title": "Data Analyst for Consumer Sensors",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-04-14 08:54:15",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1181344,
    "job_title": "Data Analyst for Consumer Sensors",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-04-14 08:54:15",
    "company_name": "Bosch Group",
    "skills": "hadoop"
  },
  {
    "job_id": 1181344,
    "job_title": "Data Analyst for Consumer Sensors",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-04-14 08:54:15",
    "company_name": "Bosch Group",
    "skills": "tableau"
  },
  {
    "job_id": 1556441,
    "job_title": "AdTech Data Analyst",
    "job_location": "Milan, Metropolitan City of Milan, Italy",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "51014.0",
    "job_posted_date": "2023-02-03 15:51:33",
    "company_name": "Publicis Groupe",
    "skills": "bigquery"
  }
]
*/

