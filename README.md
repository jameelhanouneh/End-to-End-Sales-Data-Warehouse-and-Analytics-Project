# End-to-End Sales Data Warehouse & Analytics Project

Welcome to the **End-to-End Sales Data Project** 🚀  

This project demonstrates a complete data workflow — from raw data ingestion to analytical insights — using SQL Server and advanced SQL techniques.

It showcases the full lifecycle of a modern data solution:

Data Sources → Data Warehouse → Analytics → BI Dashboard (Coming Soon)

The project is designed as a portfolio to highlight practical skills in **data engineering**, **data analytics**, and **business intelligence**.

---

# 🏗️ Project Architecture Overview
<img width="992" height="564" alt="Data Architecture" src="https://github.com/user-attachments/assets/5b11e132-5305-4e1c-9bad-246ec32297a6" />
The solution follows the **Medallion Architecture (Bronze → Silver → Gold)** approach to transform raw operational data into analytics-ready datasets.
Source Systems → Bronze → Silver → Gold → Analytics → Dashboard

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

# 📈 Dashboard (Coming Soon)

A Power BI dashboard will be added to visualize:

- Sales KPIs  
- Customer segmentation  
- Product performance  
- Revenue trends  
- Business insights  

---

# 🗂️ Repository Structure
project/
│
├── data-warehouse/
│ ├── scripts/
│ └── README.md
│
├── analytics/
│ ├── scripts/
│ └── README.md
│
├── datasets/
│
├── dashboards/ (Power BI — coming soon)
│
└── README.md

---

# 🚀 Skills Demonstrated

### Data Engineering

- ETL Pipeline Development  
- Medallion Architecture  
- Data Cleaning & Integration  
- Dimensional Modeling (Star Schema)  

### Data Analytics

- KPI Development  
- Customer & Product Segmentation  
- Time-Series Analysis  
- Business Reporting  

### Technical Skills

- SQL Server  
- T-SQL  
- Analytical SQL  
- Data Modeling  
- Business Intelligence Concepts  

---

# 🛠️ Tools Used

- SQL Server  
- T-SQL  
- Power BI (planned)  

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

