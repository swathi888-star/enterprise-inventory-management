CREATE OR REPLACE VIEW friction_analysis AS
SELECT 
    log.lead_id,
    -- Time elapsed from original entry to this status change
    DATEDIFF(log.changed_on, log.lead_date) AS total_stay_days,
    -- Binary for Correlation (1 if Lost, 0 if otherwise)
    CASE WHEN st.name IN ('Lost', 'Deferred') THEN 1 ELSE 0 END AS is_lost,
    -- Pulling source name through the leads table
    sl.name AS source_name
FROM lead_status_log log
JOIN leads l ON log.lead_id = l.lead_id
JOIN lead_source_lookup sl ON l.source_id = sl.source_id
JOIN lead_status_lookup st ON log.changed_to = st.status_id;