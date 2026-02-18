/*
=====================================================
Procedure: Load Data into Bronze Layer
=====================================================
Script Purpose:
This stored procedure loads raw data into the bronze layer tables of the
DataWarehouse. It truncates existing data and bulk inserts fresh data
from CRM and ERP source CSV files. The procedure also logs load progress
and duration for each table and the overall process.

Parameters:
None.
  This stored procedure does not accept any parameters or return any values.
Usage Example:
  EXEC bronze.load_bronze;
Warning:
This procedure deletes all existing data in the bronze tables before
loading new data. Ensure source files are correct and available, as
running this will permanently remove previous bronze-layer data.
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @begin_time DATETIME, @ending_time DATETIME;
	BEGIN TRY
		SET @begin_time = GETDATE();
		PRINT '=======================================================';
		PRINT 'Loading bronze layer';
		PRINT '=======================================================';

		PRINT '-------------------------------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '-------------------------------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting data into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Inserting data into Table: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting data into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		PRINT '-------------------------------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '-------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		PRINT '>> Inserting data into Table: bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.CSV'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;
		PRINT '>> Inserting data into Table: bronze.erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

		PRINT '>> Inserting data into Table: bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\DELL\Desktop\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+CAST(DATEDIFF(SECOND,@start_time, @end_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';
		SET @ending_time = GETDATE();
		PRINT'>>Loading Bronze layer is completed';
		PRINT '>> Total Load Duration: '+CAST(DATEDIFF(SECOND,@begin_time, @ending_time)AS NVARCHAR)+ ' Second';
		PRINT '---------------------';

	END TRY
	BEGIN CATCH
		PRINT'============================================='
		PRINT'ERROR occured during loading bronze layer';
		PRINT'Error Message'+ERROR_MESSAGE();
		PRINT'Error Number'+CAST(ERROR_NUMBER()AS NVARCHAR);
		PRINT'Error State'+CAST(ERROR_STATE()AS NVARCHAR);
		PRINT'=============================================';
	END CATCH
END
