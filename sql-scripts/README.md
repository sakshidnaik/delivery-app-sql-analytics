
# SQL Scripts — Swiggy Analytics Project

This folder contains all SQL scripts used to clean, model, and analyze the Swiggy food-delivery dataset.  
Scripts are ordered in the exact sequence needed to build the full star-schema data model and generate insights.

---

## Script Index

### **01_data_cleaning.sql**
Cleans the raw dataset:  
- Removes null/blank values  
- Fixes inconsistent formats  
- Identifies & handles duplicates  

---

### **02_star_schema_creation.sql**
Creates the full **star schema**, including:  
- Dimension tables  
- Fact table  
- Primary & foreign key relationships  

---

### **03_dimension_loading.sql**
Populates all dimension tables such as:  
- `dim_date`  
- `dim_location`  
- `dim_restaurant`  
- `dim_category`  
- `dim_dish`  

---

### **04_fact_table_loading.sql**
Builds and loads the main fact table:  
- `fact_swiggy_orders`  
Links all dimensions to create an analysis-ready data model.

---

### **05_business_insights.sql**
Contains all KPI and business insight queries:  
- Top cities, restaurants, cuisines  
- Pricing buckets  
- Rating patterns  
- State/month trends  

---

## ✅ Usage Order
Run the scripts in this order:

```
01 → 02 → 03 → 04 → 05
```


