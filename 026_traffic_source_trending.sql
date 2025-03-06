USE mavenfuzzyfactory;


SELECT
	-- YEAR(created_at) AS yr,
    -- WEEK(created_at) AS wk,
    MIN(DATE(created_at)) AS week_started_at,
    COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE created_at < '2012-05-12'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY
	YEAR(created_at),
    WEEK(created_at)