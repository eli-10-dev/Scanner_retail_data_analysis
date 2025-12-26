--CREATE TABLE sdc_customer_transaction_count_ot AS 
SELECT 
	"Customer_ID",
	"Date",
	COUNT("Transaction_ID") AS customer_transaction_count,
	EXTRACT(MONTH FROM "Date") AS "Month"
FROM scanner_data_clean
GROUP BY "Customer_ID", "Date"
ORDER BY customer_transaction_count DESC, "Customer_ID"
;
