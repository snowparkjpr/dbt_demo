
    {{
      config(
        materialized = 'incremental',
        unique_key = 'd_date',
        alias = 'incremental_date_slots',
        schema = 'jp_test'
        )
    }}


select * from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.DATE_DIM
where d_date <= current_date

{% if is_incremental() %}
  and d_date >= coalesce((select max(d_date) from {{ this }}), '1900-01-01')
{% endif %}