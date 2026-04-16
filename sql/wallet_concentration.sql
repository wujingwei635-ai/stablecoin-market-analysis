-- Purpose:
-- Identify the top 20 wallets by total USDC received.

-- Logic:
-- Aggregate USDC transfer values by receiving address,
-- rank wallets by total volume, and return the top 20.

SELECT
    "to" AS wallet,
    SUM(CAST(value AS DOUBLE)) / 1e6 AS usdc_received
FROM erc20_ethereum.evt_Transfer
WHERE contract_address = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
GROUP BY 1
ORDER BY 2 DESC
LIMIT 20;
