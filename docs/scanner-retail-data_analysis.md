- sku_category sales over time
	- Questions:
		- What are the most popular SKU categories that get purchased the most?
		- What are the purchase trends for these top SKU categories
	- Graphs
		- sku_category transaction_count distribution
			- Query
				- CREATE TABLE sdc_sku_ctgry_transaction_sum AS
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
			- Data
				- ![image.png](/assets/image_1766119032164_0.png)
				- ![image.png](/assets/image_1766492846262_0.png)
				- The pie graph shows the distribution of transaction counts of the different sku_categories. The biggest contributor beings n8u, with an 8.29% contribution of transactions. The succeeding categories garnering 3.8% and below. 63% within the 'Others' category contain a combined 177 categories that contribute below 3,000 transactions to the total of 131,706 transactions.
		- sku_category transaction count over time
			- Query
				- --CREATE TABLE sdc_sku_ctgry_transactions_over_time AS
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
			- Data
				- For both sku_category and customer transactions throughout the year, I added a new column for both tables that truncates the month of the date the transaction was made. The transactions per month is used to analyze the trends for both sku category and customer transactions.
				- Top 5 sku_categories with most transactions
					- ![image.png](/assets/image_1766492807569_0.png)
					- The top five SKU categories' transactions are mostly consistent throughout the year, though there are noticeable rises. These points are seen in March, September, October, and December.
				- 5 sku_categories with half the amount of transactions of the top 5
					- ![image.png](/assets/image_1766493532454_0.png)
					- The spikes in the amount of transactions occurred in April, May, September, and December.
				- 5 sku_categories with quarter the amount of transactions of the top 5
					- ![image.png](/assets/image_1766493647271_0.png){:height 367, :width 659}
					- The trends for these five categories don't match as much as the previous two sets shown. The few noticeable matches between categories are February, September, October, December.
				- Bottom 5 sku_categories with transactions equal to or greater than 10
					- ![image.png](/assets/image_1766507003038_0.png){:height 382, :width 659}
					- For the bottom five categories, there are major spikes in transactions for individual categories. The sales of these categories are distributed and don't match too much. The few relevant months for these five are April, May, and July. Though it is also good to note that October to December have spikes in transactions, however, it is only seen on one category in this group.
		- Transactions across category popularity are concentrated on specific periods of the year. These time periods are April, September, October, December.
- customer purchases
	- Questions
		- What are the transaction trends of the top 5 customers and another set of 5 customers with half the transactions?
	- Graphs
		- Query
			- --CREATE TABLE sdc_customer_transaction_count_ot AS 
				SELECT 
					"Customer_ID",
					"Date",
					COUNT("Transaction_ID") AS customer_transaction_count,
					EXTRACT(MONTH FROM "Date") AS "Month"
				FROM scanner_data_clean
				GROUP BY "Customer_ID", "Date"
				ORDER BY customer_transaction_count DESC, "Customer_ID";
		- Data
			- Top 5 customers and their transactions
				- ![image.png](/assets/image_1766505011625_0.png)
			- 5 customers with half the amount of transactions
				- ![image.png](/assets/image_1766505173198_0.png)
			- 5 customers quarter the amount of transactions
				- ![image.png](/assets/image_1766505243957_0.png)
		- Customer transaction counts also are concentrated on multiple time periods throughout the year, regardless of their degree of activity. These months are April, June, October, and December.
- Transaction trends for categories and customers
	- Between the transactions for sku categories and customers, there have been overlapping time periods where they both have high amount of transactions. This suggests that transactions are driven by seasonal factors.
	- This analysis evaluated transaction patterns across product categories and customer activity. However, because the dataset covers only a single year, the observed patterns reflect within-year behavior specific to 2016. Additional years of data would be required to validate these findings and support broader annual transaction analysis or predictive modeling.
