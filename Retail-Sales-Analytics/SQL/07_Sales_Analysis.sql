--Sales by Region

SELECT
    region,
    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales
FROM retail_orders
GROUP BY region
ORDER BY sales DESC;

--Sales By category

SELECT
    category,
    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales
FROM retail_orders
GROUP BY category
ORDER BY sales DESC;

--Monthly Sales Trend

SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales
FROM retail_orders
GROUP BY month
ORDER BY month;

