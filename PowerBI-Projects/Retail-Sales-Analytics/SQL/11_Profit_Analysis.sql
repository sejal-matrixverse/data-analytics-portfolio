-- ============================================================
-- PROFIT ANALYSIS BY CATEGORY & SUB-CATEGORY
-- ============================================================

SELECT
    category,
    sub_category,

    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS net_sales,

    ROUND(
        SUM(cost_price * quantity),
        2
    ) AS total_cost,

    ROUND(
        SUM(
            (
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ) -
            (cost_price * quantity)
        ),
        2
    ) AS total_profit,

    ROUND(
        (
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                ) -
                (cost_price * quantity)
            )
            /
            NULLIF(
                SUM(
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                ),
                0
            )
        ) * 100,
        2
    ) AS profit_margin_percent

FROM retail_orders

GROUP BY
    category,
    sub_category

ORDER BY
    category,
    total_profit DESC;


--MOST PROFITABLE SUB-CATEGORY IN EACH CATEGORY
WITH profit_summary AS (

    SELECT
        category,
        sub_category,

        ROUND(
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                ) -
                (cost_price * quantity)
            ),
            2
        ) AS total_profit

    FROM retail_orders

    GROUP BY
        category,
        sub_category

),

ranked_profit AS (

    SELECT
        *,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
        ) AS profit_rank

    FROM profit_summary

)

SELECT
    category,
    sub_category,
    total_profit

FROM ranked_profit

WHERE profit_rank = 1;



--Profit By CATEGORY
SELECT

category,

ROUND(
SUM(
((list_price*quantity)-
(list_price*quantity*discount_percent/100))
-
(cost_price*quantity)
),2) profit

FROM retail_orders

GROUP BY category

ORDER BY profit DESC;

--Profit By SUB-CATEGORY
SELECT

sub_category,

ROUND(
SUM(
((list_price*quantity)-
(list_price*quantity*discount_percent/100))
-
(cost_price*quantity)
),2) profit

FROM retail_orders

GROUP BY sub_category

ORDER BY profit DESC;