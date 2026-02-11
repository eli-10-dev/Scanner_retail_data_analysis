- Null checks
	- ![image.png](/assets/image_1765874953108_0.png)
	- All columns required for analysis contain no nulls and blanks. No dropping of columns are needed.
- Typography checks
	- CREATE TABLE scanner_data_clean AS 
	- I created a copy with the trimmed and lowered SKU columns, throughout this analysis, I will be manipulating this table and will keep the raw and original table untouched.
- Duplicate checks
	- ![image.png](/assets/image_1765890015717_0.png)
	- There were no duplicate "Column1" or id values; therefore, no rows were dropped.
- Date data type change
	- ALTER TABLE scanner_data_clean
	  ALTER COLUMN "Date" TYPE DATE
	  USING do_date("Date", 'DD/MM/YYYY');
	- The data type of the Date column initially was varchar, I changed it to DATE to match the content.
