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