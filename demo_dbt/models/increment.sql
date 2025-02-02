{{ 
    config(
        materialized='incremental',
        unique_key='id'
    ) 
}}

select 
    * 
from 
    {{ source('clone_database_sample', 'employee_details') }}

{% if is_incremental() %}
    where 
        received_at > (select max(received_at) from {{ this }})
{% endif %}
