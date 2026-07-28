# Dataset

## Overview

This folder contains the raw retail sales dataset used for the Retail Sales Analytics project.

The dataset contains order-level retail transaction data covering customer information, geographic details, product categories, pricing, quantities, and discounts.

## File

### `orders.csv`

The CSV file contains the following fields:

- Order Id
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
- Cost Price
- List Price
- Quantity
- Discount Percent

## Usage

The dataset is imported into PostgreSQL and analysed using SQL. Calculated metrics and analytical views are then used to support the Power BI dashboard.

## Data Flow

```text
orders.csv
    ↓
PostgreSQL
    ↓
SQL Analysis
    ↓
SQL Views
    ↓
Power BI
    ↓
Interactive Dashboards