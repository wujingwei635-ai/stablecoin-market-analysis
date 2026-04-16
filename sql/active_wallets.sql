-- Purpose:
-- Count the number of daily active wallets interacting with USDC.

-- Logic:
-- Treat both sender and receiver addresses as active wallets,
-- combine them using UNION, and count distinct wallet addresses per day.

WITH transfers AS (
    SELECT
        date_trunc('day', evt_block_time) AS day,
        "from" AS wallet
    FROM erc20_ethereum.evt_Transfer
    WHERE contract_address = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
      AND evt_block_time >= NOW() - INTERVAL '180' DAY

    UNION

    SELECT
        date_trunc('day', evt_block_time) AS day,
        "to" AS wallet
    FROM erc20_ethereum.evt_Transfer
    WHERE contract_address = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
      AND evt_block_time >= NOW() - INTERVAL '180' DAY
)

SELECT
    day,
    COUNT(DISTINCT wallet) AS active_wallets
FROM transfers
GROUP BY day
ORDER BY day;
