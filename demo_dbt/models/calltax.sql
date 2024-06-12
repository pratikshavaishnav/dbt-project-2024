-- models/calltax.sql
WITH order_data AS (
    SELECT
        oc.O_ORDERKEY,
        oc.O_TOTALPRICE,
        oc.O_ORDERDATE,
        {{ taxcal('oc.O_TOTALPRICE', 12) }} AS totalprice_with_tax
    FROM
        {{ source('clone_database_sample', 'ordersclone') }} oc
  )

SELECT * FROM order_data