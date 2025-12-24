SELECT sum(c_acctbal) as acctbal from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
group by c_acctbal
having sum(c_acctbal) > 1000