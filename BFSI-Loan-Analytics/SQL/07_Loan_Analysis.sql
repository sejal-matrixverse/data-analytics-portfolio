-------Loan Type Performance-----

SELECT

loan_type,

COUNT(*) total_loans,

ROUND(
SUM(loan_amount),
2
) total_amount,


ROUND(
AVG(interest_rate),
2
) avg_interest_rate


FROM loan_data

GROUP BY loan_type

ORDER BY total_amount DESC;


------Monthly Loan Applications------

SELECT
DATE_TRUNC(
'month',
application_date
)
AS month,

COUNT(*) applications,

ROUND(
SUM(loan_amount),
2
)
loan_amount
FROM loan_data
GROUP BY month
ORDER BY month;


