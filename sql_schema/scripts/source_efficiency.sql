CREATE OR REPLACE VIEW source_efficiency AS
SELECT 
    ls.name AS source_name,
    COUNT(l.lead_id) AS total_leads,
    -- Calculation: Success Rate
    ROUND(SUM(CASE WHEN st.name = 'Won' THEN 1 ELSE 0 END) / COUNT(l.lead_id) * 100, 2) AS conversion_rate,
    -- Calculation: Total Revenue
    SUM(COALESCE(o.value, 0)) AS total_revenue,
    -- Calculation: Revenue per Lead (Efficiency Metric)
    ROUND(SUM(COALESCE(o.value, 0)) / COUNT(l.lead_id), 2) AS revenue_per_lead
FROM lead_source_lookup ls
LEFT JOIN leads l ON ls.source_id = l.source_id
LEFT JOIN lead_status_lookup st ON l.status_id = st.status_id
LEFT JOIN orders o ON l.lead_id = o.lead_id
GROUP BY ls.name
HAVING total_leads > 0;