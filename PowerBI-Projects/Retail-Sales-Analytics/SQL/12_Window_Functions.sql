-- ============================================================
-- ADVANCED SQL WINDOW FUNCTION ANALYSIS
-- PROJECT: RETAIL SALES ANALYTICS
-- ============================================================
--
-- BUSINESS OBJECTIVES:
--
-- 1. Rank products by sales performance.
-- 2. Rank products within individual categories.
-- 3. Analyse monthly sales trends.
-- 4. Calculate cumulative running sales.
-- 5. Compare current sales with previous month.
-- 6. Calculate month-over-month sales growth.
-- 7. Measure category contribution to total sales.
-- 8. Identify top profitable products within categories.
--
-- SQL CONCEPTS USED:
--
-- RANK()
-- LAG()
-- SUM() OVER()
-- PARTITION BY
-- ORDER BY
-- CTEs
-- NULLIF()
-- Window Functions
--
-- ============================================================


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


-- ============================================================
-- PRODUCT RANKING WITHIN CATEGORY BY SALES
-- ============================================================

SELECT

    category,

    product_id,

    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales,

    RANK() OVER (
        PARTITION BY category
        ORDER BY
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ) DESC
    ) AS category_product_rank

FROM retail_orders

GROUP BY
    category,
    product_id

ORDER BY
    category,
    category_product_rank;

    -- ============================================================
-- MONTH-OVER-MONTH SALES ANALYSIS
-- ============================================================

WITH monthly_sales AS (

    SELECT

        DATE_TRUNC('month', order_date)::date AS sales_month,

        ROUND(
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ),
            2
        ) AS monthly_sales

    FROM retail_orders

    GROUP BY
        DATE_TRUNC('month', order_date)

)

SELECT

    sales_month,

    monthly_sales,

    LAG(monthly_sales) OVER (
        ORDER BY sales_month
    ) AS previous_month_sales,

    ROUND(
        monthly_sales -
        LAG(monthly_sales) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS sales_change

FROM monthly_sales

ORDER BY sales_month;

-- ============================================================
-- MONTH-OVER-MONTH SALES GROWTH %
-- ============================================================

WITH monthly_sales AS (

    SELECT

        DATE_TRUNC('month', order_date)::date AS sales_month,

        ROUND(
            SUM(
                (list_price * quantity) -
                (list_price * quantity * discount_percent / 100)
            ),
            2
        ) AS monthly_sales

    FROM retail_orders

    GROUP BY
        DATE_TRUNC('month', order_date)

),

sales_comparison AS (

    SELECT

        sales_month,

        monthly_sales,

        LAG(monthly_sales) OVER (
            ORDER BY sales_month
        ) AS previous_month_sales

    FROM monthly_sales

)

SELECT

    sales_month,

    monthly_sales,

    previous_month_sales,

    ROUND(
        (
            (monthly_sales - previous_month_sales)
            / NULLIF(previous_month_sales, 0)
        ) * 100,
        2
    ) AS mom_growth_percent

FROM sales_comparison

ORDER BY sales_month;


-- ============================================================
-- TOP 3 MOST PROFITABLE PRODUCTS WITHIN EACH CATEGORY
-- ============================================================

WITH product_profit AS (

    SELECT

        category,

        sub_category,

        product_id,

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

        category,
        sub_category,
        product_id

),

ranked_products AS (

    SELECT

        category,

        sub_category,

        product_id,

        total_profit,

        RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
        ) AS profit_rank

    FROM product_profit

)

SELECT

    category,

    sub_category,

    product_id,

    total_profit,

    profit_rank

FROM ranked_products

WHERE profit_rank <= 3

ORDER BY

    category,

    profit_rank;