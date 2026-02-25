# Business Intelligence & Data Warehousing Project

Welcome to the **End-to-End Sales Analytics Solution using SQL Server & Power BI** 🚀  

This project demonstrates a complete modern data workflow — from raw data ingestion to analytical insights and interactive dashboards — using SQL Server, T-SQL, and Power BI.

It showcases the full lifecycle of a data solution:

Data Sources → Data Warehouse → Analytics → BI Dashboards

The project is designed as a portfolio to highlight practical skills in data engineering, data analytics, and business intelligence.

---

# 🏗️ Project Architecture Overview
<img width="992" height="564" alt="Data Architecture" src="https://github.com/user-attachments/assets/5b11e132-5305-4e1c-9bad-246ec32297a6" />
The solution follows the **Medallion Architecture (Bronze → Silver → Gold)** approach to transform raw operational data into analytics-ready datasets.
Source Systems → Bronze → Silver → Gold → Analytics → Power BI Dashboards

---

# 🔹 Data Sources

The project integrates data from two simulated business systems:

- **CRM System** — customer information and sales transactions  
- **ERP System** — product details, categories, and location data  

The datasets are provided as CSV files and loaded into SQL Server for processing.

---

# 🏢 Data Warehouse (Data Engineering)

The data warehouse consolidates and transforms raw data into a structured analytical model.

### Architecture Layers

#### 🥉 Bronze Layer — Raw Data

- Stores data exactly as received from source systems  
- Minimal transformation  
- Preserves historical data for reprocessing  

#### 🥈 Silver Layer — Cleaned & Standardized Data

- Data cleaning and normalization  
- Removing duplicates and invalid records  
- Standardizing categorical values  
- Resolving inconsistent business data  

#### 🥇 Gold Layer — Business Model

- Star schema design for analytics  
- Fact table for sales transactions  
- Dimension tables for customers, products, and dates  
- Optimized for reporting and BI tools  

The warehouse serves as the foundation for analytics and reporting.

---

# 📊 Analytics & Business Insights (Data Analysis)

After building the warehouse, SQL-based analytics were developed to generate business insights and performance reports.

The analytics layer simulates the role of a **Data Analyst / BI Analyst**, transforming structured data into decision-support information.

---

## 📈 Analytical Reports

### 👥 Customer Report (report_customers)

A customer-focused analytical view providing:

- Age group segmentation  
- Customer segments (VIP, Regular, New)  
- Total orders, sales, and quantity purchased  
- Customer recency  
- Average order value  
- Average monthly spend  
- Customer lifespan  

---

### 📦 Product Report (report_products)

A product performance report including:

- Category and subcategory analysis  
- Unique customers per product  
- Revenue-based segmentation  

Product Segments:

- High Performers  
- Mid Range  
- Low Performers  

Additional metrics:

- Average order revenue  
- Average monthly revenue  
- Product recency  
- Product lifespan  

---

# 🧠 SQL Techniques Demonstrated

- Aggregations (SUM, COUNT, AVG)  
- Window Functions  
- Date Functions  
- Conditional Logic (CASE WHEN)  
- Multi-table Joins  
- Common Table Expressions (CTEs)  
- Views for reusable reporting  
- Analytical query optimization  

---

# 📈 Dashboard

📊 BI Dashboards (Power BI)

Interactive dashboards were developed using the Gold Layer of the Data Warehouse to provide business insights and support decision-making.

Two professional dashboards were created:

## 👥 Customer Dashboard
![Customer Dashboard](powerbi/images/Customers%20Dashboard.PNG)
- Customer distribution and segmentation
- Sales trends over time
- Geographic customer analysis
- Top customers by orders and revenue
- KPI summary (Customers, Sales, Orders)

### 📦 Product Performance Dashboard
![Product Dashboard](powerbi/images/Products%20Dashboard.PNG)
- Sales by category and product
- Orders distribution across categories
- Revenue trends over time
- Country-level performance analysis
- KPI summary (Sales, Orders, Quantity, Customers)

Key Insights Discovered:

- United States and Australia generated the highest revenue (~$9M each)
- United Kingdom ranked third (~$3M)
- 2013 was the best performing year (~$16M revenue)
- Bikes category contributed ~$28.3M out of $29M total sales, indicating strong dependency on a single product segment

Dashboard files are available in the `/powerbi` folder.
---

🗂️ Repository Structure

project/
│
├── data-warehouse/
│   ├── scripts/
│   └── README.md
│
├── analytics/
│   ├── scripts/
│   └── README.md
│
├── powerbi/
│   ├── Sales Dashboard.pbix
│   ├── Customers Dashboard.PNG
│   ├── Products Dashboard.PNG
│   └── README.md
│
├── datasets/
│
└── README.md

---

🚀 Skills Demonstrated

Data Engineering
- ETL Pipeline Development
- Medallion Architecture
- Data Cleaning & Integration
- Dimensional Modeling (Star Schema)

Data Analytics
- KPI Development
- Customer & Product Segmentation
- Time-Series Analysis
- Business Reporting

Business Intelligence
- Dashboard Development
- Data Visualization
- Interactive Reporting
- Insight Generation

Technical Skills
- SQL Server
- T-SQL
- Power BI
- Analytical SQL
- Data Modeling   

---

🛠️ Tools Used

- SQL Server
- T-SQL
- Power BI
- Git & GitHub

---

# 🙏 Credits

This project was inspired by learning content from  

**Baraa Khatib Salkini (Data With Baraa)**  

---

# 👤 About Me

Hi! I'm **Jameel Hanouneh**, a Biomedical Engineering graduate with a strong interest in data analytics and data engineering.

This project represents my hands-on experience in building data solutions, transforming raw data into meaningful business insights, and applying SQL in real-world analytical scenarios.

---

# 🛡️ License

This project is licensed under the MIT License.  
You are free to use, modify, and share this project with proper attribution.

