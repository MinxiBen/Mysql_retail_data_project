SELECT * FROM store_data.sales202507;

/*
-- add new public_date column;
use store_data;
ALTER TABLE sales202507
ADD COLUMN public_date DATE NULL;

-- transform format and insert into new column;
UPDATE sales202507
SET public_date = STR_TO_DATE(NULLIF(publication_date, ''), '%Y/%m/%d');

-- drop old column ;
ALTER TABLE sales202507 DROP COLUMN publication_date;
*/;

use store_data;
/* According to SKU, see which type contributes more to revenue and sort them in order */;
With salesrank as(
 SELECT ISBN,
	name,
    store_sale_number*price AS revenue_per_item,
    RANK() OVER (ORDER BY (store_sale_number*price) DESC) AS rnk,
    SUM(store_sale_number*price) OVER() AS total_revenue
FROM sales202507
)
SELECT *,
ROUND(revenue_per_item/total_revenue*100,2) AS revenue_pct
FROM salesrank
ORDER BY revenue_pct DESC;


/*Observe the average pricing and average sales volume by category and compare whether there is any correlation */;
SELECT detail_category,
		ROUND(AVG(price),2) AS avg_price,
		ROUND(AVG(store_sale_number),2) AS avg_sales
FROM sales202507
GROUP BY detail_category
ORDER BY avg_sales DESC;







