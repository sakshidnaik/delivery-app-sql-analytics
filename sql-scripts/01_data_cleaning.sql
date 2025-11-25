-- --------------------------------------------
-- 01_DATA_CLEANING.SQL
-- Swiggy Food Delivery – Data Cleaning
-- --------------------------------------------
SELECT * FROM swiggy_data;

-- ============================
-- Null Check
-- ============================
SELECT
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS null_state,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS null_city,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
    SUM(CASE WHEN `Restaurant Name` IS NULL THEN 1 ELSE 0 END) AS null_restaurant_name,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS null_location,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
    SUM(CASE WHEN `Dish Name` IS NULL THEN 1 ELSE 0 END) AS null_dish_name,
    SUM(CASE WHEN `Price (INR)` IS NULL THEN 1 ELSE 0 END) AS null_price,
    SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
    SUM(CASE WHEN `Rating Count` IS NULL THEN 1 ELSE 0 END) AS null_rating_count
FROM swiggy_data;

-- ============================
-- Rename Columns
-- ============================
ALTER TABLE swiggy_data CHANGE COLUMN State state VARCHAR(100);
ALTER TABLE swiggy_data CHANGE COLUMN City city VARCHAR(100);
ALTER TABLE swiggy_data CHANGE COLUMN `Restaurant Name` restaurant_name VARCHAR(255);
ALTER TABLE swiggy_data CHANGE COLUMN Location location VARCHAR(255);
ALTER TABLE swiggy_data CHANGE COLUMN Category category VARCHAR(100);
ALTER TABLE swiggy_data CHANGE COLUMN `Dish Name` dish_name VARCHAR(255);
ALTER TABLE swiggy_data CHANGE COLUMN `Price (INR)` price_inr DECIMAL(10,2);
ALTER TABLE swiggy_data CHANGE COLUMN Rating rating DECIMAL(3,1);
ALTER TABLE swiggy_data CHANGE COLUMN `Rating Count` rating_count INT;

-- ============================
-- Empty / Blank Strings
-- ============================
SELECT * 
FROM swiggy_data
WHERE state = '' OR city = '' OR restaurant_name = '' OR location = '' 
   OR category = '' OR dish_name = '';

-- ============================
-- Find Duplicates
-- ============================
SELECT
    state, city, order_date, restaurant_name, location, category, dish_name,
    price_inr, rating, rating_count, COUNT(*) AS dup_count
FROM swiggy_data
GROUP BY
    state, city, order_date, restaurant_name, location, category,
    dish_name, price_inr, rating, rating_count
HAVING COUNT(*) > 1;

-- ============================
-- Remove Duplicates
-- ============================
WITH cte AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY state, city, order_date, restaurant_name, location,
                         category, dish_name, price_inr, rating, rating_count
            ORDER BY (SELECT NULL)
        ) AS rn
    FROM swiggy_data
)
DELETE swiggy_data
FROM swiggy_data
JOIN cte 
    ON swiggy_data.state = cte.state
   AND swiggy_data.city = cte.city
   AND swiggy_data.order_date = cte.order_date
   AND swiggy_data.restaurant_name = cte.restaurant_name
   AND swiggy_data.location = cte.location
   AND swiggy_data.category = cte.category
   AND swiggy_data.dish_name = cte.dish_name
   AND swiggy_data.price_inr = cte.price_inr
   AND swiggy_data.rating = cte.rating
   AND swiggy_data.rating_count = cte.rating_count
WHERE cte.rn > 1;

SELECT COUNT(*) AS remaining_duplicate_count
FROM (
    SELECT *, COUNT(*) OVER (
        PARTITION BY state, city, order_date, restaurant_name, location,
                     category, dish_name, price_inr, rating, rating_count
    ) AS dup
    FROM swiggy_data
) x
WHERE dup > 1;
