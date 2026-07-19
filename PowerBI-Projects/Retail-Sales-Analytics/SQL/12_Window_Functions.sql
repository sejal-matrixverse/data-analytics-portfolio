-- ===========================================================
--TOP PRODUCT BY SALES
-- ============================================================

SELECT

product_id,

ROUND(SUM(
(list_price*quantity)-
(list_price*quantity*discount_percent/100)
),2)sales,

RANK() OVER(
ORDER BY
SUM(
(list_price*quantity)-
(list_price*quantity*discount_percent/100)
) DESC
) product_rank

FROM retail_orders

GROUP BY product_id;

-- ============================================================
-- MONTHLY SALES WITH RUNNING TOTAL
-- ============================================================

SELECT
    DATE_TRUNC('month', order_date) AS month,

    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales,

    ROUND(
        SUM(
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            )
        ) OVER (
            ORDER BY DATE_TRUNC('month', order_date)
        ),
        2
    ) AS running_total

FROM retail_orders

GROUP BY DATE_TRUNC('month', order_date)

ORDER BY month;