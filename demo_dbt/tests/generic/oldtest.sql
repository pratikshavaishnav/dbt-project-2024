{% test is_alphabet(model, column_name) %}
 
 
with validation_errors as (
 
    select
        {{ column_name }} as col
    from {{ model }}
    where  not lower( {{ column_name }} ) regexp '^[0-9]+$'
 
)
 
select *
from validation_errors
 
{% endtest %}