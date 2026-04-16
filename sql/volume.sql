-- Purpose:
-- Calculate daily USDC transaction volume over the last 180 days.

-- Logic:
-- Filter USDC transfer events from ERC-20 transfers,
-- aggregate transfer values by day, and convert raw token units to standard USDC units (6 decimals).

SELECT
    date_trunc('day', evt_block_time) AS day,
    SUM(CAST(value AS DOUBLE)) / 1e6 AS volume_usd
FROM erc20_ethereum.evt_Transfer
WHERE contract_address = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
  AND evt_block_time >= NOW() - INTERVAL '180' DAY
GROUP BY 1
ORDER BY 1;
