# Business Requirements Document (BRD) — Swiggy Sales Analysis

---

## **1. Overview**
The purpose of this project is to analyze delivery platform data (Swiggy-style) to improve business performance across **customers**, **restaurants**, **delivery partners**, and **operations**.  
The analysis supports decisions around demand patterns, delivery efficiency, cancellations, and revenue optimization.

---

## **2. Business Goals**
- Improve customer ordering experience and retention  
- Optimize restaurant onboarding and performance  
- Improve delivery partner SLA compliance  
- Reduce cancellations and refunds  
- Improve monthly revenue forecasting  
- Identify operational bottlenecks

---

## **3. Scope of Work**

### **Included**
- Data cleaning & standardization  
- Creating dimensions & fact tables  
- Defining KPIs  
- Running analytical SQL queries  
- Generating insights & recommendations  

### **Not Included**
- Real-time API integration  
- Customer-level predictive modeling  
- Pricing optimization algorithms  

---

## **4. Key Business Questions**

### **Customer**
- What are peak vs off-peak order hours?  
- What is the repeat customer rate?  
- How does AOV change across cities and cuisines?

### **Restaurant**
- Which restaurants generate the most revenue?  
- Which cuisines perform best?

### **Delivery Partner**
- What is the average delivery time?  
- Which partners consistently meet SLAs?  
- What percentage of orders are delayed?

### **Operational**
- What is the cancellation/refund rate?  
- What is the month-over-month revenue trend?  
- How do delivery times impact customer retention?

---

## **5. Data Requirements**
- Customer details  
- Restaurant metadata  
- Order timestamps  
- Delivery timestamps  
- Cancellation and refund data  
- Payment amounts  
- Delivery partner details  

---

## **6. KPIs**

### **Customer KPIs**
- Average Order Value (AOV)  
- Repeat Customer Rate  
- Monthly Active Customers  

### **Restaurant KPIs**
- Revenue Contribution %  
- Cuisine Performance Index  
- Order Acceptance Rate  

### **Delivery Partner KPIs**
- On-Time Delivery %  
- Average Delivery Minutes  
- SLA Compliance %  

### **Operational KPIs**
- Cancellation Rate  
- Refund Rate  
- Net Revenue  

---

## **7. Assumptions**
- Timestamps are standardized to IST  
- All cancellations + refunds reduce net revenue  
- No duplicate rows post-cleaning  
- Order statuses follow standardized naming  

---

## **8. Deliverables**
- Cleaned dataset  
- ERD diagram  
- Star schema  
- SQL DDL + DML + Transformation scripts  
- KPI query scripts  
