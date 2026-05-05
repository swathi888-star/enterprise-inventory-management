CREATE VIEW lead_source_summary AS
SELECT 
    ls.name,
    COUNT(*) AS total_leads,
    SUM(CASE WHEN st.name = 'Won' THEN 1 ELSE 0 END) AS won_count,
    SUM(CASE WHEN st.name = 'Lost' THEN 1 ELSE 0 END) AS lost_count,
    SUM(CASE WHEN st.name NOT IN ('Won','Lost') THEN 1 ELSE 0 END) AS open_count,
    ROUND(
        (SUM(CASE WHEN st.name = 'Won' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS conversion_pct,
    RANK() OVER (
        ORDER BY 
            (SUM(CASE WHEN st.name = 'Won' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) DESC
    ) AS rank_by_conversion
FROM leads l
JOIN lead_source_lookup ls 
    ON l.source_id = ls.source_id
JOIN lead_status_lookup st 
    ON l.status_id = st.status_id
GROUP BY ls.name;