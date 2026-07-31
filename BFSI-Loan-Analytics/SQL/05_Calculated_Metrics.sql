-- ============================================================
-- CALCULATED METRICS
-- ============================================================

SELECT

    *,

    ROUND(
        loan_amount + total_interest,
        2
    ) AS total_repayment,

    ROUND(
        (loan_amount / annual_income),
        2
    ) AS loan_to_income_ratio,

    CASE
        WHEN loan_status = 'Approved' THEN 1
        ELSE 0
    END AS approval_flag,

    CASE
        WHEN default_status = 'Yes' THEN 1
        ELSE 0
    END AS default_flag

FROM loan_data;