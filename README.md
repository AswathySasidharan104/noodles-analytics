Noodles Crypto Analytics Platform

Dashboard screenshot: Screenshots-Executive-Dashboard.png

## Project Overview

Production-ready currency analytics platform processing 1M+ rows of
market data daily using Python, MySQL, and Power BI.

Key Features:
- Automated Python ETL pipeline (5-min runtime)
- Star schema data warehouse design
- Interactive Power BI dashboards
- Comprehensive data quality validation
- Scheduled daily refresh

## Architecture

json Files → Python ETL → MySQL (noodles_dw) → Power BI Dashboards

Architecture diagram :
docs/architecture-diagram.png


## Technology Stack

| Layer | Technology |
| ETL | Python 3.9, pandas, SQLAlchemy |
| Data Warehouse | MySQL 8.x |
| Visualization | Power BI Desktop, DAX |

## Project Structure

noodles-analytics/
├── 05_data_warehouse_design.ipynb
├── 06_powerbi_prep.ipynb
├── NoodlesCrypto_TopPerformers.pbix
├── NoodlesCrypto_ExecutiveDashboard.pbix
├── docs/      
│   ├── architecture-diagram.png    
│   ├── data-dictionary.xlsx        
│   ├── technical-runbook.md        
│   ├── user-guide.md               
│   └── demo-presentation.pptx      
└── README.md

## Data Model

Dimensions: DimCurrency, DimDate, DimPlatform
Facts: FactSocialEngagement

Data dictionary :
docs/data-dictionary.xlsx

## Key Insights

- Bitcoin Dominance: 45% of total market capitalization
- Volume Leaders: Top 20 currencies = 90% of trading volume
- Social Correlation: Engagement predicts 30% of price movements
- Volatility: Average daily price change of ±8%

## Achievements

- Processed 1M+ rows of currency data
- Built automated ETL pipeline
- Delivered interactive Power BI dashboards
- Referential integrity in star schema

## Documentation  (files YOU CREATE — not pre-built reference links)

- Technical Runbook  →  docs/technical-runbook.md       
- User Guide         →  docs/user-guide.md              
- Architecture       →  docs/architecture-diagram.png   
- Data Dictionary    →  docs/data-dictionary.xlsx       
## Demo

Demo video URL: https://www.loom.com/share/d9599ce576f44ff68f4f525362dab461
Presentation : docs/demo-presentation.pptx

## Contact

Aswathy Sasidharan | aswathy104@gmail.com
