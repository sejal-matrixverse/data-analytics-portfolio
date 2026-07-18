-- Total rows
SELECT COUNT(*) AS total_rows
FROM retail_orders;

-- Preview data
SELECT *
FROM retail_orders
LIMIT 10;

-- Check for NULL Order IDs
SELECT COUNT(*)
FROM retail_orders
WHERE order_id IS NULL;

-- Check duplicate Order IDs
SELECT order_id, COUNT(*)
FROM retail_orders
GROUP BY order_id
HAVING COUNT(*) > 1;