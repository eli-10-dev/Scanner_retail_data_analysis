--CREATE TABLE sdc_sku_ctgry_transactions_over_time AS
WITH top_sku_category AS (
	SELECT 
		"SKU_Category",
		count("Transaction_ID") AS scsot_transaction_count
	FROM scanner_data_clean
	GROUP BY "SKU_Category"
	ORDER BY scsot_transaction_count DESC
)
SELECT 
	sdc."SKU_Category",
	"Date",
	EXTRACT(MONTH FROM sdc."Date") AS month,
	count("Transaction_ID") AS ctgry_transaction_count_ot
FROM scanner_data_clean sdc
INNER JOIN top_sku_category 
	ON top_sku_category."SKU_Category" = sdc."SKU_Category"
GROUP BY top_sku_category."SKU_Category",
		 top_sku_category.scsot_transaction_count,
		 sdc."SKU_Category",
		 "Date",
		 month
ORDER BY 
--	top_sku_category.transaction_count, 
	"SKU_Category",
	"Date",
	month;
