-- ============================================================
--COMMON TABLE EXPPRESSION
-- ============================================================


WITH regional_sales AS (

SELECT

region,

ROUND(SUM(
(list_price*quantity)-
(list_price*quantity*discount_percent/100)
),2) sales

FROM retail_orders

GROUP BY region

)

SELECT *

FROM regional_sales

ORDER BY sales DESC;

-- ============================================================
-- CATEGORY PROFITABILITY USING CTE
-- ============================================================

WITH category_profit AS (

    SELECT

        category,

        ROUND(
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
                (cost_price * quantity)
            ),
            2
        ) AS total_profit,

        ROUND(
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ),
            2
        ) AS net_sales

    FROM retail_orders

    GROUP BY category

)

SELECT

    category,

    net_sales,

    total_profit,

    ROUND(
        (total_profit / NULLIF(net_sales, 0)) * 100,
        2
    ) AS profit_margin_percent

FROM category_profit

ORDER BY total_profit DESC;


-- ============================================================
-- TOP 10 PRODUCTS BY PROFIT USING CTE
-- ============================================================

WITH product_profit AS (

    SELECT

        product_id,

        category,

        sub_category,

        ROUND(
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
                (cost_price * quantity)
            ),
            2
        ) AS total_profit

    FROM retail_orders

    GROUP BY

        product_id,
        category,
        sub_category

)

SELECT *

FROM product_profit

ORDER BY total_profit DESC

LIMIT 10;

-- ============================================================
-- BOTTOM 10 PRODUCTS BY PROFIT USING CTE
-- ============================================================

WITH product_profit AS (

    SELECT

        product_id,

        category,

        sub_category,

        ROUND(
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
                (cost_price * quantity)
            ),
            2
        ) AS total_profit

    FROM retail_orders

    GROUP BY

        product_id,
        category,
        sub_category

)

SELECT *

FROM product_profit

ORDER BY total_profit ASC

LIMIT 10;


-- ============================================================
-- REGION × CUSTOMER SEGMENT PERFORMANCE
-- ============================================================

WITH region_segment_sales AS (

    SELECT

        region,

        segment,

        ROUND(
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ),
            2
        ) AS net_sales,

        ROUND(
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
                (cost_price * quantity)
            ),
            2
        ) AS total_profit

    FROM retail_orders

    GROUP BY

        region,
        segment

)

SELECT

    region,

    segment,

    net_sales,

    total_profit,

    ROUND(
        (total_profit / NULLIF(net_sales, 0)) * 100,
        2
    ) AS profit_margin_percent

FROM region_segment_sales

ORDER BY

    region,

    total_profit DESC;



-- ============================================================
-- DISCOUNT IMPACT ON PROFITABILITY
-- ============================================================

WITH discount_analysis AS (

    SELECT

        category,

        ROUND(
            AVG(discount_percent),
            2
        ) AS average_discount_percent,

        ROUND(
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ),
            2
        ) AS net_sales,

        ROUND(
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
                (cost_price * quantity)
            ),
            2
        ) AS total_profit

    FROM retail_orders

    GROUP BY category

)

SELECT

    category,

    average_discount_percent,

    net_sales,

    total_profit,

    ROUND(
        (total_profit / NULLIF(net_sales, 0)) * 100,
        2
    ) AS profit_margin_percent

FROM discount_analysis

ORDER BY average_discount_percent DESC;


