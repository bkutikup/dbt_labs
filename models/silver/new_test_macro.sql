{% set customers_tbl = 'TELECOM_CUSTOMERS' %}
{% set plans_tbl = 'TELECOM_PLANS' %}

{{ 
    filter_telecom_data(
        customers_tbl, 
        plans_tbl
    ) 
}}

