SELECT


region,


COUNT(*) total_loans,


ROUND(
SUM(loan_amount),
2
)
loan_portfolio,


ROUND(
AVG(credit_score),
2
)
avg_credit_score


FROM loan_data


GROUP BY region


ORDER BY loan_portfolio DESC;