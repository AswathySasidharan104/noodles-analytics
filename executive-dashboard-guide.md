# Executive Dashboard Guide – Social Analytics

## 1. Overview

The Executive Dashboard provides **management-level overview** of:
- Token engagement levels
- Engagement trends over time
- Comparison of performance across social media platforms (Twitter, Reddit)
- Engagement quality (Avg Engagement Score)

The dashboard is built from **optimized views** in the Data Warehouse to ensure:
- High performance
- Easy scalability
- Suitable for executive-level reporting

---

## 2. Key Features

- **Executive KPIs**
- Total Engagements
- Average Engagement Score
- Total Likes / Comments / Retweets
- **Time-based Analysis**
- Daily/Monthly Engagement Trends
- **Platform Comparison**
- Twitter vs Reddit Comparison
- **Interactive Filtering**
- Filter by Time Period
- Filter by Token
- **Drill-through**
- Click Token → View Details
- **Bookmarks**
- Quickly Switch Between Analysis Views
- **Optimized for Performance**
- Use Views Instead of Fact Raw

---

## 3. Report Pages

### 3.1 Executive Dashboard

**Purpose:**
Provides a quick overview of which tokens are experiencing the highest engagement.

**Primary Data Sources:**
- `vw_ExecutiveDashboard`

**Main Visuals:**
- Top Tokens by Total Engagements
- Engagement Quality (AvgEngagementScore)
- Total Likes / Comments / Retweets
- KPI Cards (aggregated)

**How ​​to Use:**
- Sort by `TotalEngagements`
- Use Top N to focus on prominent tokens

---

### 3.2 Time Series Analysis

**Purpose:**
To track social engagement trends over time.

**Main Data Sources:**
- `vw_TimeSeries`
- `DimDate`

**Main Visuals:**
- Line chart: Total Engagements over time
- Area chart: Total Posts
- Stacked column: Likes / Comments / Retweets

**Usage:**
- Use the Date Range Slicer to zoom in on specific periods
- Observe for unusual spikes/drops

---

### 3.3 Platform Analysis

**Purpose:**
To compare the effectiveness of different social media platforms.

**Main Data Sources:**
- `vw_SocialAnalytics`

**Main Visuals:**
- Engagement by Platform (Table)
- Total Engagements by Platform
- Avg Engagement Score by Platform

**Usage:**
- Compare Twitter vs Reddit
- Evaluate the quality of engagement, not just the quantity

---

### 3.4 Currency Deep Dive

**Purpose:**
Detailed analysis of a specific token.

**Key Visuals:**
- Engagement trend over time
- Engagement breakdown by platform
- Details of Likes / Comments / Retweets

**How ​​to use:**
- Select the token from the slicer
- Or drill-through from the Executive Dashboard

---

## 4. How to Use Dashboard

### 4.1 Date Range Filtering

- Slicer: `DimDate[FullDate]`
- Applies to **the entire report**
- Used for:
- Monthly comparisons
- Short-term/long-term analysis

---

### 4.2 Token Filtering

- Click directly on the token in the table/chart
- Or use the slicer `DimCurrency[Symbol]`
- All visuals will be automatically cross-filtered

---

### 4.3 Drill-through

- Right-click on the token
- Select **Drill through → Currency Deep Dive**
- View engagement details by time and platform

---

### 4.4 Bookmarks

Available bookmarks:
- **Overview** – Market overview
- **Top Engagement** – Featured tokens
- **Platform Comparison** – Platform comparison

Use the button to quickly switch between views.

---

## 5. Key Metrics Explained

| Metric             | Meaning                                                          |
|--------------------|------------------------------------------------------------------|
| TotalEngagements   | Total interactions (Likes + Comments + Retweets + other weights) |
| AvgEngagementScore | Average engagement quality score                                 |
| TotalLikes         | Total likes                                                      |
| TotalComments      | Total comments                                                   |
| TotalRetweets      | Total shares                                                     |
| TotalPosts         | Number of posts                                                  |
| ActiveCurrencies   | Number of active tokens                                          |

---

## 6. Refresh & Performance

- **Local refresh:** Home → Refresh in Power BI Desktop (required during development)
- **Service refresh (optional — §10):** Daily – 06:00 AM if published; MySQL via On-premises Gateway (ODBC)
- **Expected Refresh Time:** < 5 minutes (Service, if configured)
- **Dashboard Load Time:** < 3 seconds (Import Mode)

---

## 7. Troubleshooting

- **No data found**
- Check Date Range Slicer
- **Slow dashboard loading**
- Reduce filter interval
- **Refresh fail**
- Check Gateway status
- Check MySQL / ODBC credential on the gateway

---

## 8. Contact

If there are any issues with the data or dashboard:
- Data Team – Noodles