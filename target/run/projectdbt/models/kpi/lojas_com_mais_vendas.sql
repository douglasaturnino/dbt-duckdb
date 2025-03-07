
  
    
    

    create  table
      "dbt"."main"."lojas_com_mais_vendas__dbt_tmp"
  
    as (
      

WITH fato_transcations AS (
    SELECT *
    FROM "dbt"."main"."fato_transactions"
)

SELECT store, ROUND(SUM(price), 2) as total_margin
FROM fato_transcations
GROUP BY store
ORDER BY total_margin DESC
LIMIT 5
    );
  
  