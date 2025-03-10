USE mavenfuzzyfactory;

SELECT
	website_session_id,
    created_at,
    HOUR(created_at) AS hr,
    WEEKDAY(created_at) AS wkday, -- 0 = Mon, 1 = Tues, etc
	CASE
		WHEN WEEKDAY(created_at) = 0 THEN 'Monday'
        WHEN WEEKDAY(created_at) = 1 THEN 'Tuesday'
        ELSE 'other_day'
	END AS clean_weekday,
    QUARTER(created_at) AS qtr,
    MONTH(created_at) AS mo,
    DATE(created_at) AS date,
    WEEK(created_at) AS wk

FROM website_sessions

WHERE website_session_id BETWEEN 150000 AND 155000 -- arbitrary