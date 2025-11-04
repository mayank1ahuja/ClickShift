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

