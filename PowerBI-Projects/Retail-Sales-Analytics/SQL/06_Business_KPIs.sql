-- ============================================================
-- EXECUTIVE BUSINESS KPIs
-- ============================================================

SELECT
    COUNT(DISTINCT order_id) AS total_orders,

    SUM(quantity) AS total_quantity,

    ROUND(
        SUM(list_price * quantity),
        2
    ) AS gross_sales,

    ROUND(
        SUM(list_price * quantity * discount_percent / 100),
        2
    ) AS total_discount,

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
    ) AS total_profit

FROM retail_orders;

