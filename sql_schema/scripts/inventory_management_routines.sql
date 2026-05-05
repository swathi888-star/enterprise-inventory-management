CREATE DATABASE  IF NOT EXISTS `inventory_management` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventory_management`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventory_management
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '5452f022-bf8a-11f0-8898-cd73d8dfd58f:1-4909';

--
-- Temporary view structure for view `bcg_matrix`
--

DROP TABLE IF EXISTS `bcg_matrix`;
/*!50001 DROP VIEW IF EXISTS `bcg_matrix`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bcg_matrix` AS SELECT 
 1 AS `product_id`,
 1 AS `total_in`,
 1 AS `total_out`,
 1 AS `movement_ratio`,
 1 AS `depletion_flag`,
 1 AS `lead_count`,
 1 AS `total_sales`,
 1 AS `order_count`,
 1 AS `bcg_category`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_delay_reason_metrics`
--

DROP TABLE IF EXISTS `order_delay_reason_metrics`;
/*!50001 DROP VIEW IF EXISTS `order_delay_reason_metrics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_delay_reason_metrics` AS SELECT 
 1 AS `name`,
 1 AS `avg_delay`,
 1 AS `max_delay`,
 1 AS `var_delay`,
 1 AS `total_orders`,
 1 AS `delayed_orders`,
 1 AS `pct_delayed_orders`,
 1 AS `rank_by_pct_delayed`,
 1 AS `rank_by_avg_delay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `supply_demand_gap`
--

