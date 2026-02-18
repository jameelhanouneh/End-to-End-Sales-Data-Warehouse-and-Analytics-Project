/*
=====================================================
Procedure: Load Data into Silver Layer
=====================================================
Script Purpose:
This stored procedure transforms and cleans raw data from the bronze
layer and loads it into the silver layer tables of the DataWarehouse.
The process includes data standardization, deduplication, validation,
data type corrections, and business rule applications to prepare
structured, analysis-ready data.

Key Transformations:
- Removes duplicate customer records using latest creation date
- Standardizes text fields (names, gender, marital status, country)
- Derives product category and recalculates product end dates
- Cleans and validates sales dates, quantities, prices, and totals
- Normalizes ERP customer, location, and product category data

Warning:
This procedure truncates all silver tables before loading. Running it
will permanently delete existing silver-layer data. Ensure the bronze
layer is fully loaded and validated before execution.
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @total_start_time DATETIME, @total_end_time DATETIME;
	BEGIN TRY
		
		SET @total_start_time = GETDATE();
		PRINT '=======================================================';
		PRINT 'Loading silver layer';
		PRINT '=======================================================';
		PRINT '-------------------------------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '-------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: silver.crm_cust_info';
		TRUNCATE TABLE silver.crm_cust_info;
		PRINT'>> Inserting DATA into table: silver.crm_cust_info';
		INSERT INTO silver.crm_cust_info(
			cst_id,
			cst_key,
			cst_firstname,
			cst_lastname,
			cst_marital_status,
			cst_gndr,
			cst_create_date)

		SELECT 
			cst_id,
			cst_key,
			TRIM(cst_firstname) AS cst_firstname,
			TRIM(cst_lastname) AS cst_lastname,
			CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
				 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
				 ELSE 'n/a'
			END cst_marital_status,
			CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
				 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
				 ELSE 'n/a'
			END cst_gndr,
			cst_create_date
		FROM(
			SELECT 
				*,
				ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC)as flag_last
			FROM bronze.crm_cust_info
		)t
		WHERE flag_last = 1
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		--=======================TABLE: silver.crm_prd_info=============================
		SET @start_time = GETDATE();
		PRINT'>> Truncating table: silver.crm_prd_info';
		TRUNCATE TABLE silver.crm_prd_info;
		PRINT'>> Inserting DATA into table: silver.crm_prd_info';
		INSERT INTO silver.crm_prd_info(
			prd_id,
			cat_id,
			prd_key,
			prd_nm,
			prd_cost,
			prd_line,
			prd_start_dt,
			prd_end_dt
		)	
			SELECT 
				prd_id,
				REPLACE(SUBSTRING(TRIM(prd_key),1,5),'-','_')cat_id,
				REPLACE(SUBSTRING(TRIM(prd_key),7,LEN(prd_key)),'-','_')prd_key,
				prd_nm,
				ISNULL(prd_cost,0)prd_cost,
				CASE WHEN UPPER(TRIM(prd_line)) ='M' THEN 'Mountain'
					 WHEN UPPER(TRIM(prd_line)) ='R' THEN 'Road'
					 WHEN UPPER(TRIM(prd_line)) ='S' THEN 'other Sales'
					 WHEN UPPER(TRIM(prd_line)) ='T' THEN 'Touring'
					 ELSE 'n/a'
				END prd_line,
				prd_start_dt,
				DATEADD(DAY,-1,LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_test
			FROM bronze.crm_prd_info
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
			PRINT '---------------------';

		--================================TABLE: silver.crm_sales_details===================================
		SET @start_time = GETDATE();
		PRINT'>> Truncating table: silver.crm_sales_details';
		TRUNCATE TABLE silver.crm_sales_details;
		PRINT'>> Inserting DATA into table: silver.crm_sales_details';

		INSERT INTO silver.crm_sales_details(
			sls_ord_num,
			sls_prd_key,
			sls_cust_id,
			sls_order_dt,
			sls_ship_dt,
			sls_due_dt,
			sls_sales,
			sls_quantity,
			sls_price
		)
		SELECT 
			sls_ord_num,
			REPLACE(sls_prd_key,'-','_') AS sls_prd_key,
			sls_cust_id,
			CASE WHEN sls_order_dt = 0 OR LEN(sls_order_dt) != 8 THEN NULL
				 ELSE CAST(CAST(sls_order_dt AS varchar)AS date) 
			END AS sls_order_dt,
			CASE WHEN sls_ship_dt = 0 OR LEN(sls_ship_dt) != 8 THEN NULL
				 ELSE CAST(CAST(sls_ship_dt AS varchar)AS date) 
			END AS sls_ship_dt,
			CASE WHEN sls_due_dt = 0 OR LEN(sls_due_dt) != 8 THEN NULL
				 ELSE CAST(CAST(sls_due_dt AS varchar)AS date) 
			END AS sls_due_dt,
			CASE WHEN sls_sales <= 0 OR sls_sales IS NULL OR sls_sales!= ABS(sls_price)*sls_quantity
				THEN sls_quantity * ABS(sls_price)
			 ELSE sls_sales
			END AS sls_sales,
			sls_quantity,
			CASE WHEN sls_price <= 0 OR sls_price IS NULL --OR sls_price!= ABS(sls_sales)/sls_quantity
				THEN ABS(sls_sales)/NULLIF(sls_quantity, 0)
			 ELSE  sls_price
		END AS sls_price
		FROM bronze.crm_sales_details
		SET @end_time = GETDATE()
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';



		PRINT '-------------------------------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '-------------------------------------------------------';
		--===============================TABLE: silver.erp_CUST_AZ12=======================================
		SET @start_time = GETDATE();
		PRINT'>> Truncating table: silver.erp_CUST_AZ12';
		TRUNCATE TABLE silver.erp_CUST_AZ12;
		PRINT'>> Inserting DATA into table: silver.erp_CUST_AZ12';

		INSERT INTO silver.erp_CUST_AZ12(CID, BDATE, GEN)
		SELECT 
		CASE WHEN CID LIKE '%NAS%' THEN SUBSTRING(CID, 4, LEN(CID))
		ELSE CID
		END CID,
		CASE WHEN BDATE > GETDATE() THEN NULL
			 ELSE BDATE
		END BDATE,
		CASE WHEN UPPER(TRIM(GEN)) IN ('M','MALE') THEN 'Male'
			 WHEN UPPER(TRIM(GEN)) IN ('F','FEMALE') THEN 'Female'
			 ELSE 'n/a'
		END GEN
		FROM bronze.erp_CUST_AZ12
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		--==============================TABLE: silver.erp_LOC_A101========================================
		SET @start_time = GETDATE();
		PRINT'>> Truncating table: silver.erp_LOC_A101';
		TRUNCATE TABLE silver.erp_LOC_A101;
		PRINT'>> Inserting DATA into table: silver.erp_LOC_A101';

		INSERT INTO silver.erp_LOC_A101(CID,CNTRY)
		SELECT 
		REPLACE(CID,'-','')CID,
		CASE WHEN UPPER(TRIM(CNTRY)) IN ('USA','US') THEN 'United states' 
			 WHEN UPPER(TRIM(CNTRY)) ='' OR CNTRY IS NULL THEN 'n/a'
			 WHEN UPPER(TRIM(CNTRY)) ='DE' THEN 'Germany'
			 ELSE TRIM(CNTRY)
		END AS CNTRY
		FROM bronze.erp_LOC_A101
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';
		--===============================TABLE:silver.erp_PX_CAT_G1V2=======================================
		SET @start_time = GETDATE();
		PRINT'>> Truncating table: silver.erp_PX_CAT_G1V2';
		TRUNCATE TABLE silver.erp_PX_CAT_G1V2;
		PRINT'>> Inserting DATA into table: silver.erp_PX_CAT_G1V2';

		INSERT INTO silver.erp_PX_CAT_G1V2(ID,CAT,SUBCAT,MAINTENANCE)
		SELECT 
		ID,
		TRIM(CAT),
		TRIM(SUBCAT),
		TRIM(MAINTENANCE)
		FROM bronze.erp_PX_CAT_G1V2
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		SET @total_end_time = GETDATE();
		PRINT'>>Loading Silver layer is completed';
		PRINT '>> Total Load Duration: '+CAST(DATEDIFF(SECOND,@total_start_time, @total_end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';
	END TRY

	BEGIN CATCH 
		PRINT'============================================='
		PRINT'ERROR occured during loading Silver layer';
		PRINT'Error Message'+ERROR_MESSAGE();
		PRINT'Error Number'+CAST(ERROR_NUMBER()AS NVARCHAR);
		PRINT'Error State'+CAST(ERROR_STATE()AS NVARCHAR);
		PRINT'=============================================';
	END CATCH
END
