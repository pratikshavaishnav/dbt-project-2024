{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

with last_run as (
    select coalesce(max(received_at), '1900-01-01') as max_received_at
    from {{ this }}
)

select
    date_trunc('day', e.received_at) as date_day,
    count(distinct e.id) as daily_active_users

from {{ source('clone_database_sample','employee_details') }} as e

{% if is_incremental() %}
  join last_run lr
  on e.received_at >= lr.max_received_at
{% endif %}

group by 1