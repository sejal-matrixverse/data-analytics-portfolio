CREATE TABLE retail_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_id VARCHAR(50),
    cost_price NUMERIC(10,2),
    list_price NUMERIC(10,2),
    quantity INT,
    discount_percent NUMERIC(5,2)
);

SELECT *
FROM retail_orders;