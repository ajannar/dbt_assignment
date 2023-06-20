{% macro date_difference(enddate,startdate,term) %}
    date_diff( {{ enddate }} ,{{ startdate }}, {{ term }} )
{% endmacro %}


