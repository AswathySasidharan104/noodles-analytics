CREATE DATABASE noodles_dw;
USE noodles_dw;
select * from currencysocialenrichment;
select * from dimcurrency;
select * from dimdate;
select * from dimplatform;
select * from factsocialengagement;

#Top 5 tokens by total engagement
SELECT c.Symbol, SUM(f.EngagementScore) AS TotalEngagement
FROM FactSocialEngagement f
JOIN DimCurrency c ON f.CurrencyKey = c.CurrencyKey
GROUP BY c.Symbol
ORDER BY TotalEngagement DESC
LIMIT 5;

USE noodles_dw;
SHOW FULL TABLES WHERE Table_type = 'VIEW';

SELECT COUNT(*) AS cnt FROM vw_ExecutiveDashboard;
SELECT COUNT(*) AS cnt FROM vw_TimeSeries;
SELECT COUNT(*) AS cnt FROM vw_SocialAnalytics;
SELECT COUNT(*) AS cnt FROM vw_PlatformDaily;

USE noodles_dw;

-- A) Twitter must have likes and non-zero avg score
SELECT dp.PlatformName,
       COUNT(*) AS fact_rows,
       SUM(f.Likes) AS total_likes,
       ROUND(AVG(f.EngagementScore), 4) AS avg_engagement_score,
       COUNT(DISTINCT dd.FullDate) AS distinct_post_days
FROM FactSocialEngagement f
JOIN DimPlatform dp ON f.PlatformKey = dp.PlatformKey
JOIN DimDate dd ON f.DateKey = dd.DateKey
GROUP BY dp.PlatformName;

-- B) Platform daily view must have multiple dates per platform (for trend chart)
SELECT PlatformName,
       COUNT(DISTINCT FullDate) AS distinct_days,
       MIN(FullDate) AS min_date,
       MAX(FullDate) AS max_date
FROM vw_PlatformDaily
GROUP BY PlatformName;

-- C) Social analytics snapshot (no date column — do NOT use for trend line)
SELECT PlatformName, TotalEngagements, AvgEngagementScore, LastEngagement
FROM vw_SocialAnalytics;
