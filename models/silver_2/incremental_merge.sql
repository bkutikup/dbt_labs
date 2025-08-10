{{
    config(
        materialized='incremental',
        unique_key = 'order_id',
        query_tag = 'dbt',
        on_schema_change = 'sync_all_columns'
    )
}}

select
*
from {{ source('raw_cust', 'orders') }}

{% if is_incremental() %}
WHERE order_date >= dateadd(day, -20, current_date)
{% endif %}
