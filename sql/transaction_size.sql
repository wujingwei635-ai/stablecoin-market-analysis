-- Purpose:
-- Analyze USDC transaction size patterns over time.

-- Logic:
-- Compute both average and median transaction size per day.
-- The average captures large-value transactions,
-- while the median reflects typical transaction size by reducing outlier effects.

SELECT
    date_trunc('day', evt_block_time) AS day,
    AVG(CAST(value AS DOUBLE) / 1e6) AS avg_tx_size,
    APPROX_PERCENTILE(CAST(value AS DOUBLE) / 1e6, 0.5) AS median_tx_size
FROM erc20_ethereum.evt_Transfer
WHERE contract_address = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
  AND evt_block_time >= NOW() - INTERVAL '180' DAY
GROUP BY 1
ORDER BY 1;
