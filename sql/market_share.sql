-- Purpose:
-- Estimate USDC's market share relative to major stablecoins (USDC + USDT).

-- Logic:
-- First compute daily USDC volume.
-- Then compute total stablecoin volume using USDC and USDT.
-- Finally, join both datasets on date to calculate USDC's share of total volume.

WITH usdc AS (
    SELECT
        date_trunc('day', evt_block_time) AS day,
        SUM(CAST(value AS DOUBLE)) / 1e6 AS usdc_volume
    FROM erc20_ethereum.evt_Transfer
    WHERE contract_address = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
      AND evt_block_time >= NOW() - INTERVAL '180' DAY
    GROUP BY 1
),

stablecoins AS (
    SELECT
        date_trunc('day', evt_block_time) AS day,
        SUM(CAST(value AS DOUBLE)) / 1e6 AS total_volume
    FROM erc20_ethereum.evt_Transfer
    WHERE contract_address IN (
        0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48, -- USDC
        0xdac17f958d2ee523a2206206994597c13d831ec7  -- USDT
    )
      AND evt_block_time >= NOW() - INTERVAL '180' DAY
    GROUP BY 1
)

SELECT
    u.day,
    u.usdc_volume,
    s.total_volume,
    (u.usdc_volume / s.total_volume) * 100 AS market_share_pct
FROM usdc u
JOIN stablecoins s
    ON u.day = s.day
ORDER BY u.day;
