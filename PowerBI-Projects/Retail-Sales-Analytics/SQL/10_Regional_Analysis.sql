--Sales By Region
SELECT

    region,

    ROUND(
        SUM(
        (list_price * quantity) -
        (list_price * quantity * discount_percent / 100)
        ),2
    ) AS sales

FROM retail_orders

GROUP BY region

ORDER BY sales DESC;

--TOP 10 States
SELECT

    state,

    ROUND(
        SUM(
        (list_price * quantity) -
        (list_price * quantity * discount_percent / 100)
        ),2
    ) AS sales

FROM retail_orders

GROUP BY state

ORDER BY sales DESC

LIMIT 10;

