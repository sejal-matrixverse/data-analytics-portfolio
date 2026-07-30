# Import Data

## Overview

This document describes the process used to import the loan portfolio dataset into the PostgreSQL database.

## Source File

**File Name:** `loan_data.csv`

## Database

**Database Name:** `bfsi_loan_db`

## Table

**Table Name:** `loan_data`

## Import Method

The dataset was imported using PostgreSQL's built-in **Import/Export Data** feature.

### Import Steps

1. Created the `loan_data` table in PostgreSQL.
2. Right-clicked the `loan_data` table.
3. Selected **Import/Export Data**.
4. Chose the `loan_data.csv` file.
5. Selected **CSV** as the file format.
6. Enabled the **Header** option.
7. Used **Comma (,)** as the delimiter.
8. Started the import process.
9. Verified that all records were successfully imported.

## Records Imported

**Total Records:** 2,000

## Validation

The import was validated using SQL queries to verify:

- Total record count
- NULL values
- Loan status distribution
- Loan type distribution
- Regional distribution

## Outcome

The dataset was successfully imported into PostgreSQL and is ready for SQL analysis and Power BI reporting.