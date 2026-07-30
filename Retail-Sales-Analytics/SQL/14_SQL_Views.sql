-- ============================================================
-- CREATE VIEW: SALES METRICS
-- ============================================================

CREATE OR REPLACE VIEW vw_sales_metrics AS

SELECT

    order_id,
    order_date,
    ship_mode,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    category,
    sub_category,
    product_id,
    cost_price,
    list_price,
    quantity,
    discount_percent,

    ROUND((list_price * quantity), 2) AS gross_sales,

    ROUND((list_price * quantity * discount_percent / 100), 2) AS discount_amount,

    ROUND(
        (list_price * quantity) -
        (list_price * quantity * discount_percent / 100),
        2
    ) AS net_sales,

    ROUND((cost_price * quantity), 2) AS total_cost,

    ROUND(
        (
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ) -
        (cost_price * quantity),
        2
    ) AS profit

FROM retail_orders;

-- ============================================================
-- CREATE VIEW: MONTHLY SALES
-- ============================================================

CREATE OR REPLACE VIEW vw_monthly_sales AS

SELECT

    DATE_TRUNC('month', order_date)::date AS sales_month,

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
    ) AS total_profit,

    ROUND(
        (
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
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
    DATE_TRUNC('month', order_date)

ORDER BY
    sales_month;


-- ============================================================
-- CREATE VIEW: PRODUCT PERFORMANCE
-- ============================================================

CREATE OR REPLACE VIEW vw_product_performance AS

SELECT

    product_id,

    category,

    sub_category,

    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS net_sales,

    SUM(quantity) AS total_quantity,

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
        (
            SUM(
                (
                    (list_price * quantity) -
                    (list_price * quantity * discount_percent / 100)
                )
                -
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

    product_id,

    category,

    sub_category;


    SELECT *
FROM vw_sales_metrics
LIMIT 10;


