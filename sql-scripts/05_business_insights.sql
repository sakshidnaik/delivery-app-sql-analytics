-- --------------------------------------------
-- 05_BUSINESS_INSIGHTS.SQL
-- All KPIs & Business Analysis Queries
-- --------------------------------------------

-- ============================
-- CORE KPIs
-- ============================

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM fact_swiggy_orders;

-- Total Revenue (INR)
SELECT 
    CONCAT(ROUND(SUM(price_inr)/1000000, 2), ' INR Million') AS total_revenue_mn_inr
FROM fact_swiggy_orders;

-- Total Revenue (USD)
SELECT 
    CONCAT(ROUND((SUM(price_inr) * 0.012), 2), ' USD') AS total_revenue_usd
FROM fact_swiggy_orders;

-- Average Dish Price
SELECT ROUND(AVG(price_inr),2) AS average_dish_price_inr 
FROM fact_swiggy_orders;

-- Average Rating
SELECT ROUND(AVG(rating),2) AS avg_rating
FROM fact_swiggy_orders;

-- ============================
-- TIME ANALYSIS
-- ============================

-- Monthly Trends
SELECT 
    d.year_num,
    d.month_num,
    d.month_name,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year_num, d.month_num, d.month_name
ORDER BY d.year_num, d.month_num;

-- Monthly Revenue
SELECT 
    d.year_num,
    d.month_num,
    d.month_name,
    SUM(price_inr) AS total_revenue
FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year_num, d.month_num, d.month_name
ORDER BY SUM(price_inr) DESC;

-- Quarterly Trends
SELECT 
    d.year_num,
    d.quarter_num,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year_num, d.quarter_num
ORDER BY d.year_num, d.quarter_num;

-- Yearly Trends
SELECT 
    d.year_num,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year_num
ORDER BY d.year_num;

-- Day of Week Orders
SELECT 
    DAYNAME(d.full_date) AS day_of_week,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY DAYNAME(d.full_date), DAYOFWEEK(d.full_date)
ORDER BY DAYOFWEEK(d.full_date);

-- ============================
-- LOCATION ANALYSIS
-- ============================

-- Top 10 Cities by Orders
SELECT 
    l.city, COUNT(*) AS total_orders
FROM fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY l.city
ORDER BY total_orders DESC
LIMIT 10;

-- City Revenue
SELECT 
    l.city, SUM(f.price_inr) AS total_revenue
FROM fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY l.city
ORDER BY total_revenue DESC
LIMIT 10;

-- State Revenue Contribution
SELECT 
    l.state, SUM(f.price_inr) AS total_revenue
FROM fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY l.state
ORDER BY total_revenue DESC;

-- ============================
-- FOOD & RESTAURANT ANALYSIS
-- ============================

-- Top Restaurants
SELECT 
    r.restaurant_name,
    SUM(f.price_inr) AS total_revenue
FROM fact_swiggy_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top Categories
SELECT 
    c.category,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders f
JOIN dim_category c ON f.category_id = c.category_id
GROUP BY c.category
ORDER BY total_orders DESC;

-- Most Ordered Dishes
SELECT 
    d.dish_name,
    COUNT(*) AS order_count
FROM fact_swiggy_orders f
JOIN dim_dish d ON f.dish_id = d.dish_id
GROUP BY d.dish_name
ORDER BY order_count DESC;

-- Category Performance
SELECT 
    c.category,
    COUNT(*) AS total_orders,
    ROUND(AVG(f.rating),2) AS avg_rating
FROM fact_swiggy_orders f
JOIN dim_category c ON f.category_id = c.category_id
GROUP BY c.category
ORDER BY total_orders DESC;

-- ============================
-- PRICE RANGE ANALYSIS
-- ============================

SELECT
    CASE
        WHEN price_inr < 100 THEN 'Under 100'
        WHEN price_inr BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN price_inr BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN price_inr BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END AS price_range,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders
GROUP BY price_range
ORDER BY total_orders DESC;

-- Ratings Distribution
SELECT 
    rating,
    COUNT(*) AS rating_count
FROM fact_swiggy_orders
GROUP BY rating
ORDER BY rating DESC;
