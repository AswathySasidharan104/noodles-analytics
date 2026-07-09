
# Noodles Data Warehouse Schema

## Star Schema Design

### Dimension Tables

1. **DimCurrency** – Currency master data  
   - CurrencyKey (PK)  
   - Symbol  
   - CurrencyName  
   - BaseCurrency  
   - Website  
   - CirculatingSupply  
   - MaxSupply  
   - LoadDate  

2. **DimDate** – Time dimension  
   - DateKey (PK)  
   - FullDate  
   - Year  
   - Quarter  
   - Month  
   - Week  
   - MonthName  
   - DayOfMonth  
   - DayOfWeek  
   - DayName  
   - IsWeekend  

3. **DimPlatform** – Social media platforms  
   - PlatformKey (PK)  
   - PlatformName (Twitter, Reddit)  
   - PlatformDescription  

### Fact Tables

1. **FactSocialEngagement** – Social media engagement metrics  
   - EngagementKey (PK)  
   - CurrencyKey (FK → DimCurrency)  
   - DateKey (FK → DimDate)  
   - PlatformKey (FK → DimPlatform)  
   - PostId  
   - Likes  
   - Retweets  
   - Comments  
   - Impressions  
   - EngagementScore (calculated metric)  
   - LoadDate

---

## Fact Table Grain

- **One row per social media post**
- Each record represents a single engagement event
  for a specific currency, date, and platform.

---

## Total Fact Records

**Total Social Engagement Records:** 2682 rows
