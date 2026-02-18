# Data Warehouse Layer

This module contains the implementation of the **Sales Data Warehouse**, developed using SQL Server and following modern data engineering best practices.

The purpose of this layer is to transform raw data from multiple source systems into a structured, analytics-ready model that supports reporting, business intelligence, and decision-making.

---

## Architecture Overview

The data warehouse follows a **Medallion Architecture (Bronze → Silver → Gold)** approach to progressively improve data quality and usability.

Source Systems → Bronze → Silver → Gold

---

## Data Sources

The warehouse integrates data from two operational systems:

- **CRM System** — customer information and sales transactions  
- **ERP System** — product details, categories, and location data  

The datasets are provided as CSV files and loaded into SQL Server.

---

## Bronze Layer — Raw Data

The Bronze layer is the landing zone for raw data.

**Purpose**

- Store data exactly as received from source systems  
- Preserve original structure and values  
- Enable reprocessing if transformation logic changes  

**Characteristics**

- Minimal transformations  
- Full data loads from source files  
- Historical backup of raw data  

---

## Silver Layer — Cleaned & Standardized Data

The Silver layer transforms raw data into clean and consistent datasets.

**Key Transformations**

- Standardizing categorical values (e.g., gender, marital status)  
- Fixing invalid or inconsistent dates  
- Removing duplicates  
- Resolving incorrect sales calculations  
- Normalizing keys across systems  

This layer represents trusted operational data ready for modeling.

---

## Gold Layer — Analytical Data Model

The Gold layer contains data modeled for analytics using a **star schema**.

**Structure**

- **Dimension Tables** — descriptive attributes such as customers, products, and dates  
- **Fact Table** — measurable business events such as sales transactions  

This design improves query performance and supports analytical tools and reporting systems.

---

## ETL Process

The ETL workflow includes:

1. **Extract** — Load raw data from CSV files  
2. **Transform** — Apply data cleaning and business rules  
3. **Load** — Insert transformed data into warehouse tables  

The process ensures data consistency, accuracy, and integration across systems.

---

## Folder Structure

data-warehouse/
│
├── scripts/
│ ├── bronze/
│ ├── silver/
│ ├── gold/
│ └── init_database.sql
│
└── README.md


---

## How to Run

1. Start with init_database.sql  
2. Execute the table creation scripts  
3. Run ETL scripts for Bronze, Silver, and Gold layers in sequence  
4. Validate the data using verification queries  

---

## Technologies Used

- SQL Server  
- T-SQL  
- ETL Processes  
- Dimensional Modeling (Star Schema)  

---

## Purpose of This Layer

This data warehouse serves as the foundation for:

- Exploratory Data Analysis  
- Business Intelligence  
- Dashboard Development  
- Decision Support  

The analytics layer of the project builds directly on this warehouse.

