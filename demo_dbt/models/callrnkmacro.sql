WITH RankedBalances AS (
    {{ rnkbalance() }}
)

SELECT 
    A.N_NAME,
    A.TotalBalance,
    A.rnk
FROM 
    RankedBalances AS A
WHERE 
    A.rnk <= 3
