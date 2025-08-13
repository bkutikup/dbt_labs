SELECT
    {{ dbt_utils.star(from=source('raw_cust', 'SALES_ORDERS')) }}
FROM {{ source('raw_cust', 'SALES_ORDERS') }}