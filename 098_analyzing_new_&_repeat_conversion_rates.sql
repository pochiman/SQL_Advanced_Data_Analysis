USE mavenfuzzyfactory;

SELECT
	is_repeat_session,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
	COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS conv_rate,
	SUM(price_usd)/COUNT(DISTINCT website_sessions.website_session_id) AS rev_per_session

FROM website_sessions
	LEFT JOIN orders
		ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2014-11-08' -- the date of the assignment
	AND website_sessions.created_at >= '2014-01-01' -- prescribed date range in assignment
GROUP BY 1;