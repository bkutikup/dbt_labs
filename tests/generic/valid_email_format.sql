{% test valid_email_format(model, column_name) %}

{{
    config(
        severity ='error'
    )
}}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} NOT LIKE '%@%.%'

{% endtest %}