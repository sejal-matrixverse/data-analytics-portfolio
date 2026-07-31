-----Default Risk by Credit Score-----
SELECT


CASE

WHEN credit_score <650
THEN 'High Risk'


WHEN credit_score BETWEEN 650 AND 750
THEN 'Medium Risk'


ELSE 'Low Risk'


END risk_category,


COUNT(*) total_customers,


SUM(
CASE
WHEN default_status='Yes'
THEN 1
ELSE 0
END
)
defaults


FROM loan_data


GROUP BY risk_category;