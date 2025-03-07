-- Instala extensões necessáriasInstall extensions
INSTALL httpfs;
LOAD httpfs;
-- Minimum configuration for loading S3 dataset if the bucket is public
SET s3_region='us-west-1';
SET s3_access_key_id='<s3_access_key_id>';
SET s3_secret_access_key='<s3_secret_access_key>';
-- Cria a tabela lendo dos arquivos parquet
CREATE TABLE transactions AS SELECT * FROM read_parquet('s3://dagshub/douglasaturnino/dbt-duckdb/vendas/*.parquet');
FROM transactions;
SHOW transactions;

-- Mais venda
SELECT store, ROUND(SUM(price), 2) as total_margin
FROM transactions
GROUP BY store
ORDER BY total_margin DESC
LIMIT 1;

-- Top 5 Lojas com Mais Vendas
SELECT store, COUNT(*) as total_sales
FROM transactions
GROUP BY store
ORDER BY total_sales DESC
LIMIT 5;

-- Top 5 Lojas com Menos Vendas
SELECT store, COUNT(*) as total_sales
FROM transactions
GROUP BY store
ORDER BY total_sales
LIMIT 5;

-- 10 Produtos com mais receita
SELECT product_name, ROUND(SUM(price), 2) as total_revenue
FROM transactions
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Exportando uma query
COPY (SELECT product_name, ROUND(SUM(price), 2) as total_revenue
    FROM transactions
    GROUP BY product_name
    ORDER BY total_revenue DESC
    LIMIT 10)
TO 's3://dagshub/douglasaturnino/dbt-duckdb/vendas/kpi.csv' WITH (FORMAT CSV, HEADER);


-- Refazendo

-- Instala extensões necessáriasInstall extensions
INSTALL httpfs;
LOAD httpfs;
-- Minimum configuration for loading S3 dataset if the bucket is public
SET s3_region='us-east-1';
SET s3_access_key_id='<s3_access_key_id>';
SET s3_secret_access_key='<s3_secret_access_key>';
SET s3_endpoint ='com/api/v1/repo-buckets/s3';



CREATE TABLE transactions_consolidado (
    transaction_id UUID,
    time_of_transaction TIMESTAMP,
    ean BIGINT,
    name_of_product VARCHAR(255),
    price DECIMAL(10, 2),
    store INTEGER,
    operator INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Define o valor padrão como o timestamp atual
    source_path VARCHAR
);

-- Carrega dados do arquivo CSV para a tabela temporária, incluindo o nome do arquivo
CREATE TABLE temp_table AS SELECT *, CURRENT_TIMESTAMP AS created_at FROM read_parquet('../data/consolidado.parquet');

-- Insere dados da tabela temporária para a tabela principal com nomes de colunas modificados
INSERT INTO transactions_consolidado (transaction_id, time_of_transaction, ean, name_of_product, price, store, operator, source_path)
SELECT transaction_id, time_of_transaction, ean, name_of_product, price, store, operator, filename FROM temp_table;

-- Remove a tabela temporária
DROP TABLE temp_table;

-- Verifica os dados inseridos
SELECT * FROM transactions_consolidado;

-- Exportando uma tabela completa
COPY transactions_consolidado TO 's3://dagshub/douglasaturnino/dbt-duckdb/consolidado/consolidado.parquet';


-- Drop table
DROP TABLE transactions;