# Mysql_retail_data_project
This project demonstrates how SQL can be used to analyze bookstore sales data and generate actionable business insights.

## 1.import retail data
Using MySQL 8.0, we first import the dataset via the command line. (Directly importing files that contain Chinese characters can be challenging.)<br>
Step 1: Use one repository：<br>
use store_data;<br>
Step 2: Create new table：<br>
CREATE TABLE sales202507 ( ISBN VARCHAR(255),<br>
            name VARCHAR(255),<br>
            store_sale_number INTEGER,<br>
	    out_sale_number INTEGER,<br>
	    total_sale_number INTEGER,<br>
	    price float,<br>
	    publication_date VARCHAR(255),<br>
	    version VARCHAR(255),<br>
	    publisher VARCHAR(255),<br>
	    detail_category VARCHAR(255),<br>
            upper_category VARCHAR(255),<br>
	    stock INTEGER,<br>
            last_restock_time date,<br>
            PRIMARY KEY (ISBN));<br>
Step 3: Import table<br>
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_storedata202507.csv'<br>
INTO TABLE sales202507 <br>
FIELDS TERMINATED BY ','<br>
LINES TERMINATED BY '\n'<br>
IGNORE 1 ROWS;<br>

## 2. Data insight anaysis
Use SQL to gain data insights, such as SKU contribution analysis and sales and price correlation analysis. See store_mysql1.sql.
