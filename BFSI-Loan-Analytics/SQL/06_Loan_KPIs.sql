-- ============================================================
-- EXECUTIVE LOAN KPIs
-- ============================================================


SELECT


COUNT(*) AS total_applications,


COUNT(
CASE
WHEN loan_status='Approved'
THEN 1
END
)
AS approved_loans,


COUNT(
CASE
WHEN loan_status='Rejected'
THEN 1
END
)
AS rejected_loans,


COUNT(
CASE
WHEN loan_status='Pending'
THEN 1
END
)
AS pending_loans,


ROUND(

COUNT(
CASE WHEN loan_status='Approved'
THEN 1 END
)
*100.0
/
COUNT(*),

2

)
AS approval_rate,


ROUND(
SUM(loan_amount),
2
)
AS total_loan_amount,


ROUND(
AVG(loan_amount),
2
)
AS average_loan_amount,


ROUND(
AVG(interest_rate),
2
)
AS average_interest_rate,


ROUND(
SUM(total_interest),
2
)
AS total_interest_revenue,


ROUND(
AVG(credit_score),
2
)
AS average_credit_score,


ROUND(
AVG(annual_income),
2
)
AS average_customer_income


FROM loan_data;