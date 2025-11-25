-- --------------------------------------------
-- 04_FACT_TABLE_LOADING.SQL
-- Load Fact Table with FK Mappings
-- --------------------------------------------

INSERT INTO fact_swiggy_orders (
    date_id, 
    price_inr,
    rating,
    rating_count,
    location_id,
    restaurant_id,
    category_id,
    dish_id
)
SELECT 
    dd.date_id,
    s.price_inr,
    s.rating,
    s.rating_count,

    dl.location_id,
    dr.restaurant_id,
    dc.category_id,
    dsh.dish_id
FROM swiggy_data s
JOIN dim_date dd
    ON dd.full_date = s.order_date
JOIN dim_location dl
    ON dl.state = s.state
   AND dl.city = s.city
   AND dl.location = s.location
JOIN dim_restaurant dr
    ON dr.restaurant_name = s.restaurant_name
JOIN dim_category dc
    ON dc.category = s.category
JOIN dim_dish dsh
    ON dsh.dish_name = s.dish_name;
