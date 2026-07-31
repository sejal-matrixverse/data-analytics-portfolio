SELECT


loan_type,


COUNT(*) total_loans,


SUM(
CASE
WHEN default_status='Yes'
THEN 1
ELSE 0
END
)
defaults,


ROUND(

SUM(
CASE
WHEN default_status='Yes'
THEN 1
END
)
*100.0
/
COUNT(*),

2

)
default_rate


FROM loan_data


GROUP BY loan_type;