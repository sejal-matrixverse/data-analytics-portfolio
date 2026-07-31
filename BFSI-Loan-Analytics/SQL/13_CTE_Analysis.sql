-- ============================================================
-- REGIONAL PORTFOLIO
-- ============================================================

WITH regional_summary AS(

SELECT

region,

COUNT(*) total_loans,

ROUND(SUM(loan_amount),2) portfolio

FROM loan_data

GROUP BY region

)

SELECT *

FROM regional_summary

ORDER BY portfolio DESC;


-- ============================================================
-- HIGH VALUE CUSTOMERS
-- ============================================================

WITH high_value AS(

SELECT *

FROM loan_data

WHERE loan_amount>=2000000

)

SELECT

customer_id,

loan_type,

loan_amount,

credit_score,

region

FROM high_value

ORDER BY loan_amount DESC;


-- ============================================================
-- HIGH RISK CUSTOMERS
-- ============================================================

WITH risk_customers AS(

SELECT

customer_id,

loan_amount,

credit_score,

default_status,

CASE

WHEN credit_score<650 THEN 'High Risk'

WHEN credit_score BETWEEN 650 AND 750 THEN 'Medium Risk'

ELSE 'Low Risk'

END risk_level

FROM loan_data

)

SELECT *

FROM risk_customers

ORDER BY credit_score;


-- ============================================================
-- BRANCH APPROVAL RATE
-- ============================================================

WITH branch_summary AS(

SELECT

branch,

COUNT(*) applications,

SUM(

CASE

WHEN loan_status='Approved'

THEN 1

ELSE 0

END

) approvals

FROM loan_data

GROUP BY branch

)

SELECT

branch,

applications,

approvals,

ROUND(

approvals*100.0/applications,

2

) approval_rate

FROM branch_summary

ORDER BY approval_rate DESC;