CREATE TABLE scanner_data_clean AS 
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
