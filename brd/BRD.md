# Business Requirements Document (BRD)  
## **Swiggy Sales Analysis — SQL Analytics Project**

---

## **1. Project Overview**

This project analyzes Swiggy sales data to derive insights across orders, locations, restaurants, categories, dishes, pricing, and ratings.  
The purpose is to build a clean analytical dataset, create dimensions and fact tables, and generate business insights using SQL.

---

## **2. Objectives**

- Clean and validate the raw dataset  
- Create a Star Schema (dimensions + fact table)  
- Load data into dimension and fact tables  
- Generate KPIs and business insights  
- Enable decision-making around category performance, pricing, ratings, and demand

---

## **3. Data Cleaning Requirements**

### **3.1 Null Checks**
- Identify columns containing NULL values  
- Count NULL values by column  

### **3.2 Empty String Checks**
- Detect columns containing values = `''` (empty strings)  

### **3.3 Duplicate Checks**
- Identify duplicate rows  
- Use `ROW_NUMBER()` window function  
- Retain the first record and remove the rest  

### **3.4 Final Output**
A fully cleaned dataset ready for dimensional modeling.

---

## **4. Dimensional Modeling (Star Schema)**

The data must be organized into a **Star Schema** with:

### **4.1 Dimension Tables**

#### **dim_date**  
- date  
- day  
- month  
- year  
- week  
- quarter  
- month_name  
- day_name  

#### **dim_location**  
- location_id (PK)  
- state  
- city  

#### **dim_restaurant**  
- restaurant_id (PK)  
- restaurant_name  

#### **dim_category**  
- category_id (PK)  
- category_name  

#### **dim_dish**  
- dish_id (PK)  
- dish_name  
- price  

---

### **4.2 Fact Table**

#### **fact_swiggy_orders**  
Contains keys and metrics:

- order_id  
- date_id (FK)  
- location_id (FK)  
- restaurant_id (FK)  
- category_id (FK)  
- dish_id (FK)  
- price  
- rating  

---

## **5. Data Loading Requirements**

### **5.1 Populate Dimension Tables**
- Load distinct values into each dimension  
- Generate surrogate primary keys  
- Ensure referential integrity when loading fact table

### **5.2 Populate Fact Table**
- Join cleaned dataset to dimensions  
- Replace text values with foreign keys  
- Store final relevant metrics

---

## **6. Business Insights Requirements**

### **6.1 Date-Based Insights**
- Month-wise order count  
- Quarter-wise performance  
- YoY comparison (if applicable)

### **6.2 Location-Based Insights**
- Top 10 cities with highest order volume  
- State-level distribution  
- High/low performing regions

### **6.3 Restaurant Insights**
- Top restaurants by number of dishes  
- Restaurant performance by ratings  
- Price distribution across restaurants

### **6.4 Category Insights**
- Top 10 categories by order volume  
- Category contribution %  
- High-performing vs. low-performing categories

### **6.5 Dish-Level Insights**
- Most expensive dishes  
- Top dishes by rating  
- Dish order volume  
- Price bucket analysis (Under 100 → 500+)  

### **6.6 Pricing & Revenue Insights**
- Total revenue  
- Average price  
- Price distribution analysis  
- Orders in each spend bucket  

### **6.7 Ratings Insights**
- Rating distribution (1–5)  
- Avg rating per category  
- Avg rating per restaurant  

---

## **7. KPIs**

- Total Orders  
- Total Revenue  
- Average Price  
- Average Rating  
- Category Performance  
- Top Restaurants / Top Dishes  
- Price Bucket Performance  
- Location-wise Order Count  
- Rating Distribution

---

## **8. Final Deliverables**

- Cleaned dataset  
- Star Schema ERD (Entity Relationship Diagram)  
- SQL scripts:  
  - Data Cleaning  
  - Schema Creation  
  - Dimension Loading  
  - Fact Loading  
  - Business Insights  
- KPI dashboard base tables  
- README documentation for GitHub
