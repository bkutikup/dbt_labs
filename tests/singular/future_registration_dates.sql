select * 
from {{ ref('customer_analysis') }}
where registered_on > CURRENT_DATE