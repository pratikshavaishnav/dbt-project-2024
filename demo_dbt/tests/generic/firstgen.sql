{% test primary_key(model, column_name) %}

with validation as (
    select
    {{column_name}} as primary_key,
    count(1) as occurances

    from {{model}}
    group by 1)

select *
from validation
where primary_key is null
or occurances >1

{% endtest %}
