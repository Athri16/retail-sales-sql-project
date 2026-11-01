-- Retail Sales Analysis
-- Database: PostgreSQL
-- Raw rows: 2,000
-- Clean rows: 1,987
-- 1. Revenue by category
SELECT category, SUM(total_sale) AS revenue
FROM retailsales_clean
GROUP BY category
ORDER BY revenue DESC;

-- 2. Revenue by year and month
SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale) AS revenue
FROM retailsales_clean
GROUP BY year, month
ORDER BY year, revenue DESC;

-- 3. Top 5 customers by spending
SELECT
    customer_id,
    SUM(total_sale) AS total_spent,
    COUNT(*) AS transaction_count
FROM retailsales_clean
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- 4. Average transaction value by category
SELECT
    category,
    ROUND(AVG(total_sale), 2) AS average_order_value,
    COUNT(*) AS transaction_count
FROM retailsales_clean
GROUP BY category
ORDER BY average_order_value DESC;

-- 5. Monthly revenue compared with the previous month
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', sale_date)::date AS month,
        SUM(total_sale) AS revenue
    FROM retailsales_clean
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
FROM monthly_sales
ORDER BY month;

-- 6. Revenue by category and time of day
SELECT
    category,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    SUM(total_sale) AS revenue,
    COUNT(*) AS transactions
FROM retailsales_clean
GROUP BY category, time_of_day
ORDER BY category, revenue DESC;