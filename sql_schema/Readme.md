# 🏗️ SQL Architecture & Data Model Evolution

### 🚀 Post-Phase A Evolution
Post-Phase A, I evolved the schema from a strictly transactional (**OLTP**) structure to an analytical (**OLAP**) structure. While the Fact tables remained consistent to preserve data integrity, the Dimension tables were refined to support complex filtering, time-series analysis, and drill-downs in **Power BI** and **Tableau**.

### 📐 The Star Schema (OLAP)
The database is engineered for high-performance Business Intelligence, utilizing a central Fact-Dimension relationship:

*   **Fact Tables:** `inventory`, `leads`, and `orders`—preserving the core quantitative business events.
*   **Dimension Tables:** Optimized for slicing data across time, product categories, and lead sources.
*   **Log Intelligence:** Includes `lead_status_log` and `stock_movement` for point-in-time velocity and bottleneck analysis.

### 🧠 Analytical Layer: Specialized Views
I developed specialized SQL Views (e.g., `friction_analysis`, `bcg_matrix`) to act as a robust reporting layer. These serve two critical functions:
1.  **Decoupling:** Separates raw transactional data from the reporting layer for cleaner maintenance.
2.  **Pre-calculation:** Embeds complex logic (Conversion Rates, Lead Velocity) directly into the SQL layer to ensure dashboards run at peak speed.

### 🛠️ Multi-Tool Integration
*   **Power BI:** Connects to the Star Schema for executive-level KPI tracking.
*   **Tableau:** Leverages custom Views for granular time-series and funnel analysis.
*   **Python:** Extracts optimized datasets for statistical modeling.

---

![Entity Relationship Diagram](visual_model/ER_diag.png)