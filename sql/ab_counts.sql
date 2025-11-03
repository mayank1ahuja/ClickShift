-- ab_counts.sql

-- Creating A/B test summary table
-- Purpose: aggregate campaign performance by variant for experiment evaluation.

CREATE TABLE ab_counts AS
SELECT

  -- Using campaign_type as experiment variant identifier
  -- Purpose: treat each campaign type as a distinct test group
  COALESCE(campaign_type, 'UNKNOWN') AS variant,
  
  -- Estimating total conversions by multiplying rate × impressions
  -- Purpose: unify campaigns with rate-only data into comparable absolute metrics.

  ROUND(SUM(COALESCE(conversion_rate,0) * COALESCE(impressions,0)))::bigint AS conversions,
  
  -- Aggregating total impressions and clicks per variant
  -- Purpose: ensure sufficient sample size for statistical testing.

  SUM(COALESCE(impressions,0))::bigint AS impressions,
  SUM(COALESCE(clicks,0))::bigint AS clicks,
  
  -- counting contributing campaigns in each variant
  COUNT(*) AS n_campaigns,

  -- Calculating aggregated conversion rate per variant
  -- Purpose: derive comparable group-level performance metrics.

  CASE WHEN SUM(COALESCE(impressions,0)) = 0 THEN NULL
       ELSE ROUND( (SUM(COALESCE(conversion_rate,0) * COALESCE(impressions,0))::numeric / NULLIF(SUM(COALESCE(impressions,0)),0) ) , 6) END AS conversion_rate,
  
  -- calculating overall click-through rate for variant quality check
  CASE WHEN SUM(COALESCE(impressions,0)) = 0 THEN NULL
       ELSE ROUND( SUM(COALESCE(clicks,0))::numeric / NULLIF(SUM(COALESCE(impressions,0)),0) , 6) END AS overall_ctr
FROM campaign_events

-- grouping campaigns by variant to form A/B test
GROUP BY 1

-- ordering by impressions to highlight highest-volume cohorts
ORDER BY impressions DESC;



