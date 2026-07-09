 ## DAX Measures documentation
## Create a measure table:

Measures = ROW("Placeholder", 1)

Executive KPI Measures
Total Engagements =
SUM(vw_ExecutiveDashboard[TotalEngagements])
Total Likes =
SUM(vw_ExecutiveDashboard[TotalLikes])
Total Comments =
SUM(vw_ExecutiveDashboard[TotalComments])
Total Retweets =
SUM(vw_ExecutiveDashboard[TotalRetweets])
Average Engagement Score =
AVERAGE(vw_ExecutiveDashboard[AvgEngagementScore])
Active Tokens =
DISTINCTCOUNT(vw_ExecutiveDashboard[CurrencySymbol])
Time Intelligence Measures (Trend)
Total Engagements (Time) =
SUM(vw_TimeSeries[TotalEngagements])
Engagements Previous Day =
CALCULATE(
    [Total Engagements (Time)],
    DATEADD(DimDate[FullDate], -1, DAY)
)
Engagement Growth % =
DIVIDE(
    [Total Engagements (Time)] - [Engagements Previous Day],
    [Engagements Previous Day],
    0
) * 100
Engagements 7D Avg =
CALCULATE(
    [Total Engagements (Time)],
    DATESINPERIOD(
        DimDate[FullDate],
        MAX(DimDate[FullDate]),
        -7,
        DAY
    )
) / 7
Platform Analytics Measures
Create in this order (each measure depends on the previous).
Use the exact table name from your Fields pane (often lowercase vw_socialanalytics).
If [Platform Total Engagements] is red, you have not created that measure yet (see step 1).

Step 1 — required base measure:

Platform Total Engagements =
SUM(vw_SocialAnalytics[TotalEngagements])
Step 2 — optional helpers:

Platform Total Comments =
SUM(vw_SocialAnalytics[TotalComments])
Platform Avg Engagement Score =
AVERAGE(vw_SocialAnalytics[AvgEngagementScore])
Last Engagement Date =
MAX(vw_SocialAnalytics[LastEngagement])
Column missing? If TotalComments is not in vw_socialanalytics, re-run Task 6 Cell 6 (views SQL) and Refresh Power BI. The view must include TotalComments (see task6.md view definition).

Ranking & Top N (Advanced Feature)
Token Engagement Rank =
RANKX(
    ALL(vw_ExecutiveDashboard[CurrencySymbol]),
    [Total Engagements],
    ,
    DESC,
    Dense
)
Drill-through Support Measures
Engagement Share % =
DIVIDE(
    [Total Engagements],
    CALCULATE(
        [Total Engagements],
        ALL(vw_ExecutiveDashboard)
    ),
    0
) * 100
Tooltip-only Measures (ADVANCED)
Create after Platform Total Engagements (above). Do not reference [Total Comments] here — that measure uses vw_ExecutiveDashboard, not platform rows.

Step 3 — share % measures:

Likes Share % =
DIVIDE(
    SUM(vw_SocialAnalytics[TotalLikes]),
    [Platform Total Engagements],
    0
) * 100
Comments Share % =
DIVIDE(
    SUM(vw_SocialAnalytics[TotalComments]),
    [Platform Total Engagements],
    0
) * 100
Power BI tip: Type [Platform Total Engagements] by selecting the existing measure from autocomplete — do not type Total Engagements (different measure).

If TotalComments still errors: expand vw_socialanalytics in Fields — if there is no TotalComments column, run Task 6 view SQL again, then Home → Refresh.

Engagement Quality =
SWITCH(
    TRUE(),
    [Average Engagement Score] >= 0.8, "Excellent",
    [Average Engagement Score] >= 0.6, "Good",
    [Average Engagement Score] >= 0.4, "Average",
    "Low"
)