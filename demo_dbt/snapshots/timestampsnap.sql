{% snapshot my_snapshot %}
    {{ config(
        target_schema='tpch1_sf1_clone',
        unique_key='O_ORDERKEY',
        strategy='timestamp',
        updated_at='O_ORDERDATE'
    ) }}
 
  select * from {{source('clone_database_sample','ordersclone')}}
{% endsnapshot %}