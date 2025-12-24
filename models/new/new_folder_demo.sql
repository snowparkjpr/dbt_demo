{{ config(materialized='table') }}

with source_data as (

    select 5 as id
    union all
    select 6 as id
    union all
    select 7 as id

)

select *
from source_data
where id is not null