USE mavenfuzzyfactory;

SELECT
	utm_content,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS session_to_order_conversion_rate -- aka "conversion rate"

FROM website_sessions
	LEFT JOIN orders
		ON orders.website_session_id = website_sessions.website_session_id

WHERE website_sessions.created_at BETWEEN '2014-01-01' AND '2014-02-01' -- arbitrary
GROUP BY 1
ORDER BY sessions DESC;