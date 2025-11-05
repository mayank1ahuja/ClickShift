![Project Header](https://github.com/mayank1ahuja/ClickShift/blob/14e0834f90c4d02e6c2d1453a2257e754742a6dd/images/project%20header.png)

<h2 align = "center"> ClickShift: Campaign Performance Analysis with A/B Testing </h2>

# `TL;DR`
This reproducible analytics project was developed to evaluate and optimize marketing campaign performance for a SaaS business through A/B testing. Deliverables include reproducible SQL scripts, Jupyter notebooks for statistical testing, and an interactive Tableau dashboard for comparative insights between campaign variants.

# `Contents`
- [Project Overview](#project-overview)
- [Dashboard Preview](#dashboard-preview)
- [Background and Motivation](#background-and-motivation)
- [Understanding A/B Testing and Its Role in This Project](#understanding-ab-testing-and-its-role-in-this-project)
- [Data Source](#data-source)
- [Objectives](#objectives)
- [Methodology](#methodology)
- [Repository Structure](#repository-structure)
- [Visual Highlights](#visual-highlights)
- [Key Findings](#key-findings)
- [Business Interpretation](#business-interpretation)
- [Dashboard and Deliverables](#dashboard-and-deliverables)
- [Impact and Skills Demonstrated](#impact-and-skills-demonstrated)
- [Author](#author)


# `Project Overview`

Marketing teams often run multiple campaign variants — different creatives, messaging, or channels — but lack clear, data-backed methods to identify which performs best. ClickShift bridges that gap.  
It is a data analysis case study designed to measure and visualize the impact of A/B campaign experiments across key performance indicators like **conversion rate**, **click-through rate (CTR)**, and **ROI**.  
By combining SQL-based aggregation, Python statistical testing, and Tableau dashboards, the project transforms raw campaign data into decision-grade insights that marketing strategists can act upon.


# `Dashboard Preview`
![Campaign Overview Dashboard](https://github.com/mayank1ahuja/ClickShift/blob/8a3324678f085034fc4f9c0f148882f38d879c0a/tableau/assets/Campaign%20Performance%20Overview.png)  
*Interactive Tableau dashboard highlighting conversion lift, ROI differentials, and audience response across A/B variants.*


# `Background and Motivation`
In digital marketing, campaign budgets are often allocated across multiple ad or email variants without a robust evidence base. Small design changes can significantly affect engagement and conversion outcomes, yet these differences are rarely quantified statistically.  
ClickShift addresses this by implementing a reproducible, data-driven A/B testing framework. The goal is to help SaaS teams **quantify campaign effectiveness**, **identify winning variants**, and **reallocate spend** toward the most efficient channels or creatives.


# `A/B Testing`

**A/B testing** (also known as split testing) is a controlled experimental technique used to compare two versions of a campaign — Version A (control) and Version B (variant).  
By dividing the audience randomly and exposing each group to a different version, analysts can measure which performs better on key metrics such as **conversion rate**, **CTR**, or **ROI**.  

In ClickShift, A/B testing acts as the analytical backbone and each campaign variant (email type, ad design, or platform) acts as a separate test group.  
Statistical hypothesis testing determines whether observed performance differences are statistically significant, meaning that Variant B truly outperformed Variant A rather than the result being due to chance.  

This approach ensures that marketing insights are **quantifiable, reproducible, and business actionable**, allowing decision-makers to shift budgets confidently based on empirical evidence.

# `Objectives`
Primary objectives:
1. **Identify Winning Variants**: Determine which campaign type (A or B) yields a higher conversion rate and ROI.  
2. **Establish Performance Benchmarks**: Compute baseline CTR and ROI across market segments and channels.  
3. **Quantify Statistical Significance**: Validate whether performance differences between variants are statistically significant.  
4. **Visualize Insights**: Build an interactive Tableau dashboard to present results clearly to business stakeholders.  
5. **Recommend Actionable Budget Shifts**: Translate findings into marketing recommendations for future campaigns.

# `Methodology`

The project follows an end-to-end analytics pipeline, transforming raw campaign records into actionable business intelligence through a series of structured analytical stages.

1. **Data Ingestion and Structuring:** Raw campaign data from CSV files was first ingested into a PostgreSQL database. The process was governed by a defined schema (`schema.sql`), which ensured clean, typed tables with consistent numeric formats and standardized date fields. This database-first approach established a reliable foundation for downstream querying and aggregations.

2. **Feature Engineering and Benchmarking:** Using SQL scripts in `benchmarks.sql`, key marketing baselines were computed across segments, channels, and campaign types. Metrics such as click-through rate (CTR), conversion rate, return on investment (ROI), and acquisition cost were aggregated to surface top-performing categories and benchmark campaign efficiency.

3. **A/B Variant Aggregation:** The script `ab_counts.sql` consolidated campaign results by variant (A vs. B), calculating conversion counts, impressions, and CTRs at the variant level. This ensured that each experimental group met sample-size sufficiency and statistical comparability, providing a clean basis for A/B testing.

4. **Hypothesis Testing and Statistical Validation:** Statistical evaluation of variant performance was performed in `ab_test.ipynb` using a two-proportion z-test. The test quantified whether observed differences in conversion rates were statistically significant or due to random variation, producing interpretable outputs including absolute lift, confidence intervals, and p-values.

5. **Exploratory Data Analysis (EDA):** Exploratory analysis was conducted in `insights.ipynb` using Python. Derived KPIs such as conversion lift and ROI differentials were visualized through interactive charts and summary tables, enabling intuitive pattern discovery and hypothesis refinement.

6. **Dashboard Development:** The analytical findings were consolidated into an interactive Tableau dashboard (`Campaign Performance Overview.twbx`). This final deliverable integrates SQL outputs, computed KPIs, and A/B test results, offering dynamic drill-downs by marketing channel, customer segment, and campaign variant. The dashboard serves as a decision-support interface, translating statistical evidence into accessible, business-facing insights.

# `Key Findings`

| Metric | Variant A | Variant B | Lift (%) |
|---------|------------|------------|----------|
| Conversion Rate | 3.8% | 4.3% | +13.2% |
| Click-Through Rate | 2.1% | 2.4% | +14.3% |
| ROI | 1.28 | 1.46 | +14.1% |

*Statistical significance validated at p < 0.05.*

1. **Variant B Outperforms A in Conversion and ROI** – Statistical testing confirmed a significant uplift (~12–15%) in conversion rate for Variant B with *p < 0.05*.  
2. **Channel Efficiency Insights** – Email and search-based campaigns delivered higher CTR than social channels, suggesting channel-specific optimization opportunities.  
3. **Benchmark Gaps Across Segments** – Younger audience segments showed stronger responses to Variant B, indicating message resonance effects.  
4. **Business Recommendation** – Reallocate a greater share of future marketing spend toward the higher-performing variant and its associated audience segments.

# `Business Interpretation`

The uplift observed in Variant B’s conversion and ROI demonstrates the tangible impact of small creative and targeting changes. From a business perspective, this translates to improved **marketing efficiency** — achieving higher conversions at similar or lower spend. If scaled across future campaigns, a 13% conversion lift could correspond to a significant gain in customer acquisition volume and revenue without additional budget. This validates the role of **data-driven experimentation** as a cornerstone of marketing decision-making.


# `Deliverables`
The repository includes all code, data, and visuals required for full reproducibility.  

**Deliverables:**
* `schema.sql` — defines and cleans the campaign data model.  
* `benchmarks.sql` — establishes performance baselines for CTR, ROI, and acquisition cost.  
* `ab_counts.sql` — computes aggregated A/B metrics.  
* `insights.ipynb` — EDA and visualization notebook.  
* `ab_test.ipynb` — statistical hypothesis testing notebook.  
* `Campaign Performance Overview.twbx` — interactive Tableau dashboard for exploration.  

# `Impact and Skills Demonstrated`
This project demonstrates how structured experimentation and data analysis can guide marketing strategy.  

* **Domain Knowledge**: Framing A/B testing as a campaign optimization and decision-support problem.  
* **Technical Skills**: SQL-based data transformation and aggregation; Python-based statistical testing; dashboard design using Tableau.  
* **Analytical Techniques**: A/B testing design, t-test validation, time-series trend analysis, and KPI benchmarking.  
* **Business Impact**: Data-driven recommendations for marketing spend reallocation, grounded in statistical evidence.  

The ClickShift pipeline is modular and reusable — it can be extended to test additional variants, campaigns, or datasets for continuous marketing optimization.

# `Author`
### **Mayank Ahuja**  
- Email: ahuja.1mayank@gmail.com  
- LinkedIn: [https://www.linkedin.com/in/mayank1ahuja/](https://www.linkedin.com/in/mayank1ahuja/)  
- GitHub: [https://github.com/mayank1ahuja](https://github.com/mayank1ahuja)  
- X: [https://x.com/maxsiie](https://x.com/maxsiie)
