-- ============================================================
-- CALCULATED BUSINESS METRICS
-- ============================================================

SELECT
    order_id,
    order_date,
    category,
    sub_category,
    quantity,
    cost_price,
    list_price,
    discount_percent,

    (list_price * quantity) AS gross_sales,

    (list_price * quantity * discount_percent / 100) AS discount_amount,

    ((list_price * quantity) -
     (list_price * quantity * discount_percent / 100)) AS net_sales,

    (cost_price * quantity) AS total_cost,

    (
        ((list_price * quantity) -
        (list_price * quantity * discount_percent / 100))
        -
        (cost_price * quantity)
    ) AS profit

FROM retail_orders;