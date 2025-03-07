
  
  create view "dbt"."main"."fato_transactions__dbt_tmp" as (
    

WITH src_transactions AS (
  SELECT * FROM "dbt"."main"."src_transactions"
)

SELECT
 transaction_id,
 time_of_transaction,
 ean as ean_of_product,
 store,
 price,
 CASE
   WHEN price > 20 THEN TRUE
   ELSE FALSE
 END AS price_greater_than_20,
 CASE
   WHEN EXTRACT(HOUR FROM time_of_transaction) < 12 THEN 'Manhã'
   WHEN EXTRACT(HOUR FROM time_of_transaction) >= 12 AND EXTRACT(HOUR FROM time_of_transaction) < 15 THEN 'Meio Dia'
   ELSE 'Noite'
 END AS periodo_do_dia
FROM
 src_transactions
  );
