CREATE TABLE sdc_sku_ctgry_transaction_sum AS
WITH cte AS (
	SELECT 
		CASE WHEN ctgry_transaction_count > 3000 THEN "SKU_Category"
		ELSE 'Others'
	END AS "SKU_Category",
	ctgry_transaction_count
	FROM sdc_sku_ctgry_transaction_count
)
SELECT 
	"SKU_Category" AS sku_ctgry_s,
	sum(ctgry_transaction_count) AS transaction_sum
FROM cte
GROUP BY "SKU_Category"
ORDER BY transaction_sum DESC;
