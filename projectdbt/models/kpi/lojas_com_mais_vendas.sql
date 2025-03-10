{{
 config(
 materialized = 'table',
 )
}}

WITH fato_transcations AS (
    SELECT *
    FROM {{ref('fato_transactions')}}
)

SELECT store, ROUND(SUM(price), 2) as total_margin
FROM fato_transcations
GROUP BY store
ORDER BY total_margin DESC
LIMIT 5