{% macro date_difference(column1,column2,part) %}
    date_diff( {{ column1 }} ,{{ column2 }}, {{ part }} )
{% endmacro %}

