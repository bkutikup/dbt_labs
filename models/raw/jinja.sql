{% set list = ['Snowflake', 'dbt', 'AWS'] %}

SELECT tech FROM (
    {%- for i in list %}
        SELECT '{{ i }}' AS tech
        {%- if not loop.last %} UNION ALL {% endif %}
    {%- endfor %}
) AS technology_list