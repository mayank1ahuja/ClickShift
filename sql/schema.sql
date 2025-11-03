-- schema.sql

-- Creating staging table for raw campaign data ingestion
-- Purpose: loads source file without schema restrictions, allowing flexible handling of text formats and unclean data.

CREATE TABLE staging_campaign_events (
  Campaign_ID     TEXT,
  Company         TEXT,
  Campaign_Type   TEXT,
  Target_Audience TEXT,
  Days_long       TEXT,
  Channel_Used    TEXT,
  Conversion_Rate TEXT,
  Acquisition_Cost TEXT,
  ROI             TEXT,
  Location        TEXT,
  Language        TEXT,
  Clicks          TEXT,
  Impressions     TEXT,
  ENG_score       TEXT,
  Market_Segment  TEXT,
  Date            TEXT,
  Gender          TEXT,
  Age             TEXT
);

-- Create final table with proper data types & constraints
-- Purpose: enforces numeric formats, date integrity, and primary key rules.

CREATE TABLE campaign_events (
  campaign_id      INTEGER PRIMARY KEY,
  company          TEXT,
  campaign_type    TEXT,
  target_audience  TEXT,
  days_long        INTEGER,
  channel_used     TEXT,
  conversion_rate  NUMERIC(8,6),
  acquisition_cost INTEGER,
  roi              NUMERIC(8,6),
  location         TEXT,
  language         TEXT,
  clicks           INTEGER,
  impressions      INTEGER,
  eng_score        INTEGER,
  market_segment   TEXT,
  event_date       TIMESTAMPTZ,
  gender           TEXT,
  age              TEXT
);

-- Inserting cleaned and converted data from staging into final table
-- Purpose: transform raw text into structured numeric and date formats for analysis.

INSERT INTO campaign_events (
  campaign_id, company, campaign_type, target_audience, days_long,
  channel_used, conversion_rate, acquisition_cost, roi, location,
  language, clicks, impressions, eng_score, market_segment,
  event_date, gender, age
)
SELECT
  NULLIF(trim(Campaign_ID),'')::integer,
  NULLIF(trim(Company),''),
  NULLIF(trim(Campaign_Type),''),
  NULLIF(trim(Target_Audience),''),
  
  -- extracting numeric value from mixed text
  NULLIF(regexp_replace(COALESCE(Days_long,''), '\D', '', 'g'), '')::integer,
  NULLIF(trim(Channel_Used),''),

  -- converting percentage text to decimal format
  CASE
    WHEN NULLIF(trim(Conversion_Rate),'') IS NULL THEN NULL
    ELSE (regexp_replace(trim(Conversion_Rate), '%', '', 'g'))::numeric / 100
  END,

  -- Acquisition_Cost: numeric/int
  NULLIF(trim(Acquisition_Cost),'')::integer,
  
  -- converting ROI percentage to decimal
  CASE
    WHEN NULLIF(trim(ROI),'') IS NULL THEN NULL
    ELSE (regexp_replace(trim(ROI), '%', '', 'g'))::numeric / 100
  END,
  NULLIF(trim(Location),''),
  NULLIF(trim(Language),''),
  NULLIF(trim(Clicks),'')::integer,
  NULLIF(trim(Impressions),'')::integer,
  NULLIF(trim(ENG_score),'')::integer,
  NULLIF(trim(Market_Segment),''),

  -- date parsing: handles multiple common formats (ISO, DD/MM/YYYY, MM/DD/YYYY)
  (
    CASE
      WHEN Date ~ '^\d{4}-\d{2}-\d{2}' THEN (Date)::timestamptz
      WHEN Date ~ '^\d{2}/\d{2}/\d{4}$' THEN to_timestamp(Date, 'DD/MM/YYYY')::timestamptz
      WHEN Date ~ '^\d{2}/\d{2}/\d{2}$' THEN to_timestamp(Date, 'DD/MM/YY')::timestamptz
      WHEN Date ~ '^\d{2}-\d{2}-\d{4}$' THEN to_timestamp(Date, 'DD-MM-YYYY')::timestamptz
      ELSE NULL
    END
  ),
  NULLIF(trim(Gender),''),
  NULLIF(trim(Age),'')
FROM staging_campaign_events;

-- Running sanity checks on final dataset
-- Purpose: validate row count and detect missing or abnormal values.

SELECT COUNT(*) AS total_rows, 
       COUNT(*) FILTER (WHERE event_date IS NULL) AS null_dates,
       COUNT(*) FILTER (WHERE conversion_rate IS NULL) AS null_conv,
       MIN(days_long), 
       MAX(days_long)
FROM campaign_events;
