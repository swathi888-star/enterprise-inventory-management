CREATE OR REPLACE VIEW source_stability AS
SELECT 
    ls.name AS source_name,
    COUNT(o.order_id) AS total_orders,
    AVG(o.value) AS avg_revenue,
    STDDEV(o.value) AS std_dev_revenue,
    -- Coefficient of Variation Calculation
    (STDDEV(o.value) / AVG(o.value)) AS cv_index
FROM lead_source_lookup ls
JOIN leads l ON ls.source_id = l.source_id
JOIN orders o ON l.lead_id = o.lead_id
GROUP BY ls.name
HAVING total_orders > 1; -- CV requires at least 2 data points