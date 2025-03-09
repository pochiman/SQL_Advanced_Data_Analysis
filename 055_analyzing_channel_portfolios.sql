USE mavenfuzzyfactory;



SELECT
	YEARWEEK(created_at) AS yrwk,
    -- AS week_start_date
    COUNT(DISTINCT website_session_id) AS total_sessions,
    COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' THEN website_session_id ELSE NULL END) AS gsearch_sessions,
    COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' THEN website_session_id ELSE NULL END) AS bsearch_sessions

FROM website_sessions
WHERE created_at > '2012-08-22' -- specified in the request
	AND created_at < '2012-11-29' -- dictated by the time of the request
    AND utm_campaign = 'nonbrand' -- limiting to nonbrand paid search

GROUP BY YEARWEEK(created_at);