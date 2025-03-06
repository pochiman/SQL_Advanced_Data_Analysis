USE mavenfuzzyfactory;

SELECT
    YEAR(created_at),
    WEEK(created_at),
    MIN(DATE(created_at)) AS week_start,
    COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE website_session_id BETWEEN 100000 AND 115000 -- arbitrary
GROUP BY 1, 2;


SELECT
	order_id,
    primary_product_id,
    items_purchased,
    created_at
FROM orders
WHERE order_id BETWEEN 31000 AND 32000;


SELECT
	primary_product_id,
    COUNT(DISTINCT CASE WHEN items_purchased = 1 THEN order_id ELSE NULL END) AS orders_w_1_item,
    COUNT(DISTINCT CASE WHEN items_purchased = 2 THEN order_id ELSE NULL END) AS orders_w_2_items,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE order_id BETWEEN 31000 AND 32000
GROUP BY 1;


SELECT
	primary_product_id,
    order_id,
    items_purchased,
    COUNT(DISTINCT CASE WHEN items_purchased = 1 THEN order_id ELSE NULL END) AS count_single_item_orders,
    COUNT(DISTINCT CASE WHEN items_purchased = 2 THEN order_id ELSE NULL END) AS count_two_item_orders
    
FROM orders

WHERE order_id BETWEEN 31000 AND 32000 -- arbitrary
GROUP BY 1, 2, 3;