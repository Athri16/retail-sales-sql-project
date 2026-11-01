# Retail Sales Analysis with PostgreSQL

## Project goal
I used SQL to analyze retail transactions and answer questions about sales, categories, customers, and monthly trends.

## Tools
- PostgreSQL
- pgAdmin
- VS Code

## Data cleaning
The raw dataset had 2,000 rows. I found 13 rows with missing values and created a cleaned table with 1,987 rows. I kept the raw table unchanged.

## Questions explored
- Which category generated the most revenue?
- Who were the top five customers by spending?
- How did monthly revenue change?
- How did average transaction value vary by category?
- How did sales vary by time of day?

## Findings
- Highest-revenue category: "Electronics",311445.00
- Top-spending customer: customer ID = 3 and total = 38440.00
- Highest average order value: category = Beauty and amount = 469.38
- Monthly trend: Revenue rose sharply in September in both 2022 and 2023. The highest monthly revenue was 71,880 in December 2022.

## Files
- `retail_sales_analysis.sql` — SQL queries
- `results/` — exported query results
- `data/` — dataset