
-- ============================================================
-- RANK LOAN TYPES BY TOTAL LOAN AMOUNT
-- ============================================================

SELECT
    loan_type,

    ROUND(SUM(loan_amount),2) AS total_loan_amount,

    RANK() OVER(
        ORDER BY SUM(loan_amount) DESC
    ) AS loan_type_rank

FROM loan_data

GROUP BY loan_type;


-- ============================================================
-- BRANCH RANKING
-- ============================================================

SELECT

    branch,

    ROUND(SUM(loan_amount),2) AS portfolio,

    DENSE_RANK() OVER(
        ORDER BY SUM(loan_amount) DESC
    ) AS branch_rank

FROM loan_data

GROUP BY branch;


-- ============================================================
-- RUNNING LOAN PORTFOLIO
-- ============================================================

SELECT

    DATE_TRUNC('month',application_date) AS month,

    ROUND(SUM(loan_amount),2) AS monthly_loans,

    ROUND(

        SUM(SUM(loan_amount))

        OVER(

            ORDER BY DATE_TRUNC('month',application_date)

        ),

        2

    ) AS running_portfolio

FROM loan_data

GROUP BY DATE_TRUNC('month',application_date)

ORDER BY month;



-- ============================================================
-- REGIONAL AVERAGE
-- ============================================================

SELECT

    region,

    branch,

    loan_amount,

    ROUND(

        AVG(loan_amount)

        OVER(PARTITION BY region),

        2

    ) regional_average

FROM loan_data;

-- ============================================================
-- TOP CUSTOMERS
-- ============================================================

SELECT *

FROM(

SELECT

customer_id,

loan_amount,

ROW_NUMBER()

OVER(

ORDER BY loan_amount DESC

) row_num

FROM loan_data

)t

WHERE row_num<=5;