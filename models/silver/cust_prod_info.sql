select  
    c.CUST_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.FULL_NAME,
    c.EMAIL,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE
 from {{ ref('customer_info') }} c 
join
{{ ref('prod_info') }} p 
on c.CUST_ID = p.CUSTOMER_ID