DROP TABLE IF EXISTS `supply_demand_gap`;
/*!50001 DROP VIEW IF EXISTS `supply_demand_gap`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `supply_demand_gap` AS SELECT 
 1 AS `inventory_id`,
 1 AS `product_sku`,
 1 AS `brand`,
 1 AS `total_qty`,
 1 AS `sold_qty`,
 1 AS `available_stock`,
 1 AS `open_lead_demand`,
 1 AS `supply_demand_gap`,
 1 AS `gap_flag`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `won_lead_stats`
--

DROP TABLE IF EXISTS `won_lead_stats`;
/*!50001 DROP VIEW IF EXISTS `won_lead_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `won_lead_stats` AS SELECT 
 1 AS `lead_id`,
 1 AS `days_to_win`,
 1 AS `revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `source_stability`
--

DROP TABLE IF EXISTS `source_stability`;
/*!50001 DROP VIEW IF EXISTS `source_stability`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `source_stability` AS SELECT 
 1 AS `source_name`,
 1 AS `total_orders`,
 1 AS `avg_revenue`,
 1 AS `std_dev_revenue`,
 1 AS `cv_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `friction_analysis`
--

DROP TABLE IF EXISTS `friction_analysis`;
/*!50001 DROP VIEW IF EXISTS `friction_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `friction_analysis` AS SELECT 
 1 AS `lead_id`,
 1 AS `total_stay_days`,
 1 AS `is_lost`,
 1 AS `source_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lead_lifetracker`
--

DROP TABLE IF EXISTS `lead_lifetracker`;
/*!50001 DROP VIEW IF EXISTS `lead_lifetracker`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lead_lifetracker` AS SELECT 
 1 AS `lead_id`,
 1 AS `source_name`,
 1 AS `status_name`,
 1 AS `start_date`,
 1 AS `days_in_stage`,
 1 AS `activity_month`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `region_division_summary`
--

DROP TABLE IF EXISTS `region_division_summary`;
/*!50001 DROP VIEW IF EXISTS `region_division_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `region_division_summary` AS SELECT 
 1 AS `region`,
 1 AS `division`,
 1 AS `total_leads`,
 1 AS `won_leads`,
 1 AS `lost_leads`,
 1 AS `open_leads`,
 1 AS `total_revenue`,
 1 AS `conversion_pct`,
 1 AS `rank_by_conversion`,
 1 AS `rank_by_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `product_aging_summary`
--

DROP TABLE IF EXISTS `product_aging_summary`;
/*!50001 DROP VIEW IF EXISTS `product_aging_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_aging_summary` AS SELECT 
 1 AS `product_sku`,
 1 AS `brand`,
 1 AS `purchase_date`,
 1 AS `warranty_expiry_date`,
 1 AS `total_qty`,
 1 AS `sold_qty`,
 1 AS `unsold_qty`,
 1 AS `days_since_purchase`,
 1 AS `days_until_expiry`,
 1 AS `aging_pct`,
 1 AS `remaining_stock_cost`,
 1 AS `risk_flag`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `product_profit_summary`
--

DROP TABLE IF EXISTS `product_profit_summary`;
/*!50001 DROP VIEW IF EXISTS `product_profit_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_profit_summary` AS SELECT 
 1 AS `brand`,
 1 AS `item_description`,
 1 AS `product_SKU`,
 1 AS `division`,
 1 AS `total_orders`,
 1 AS `total_revenue`,
 1 AS `total_cost`,
 1 AS `total_margin`,
 1 AS `avg_margin_per_order`,
 1 AS `margin_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `source_efficiency`
--

DROP TABLE IF EXISTS `source_efficiency`;
/*!50001 DROP VIEW IF EXISTS `source_efficiency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `source_efficiency` AS SELECT 
 1 AS `source_name`,
 1 AS `total_leads`,
 1 AS `conversion_rate`,
 1 AS `total_revenue`,
 1 AS `revenue_per_lead`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lead_source_summary`
--

DROP TABLE IF EXISTS `lead_source_summary`;
/*!50001 DROP VIEW IF EXISTS `lead_source_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lead_source_summary` AS SELECT 
 1 AS `name`,
 1 AS `total_leads`,
 1 AS `won_count`,
 1 AS `lost_count`,
 1 AS `open_count`,
 1 AS `conversion_pct`,
 1 AS `rank_by_conversion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lead_conversion`
--

DROP TABLE IF EXISTS `lead_conversion`;
/*!50001 DROP VIEW IF EXISTS `lead_conversion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lead_conversion` AS SELECT 
 1 AS `month`,
 1 AS `total_leads`,
 1 AS `won_count`,
 1 AS `lost_count`,
 1 AS `win_rate`,
 1 AS `loss_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lead_velocity`
--

DROP TABLE IF EXISTS `lead_velocity`;
/*!50001 DROP VIEW IF EXISTS `lead_velocity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lead_velocity` AS SELECT 
 1 AS `month`,
 1 AS `lead_count`,
 1 AS `prev_lead_count`,
 1 AS `lead_velocity_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bcg_matrix`
--

/*!50001 DROP VIEW IF EXISTS `bcg_matrix`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bcg_matrix` AS with `product_leads` as (select `inv`.`product_SKU` AS `product_id`,count(`l`.`lead_id`) AS `lead_count` from (`leads` `l` join `inventory` `inv` on((`l`.`inventory_id` = `inv`.`inventory_id`))) group by `inv`.`product_SKU`), `product_sales` as (select `inv`.`product_SKU` AS `product_id`,sum(`o`.`value`) AS `total_sales`,count(`o`.`order_id`) AS `order_count`,sum(`l`.`quantity`) AS `qty_sold` from ((`orders` `o` join `leads` `l` on((`o`.`lead_id` = `l`.`lead_id`))) join `inventory` `inv` on((`l`.`inventory_id` = `inv`.`inventory_id`))) group by `inv`.`product_SKU`), `product_movement` as (select `inv`.`product_SKU` AS `product_id`,sum((case when (`sm`.`in_date` is not null) then `sm`.`curr_quantity` else 0 end)) AS `total_in` from (`inventory` `inv` left join `stock_movement` `sm` on((`inv`.`inventory_id` = `sm`.`inventory_id`))) group by `inv`.`product_SKU`), `combined` as (select `ps`.`product_id` AS `product_id`,`pm`.`total_in` AS `total_in`,`ps`.`qty_sold` AS `total_out`,(case when (`pm`.`total_in` = 0) then NULL else round(((`ps`.`qty_sold` * 1.0) / nullif(`pm`.`total_in`,0)),2) end) AS `movement_ratio`,(case when ((case when (`pm`.`total_in` = 0) then NULL else ((`ps`.`qty_sold` * 1.0) / nullif(`pm`.`total_in`,0)) end) > 1) then 'High Depletion' when ((case when (`pm`.`total_in` = 0) then NULL else ((`ps`.`qty_sold` * 1.0) / nullif(`pm`.`total_in`,0)) end) = 1) then 'Balanced' when ((case when (`pm`.`total_in` = 0) then NULL else ((`ps`.`qty_sold` * 1.0) / nullif(`pm`.`total_in`,0)) end) < 1) then 'Stable/Overstock' else 'No Movement' end) AS `depletion_flag`,`ps`.`total_sales` AS `total_sales`,`ps`.`order_count` AS `order_count`,`pl`.`lead_count` AS `lead_count` from ((`product_sales` `ps` left join `product_movement` `pm` on((`ps`.`product_id` = `pm`.`product_id`))) left join `product_leads` `pl` on((`ps`.`product_id` = `pl`.`product_id`)))) select `c`.`product_id` AS `product_id`,`c`.`total_in` AS `total_in`,`c`.`total_out` AS `total_out`,`c`.`movement_ratio` AS `movement_ratio`,`c`.`depletion_flag` AS `depletion_flag`,`c`.`lead_count` AS `lead_count`,`c`.`total_sales` AS `total_sales`,`c`.`order_count` AS `order_count`,(case when ((`c`.`total_out` >= (select avg(`combined`.`total_out`) from `combined`)) and (`c`.`lead_count` >= (select avg(`combined`.`lead_count`) from `combined`))) then 'Star' when ((`c`.`total_out` >= (select avg(`combined`.`total_out`) from `combined`)) and (`c`.`lead_count` < (select avg(`combined`.`lead_count`) from `combined`))) then 'Cash Cow' when ((`c`.`total_out` < (select avg(`combined`.`total_out`) from `combined`)) and (`c`.`lead_count` >= (select avg(`combined`.`lead_count`) from `combined`))) then 'Question Mark' else 'Dog' end) AS `bcg_category` from `combined` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_delay_reason_metrics`
--

/*!50001 DROP VIEW IF EXISTS `order_delay_reason_metrics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `order_delay_reason_metrics` AS select `r`.`name` AS `name`,avg((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`))) AS `avg_delay`,max((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`))) AS `max_delay`,variance((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`))) AS `var_delay`,count(0) AS `total_orders`,sum((case when ((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`)) > 15) then 1 else 0 end)) AS `delayed_orders`,round(((sum((case when ((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`)) > 15) then 1 else 0 end)) * 100.0) / count(0)),2) AS `pct_delayed_orders`,rank() OVER (ORDER BY round(((sum((case when ((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`)) > 15) then 1 else 0 end)) * 100.0) / count(0)),2) desc )  AS `rank_by_pct_delayed`,rank() OVER (ORDER BY avg((to_days(`o`.`order_out_date`) - to_days(`o`.`order_in_date`))) desc )  AS `rank_by_avg_delay` from (`orders` `o` join `reason_lookup` `r` on((`o`.`reason_id` = `r`.`reason_id`))) group by `r`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `supply_demand_gap`
--

/*!50001 DROP VIEW IF EXISTS `supply_demand_gap`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `supply_demand_gap` AS select `i`.`inventory_id` AS `inventory_id`,`i`.`product_SKU` AS `product_sku`,`i`.`brand` AS `brand`,`i`.`quantity` AS `total_qty`,coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0) AS `sold_qty`,(`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) AS `available_stock`,coalesce(sum((case when (`ls`.`name` not in ('won','lost')) then `l`.`quantity` else 0 end)),0) AS `open_lead_demand`,((`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) - coalesce(sum((case when (`ls`.`name` not in ('won','lost')) then `l`.`quantity` else 0 end)),0)) AS `supply_demand_gap`,(case when (((`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) - coalesce(sum((case when (`ls`.`name` not in ('won','lost')) then `l`.`quantity` else 0 end)),0)) < 0) then 'Shortage' when (((`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) - coalesce(sum((case when (`ls`.`name` not in ('won','lost')) then `l`.`quantity` else 0 end)),0)) > 0) then 'Surplus' else 'Balanced' end) AS `gap_flag` from (((`inventory` `i` left join `leads` `l` on((`i`.`inventory_id` = `l`.`inventory_id`))) left join `lead_status_lookup` `ls` on((`l`.`status_id` = `ls`.`status_id`))) left join `orders` `o` on((`l`.`lead_id` = `o`.`lead_id`))) group by `i`.`inventory_id`,`i`.`product_SKU`,`i`.`brand`,`i`.`quantity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `won_lead_stats`
--

/*!50001 DROP VIEW IF EXISTS `won_lead_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `won_lead_stats` AS select `log`.`lead_id` AS `lead_id`,(to_days(`log`.`changed_on`) - to_days(`log`.`lead_date`)) AS `days_to_win`,`o`.`value` AS `revenue` from ((`lead_status_log` `log` join `orders` `o` on((`log`.`lead_id` = `o`.`lead_id`))) join `lead_status_lookup` `st` on((`log`.`changed_to` = `st`.`status_id`))) where (`st`.`name` = 'Won') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `source_stability`
--

/*!50001 DROP VIEW IF EXISTS `source_stability`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `source_stability` AS select `ls`.`name` AS `source_name`,count(`o`.`order_id`) AS `total_orders`,avg(`o`.`value`) AS `avg_revenue`,std(`o`.`value`) AS `std_dev_revenue`,(std(`o`.`value`) / avg(`o`.`value`)) AS `cv_index` from ((`lead_source_lookup` `ls` join `leads` `l` on((`ls`.`source_id` = `l`.`source_id`))) join `orders` `o` on((`l`.`lead_id` = `o`.`lead_id`))) group by `ls`.`name` having (`total_orders` > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `friction_analysis`
--

/*!50001 DROP VIEW IF EXISTS `friction_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `friction_analysis` AS select `log`.`lead_id` AS `lead_id`,(to_days(`log`.`changed_on`) - to_days(`log`.`lead_date`)) AS `total_stay_days`,(case when (`st`.`name` in ('Lost','Deferred')) then 1 else 0 end) AS `is_lost`,`sl`.`name` AS `source_name` from (((`lead_status_log` `log` join `leads` `l` on((`log`.`lead_id` = `l`.`lead_id`))) join `lead_source_lookup` `sl` on((`l`.`source_id` = `sl`.`source_id`))) join `lead_status_lookup` `st` on((`log`.`changed_to` = `st`.`status_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lead_lifetracker`
--

/*!50001 DROP VIEW IF EXISTS `lead_lifetracker`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `lead_lifetracker` AS with `ordered_logs` as (select `lsl`.`lead_id` AS `lead_id`,`lsl`.`log_id` AS `log_id`,`sl`.`name` AS `source_name`,`ls_to`.`name` AS `status_name`,`lsl`.`changed_on` AS `start_date`,lead(`lsl`.`changed_on`) OVER (PARTITION BY `lsl`.`lead_id` ORDER BY `lsl`.`log_id` )  AS `next_change_date` from (((`lead_status_log` `lsl` join `leads` `l` on((`lsl`.`lead_id` = `l`.`lead_id`))) join `lead_source_lookup` `sl` on((`l`.`source_id` = `sl`.`source_id`))) join `lead_status_lookup` `ls_to` on((`lsl`.`changed_to` = `ls_to`.`status_id`))) where (`ls_to`.`name` not in ('WON','LOST'))) select `ordered_logs`.`lead_id` AS `lead_id`,`ordered_logs`.`source_name` AS `source_name`,`ordered_logs`.`status_name` AS `status_name`,`ordered_logs`.`start_date` AS `start_date`,(to_days(coalesce(`ordered_logs`.`next_change_date`,'2026-06-01')) - to_days(`ordered_logs`.`start_date`)) AS `days_in_stage`,date_format(`ordered_logs`.`start_date`,'%Y-%m-01') AS `activity_month` from `ordered_logs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `region_division_summary`
--

/*!50001 DROP VIEW IF EXISTS `region_division_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `region_division_summary` AS select `u`.`region` AS `region`,`i`.`division` AS `division`,count(`l`.`lead_id`) AS `total_leads`,sum((case when (`ls`.`name` = 'Won') then 1 else 0 end)) AS `won_leads`,sum((case when (`ls`.`name` = 'Lost') then 1 else 0 end)) AS `lost_leads`,sum((case when (`ls`.`name` not in ('Won','Lost')) then 1 else 0 end)) AS `open_leads`,sum(`o`.`value`) AS `total_revenue`,round(((sum((case when (`ls`.`name` = 'Won') then 1 else 0 end)) * 100.0) / count(`l`.`lead_id`)),2) AS `conversion_pct`,rank() OVER (ORDER BY ((sum((case when (`ls`.`name` = 'Won') then 1 else 0 end)) * 100.0) / count(`l`.`lead_id`)) desc )  AS `rank_by_conversion`,rank() OVER (ORDER BY sum(`o`.`value`) desc )  AS `rank_by_revenue` from ((((`leads` `l` join `users` `u` on((`l`.`user_id` = `u`.`user_id`))) join `inventory` `i` on((`l`.`inventory_id` = `i`.`inventory_id`))) join `lead_status_lookup` `ls` on((`l`.`status_id` = `ls`.`status_id`))) left join `orders` `o` on((`l`.`lead_id` = `o`.`lead_id`))) group by `u`.`region`,`i`.`division` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_aging_summary`
--

/*!50001 DROP VIEW IF EXISTS `product_aging_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `product_aging_summary` AS select `i`.`product_SKU` AS `product_sku`,`i`.`brand` AS `brand`,`i`.`purchase_date` AS `purchase_date`,`i`.`warranty_expiry_date` AS `warranty_expiry_date`,`i`.`quantity` AS `total_qty`,coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0) AS `sold_qty`,(`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) AS `unsold_qty`,(to_days(curdate()) - to_days(`i`.`purchase_date`)) AS `days_since_purchase`,(to_days(`i`.`warranty_expiry_date`) - to_days(curdate())) AS `days_until_expiry`,round((((`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) * 100.0) / `i`.`quantity`),2) AS `aging_pct`,((`i`.`unit_purchase_cost` / `i`.`quantity`) * (`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0))) AS `remaining_stock_cost`,(case when (((`i`.`quantity` - coalesce(sum((case when (`ls`.`name` = 'won') then `l`.`quantity` else 0 end)),0)) > 0) and ((to_days(`i`.`warranty_expiry_date`) - to_days(curdate())) < 90)) then 'High Risk' else 'Normal' end) AS `risk_flag` from (((`inventory` `i` left join `leads` `l` on((`i`.`inventory_id` = `l`.`inventory_id`))) left join `lead_status_lookup` `ls` on((`l`.`status_id` = `ls`.`status_id`))) left join `orders` `o` on((`l`.`lead_id` = `o`.`lead_id`))) group by `i`.`product_SKU`,`i`.`brand`,`i`.`purchase_date`,`i`.`warranty_expiry_date`,`i`.`quantity`,`i`.`unit_purchase_cost` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_profit_summary`
--

/*!50001 DROP VIEW IF EXISTS `product_profit_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `product_profit_summary` AS select `i`.`brand` AS `brand`,`i`.`item_description` AS `item_description`,`i`.`product_SKU` AS `product_SKU`,`i`.`division` AS `division`,count(`o`.`order_id`) AS `total_orders`,sum(`o`.`value`) AS `total_revenue`,sum((`l`.`quantity` * `i`.`unit_purchase_cost`)) AS `total_cost`,sum((`o`.`value` - (`l`.`quantity` * `i`.`unit_purchase_cost`))) AS `total_margin`,round(avg((`o`.`value` - (`l`.`quantity` * `i`.`unit_purchase_cost`))),2) AS `avg_margin_per_order`,round(((sum((`o`.`value` - (`l`.`quantity` * `i`.`unit_purchase_cost`))) * 100.0) / nullif(sum(`o`.`value`),0)),2) AS `margin_pct` from ((`inventory` `i` join `leads` `l` on((`i`.`inventory_id` = `l`.`inventory_id`))) join `orders` `o` on((`l`.`lead_id` = `o`.`lead_id`))) group by `i`.`brand`,`i`.`product_SKU`,`i`.`item_description`,`i`.`division` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `source_efficiency`
--

/*!50001 DROP VIEW IF EXISTS `source_efficiency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `source_efficiency` AS select `ls`.`name` AS `source_name`,count(`l`.`lead_id`) AS `total_leads`,round(((sum((case when (`st`.`name` = 'Won') then 1 else 0 end)) / count(`l`.`lead_id`)) * 100),2) AS `conversion_rate`,sum(coalesce(`o`.`value`,0)) AS `total_revenue`,round((sum(coalesce(`o`.`value`,0)) / count(`l`.`lead_id`)),2) AS `revenue_per_lead` from (((`lead_source_lookup` `ls` left join `leads` `l` on((`ls`.`source_id` = `l`.`source_id`))) left join `lead_status_lookup` `st` on((`l`.`status_id` = `st`.`status_id`))) left join `orders` `o` on((`l`.`lead_id` = `o`.`lead_id`))) group by `ls`.`name` having (`total_leads` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lead_source_summary`
--

/*!50001 DROP VIEW IF EXISTS `lead_source_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `lead_source_summary` AS select `ls`.`name` AS `name`,count(0) AS `total_leads`,sum((case when (`st`.`name` = 'Won') then 1 else 0 end)) AS `won_count`,sum((case when (`st`.`name` = 'Lost') then 1 else 0 end)) AS `lost_count`,sum((case when (`st`.`name` not in ('Won','Lost')) then 1 else 0 end)) AS `open_count`,round(((sum((case when (`st`.`name` = 'Won') then 1 else 0 end)) * 100.0) / count(0)),2) AS `conversion_pct`,rank() OVER (ORDER BY ((sum((case when (`st`.`name` = 'Won') then 1 else 0 end)) * 100.0) / count(0)) desc )  AS `rank_by_conversion` from ((`leads` `l` join `lead_source_lookup` `ls` on((`l`.`source_id` = `ls`.`source_id`))) join `lead_status_lookup` `st` on((`l`.`status_id` = `st`.`status_id`))) group by `ls`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lead_conversion`
--

/*!50001 DROP VIEW IF EXISTS `lead_conversion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `lead_conversion` AS with `monthly_leads` as (select date_format(`leads`.`lead_date`,'%Y-%m') AS `month`,count(`leads`.`lead_id`) AS `total_leads` from `leads` where (`leads`.`lead_date` >= '2025-04-01') group by date_format(`leads`.`lead_date`,'%Y-%m')), `monthly_closed` as (select date_format(`lsl`.`changed_on`,'%Y-%m') AS `month`,sum((case when (`ls_to`.`name` = 'WON') then 1 else 0 end)) AS `won_count`,sum((case when (`ls_to`.`name` = 'LOST') then 1 else 0 end)) AS `lost_count` from (`lead_status_log` `lsl` join `lead_status_lookup` `ls_to` on((`lsl`.`changed_to` = `ls_to`.`status_id`))) group by date_format(`lsl`.`changed_on`,'%Y-%m')) select `ml`.`month` AS `month`,`ml`.`total_leads` AS `total_leads`,`mc`.`won_count` AS `won_count`,`mc`.`lost_count` AS `lost_count`,round(((`mc`.`won_count` / `ml`.`total_leads`) * 100),2) AS `win_rate`,round(((`mc`.`lost_count` / `ml`.`total_leads`) * 100),2) AS `loss_rate` from (`monthly_leads` `ml` left join `monthly_closed` `mc` on((`ml`.`month` = `mc`.`month`))) order by `ml`.`month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lead_velocity`
--

/*!50001 DROP VIEW IF EXISTS `lead_velocity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `lead_velocity` AS with `monthly_leads` as (select date_format(`leads`.`lead_date`,'%Y-%m') AS `month`,count(`leads`.`lead_id`) AS `lead_count` from `leads` where (`leads`.`lead_date` >= '2025-04-01') group by date_format(`leads`.`lead_date`,'%Y-%m') order by `month`) select `m1`.`month` AS `month`,`m1`.`lead_count` AS `lead_count`,`m2`.`lead_count` AS `prev_lead_count`,(case when (`m2`.`lead_count` is null) then NULL else round((((`m1`.`lead_count` - `m2`.`lead_count`) / `m2`.`lead_count`) * 100),2) end) AS `lead_velocity_rate` from (`monthly_leads` `m1` left join `monthly_leads` `m2` on((`m2`.`month` = date_format((concat(`m1`.`month`,'-01') - interval 1 month),'%Y-%m')))) order by `m1`.`month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 11:41:01
