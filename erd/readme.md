# Entity Relationship Diagram (ERD) — Swiggy SQL Analytics

This folder contains the **Entity Relationship Diagram (ERD)** used to design the star-schema data model for the Swiggy analytics project.

The ERD helps visualize how all tables connect — including dimensions like date, location, restaurant, category, and dish, along with the central fact table containing order-level metrics.

---

## ERD Overview
The diagram includes:

- **fact_swiggy_orders**  
- **dim_date**  
- **dim_location**  
- **dim_restaurant**  
- **dim_category**  
- **dim_dish**

Each table is linked through primary–foreign key relationships to support analytical queries.
