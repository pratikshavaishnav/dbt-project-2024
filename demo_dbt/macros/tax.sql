{% macro taxcal(O_TOTALPRICE_column,tax_percent=12)%}

round({{O_TOTALPRICE_column}}+{{O_TOTALPRICE_column}}*{{tax_percent}}/100)
{%endmacro%}