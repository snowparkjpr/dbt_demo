    {{
      config(
        materialized = 'incremental',
        unique_key = 'TIM_SLOT',
        )
    }}

SELECT * FROM
(SELECT D.*,TO_TIME(CONCAT(T_HOUR::VARCHAR,':',T_MINUTE::VARCHAR,':',T_SECOND::VARCHAR)) AS TIM_SLOT 
FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM D)
WHERE TIM_SLOT<=CURRENT_TIME

 {% if is_incremental() %}
  and TIM_SLOT > (select max(TIM_SLOT) from {{ this }})
{% endif %}