{% macro extract_from_timestamp(timestamp,part) %}
    extract({{ part }} from {{ timestamp }})
{% endmacro %}


