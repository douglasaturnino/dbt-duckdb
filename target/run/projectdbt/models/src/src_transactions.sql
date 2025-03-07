
  
  create view "dbt"."main"."src_transactions__dbt_tmp" as (
    SELECT * 
FROM 's3://dagshub/douglasaturnino/dbt-duckdb/consolidado/consolidado.parquet'
  );
