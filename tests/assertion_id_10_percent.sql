select
sum(case when id is not null then 1 else 0 end)/count(*) as fail_cnt
from {{ref("my_first_dbt_model")}}
having sum(case when id is not null then 1 else 0 end)/count(*) > 0.9