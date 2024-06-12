{{
    config(materialized='ephemeral')
}}
select O_CUSTKEY,O_ORDERKEY,O_ORDERDATE,O_TOTALPRICE from clone_database_sample.tpch1_sf1_clone.ordersclone  where O_TOTALPRICE>20000