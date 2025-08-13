SELECT
    customer_id,
    full_name,
    {{ standardize_state('state') }} AS standardized_state,
    city,
    {{ mask_mobile('mobile_number') }} AS masked_mobile,
    email,
    gender,
    age,
    registered_on
FROM {{ source('raw_cust', 'TELECOM_CUSTOMERS') }}