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