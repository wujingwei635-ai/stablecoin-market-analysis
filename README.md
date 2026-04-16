# stablecoin-market-analysis
Analysis of USDC growth, wallet activity, and market share using on-chain data from Dune Analytics
# USDC Growth Analysis Dashboard

## Overview
This project analyzes the growth and usage patterns of USDC (USD Coin) using on-chain transaction data from Ethereum. The goal is to evaluate user activity, transaction behavior, and competitive positioning against other stablecoins (e.g., USDT) from a business perspective.

## Key Questions
- How has USDC transaction volume evolved over time?
- What are the trends in active wallet usage?
- What is the distribution of transaction sizes (retail vs. institutional)?
- How concentrated is activity among top wallets?
- How does USDC’s market share fluctuate over time?

## Methodology
- Data Source: `erc20_ethereum.evt_Transfer` (Dune Analytics)
- Time Window: Last 180 days
- Aggregations: Daily transaction volume, active wallets, transaction size
- Techniques Used:
  - SQL aggregation (SUM, COUNT, GROUP BY)
  - Time-series analysis
  - Wallet-level analysis (top holders by volume)
  - Derived metrics (average/median transaction size, market share)

## Key Insights
- USDC maintains stable transaction activity, with daily volume typically ranging between $50M–$100M
- Both retail and large-value transactions are present, indicating a mixed user base
- A small number of wallets contribute a disproportionate share of total volume
- Market share fluctuates significantly (≈30%–85%), suggesting strong competition in the stablecoin market

## Business Recommendations
- **Engage High-Value Wallets:** Target top wallets (institutional users) with incentives to retain liquidity and prevent migration
- **Strengthen Competitive Positioning:** Improve partnerships and incentives to compete with USDT
- **Support Dual User Segments:** Optimize infrastructure for both retail users (low fees) and institutional traders (high liquidity)

## Dashboard
🔗 https://dune.com/pariswei/usdc-growth-analysis-dashboard

## Project Structure
- `/slides` – Final presentation deck (PDF)
- `/sql` – SQL queries used for analysis
- `/images` – Key visualization screenshots

## Tools & Technologies
- SQL (Dune Analytics)
- Data Visualization (Dune dashboards)
- PowerPoint (presentation design)

## Notes
This project was completed as part of a data analytics assignment. All analysis, interpretations, and conclusions were developed independently.

## Dashboard
🔗 https://dune.com/pariswei/usdc-growth-analysis-dashboard
