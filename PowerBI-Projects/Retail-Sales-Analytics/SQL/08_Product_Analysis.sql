--TOP 10 Products
SELECT
    product_id,
    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales
FROM retail_orders
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;

--TOP 10 Sub-Categories

SELECT
    sub_category,
    ROUND(
        SUM(
            (list_price * quantity) -
            (list_price * quantity * discount_percent / 100)
        ),
        2
    ) AS sales
FROM retail_orders
GROUP BY sub_category
ORDER BY sales DESC
LIMIT 10;