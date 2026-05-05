CREATE VIEW product_profit_summary AS
SELECT 
    i.brand,
    i.item_description,
    i.product_SKU,
    i.division,
    COUNT(o.order_id) AS total_orders,
    SUM(o.value) AS total_revenue,
    SUM(l.quantity * i.unit_purchase_cost) AS total_cost,  -- unit cost × ordered qty
    SUM(o.value - (l.quantity * i.unit_purchase_cost)) AS total_margin,
    ROUND(AVG(o.value - (l.quantity * i.unit_purchase_cost)),2) AS avg_margin_per_order,
    ROUND(
        (SUM(o.value - (l.quantity * i.unit_purchase_cost)) * 100.0) / NULLIF(SUM(o.value),0),
        2
    ) AS margin_pct
FROM inventory i
JOIN leads l 
    ON i.inventory_id = l.inventory_id
JOIN orders o 
    ON l.lead_id = o.lead_id
GROUP BY i.brand, i.product_sku, i.item_description, i.division;
