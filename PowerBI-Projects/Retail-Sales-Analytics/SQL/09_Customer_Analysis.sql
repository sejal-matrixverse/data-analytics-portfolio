--Customer Segment Sales
SELECT
    segment,
    ROUND(
        SUM((list_price * quantity) -
        (list_price * quantity * discount_percent / 100)),2
    ) AS total_sales,

    ROUND(
        SUM(
        ((list_price * quantity) -
        (list_price * quantity * discount_percent / 100))
        -
        (cost_price * quantity)
        ),2
    ) AS total_profit

FROM retail_orders

GROUP BY segment

ORDER BY total_sales DESC;

--Orders By SHIP MODE
SELECT
    ship_mode,
    COUNT(*) AS total_orders

FROM retail_orders

GROUP BY ship_mode

ORDER BY total_orders DESC;


