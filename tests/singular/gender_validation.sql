select * 
from {{ ref('customer_analysis') }}
where gender NOT IN ('Male', 'Female')