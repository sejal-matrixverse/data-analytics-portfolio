SELECT *

FROM vw_sales_metrics;

-- ============================================================
-- POWER BI DATASET: MONTHLY PERFORMANCE
-- ============================================================

SELECT *
FROM vw_monthly_sales
ORDER BY sales_month;

-- ============================================================
-- POWER BI DATASET: PRODUCT PERFORMANCE
-- ============================================================

SELECT *
FROM vw_product_performance
ORDER BY net_sales DESC
LIMIT 10;

-- ============================================================
-- POWER BI DATASET: REGIONAL PERFORMANCE
-- ============================================================

SELECT

    region,

    ROUND(
        SUM(net_sales),
        2
    ) AS total_net_sales,

    ROUND(
        SUM(profit),
        2
    ) AS total_profit,

    ROUND(
        (
            SUM(profit)
            /
            NULLIF(SUM(net_sales), 0)
        ) * 100,
        2
    ) AS profit_margin_percent

FROM vw_sales_metrics

GROUP BY region

ORDER BY total_net_sales DESC;