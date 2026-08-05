# SQL Analysis

## Overview

The SQL analysis was performed using PostgreSQL to transform raw loan application data into business-ready datasets for Power BI reporting.

---

## Objectives

- Clean and validate imported data
- Calculate loan KPIs
- Analyze loan approvals and defaults
- Evaluate regional and branch performance
- Study customer demographics
- Prepare optimized SQL views for Power BI

---

## SQL Concepts Used

### Data Validation

- NULL checks
- Duplicate detection
- Data quality verification

### Aggregate Functions

- SUM()
- COUNT()
- AVG()
- MIN()
- MAX()

### Business KPI Analysis

- Total Loan Amount
- Approval Rate
- Default Rate
- Total Interest
- Average Credit Score
- Average Loan Amount

### Window Functions

- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- Running Totals

### Common Table Expressions (CTEs)

Used for:

- Regional loan summaries
- Branch performance
- Customer segmentation

### SQL Views

Created reusable views for Power BI including:

- vw_loan_metrics

---

## Business Questions Answered

- Which loan type generates the highest portfolio?
- Which regions approve the most loans?
- Which customer segments are highest risk?
- What is the approval rate?
- Which branches perform best?
- Which customers have the highest loan amounts?

---

## Outcome

The SQL scripts transformed raw transactional data into analytics-ready datasets that powered the Power BI dashboards.