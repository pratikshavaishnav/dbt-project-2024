{% snapshot orderhistory %}

{{
config(
    target_schema='tpch1_sf1_clone',
    unique_key='C_CUSTKEY',
    strategy='check',
    check_cols=['C_ADDRESS'] 
)
}}

select * from {{source('clone_database_sample','customerclone')}}

{% endsnapshot %}