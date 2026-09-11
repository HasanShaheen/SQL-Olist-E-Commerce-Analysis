# 📉 Brazilian E-Commerce by Olist Analytics

## 📌 Project Overview
This project analyzes a public e-commerce dataset spanning multiple relational tables to map fulfillment delays, evaluate macroeconomic freight burdens across regional states, and categorize sellers by their revenue-generating performance. Using advanced SQL techniques in MySQL (CTEs, Window Functions, and complex aggregations), the analysis provides actionable intelligence for Marketing and Operations teams to optimize shipping strategies and monitor seller performance.

**Dataset Source:** [Brazilian E-Commerce Public Dataset by Olist on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 📂 Repository Structure

```text
├── queries/
│   ├── 00_schema.sql                           # Database initialization and table creation
│   ├── 01_The_Delivery_Bottleneck.sql          # Calculate average delivery delays and review impact by state
│   ├── 02_The_Freight_Ratio.sql                # Evaluate freight cost vs. order price burdens geographically
│   └── 03_The_Seller_Performance_Matrix.sql    # CTEs and Window Functions (NTILE) for ranking sellers
└── README.md                                   # Executive summary & SQL methodology
```

---


## 🎯 Business Problems & Objectives

1. **The Delivery Bottleneck (Logistics Funnel):** Identify which states experience the most significant delivery variances (actual vs. estimated) and evaluate how these systemic delivery buffers impact average customer review scores.
2. **Freight Friction:** Analyze how logistical freight costs scale relative to the actual price of products across different geographical states to uncover margin-eating shipping burdens.
3. **Seller Performance Matrix:** Segment the marketplace seller base into four distinct revenue tiers (quartiles) to identify top performers and underperforming accounts.

---

## 🔍 Analytical Methodology 

To address these business problems, the analysis was broken down into three distinct SQL workflows:

*   **Scenario 1: Delivery Delays Analysis (Reference: `1_Executive Brief_The Delivery Bottleneck.sql`)**
    *   *Methodology:* Utilized `DATEDIFF()` and aggregate functions (`AVG`) to calculate the variance between estimated and actual delivery dates. Grouped the data geographically to prove that massive delivery buffers (arriving 10-20 days early) do not proportionally elevate customer satisfaction scores.
*   **Scenario 2: Freight Costs Ratio Analysis (Reference: `2_Executive Brief_The freight ratio by states.sql`)**
    *   *Methodology:* Applied the "Ratio of Sums" mathematical logic (`SUM(freight) / SUM(price)`) and handled potential divide-by-zero errors using `NULLIF`. This approach revealed the true macroeconomic burden, showing that remote northern states carry more than double the relative freight burden of central hubs.
*   **Scenario 3: Seller Performance Matrix (Reference: `3_Executive_Brief_The Seller Performance Matrix.sql`)**
    *   *Methodology:* Implemented Common Table Expressions (CTEs) alongside the `NTILE(4)` window function to partition aggregated seller revenue (`SUM(price)`) into four equal tiers. Executed a final query to extract targeted lists for marketing operations.

---

## 💡 Strategic Recommendations

1. **Logistics & Customer Satisfaction:** Shift operational focus toward product quality control and accurate tracking rather than merely accelerating shipments. The data clearly shows that beating bloated delivery estimates by 20 days does not guarantee 5-star reviews.
2. **Mitigating Freight Burdens:** To combat the 28% freight burden in remote northern states (like Roraima), explore strategic regional warehouse expansion or incentivize onboarding sellers located closer to these logistical bottlenecks rather than subsidizing shipping costs.
3. **Seller Ecosystem Management:** Deploy a targeted incentive or badging program for Tier 1 sellers who drive the highest revenue volume. Conversely, establish probationary performance reviews for Tier 4 sellers to protect overall platform integrity and customer trust.
Mitigating Freight Burdens: To combat the 28% freight burden in remote northern states (like Roraima), explore strategic regional warehouse expansion or incentivize onboarding sellers located closer to these logistical bottlenecks rather than subsidizing shipping costs.

Seller Ecosystem Management: Deploy a targeted incentive or badging program for Tier 1 sellers who drive the highest revenue volume. Conversely, establish probationary performance reviews for Tier 4 sellers to protect overall platform integrity and customer trust.
