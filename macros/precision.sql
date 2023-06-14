{% macro precision(value,decimal_places=2) %}
    round({{value}},{{decimal_places}})
{% endmacro %}

