-- ============================================================
-- CREATE VIEW: LOAN METRICS
-- ============================================================

CREATE OR REPLACE VIEW vw_loan_metrics AS

SELECT

    loan_id,
    customer_id,
    application_date,
    loan_type,
    loan_amount,
    interest_rate,
    loan_term_months,
    annual_income,
    employment_type,
    credit_score,
    age,
    gender,
    marital_status,
    region,
    branch,
    loan_status,
    default_status,
    emi,
    total_interest,

    ROUND(
        loan_amount / annual_income,
        2
    ) AS loan_income_ratio,

    ROUND(
        loan_amount + total_interest,
        2
    ) AS total_repayment,

    CASE
        WHEN loan_status = 'Approved' THEN 1
        ELSE 0
    END AS approval_flag,

    CASE
        WHEN loan_status = 'Rejected' THEN 1
        ELSE 0
    END AS rejection_flag,

    CASE
        WHEN loan_status = 'Pending' THEN 1
        ELSE 0
    END AS pending_flag,

    CASE
        WHEN default_status = 'Yes' THEN 1
        ELSE 0
    END AS default_flag,

    CASE
        WHEN credit_score >= 750 THEN 'Excellent'
        WHEN credit_score >= 650 THEN 'Good'
        ELSE 'High Risk'
    END AS credit_category

FROM loan_data;


-- ============================================================
-- CREATE VIEW: REGIONAL SUMMARY
-- ============================================================

CREATE OR REPLACE VIEW vw_region_summary AS

SELECT

    region,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN loan_status='Approved' THEN 1
            ELSE 0
        END
    ) AS approved_loans,

    SUM(
        CASE
            WHEN default_status='Yes' THEN 1
            ELSE 0
        END
    ) AS defaults,

    ROUND(
        SUM(loan_amount),
        2
    ) AS total_loan_amount,

    ROUND(
        AVG(loan_amount),
        2
    ) AS average_loan_amount,

    ROUND(
        AVG(credit_score),
        2
    ) AS average_credit_score,

    ROUND(
        AVG(interest_rate),
        2
    ) AS average_interest_rate

FROM loan_data

GROUP BY region;


-- ============================================================
-- CREATE VIEW: LOAN PORTFOLIO SUMMARY
-- ============================================================

CREATE OR REPLACE VIEW vw_loan_portfolio AS

SELECT

    loan_type,

    COUNT(*) AS total_loans,

    ROUND(
        SUM(loan_amount),
        2
    ) AS total_loan_amount,

    ROUND(
        AVG(loan_amount),
        2
    ) AS average_loan_amount,

    ROUND(
        AVG(interest_rate),
        2
    ) AS average_interest_rate,

    ROUND(
        SUM(total_interest),
        2
    ) AS expected_interest,

    SUM(
        CASE
            WHEN loan_status='Approved' THEN 1
            ELSE 0
        END
    ) AS approved_loans,

    SUM(
        CASE
            WHEN default_status='Yes' THEN 1
            ELSE 0
        END
    ) AS defaults

FROM loan_data

GROUP BY loan_type;