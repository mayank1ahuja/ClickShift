--benchmarks.sql

-- Creating benchmark reference table for campaign performance
-- Purpose: aggregate performance by segment, channel, and type to establish baseline metrics.

CREATE TABLE benchmarks AS
SELECT

  -- Standardizing null segment, channel, and campaign values
  -- Purpose: avoid missing category groups in aggregation.

  COALESCE(market_segment,'UNKNOWN') AS market_segment,
  COALESCE(channel_used,'UNKNOWN') AS channel_used,
  COALESCE(campaign_type,'UNKNOWN') AS campaign_type,
  
  -- counting total campaigns for scale and distribution analysis
  COUNT(*) AS n_campaigns,

  -- summing impressions and clicks for funnel metric computation
  SUM(COALESCE(impressions,0)) AS total_impressions,
  SUM(COALESCE(clicks,0)) AS total_clicks,
  
  -- Computing overall CTR across each segment/channel/type group
  -- Purpose: measure top-of-funnel efficiency.

  CASE WHEN SUM(COALESCE(impressions,0)) = 0 THEN NULL
       ELSE SUM(COALESCE(clicks,0))::numeric / SUM(COALESCE(impressions,0)) END AS overall_ctr,
  
  -- average conversion rate across campaigns in group
  AVG(COALESCE(conversion_rate,0)) AS avg_conversion_rate,
  
  -- percentile-based breakdown for identifying performance distribution
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY COALESCE(conversion_rate,0)) AS p25_conversion_rate,
  PERCENTILE_CONT(0.5)  WITHIN GROUP (ORDER BY COALESCE(conversion_rate,0)) AS median_conversion_rate,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY COALESCE(conversion_rate,0)) AS p75_conversion_rate,
  
  -- average and median ROI measures economic efficiency of campaigns
  AVG(COALESCE(roi,0)) AS avg_roi,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY COALESCE(roi,0)) AS median_roi,
  
  -- average acquisition cost to benchmark spend efficiency
  AVG(COALESCE(acquisition_cost,0)) AS avg_acquisition_cost,
  
  -- timestamp for tracking benchmark refresh time
  now() AS computed_at
FROM campaign_events

-- grouping by key business dimensions
GROUP BY 1,2,3

-- ordering by campaign volume for visibility of largest groups first
ORDER BY n_campaigns DESC;
