USE mavenfuzzyfactory;


SELECT
	utm_source,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_sessions.website_session_id ELSE NULL END) AS mobile_sessions,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_sessions.website_session_id ELSE NULL END)/
		COUNT(DISTINCT website_sessions.website_session_id) AS pct_mobile
FROM website_sessions
WHERE created_at > '2012-08-22' -- specified in the request
	AND created_at < '2012-11-30' -- dictated by the time of the request
    AND utm_campaign = 'nonbrand' -- limiting to nonbrand paid search
GROUP BY
	utm_source;