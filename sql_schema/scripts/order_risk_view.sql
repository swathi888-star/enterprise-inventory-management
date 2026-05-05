CREATE VIEW order_delay_reason_metrics AS
SELECT 
    r.name,
    AVG(DATEDIFF(o.order_out_date, o.order_in_date)) AS avg_delay,
    MAX(DATEDIFF(o.order_out_date, o.order_in_date)) AS max_delay,
    VARIANCE(DATEDIFF(o.order_out_date, o.order_in_date)) AS var_delay,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN DATEDIFF(o.order_out_date, o.order_in_date) > 15 THEN 1 ELSE 0 END) AS delayed_orders,
    ROUND(
        (SUM(CASE WHEN DATEDIFF(o.order_out_date, o.order_in_date) > 15 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS pct_delayed_orders,
    RANK() OVER (
        ORDER BY 
            ROUND(
                (SUM(CASE WHEN DATEDIFF(o.order_out_date, o.order_in_date) > 15 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
                2
            ) DESC
    ) AS rank_by_pct_delayed,
    RANK() OVER (
        ORDER BY AVG(DATEDIFF(o.order_out_date, o.order_in_date)) DESC
    ) AS rank_by_avg_delay
FROM orders o
JOIN reason_lookup r 
    ON o.reason_id = r.reason_id
GROUP BY r.name;