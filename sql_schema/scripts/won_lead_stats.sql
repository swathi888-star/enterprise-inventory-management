CREATE OR REPLACE VIEW won_lead_stats AS
SELECT 
    log.lead_id,
    -- Time from lead entry to the 'Won' status change
    DATEDIFF(log.changed_on, log.lead_date) AS days_to_win,
    -- Revenue from the orders table
    o.value AS revenue
FROM lead_status_log log
JOIN orders o ON log.lead_id = o.lead_id
JOIN lead_status_lookup st ON log.changed_to = st.status_id
WHERE st.name = 'Won';