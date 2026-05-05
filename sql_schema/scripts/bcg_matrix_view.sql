CREATE OR REPLACE VIEW bcg_matrix AS
WITH product_leads AS (
    SELECT 
        inv.product_SKU AS product_id,
        COUNT(l.lead_id) AS lead_count
    FROM leads l
    INNER JOIN inventory inv ON l.inventory_id = inv.inventory_id
    GROUP BY inv.product_SKU
),
product_sales AS (
    SELECT 
        inv.product_SKU AS product_id,
        SUM(o.value) AS total_sales,
        COUNT(o.order_id) AS order_count,
        SUM(l.quantity) AS qty_sold
    FROM orders o
    INNER JOIN leads l ON o.lead_id = l.lead_id
    INNER JOIN inventory inv ON l.inventory_id = inv.inventory_id
    GROUP BY inv.product_SKU
   
),
product_movement AS (
    SELECT 
        inv.product_SKU AS product_id,
        SUM(CASE WHEN sm.in_date IS NOT NULL THEN sm.curr_quantity ELSE 0 END) AS total_in
    FROM inventory inv
    LEFT JOIN stock_movement sm ON inv.inventory_id = sm.inventory_id
    GROUP BY inv.product_SKU
),
combined AS (
    SELECT 
        ps.product_id,
        pm.total_in,
        ps.qty_sold AS total_out,
        CASE 
            WHEN pm.total_in = 0 THEN NULL
            ELSE ROUND(ps.qty_sold * 1.0 / NULLIF(pm.total_in,0), 2)
        END AS movement_ratio,
        CASE 
            WHEN (CASE WHEN pm.total_in = 0 THEN NULL ELSE ps.qty_sold * 1.0 / NULLIF(pm.total_in,0) END) > 1 THEN 'High Depletion'
            WHEN (CASE WHEN pm.total_in = 0 THEN NULL ELSE ps.qty_sold * 1.0 / NULLIF(pm.total_in,0) END) = 1 THEN 'Balanced'
            WHEN (CASE WHEN pm.total_in = 0 THEN NULL ELSE ps.qty_sold * 1.0 / NULLIF(pm.total_in,0) END) < 1 THEN 'Stable/Overstock'
            ELSE 'No Movement'
        END AS depletion_flag,
        ps.total_sales,
        ps.order_count,
        pl.lead_count
    FROM product_sales ps
    LEFT JOIN product_movement pm ON ps.product_id = pm.product_id
    LEFT JOIN product_leads pl ON ps.product_id = pl.product_id
)
SELECT 
    c.product_id,
    c.total_in,
    c.total_out,
    c.movement_ratio,
    c.depletion_flag,
    c.lead_count,
    c.total_sales,
    c.order_count,
    CASE 
        WHEN c.total_out >= (SELECT AVG(total_out) FROM combined)
             AND c.lead_count >= (SELECT AVG(lead_count) FROM combined)
        THEN 'Star'
        WHEN c.total_out >= (SELECT AVG(total_out) FROM combined)
             AND c.lead_count < (SELECT AVG(lead_count) FROM combined)
        THEN 'Cash Cow'
        WHEN c.total_out < (SELECT AVG(total_out) FROM combined)
             AND c.lead_count >= (SELECT AVG(lead_count) FROM combined)
        THEN 'Question Mark'
        ELSE 'Dog'
    END AS bcg_category
FROM combined c;