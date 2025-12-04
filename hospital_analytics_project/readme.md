# 🏥 Hospital Department Operational Metrics Analysis

Analysis of hospital operational, financial, and demographic metrics by department using SQL and Tableau to generate actionable insights.

---

## 🎯 Problem Statement

Hospitals generate vast amounts of data, but understanding operational efficiency, patient outcomes, and departmental costs requires structured analysis. This project quantifies key metrics like average length of stay, costs, readmission risk, and demographic patterns to support better decision-making.

---

## 🛠️ Approach

* Extracted and cleaned data using **SQL**
* Aggregated metrics by department and patient characteristics
* Visualized results in **Tableau dashboards** to highlight trends and insights
* Organized queries into thematic files to demonstrate structured, professional workflow

---

## 💾 SQL Datasets Generated

All SQL queries are stored in the `/sql/` folder:

| File                              | Purpose                                                                     |
| --------------------------------- | --------------------------------------------------------------------------- |
| `01_data_cleaning.sql`            | Type casting, handling missing values, filtering outliers (e.g., LOS > 365) |
| `02_operational_metrics.sql`      | Avg LOS, SLA performance                                                    |
| `03_financial_metrics.sql`        | Cost per visit, cost per day, charges vs. costs                             |
| `04_operational_flow_metrics.sql` | Admission types, patient disposition, severity distribution                 |
| `05_demographic_metrics.sql`      | Race/ethnicity, gender, age groups                                          |
| `06_readmission_features.sql`     | LOS by severity, cost by severity                                           |

> **Note:** The raw dataset is too large to host here. Download it from Kaggle: [Kaggle Dataset Link](https://www.kaggle.com/…)

---

## 📊 Dashboard Screenshots

**

---

## 💡 Key Insights

* Departments X and Y have higher average length of stay compared to others.
* Costs per visit vary significantly with severity and department.
* Certain demographic groups show higher readmission risk, suggesting targeted interventions.
* SLA compliance differs across departments, highlighting potential efficiency gaps.

---

## 🏅 Skills Demonstrated

* SQL for data cleaning, aggregation, and feature engineering
* Tableau for visual analytics and dashboard design
* Data storytelling: presenting insights clearly and effectively
* Workflow organization for reproducible and professional analyses

---

