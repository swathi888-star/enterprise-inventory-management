CREATE OR REPLACE VIEW lead_lifetracker AS
WITH Ordered_Logs AS (
    SELECT 
        lsl.lead_id,
        lsl.log_id,
        sl.name AS source_name,
        ls_to.name AS status_name,
        lsl.changed_on AS start_date,
        -- Get the 'changed_on' date of the NEXT log entry for this lead
        LEAD(lsl.changed_on) OVER (PARTITION BY lsl.lead_id ORDER BY lsl.log_id) AS next_change_date
    FROM lead_status_log lsl
    JOIN leads l ON lsl.lead_id = l.lead_id
    JOIN lead_source_lookup sl ON l.source_id = sl.source_id
    JOIN lead_status_lookup ls_to ON lsl.changed_to = ls_to.status_id
    -- ✅ Exclude closed statuses right here
    WHERE ls_to.name NOT IN ('WON','LOST')
)
SELECT 
    lead_id,
    source_name,
    status_name,
    start_date,
    DATEDIFF(COALESCE(next_change_date, '2026-06-01'), start_date) AS days_in_stage,
    DATE_FORMAT(start_date, '%Y-%m-01') AS activity_month
FROM Ordered_Logs;