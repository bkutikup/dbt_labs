with product as (
    -- Extract raw product data from the prod_data schema
    select * from {{ source('raw_prod', 'PRODUCT') }}
),
delivery as (
    -- Extract raw delivery status data from the prod_data schema
    select * from {{ source('raw_cust', 'delivery') }}
)
select
    p.product_id,                                      -- Unique identifier for product
    p.product_name,                                    -- Name of the product
    upper(p.category) as category,                     -- Standardized category name in uppercase
    p.price as unit_price,                             -- Adjusted column name
    TO_CHAR(d.delivery_date, 'DD-MM-YYYY') as delivery_date   -- Delivery date snowflake date formt yyyy--mm--dd so have to make as string 
from product p
join delivery d
on p.product_id = d.product_id                       -- Join on product_id to link delivery info
