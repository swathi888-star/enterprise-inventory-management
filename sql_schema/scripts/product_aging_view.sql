CREATE VIEW product_aging_summary AS
SELECT 
    i.product_sku,
    i.brand,
    i.purchase_date,
    i.warranty_expiry_date,
    i.quantity AS total_qty,
    COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0) AS sold_qty,
    (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) AS unsold_qty,
    DATEDIFF(CURDATE(), i.purchase_date) AS days_since_purchase,
    DATEDIFF(i.warranty_expiry_date, CURDATE()) AS days_until_expiry,
    ROUND(((i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) * 100.0) / i.quantity,2) AS aging_pct,
    (i.unit_purchase_cost / i.quantity) * 
        (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) AS remaining_stock_cost,
    CASE 
        WHEN (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) > 0 
             AND DATEDIFF(i.warranty_expiry_date, CURDATE()) < 90 
        THEN 'High Risk'
        ELSE 'Normal'
    END AS risk_flag
FROM inventory i
LEFT JOIN leads l 
    ON i.inventory_id = l.inventory_id
LEFT JOIN lead_status_lookup ls 
    ON l.status_id = ls.status_id
LEFT JOIN orders o 
    ON l.lead_id = o.lead_id
GROUP BY i.product_sku, i.brand, i.purchase_date, i.warranty_expiry_date, i.quantity, i.unit_purchase_cost;