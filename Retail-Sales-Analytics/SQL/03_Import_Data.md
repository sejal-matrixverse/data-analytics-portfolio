# Data Import Documentation

## Project

Retail Sales Analytics

---

## Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Name | Retail Orders |
| Source | Kaggle – Retail Orders Dataset by Ankit Bansal |
| File Format | CSV |
| Target Database | retail_sales_db |
| Target Table | retail_orders |

---

## Import Environment

- PostgreSQL
- VS Code
- SQL Extension
- CSV Import

---

## Import Steps

1. Created the `retail_sales_db` database.
2. Connected to the database using VS Code.
3. Created the `retail_orders` table.
4. Imported the Retail Orders CSV into PostgreSQL.
5. Verified successful import using SQL validation queries.

---

## Data Validation

Validation performed after import:

- Total row count
- Sample data preview
- NULL value check for primary key
- Duplicate Order ID check

---

## Import Status

✅ Successfully Imported

---

## Notes

- `Order Date` stored as DATE.
- `Cost Price` and `List Price` stored as NUMERIC.
- `Discount Percent` stored as NUMERIC.
- Dataset imported without structural changes.
- Business metrics such as Gross Sales, Net Sales, Discount Amount, and Profit will be calculated during SQL analysis.

---

## Next Phase

The next phase involves business analysis using SQL to calculate KPIs, identify trends, and generate insights for the Power BI dashboard.