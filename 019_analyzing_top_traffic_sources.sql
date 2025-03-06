USE mavenfuzzyfactory;

SELECT
	utm_content,
    COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE website_session_id BETWEEN 1000 AND 2000 -- arbitrary
GROUP BY
	utm_content
-- ORDER BY COUNT(DISTINCT website_session_id) DESC;
ORDER BY sessions DESC;


SELECT
	utm_content,
    COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE website_session_id BETWEEN 1000 AND 2000 -- arbitrary
GROUP BY 1
ORDER BY 2 DESC;


SELECT
	website_sessions.utm_content,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS session_to_order_conv_rt
FROM website_sessions
	LEFT JOIN orders
		ON orders.website_session_id = website_sessions.website_session_id

WHERE website_sessions.website_session_id BETWEEN 1000 AND 2000 -- arbitrary

GROUP BY 1
ORDER BY 2 DESC;