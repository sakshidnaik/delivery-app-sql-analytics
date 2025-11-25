-- --------------------------------------------
-- 03_DIMENSION_LOADING.SQL
-- Load all dimension tables
-- --------------------------------------------

-- Load dim_date
INSERT INTO dim_date (
    full_date, year_num, month_num, month_name, quarter_num, day_num, week_num
)
SELECT DISTINCT
    order_date,
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date),
    QUARTER(order_date),
    DAY(order_date),
    WEEK(order_date)
FROM swiggy_data
WHERE order_date IS NOT NULL;

-- Load dim_location
INSERT INTO dim_location (state, city, location)
SELECT DISTINCT
    state, city, location
FROM swiggy_data;

-- Load dim_restaurant
INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT
    restaurant_name
FROM swiggy_data;

-- Load dim_category
INSERT INTO dim_category (category)
SELECT DISTINCT
    category
FROM swiggy_data;

-- Load dim_dish
INSERT INTO dim_dish (dish_name)
SELECT DISTINCT
    dish_name
FROM swiggy_data;
