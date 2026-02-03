# sql-data-warehouse-project
Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

----

## 🏗️ Data Warehouse Architecture Overview

<img width="992" height="561" alt="Data Architecture" src="https://github.com/user-attachments/assets/319f7e22-46e5-41d3-9c1e-a9fbe69a54b4" />
This project follows a Medallion Architecture (Bronze → Silver → Gold) to transform raw source data into analytics-ready datasets for reporting and advanced analysis.

### 🔹 Data Sources

The pipeline starts with operational systems:

CRM system — Customer and sales-related data

ERP system — Product, category, and location data

These systems provide raw structured data that is ingested into the data warehouse.

### 🥉 Bronze Layer — Raw Data Storage

The Bronze layer is the landing zone for raw data.

Purpose:

Store data exactly as received from source systems

Preserve original structure and values

Enable reprocessing if transformation logic changes

Characteristics:

Minimal or no transformation

Full data loads from CSV/source extracts

Acts as a historical backup of source data

### 🥈 Silver Layer — Cleaned & Standardized Data

The Silver layer transforms raw data into structured, quality-controlled datasets.

Purpose:

Clean and standardize data

Apply business rules

Remove duplicates and invalid records

Typical Transformations:

Standardizing gender and marital status values

Fixing date formats and invalid dates

Recalculating sales amounts when inconsistent

Deriving product categories and normalized keys

This layer represents trusted, consistent operational data.

### 🥇 Gold Layer — Business & Analytics Model

The Gold layer contains data modeled for analytics using a star schema.

Purpose:

Provide business-friendly, query-optimized datasets

Support reporting, dashboards, and analytical tools

Structure:

Dimension Tables (e.g., dim_customers, dim_products)
→ Descriptive attributes used for filtering and grouping

Fact Table (e.g., fact_sales)
→ Measurable business events like sales transactions

This layer is designed for fast queries and easy understanding by BI tools.

----

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

 ----

 ### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  

----

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🌟 About Me

Hi there! I'm **Jameel Hanouneh**. I’m a fresh graduated Biomedical Engineering student, sharping my SQL skills and this is my full data warehouse project.
and the credits go to **Baraa Khatib Salkini**, also known as **Data With Baraa**
