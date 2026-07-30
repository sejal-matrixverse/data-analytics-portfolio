# SQL Analytics

This folder contains the complete SQL analysis layer for the **Retail Sales Analytics** project.

The SQL workflow demonstrates how raw retail transaction data can be transformed into reusable business metrics, analytical insights, and Power BI-ready datasets using PostgreSQL.

---

## Project Objective

The objective of the SQL analysis is to transform raw retail order data into meaningful business insights related to:

- Sales performance
- Revenue generation
- Profitability
- Product performance
- Customer segments
- Regional performance
- Business KPIs
- Time-based trends
- Advanced analytical patterns

The SQL analysis forms the foundation of the Power BI dashboards developed as part of this project.

---

# SQL Analytics Workflow

The overall analytical workflow is:

```text
Raw Retail Orders
        │
        ▼
Data Exploration & Validation
        │
        ▼
Calculated Business Metrics
        │
        ▼
Executive Business KPIs
        │
        ▼
Sales Analysis
        │
        ▼
Product & Customer Analysis
        │
        ▼
Regional & Profitability Analysis
        │
        ▼
Advanced SQL Analytics
        │
        ├── Window Functions
        ├── CTEs
        └── SQL Views
        │
        ▼
Power BI-Ready Data


## Power BI Data Preparation

The SQL layer prepares reusable datasets and analytical views for Power BI reporting.

### Available Analytical Views

| View | Purpose |
|---|---|
| `vw_sales_metrics` | Row-level sales, discount, cost and profit metrics |
| `vw_monthly_sales` | Monthly sales, profit and profit margin analysis |
| `vw_product_performance` | Product-level sales, quantity, profit and margin analysis |

These views provide a reusable analytical layer between the PostgreSQL database and Power BI.

### Data Flow

PostgreSQL
↓
retail_orders
↓
SQL Calculated Metrics
↓
Analytical Views
↓
Power BI Data Model
↓
DAX Measures
↓
Interactive Dashboards