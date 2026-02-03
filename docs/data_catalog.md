

## 🟡 `gold.dim_customers` — Customer Dimension

**Description:**
Contains master customer data enriched with demographic and geographic information. One record per customer.

| Column Name       | Data Type     | Description (with Example)                                        |
| ----------------- | ------------- | ----------------------------------------------------------------- |
| `customer_key`    | INT (Derived) | Surrogate key generated for the data warehouse (e.g., **101**)    |
| `customer_id`     | INT           | Original customer ID from CRM (e.g., **3456**)                    |
| `customer_number` | NVARCHAR(50)  | Business customer identifier (e.g., **CUST_AZ_1102**)             |
| `first_name`      | NVARCHAR(50)  | Customer first name (e.g., **John**)                              |
| `last_name`       | NVARCHAR(50)  | Customer last name (e.g., **Smith**)                              |
| `country`         | NVARCHAR(50)  | Customer country from ERP location data (e.g., **United States**) |
| `marital_status`  | NVARCHAR(50)  | Standardized marital status (e.g., **Single**)                    |
| `gender`          | NVARCHAR(50)  | Gender resolved from CRM or ERP (e.g., **Male**)                  |
| `birthdate`       | DATE          | Customer birth date (e.g., **1988-04-21**)                        |
| `create_date`     | DATE          | Date customer was created in CRM (e.g., **2021-09-15**)           |

---

## 🟢 `gold.dim_products` — Product Dimension

**Description:**
Contains product master data enriched with category and maintenance information. Only current (active) product records are included.

| Column Name      | Data Type     | Description (with Example)                                     |
| ---------------- | ------------- | -------------------------------------------------------------- |
| `product_key`    | INT (Derived) | Surrogate key generated for the data warehouse (e.g., **205**) |
| `product_id`     | INT           | Original product ID from CRM (e.g., **9001**)                  |
| `product_number` | NVARCHAR(50)  | Business product identifier (e.g., **BK-M82S-44**)             |
| `product_name`   | NVARCHAR(50)  | Product name (e.g., **Mountain Bike X200**)                    |
| `category_id`    | NVARCHAR(50)  | Category ID derived from product key (e.g., **BK_M82**)        |
| `category`       | NVARCHAR(50)  | Product category (e.g., **Bikes**)                             |
| `subcategory`    | NVARCHAR(50)  | Product subcategory (e.g., **Mountain Bikes**)                 |
| `maintenance`    | NVARCHAR(50)  | Maintenance classification (e.g., **High Maintenance**)        |
| `cost`           | INT           | Product cost (e.g., **750**)                                   |
| `product_line`   | NVARCHAR(50)  | Product line (e.g., **Mountain**)                              |
| `start_date`     | DATE          | Product record start date (e.g., **2023-01-01**)               |

---

## 🔵 `gold.fact_sales` — Sales Fact Table

**Description:**
Transactional sales fact table containing measurable sales metrics linked to customer and product dimensions.

| Column Name     | Data Type   | Description (with Example)                                 |
| --------------- | ----------- | ---------------------------------------------------------- |
| `order_number`  | VARCHAR(50) | Business sales order number (e.g., **SO-2024-000145**)     |
| `product_key`   | INT         | Foreign key referencing product dimension (e.g., **205**)  |
| `customer_key`  | INT         | Foreign key referencing customer dimension (e.g., **101**) |
| `order_date`    | DATE        | Date the order was placed (e.g., **2024-06-12**)           |
| `shipping_date` | DATE        | Date the order was shipped (e.g., **2024-06-13**)          |
| `due_date`      | DATE        | Order due date (e.g., **2024-06-20**)                      |
| `sales_amount`  | INT         | Total sales amount (e.g., **1500**)                        |
| `quantity`      | INT         | Quantity of products sold (e.g., **2**)                    |
| `price`         | INT         | Price per unit (e.g., **750**)                             |
