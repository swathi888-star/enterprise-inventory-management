CREATE OR REPLACE VIEW lead_conversion AS
WITH Monthly_Leads AS (
    SELECT 
        DATE_FORMAT(lead_date, '%Y-%m') AS month,
        COUNT(lead_id) AS total_leads
    FROM leads
    WHERE lead_date >= '2025-04-01'   -- ✅ April is baseline
    GROUP BY DATE_FORMAT(lead_date, '%Y-%m')
),
Monthly_Closed AS (
    SELECT 
        DATE_FORMAT(lsl.changed_on, '%Y-%m') AS month,
        SUM(CASE WHEN ls_to.name = 'WON' THEN 1 ELSE 0 END) AS won_count,
        SUM(CASE WHEN ls_to.name = 'LOST' THEN 1 ELSE 0 END) AS lost_count
    FROM lead_status_log lsl
    JOIN lead_status_lookup ls_to ON lsl.changed_to = ls_to.status_id
    GROUP BY DATE_FORMAT(lsl.changed_on, '%Y-%m')
)
SELECT 
    ml.month,
    ml.total_leads,
    mc.won_count,
    mc.lost_count,
    ROUND((mc.won_count / ml.total_leads) * 100, 2) AS win_rate,
    ROUND((mc.lost_count / ml.total_leads) * 100, 2) AS loss_rate
FROM Monthly_Leads ml
LEFT JOIN Monthly_Closed mc ON ml.month = mc.month
ORDER BY ml.month;