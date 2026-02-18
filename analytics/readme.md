# Analytics Layer

This module contains the **SQL-based exploratory data analysis and reporting layer** built on top of the sales data warehouse.

The objective of this layer is to transform structured warehouse data into meaningful business insights, performance metrics, and analytical reports that support decision-making.

This phase simulates the role of a **Data Analyst / BI Analyst** working with an existing data warehouse.

---

## Analytics Objectives

The analysis focuses on generating insights related to:

- Customer behavior and segmentation
- Product performance evaluation
- Revenue trends over time
- Business KPI reporting

The results demonstrate how the data warehouse can be leveraged for analytical and business intelligence purposes.

---

## Analytical Reports

### Customer Report (report_customers)

A customer-focused analytical view providing:

- Age group segmentation
- Customer segments (VIP, Regular, New)
- Total orders, sales, and quantity purchased
- Customer recency (months since last purchase)
- Average order value
- Average monthly spend
- Customer lifespan

---

### Product Report (report_products)

A product performance report including:

- Category and subcategory analysis
- Unique customers per product
- Revenue-based product segmentation

Product segments:

- High Performers
- Mid Range
- Low Performers

Additional metrics:

- Average order revenue
- Average monthly revenue
- Product recency
- Product lifespan

---

## SQL Techniques Demonstrated

- Aggregations (SUM, COUNT, AVG)
- Window Functions
- Date Functions
- Conditional Logic (CASE WHEN)
- Multi-table Joins
- Common Table Expressions (CTEs)
- Views for reusable reporting layers
- Analytical query design

---

## Folder Structure
analytics/
│
├── scripts/
│ ├── customer_report.sql
│ ├── product_report.sql
│ └── exploratory_queries.sql
│
└── README.md

---

## How to Run

1. Ensure the data warehouse layer has been built successfully
2. Connect to the SQL Server database
3. Execute the analytical SQL scripts inside the scripts folder
4. Query the generated views or result sets to explore insights

---

## Skills Demonstrated

- Business KPI Development
- Customer Segmentation
- Product Performance Analysis
- Time-Series Analysis
- Analytical SQL Query Design
- Reporting Layer Creation

---

## Technologies Used

- SQL Server
- T-SQL
- Data Analytics
- Business Intelligence Concepts

---

## Purpose of This Layer

This analytics layer demonstrates how structured warehouse data can be transformed into actionable insights that support:

- Business decision-making
- Performance monitoring
- Strategic planning
- Dashboard development

The outputs of this module will later be visualized in the BI dashboard layer.
