## 🔬 Statistical Engine (Python Research Layer)

While Power BI and Tableau provide operational visibility, I utilized a **Python-based Statistical Engine** to perform deep-dive diagnostic analytics. This layer moves beyond descriptive "what happened" metrics into rigorous "why it happened" scientific validation.

### 1. Objective: Statistical Rigor vs. Visualization
Python was employed to execute complex statistical tests that standard BI tools cannot natively perform. This ensures that observed trends in lead conversion or inventory fluctuations are statistically significant rather than random noise.
*   **Methodologies:** Implementation of **ANOVA**, **Chi-Square tests**, and **Bayesian Probability** analysis to validate lead velocity and inventory aging.
*   **Use Case:** Determining if the variance in "days_in_stage" across different lead sources was mathematically significant.

### 2. Technical Stack
The analysis was conducted in **Jupyter Notebooks** using the following libraries:
*   **Pandas:** For data manipulation and feature engineering of neutralized timestamps.
*   **SciPy.stats / Statsmodels:** For executing hypothesis testing and calculating P-values.

### 🔬 Key Analytical Insights (Research Highlights)

*   **Reliability vs. Volume:** While high-volume sources like Cold Calling initially appeared successful, **Coefficient of Variation (CV)** analysis revealed they are statistically inconsistent. This research validates Tenders and Expos as more reliable revenue drivers for long-term planning.
*   **Segment Quality:** Applied **Bayesian Win-Probability** to identify "High-Alpha" segments. The analysis proved that the Material Science sector maintains a 72.7% maturity rate, justifying prioritized resource allocation despite lower lead volumes.
*   **Predictive Resource Shifts:** A **Chi-Square test** (Result: 39.68) confirmed that regional demand is non-random. This provides a mathematical foundation for shifting Q3/Q4 focus toward Gujarat and Maharashtra to capture peak conversion windows.
*   **Outlier Detection:** Used **Z-score analysis** on Lead Friction logs to isolate bottlenecks skewing average processing times. Identifying these with a high confidence interval (**P < 0.05**) allows for precision operational fixes rather than broad policy changes.
---
*Refer to `/stats_research/stats_analytics_project.ipynb` for the full Python implementation and data logs.*