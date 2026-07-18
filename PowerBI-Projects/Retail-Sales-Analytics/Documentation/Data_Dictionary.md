# 📖 Data Dictionary – Retail Sales Analytics

## Overview

This document describes the structure, meaning, and purpose of each field in the Retail Orders dataset used for the Retail Sales Analytics project.

---

## Dataset Information

| Attribute | Details |
|-----------|---------|
| Dataset Name | Retail Orders |
| Source | Kaggle – Retail Orders Dataset |
| Domain | Retail Sales |
| File Format | CSV |
| Purpose | Analyze sales performance, profitability, customer behavior, product performance, and regional trends |

---

# Column Definitions

| Column Name | Data Type | Description | Business Purpose |
|-------------|-----------|-------------|------------------|
| Order Id | Integer | Unique identifier for each order | Tracks and identifies every order |
| Order Date | Date | Date when the customer placed the order | Used for trend, monthly, quarterly, and yearly sales analysis |
| Ship Mode | Text | Shipping method selected for the order | Analyzes customer shipping preferences and logistics |
| Segment | Text | Customer segment (Consumer, Corporate, Home Office) | Measures sales contribution by customer type |
| Country | Text | Country where the order was placed | Geographic analysis |
| City | Text | Customer city | Regional sales analysis |
| State | Text | Customer state | State-wise performance analysis |
| Postal Code | Integer | Postal code of delivery location | Geographic identification |
| Region | Text | Business region (East, West, Central, South) | Regional sales and profitability comparison |
| Category | Text | Main product category | Category-level performance analysis |
| Sub Category | Text | Product sub-category | Detailed product category analysis |
| Product Id | Text | Unique identifier for each product | Product tracking and performance analysis |
| Cost Price | Decimal | Cost incurred by the company for one unit | Used to calculate profit |
| List Price | Decimal | Selling price before discount | Used to calculate gross sales |
| Quantity | Integer | Number of units sold | Calculates total units sold and revenue |
| Discount Percent | Decimal | Discount percentage applied to the order | Measures discount impact on profitability |

---

# Derived Business Metrics

The following metrics are not present in the raw dataset and will be calculated using SQL and Power BI.

| Metric | Formula | Purpose |
|--------|---------|---------|
| Gross Sales | List Price × Quantity | Total sales before discounts |
| Discount Amount | Gross Sales × (Discount Percent / 100) | Total discount offered |
| Net Sales | Gross Sales − Discount Amount | Revenue earned after discount |
| Total Cost | Cost Price × Quantity | Total cost incurred |
| Profit | Net Sales − Total Cost | Actual profit earned |
| Profit Margin (%) | (Profit ÷ Net Sales) × 100 | Measures business profitability |

---

# Dimension Columns

These columns describe business entities and are used for slicing and filtering reports.

- Order Date
- Ship Mode
- Segment
- Country
- City
- State
- Postal Code
- Region
- Category
- Sub Category
- Product Id

---

# Measure Columns

These columns contain numeric values used for calculations.

- Cost Price
- List Price
- Quantity
- Discount Percent

---

# Calculated Measures

These measures will be created during the project.

- Gross Sales
- Discount Amount
- Net Sales
- Total Cost
- Profit
- Profit Margin %
- Average Order Value
- Total Orders
- Total Quantity Sold

---

# Data Quality Notes

- Each row represents one product within an order.
- Order Id may appear multiple times if an order contains multiple products.
- Product Id uniquely identifies a product.
- Discount values are stored as percentages.
- Sales and Profit are calculated rather than stored in the dataset.
- Date fields should be converted to Date format before analysis.

---

# Business Use Cases

This dataset supports answering questions such as:

- What is the total revenue generated?
- Which products generate the highest profit?
- Which regions perform best?
- How do discounts impact profitability?
- Which customer segments contribute the most revenue?
- What are the monthly and yearly sales trends?
- Which shipping mode is used most frequently?

---

# Tools Used

- PostgreSQL
- SQL
- Power BI
- Excel
- GitHub

---

**Prepared By:** Sejal Singh  
**Project:** Retail Sales Analytics Portfolio Project  
**Version:** 1.0