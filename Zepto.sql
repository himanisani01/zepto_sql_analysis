CREATE DATABASE Zepto;
USE Zepto;

#data_exploration

#count_rows
SELECT COUNT(*) FROM Zepto;

#show_data
SELECT * FROM Zepto
LIMIT 15;

#null_values
SELECT * FROM zepto
WHERE name IS NULL OR
mrp IS NULL OR
discountPercent IS NULL OR
availableQuantity IS NULL OR
discountedSellingPrice IS NULL OR
weightInGms IS NULL OR
outOfStock IS NULL OR
quantity IS NULL;

#categories
SELECT DISTINCT Category
FROM zepto
ORDER BY Category;

#rename_column
ALTER TABLE zepto
RENAME COLUMN ï»¿Category TO Category;

#product_inStock_vs_outOfStock
SELECT outOfStock, COUNT(*) FROM zepto
GROUP BY outOfStock;

#product_count
SELECT name, COUNT(*) FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

#data_cleaning

#products_with_price_zero
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto WHERE mrp = 0;

#conversion_from_paisa_to_rupees
UPDATE zepto
SET mrp = mrp / 100.0, discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

#business_questions

#1 Find the top 10 best-value products based on the highest discount percentage.
SELECT DISTINCT name, mrp, discountPercent FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

#2 What are the products with high MRP but out of stock?
SELECT DISTINCT name, mrp FROM zepto
WHERE outOfStock = TRUE
ORDER BY mrp DESC
LIMIT 10;

#3 Calculate estimated revenue for each category.
SELECT Category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue FROM zepto
GROUP BY Category
ORDER BY total_revenue DESC
LIMIT 10;

#4 Find all products where MRP is greater than Rs 500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC
LIMIT 10;

#5 Identify the top 5 categories offering the highest average discount percentage.
SELECT Category, AVG(discountPercent) AS avg_discount FROM zepto
GROUP BY Category
ORDER BY avg_discount DESC
LIMIT 5;

#6 Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, mrp, discountedSellingPrice,
discountedSellingPrice / weightInGms AS price_per_gram FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC
LIMIT 10;

#7 Group the products into weight categories: low, medium, bulk.
SELECT DISTINCT name, weightInGms,
CASE 
    WHEN weightInGms < 1000 THEN 'LOW'
    WHEN weightInGms < 5000 THEN 'MEDIUM'
    ELSE 'BULK'
END AS weight_category
FROM zepto;

#8 What is the total inventory weight per category?
SELECT Category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY Category
ORDER BY total_weight DESC;
