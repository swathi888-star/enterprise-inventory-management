CREATE VIEW region_division_summary AS
SELECT 
    u.region,
    i.division,
    COUNT(l.lead_id) AS total_leads,
    SUM(CASE WHEN ls.name = 'Won' THEN 1 ELSE 0 END) AS won_leads,
    SUM(CASE WHEN ls.name = 'Lost' THEN 1 ELSE 0 END) AS lost_leads,
    SUM(CASE WHEN ls.name NOT IN ('Won','Lost') THEN 1 ELSE 0 END) AS open_leads,
    SUM(o.value) AS total_revenue,
    ROUND(
        (SUM(CASE WHEN ls.name = 'Won' THEN 1 ELSE 0 END) * 100.0) / COUNT(l.lead_id),
        2
    ) AS conversion_pct,
    RANK() OVER (
        ORDER BY 
            (SUM(CASE WHEN ls.name = 'Won' THEN 1 ELSE 0 END) * 100.0) / COUNT(l.lead_id) DESC
    ) AS rank_by_conversion,
    RANK() OVER (
        ORDER BY SUM(o.value) DESC
    ) AS rank_by_revenue
FROM leads l
JOIN users u 
    ON l.user_id = u.user_id
JOIN inventory i 
    ON l.inventory_id = i.inventory_id
JOIN lead_status_lookup ls 
    ON l.status_id = ls.status_id
LEFT JOIN orders o 
    ON l.lead_id = o.lead_id -- only populated when status = Won
GROUP BY u.region, i.division;
