- Dataset link:
  https://www.kaggle.com/datasets/marian447/retail-store-sales-transactions
- The dataset contains 131,706 rows and 8 columns.
- The dataset's columns are:
	- ID
	- Date
	- Customer_ID
	- Transaction_ID
	- SKU_Category
	- Quantity
	- Sales_Amount
- The data contains sales of products whose SKU_category and SKU_IDs are provided. The sales in the dataset are all from the year 2016. The first recorded transaction was on 01/02/2016 while the last transaction was on 12/31/2016.
- Dimension checks
	- Categories
		- Customer_ID
			- SELECT
			  	COUNT(DISTINCT "Customer_ID") AS customerid_count
			  FROM scanner_data;
			- ![image.png](/assets/image_1765872942622_0.png)
		- Transaction_ID
			- SELECT
			  	COUNT(DISTINCT "Transaction_ID") AS transactionid_count
			  FROM scanner_data;
			- ![image.png](/assets/image_1765872860278_0.png)
		- Total number of transactions
			- SELECT SUM(ctgry_transaction_count) AS total_transactions
			  FROM sdc_sku_ctgry_transaction_count;
			- ![image.png](/assets/image_1766376302637_0.png)
		- SKU_Category
			- SELECT
			  	COUNT(DISTINCT "SKU_Category") AS sku_category_count
			  FROM scanner_data;
			- ![image.png](/assets/image_1765872600703_0.png)
		- SKU
			- SELECT
			  	COUNT(DISTINCT "SKU") AS sku_count
			  FROM scanner_data;
			- ![image.png](/assets/image_1765872781933_0.png)
