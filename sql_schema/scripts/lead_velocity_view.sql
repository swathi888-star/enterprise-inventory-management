Create view lead_velocity as
WITH monthly_leads AS (
    SELECT 
        DATE_FORMAT(date, '%Y-%m') AS month,
        COUNT(lead_id) AS lead_count
    FROM leads
    WHERE date >= '2025-04-01'   -- ✅ April is the start month
    GROUP BY DATE_FORMAT(date, '%Y-%m')
    ORDER BY month
)
SELECT 
    m1.month,
    m1.lead_count,
    m2.lead_count AS prev_lead_count,
    CASE 
        WHEN m2.lead_count IS NULL THEN NULL
        ELSE ROUND(((m1.lead_count - m2.lead_count) / m2.lead_count) * 100, 2)
    END AS lead_velocity_rate
FROM monthly_leads m1
LEFT JOIN monthly_leads m2 
    ON m2.month = DATE_FORMAT(
        DATE_SUB(CONCAT(m1.month,'-01'), INTERVAL 1 MONTH), '%Y-%m'
    )
ORDER BY m1.month;