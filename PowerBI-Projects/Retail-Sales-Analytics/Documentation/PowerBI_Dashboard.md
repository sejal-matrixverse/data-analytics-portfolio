# Power BI Dashboard

## Dashboard Name

Retail Sales Analytics — Executive Overview

## Objective

The dashboard provides an executive-level view of retail sales performance,
profitability, product performance, category performance, and regional trends.

## Key KPIs

- Net Sales
- Total Profit
- Profit Margin %
- Total Orders
- MoM Sales Growth %

## Dashboard Visuals

1. Monthly Net Sales Trend
2. Net Sales by Category
3. Net Sales by Region
4. Top 10 Products by Net Sales

## Interactive Filters

- Year
- Region
- Category
- Segment

## Data Model

The Power BI report uses:

- DateTable as the Date Dimension
- public vw_sales_metrics as the Sales Fact/View

The DateTable is connected to the sales data using:

DateTable[Date] → public vw_sales_metrics[order_date]

## Business Questions Answered

- How are sales trending over time?
- Which categories generate the highest sales?
- Which regions contribute the most revenue?
- Which products are the top performers?
- What is the overall profitability?
- How is sales performance changing month over month?

## Tools

- PostgreSQL
- SQL
- Power BI
- DAX
- GitHub