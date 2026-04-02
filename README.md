🛒 Zepto Product Analysis — SQL Project
📌 Overview
This project analyzes product data from Zepto, one of India's leading quick-commerce platforms.
The goal is to explore pricing, discounts, stock availability, and category trends using SQL —
simulating the kind of analysis a data analyst would perform for a retail or e-commerce business.

🗃️ Dataset

Source: Zepto product listings (scraped/publicly available)
Table: zepto
Size: ~3,000+ product records


🧹 Data Cleaning

Removed products with MRP = 0 (invalid/test listings)
Checked for NULL values across all columns
Converted price columns from paise to rupees (÷ 100)
Renamed malformed column header caused by a CSV encoding issue

 

📊 Business Questions Answered

1 Which products offer the highest discount percentage?
2 Which high-MRP products are currently out of stock?
3 What is the estimated revenue potential per category?
4 Which products have MRP > ₹500 but less than 10% discount?
5 Which categories offer the highest average discount?
6 Which products offer the best value per gram?
7 How do products distribute across weight categories (Low / Medium / Bulk)?
8 What is the total inventory weight per category?


💡 Key Insights

-Cooking Essentials had the highest estimated revenue potential at ₹3,37,131

-Fruits & Vegetables offered the highest average discount at 15.46% — making it the best category for deal-seekers

-0% of products were out of stock at the time of data collection, indicating strong inventory management

-Fruits & Vegetables also offered the best price-per-gram value at just ₹0.17/gram




🛠️ Tools Used


MySQL — data cleaning, exploration, and business queries



🚀 How to Run


Clone this repository
Import dataset/zepto_v1.csv into MySQL as table zepto
Run zepto.sql top to bottom — schema setup → cleaning → analysis



📁 File Structure
zepto-sql-analysis/
│
├── zepto.sql            # All queries: exploration, cleaning & analysis
├── README.md            # Project documentation
└── dataset/
    └── zepto_v1.csv     # Raw product dataset

👤 Author-Himani
Email-himanisaini2601@gmail.com
Linkedin-https://www.linkedin.com/in/himani-s-6326311b5
