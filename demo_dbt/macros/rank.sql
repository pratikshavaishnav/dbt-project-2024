{% macro rnkbalance() %}
SELECT 
        nc.N_NAME,
        SUM(sc.S_ACCTBAL) AS TotalBalance,
        DENSE_RANK() OVER (ORDER BY SUM(sc.S_ACCTBAL) DESC) AS rnk
    FROM 
        {{ source('clone_database_sample', 'supplierclone') }} sc
    INNER JOIN 
        {{ source('clone_database_sample', 'nationclone') }} nc
    ON 
        sc.s_nationkey = nc.n_nationkey
    GROUP BY 
        nc.N_NAME
{% endmacro %}

