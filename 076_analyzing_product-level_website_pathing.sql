USE mavenfuzzyfactory;

SELECT
	pageview_url
FROM website_pageviews
WHERE created_at BETWEEN '2013-02-01' AND '2013-03-01'; -- arbitrary


SELECT
	-- website_session_id,
    website_pageviews.pageview_url,
    COUNT(DISTINCT website_pageviews.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_pageviews.website_session_id) AS viewed_product_to_order_rate
FROM website_pageviews
	LEFT JOIN orders
		ON orders.website_session_id = website_pageviews.website_session_id
WHERE website_pageviews.created_at BETWEEN '2013-02-01' AND '2013-03-01' -- arbitrary
	AND website_pageviews.pageview_url IN ('/the-original-mr-fuzzy', '/the-forever-love-bear')
GROUP BY 1;