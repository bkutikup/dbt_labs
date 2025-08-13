{% macro calculate_expiry(activate_on, validate_days) %}
    DATEADD(day, {{validate_days}}, {{activate_on}})
{% endmacro %}


