select
order_id ,
customer_id,
order_date,
order_status,
amount
from {{ source('raw_cust', 'orders') }}

{% if is_incremental %}
WHERE order_id > (select Max(order_id) from {{this}})
{% endif %}