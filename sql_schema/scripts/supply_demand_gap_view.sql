CREATE VIEW supply_demand_gap AS
SELECT 
    i.inventory_id,
    i.product_sku,
    i.brand,
    i.quantity AS total_qty,
    
    -- sold qty = leads marked as 'won'
    COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0) AS sold_qty,
    
    -- remaining stock
    (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) AS available_stock,
    
    -- open demand = leads still active (not won/lost)
    COALESCE(SUM(CASE WHEN ls.name NOT IN ('won','lost') THEN l.quantity ELSE 0 END),0) AS open_lead_demand,
    
    -- supply-demand gap
    ( (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) 
      - COALESCE(SUM(CASE WHEN ls.name NOT IN ('won','lost') THEN l.quantity ELSE 0 END),0) ) AS supply_demand_gap,
    
    -- flag for shortage/surplus
    CASE 
        WHEN ( (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) 
               - COALESCE(SUM(CASE WHEN ls.name NOT IN ('won','lost') THEN l.quantity ELSE 0 END),0) ) < 0 
        THEN 'Shortage'
        WHEN ( (i.quantity - COALESCE(SUM(CASE WHEN ls.name = 'won' THEN l.quantity ELSE 0 END),0)) 
               - COALESCE(SUM(CASE WHEN ls.name NOT IN ('won','lost') THEN l.quantity ELSE 0 END),0) ) > 0 
        THEN 'Surplus'
        ELSE 'Balanced'
    END AS gap_flag
    
FROM inventory i
LEFT JOIN leads l 
    ON i.inventory_id = l.inventory_id
LEFT JOIN lead_status_lookup ls 
    ON l.status_id = ls.status_id
LEFT JOIN orders o 
    ON l.lead_id = o.lead_id
GROUP BY i.inventory_id, i.product_sku, i.brand, i.quantity;