## DAX Measures Documented
## In Power BI:

## Modeling → New Measure

## Core Engagement Metrics

Total Engagements = 
SUM(vw_ExecutiveDashboard[TotalEngagements])
Total Likes =
SUM(vw_ExecutiveDashboard[TotalLikes])
Total Comments =
SUM(vw_ExecutiveDashboard[TotalComments])
Total Retweets =
SUM(vw_ExecutiveDashboard[TotalRetweets])
Avg Engagement Score =
AVERAGE(vw_ExecutiveDashboard[AvgEngagementScore])
Engagement per Post =
DIVIDE(
    [Total Engagements],
    SUM(vw_TimeSeries[TotalPosts]),
    0
)
Time Intelligence (Engagement-based)
Requirement: DimDate has been Marked as a Date Table

Engagement Today =
CALCULATE(
    [Total Engagements],
    LASTDATE(DimDate[FullDate])
)
Engagement Yesterday =
CALCULATE(
    [Total Engagements],
    DATEADD(DimDate[FullDate], -1, DAY)
)
Engagement Change % =
DIVIDE(
    [Engagement Today] - [Engagement Yesterday],
    [Engagement Yesterday],
    0
)
Engagement 7D Avg =
CALCULATE(
    [Total Engagements],
    DATESINPERIOD(
        DimDate[FullDate],
        MAX(DimDate[FullDate]),
        -7,
        DAY
    )
)
Engagement 30D Avg =
CALCULATE(
    [Total Engagements],
    DATESINPERIOD(
        DimDate[FullDate],
        MAX(DimDate[FullDate]),
        -30,
        DAY
    )
)
Ranking & Labels
Engagement Rank =
RANKX(
    ALL(DimCurrency[Symbol]),
    [Total Engagements],
    ,
    DESC,
    Dense
)
Engagement Trend =
IF(
    [Engagement 7D Avg] > [Engagement 30D Avg],
    "Up ▲",
    "Down ▼"
)
Platform Analysis
Engagement by Platform =
SUM(vw_SocialAnalytics[TotalEngagements])
Platform Engagement Share % =
DIVIDE(
    [Engagement by Platform],
    CALCULATE(
        [Engagement by Platform],
        ALL(vw_SocialAnalytics[PlatformName])
    ),
    0
)
Trend Indicator (UI Helper)
Engagement Trend =
IF(
    [Engagement Today] > [Engagement Yesterday],
    "Up ▲",
    IF(
        [Engagement Today] < [Engagement Yesterday],
        "Down ▼",
        "Flat →"
    )
)
KPI Flags (Conditional Formatting)
High Engagement Flag =
IF([Total Engagements] >= 10000, 1, 0)