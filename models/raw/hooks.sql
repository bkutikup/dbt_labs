{{ 
    config(
        pre_hook = [
            "INSERT INTO SNOWFLAKE_DBT_DATE.SF_SCHEMA.MODEL_RUN_AUDIT (model_name, execution_time_start) VALUES ('hooks', CURRENT_TIMESTAMP)"
        ],
        post_hook = [
            "UPDATE SNOWFLAKE_DBT_DATE.SF_SCHEMA.MODEL_RUN_AUDIT SET execution_time_end = CURRENT_TIMESTAMP, row_count = (SELECT COUNT(*) FROM {{ this }}) WHERE model_name = 'hooks' AND execution_time_end IS NULL"
        ]
    ) 
}}

SELECT
    customer_id,
    full_name,
    email,
    gender,
    age,
    city,
    state,
    registered_on
FROM {{ source('tele_customer', 'TELECOM_CUSTOMERS') }}