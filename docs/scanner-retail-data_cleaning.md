- Null checks
  collapsed:: true
	- SELECT
	    COUNT(*) FILTER (WHERE "Column1" IS NULL) AS col1_null,
	    COUNT(*) FILTER (WHERE "Date" IS NULL) AS date_null,
	    COUNT(*) FILTER (WHERE "Customer_ID" IS NULL) AS customerid_null,
	    COUNT(*) FILTER (WHERE "Transaction_ID" IS NULL) AS transactionid_null,
	    COUNT(*) FILTER (WHERE "SKU_Category" IS NULL OR TRIM("SKU") = '') AS skucategory_null,
	    COUNT(*) FILTER (WHERE "SKU" IS NULL OR TRIM("SKU") = '') AS sku_null,
	    COUNT(*) FILTER (WHERE "Quantity" IS NULL) AS quantity_null,
	    COUNT(*) FILTER (WHERE "Sales_Amount" IS NULL) AS sales_amount_null
	  FROM scanner_data;
	- ![image.png](/assets/image_1765874953108_0.png)
	- All columns required for analysis contain no nulls and blanks. No dropping of columns are needed.
- Typography checks
  collapsed:: true
	- CREATE TABLE scanner_data_clean AS 
	  SELECT
	  	"Column1",
	  	"Date",
	  	"Customer_ID",
	  	"Transaction_ID",
	  	TRIM(LOWER("SKU_Category")) AS "SKU_Category",
	  	TRIM(LOWER("SKU")) AS "SKU",
	  	"Quantity",
	  	"Sales_Amount"
	  FROM scanner_data;
	- I created a copy with the trimmed and lowered SKU columns, throughout this analysis, I will be manipulating this table and will keep the raw and original table untouched.
- Duplicate checks
  collapsed:: true
	- SELECT
	  	"Column1" AS id,
	  	count(*) AS id_frequency
	  FROM scanner_data_clean
	  GROUP BY id
	  HAVING COUNT(*) > 1
	  ORDER BY id DESC;
	- ![image.png](/assets/image_1765890015717_0.png)
	- There were no duplicate "Column1" or id values; therefore, no rows were dropped.
- Date data type change
  collapsed:: true
	- ALTER TABLE scanner_data_clean
	  ALTER COLUMN "Date" TYPE DATE
	  USING do_date("Date", 'DD/MM/YYYY');
	- The data type of the Date column initially was varchar, I changed it to DATE to match the content.
-
