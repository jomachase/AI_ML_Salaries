# AI_ML_Salaries


📌 Project Overview

This project aims to look at the positives of AI and Machine Learning. This analysis wants to look at what medicating factors contribute to this high demand position.

Why Show Interest?

- The demand for AI talent is skyrocketing
- Unlocking Insights from Data
- Driving Innovation and Efficiency
- Solving Global Challenges
- Enhancing Human Capabilities

Project Goal

- Discuss Job Popularity
- Discuss Position Growth
- Discuss Highest Pay
- Discuss Experience-level vs best pay
- Discuss Company size vs best pay

🧑‍⚕️ Project Hypothesis
Under the umbrella of AI and Machine Learning:
1. Which job position is the most popular job to have?
2. From 2020 to 2025, how has the most popular job position grown?
3. Which of the jobs have the highest paying salary?
4. What experience-level is needed to have the best pay?
5. How big does the company have to be to have the best pay?

🧾 Data Sources
The dataset was retrieved from GitHub 

- Size: The original Dataset contained 73,148 rows and 11 columns. Once cleaned and renamed dataset became 65,877 rows and 9 rows. 

- Author:Cedric Aubin 


GitHub Table Structure:

- Year: The year the salary was paid.
> range:2020 - 2025

- Experience_level: The experience level in the job during the year with the following possible values:
> Entry-level
> Mid-level
> Senior-level 
> Executive-level

- Employment_type: The type of employement for the role:
> Part-time
> Full-time
> Contract

- Position: The role worked in during the year:
> AI / ML Engineer / Developer
> Data Science, Engineers & Analytics
> Products, Research & Development
> AI / ML Software Engineer
> AI / ML Computer Systems
> AI / ML Sales, Consultant & Prof. Services

- Currancy: The currency used in thr salary amount paid.
> USD

- Salary: The total gross salary amount paid.
> ranges from $16,000 to $750,000

- Country: The location of the job.
> US

- Remote_Amount: The percentage of the job location being remote or On-site.
> 0%, 50% or 100%


Main Focus: Position, Experience_Level, Company_Size, Year and Salary (categorical & numerical)

🧹 Data Preparation

* Dropped columns (salary, employee_residence ) to avoid duplicated data.
Checked for missing values, outliers, and inconsistencies.
Renamed job titles from 289 positions to 6 umbrella position to simplify analysis
Renamed dataframe table to make table names and rows more readible.

🧮 Feature Stats to answer hypothesis:

Counts for Position:
-------|------|-----      
| Data Science, Engineers & Analytics          | 36290 |
| Products, Research & Development             | 11775 |
| AI / ML Software Engineer                    | 8684  |
| AI / ML Engineer / Developer                 | 7479  |
| AI / ML Sales, Consultant & Prof. Services   | 1120  |
| AI / ML Computer Systems                     | 529   |

Counts for Experience_Level:
-------|------|-----   
|Experience_Level   |       | 
|Senior Level       | 39552 |
|Mid Level          | 19280 | 
|Entry Level        |  5661 |
|Executive Level    |  1384 |

Counts for Company_Size
-------|------|----- 
|Medium | 63740     | 
| Large |  2081     | 
| Small |    56     | 

Job Rank                  Position             Mean Salary
---------------------|----------------------|--------------- 
|1|                AI / ML Engineer / Developer|  $ 193610.27|  
|2|                   AI / ML Software Engineer|  $ 189431.72| 
|3|            Products, Research & Development|  $ 182090.09| 
|4|                    AI / ML Computer Systems|  $ 181678.86|  
|5| AI / ML Sales, Consultant & Prof. Services |  $ 163489.44| 
|6|         Data Science, Engineers & Analytics|  $ 145727.63|  

📊 Key Findings
- Most job title in demand is  Data Science, Engineers & Analytics.
- Best paying job is AI / ML Engineer / Developer with the best salary of $193,610.
- Senior Level positions have the best pay.
- Medium sized companies pay the best.

⚠️ Challenges of Work:
- The dataset is extremely large and had no generalized job titles, which made classification difficult.
- Potential experience-level imbalance should be addressed cause it may reflect a disproportion for jobs.
- Need more Global information for analysis
- Need more state by state analysis for comparison

🧰 Tech Stack

- Tools: Jupyter Notebook,MS Excel, Tableau, SQL


📁 Github Structure


├── data/
│   ├── raw/           
│   └── clean/          
├── notebooks/
│   ├──AI_ML_Salaries_sorted_columns.csv
│   └── AI_ML_Salaries_v1.ipynb        
│   └── AI_ML_Salaries_v2.ipynb         
│   └── AI_ML_Salaries_stats_v3.ipynb
│   └── AI_ML_Salaries_visuals_v4.ipynb
├── figures/
│   ├── AI_ML_Presentation1.png
│   ├── AI_ML_Presentation2.png
│   ├── Positions_Dahboard.png
│   └── AI_ML_Salaries_Tableau.twbx
│   └── Project_ERD.pdf
├── sql_scripts/
│   ├── create_database.sql
│   ├── position_salary_exp_employ_query_database.sql
│   ├── check_data.sql
│   └── project.sql
├── pyproject.toml
├── config.yaml
└── README.md

👥 Contributor:
   Joma Chase



1. Dataset Location:https://www.kaggle.com/datasets/cedricaubin/ai-ml-salaries
2. Tableau Dashboard: https://public.tableau.com/app/profile/joma.chase/viz/AI_ML_Salaries_Tableau/Donut-EL?publish=yes
