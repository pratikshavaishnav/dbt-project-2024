{% test region_name(model, column_name) %}
 
with invalid_marital_status as (
    select
        {{ column_name }} as col
    from {{ model }}
    where ({{ column_name }}) NOT IN ('AMERICA', 'ASIA', 'MIDDLE EAST')
)
 
select *
from {{source('clone_database_sample','regionclone')}}
 
{% endtest %}
 