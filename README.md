## Workshop03: DuckDB e DBT

![Texto alternativo](capa.png)


### Onde estamos?
Conseguimos ter os nossos dados da API, banco SQL e EXCEL em nosso Data Lake. Mas como transformar esses dados em valor para o negócio?

### Objetivo 
Este repositório contém a segunda parte do projeto Workshop03, que demonstra o uso do DuckDB em conjunto com o DBT para análise de dados. O projeto é ideal para aqueles que estão buscando integrar DuckDB com ferramentas modernas de transformação de dados.

Precisamos responder:

- Qual a loja com receita venda?
- Quais sas 5 lojas com mais e com menos venda?
- Quais 10 produtos tiveram a maior receita?

## Documentação

Mkdocs: [Github-Pages](https://douglasaturnino.github.io/dbt-duckdb/)


## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes pré-requisitos instalados em seu sistema:

- Git
- Python (recomendado 3.12)
- uv para gerenciamento de dependências Python


### Como instalar?

Pré requisitos - Esse projeto utiliza o [DataProjectStarterKit](https://github.com/lvgalvao/DataProjectStarterKit) como base

## Instalação

Siga estas etapas para instalar e configurar o projeto em seu ambiente local:

### Clonando o Repositório

Clone o repositório para sua máquina local usando o seguinte comando:

```bash
git clone git@github.com:douglasaturnino/dbt-duckdb.git
cd dbt-duckdb
```

### Configurando o Ambiente Python

Se estiver usando `uv`, configure a versão local do Python para o projeto:

```bash
uv venv -p 3.12
```

### Instalando Dependências

Instale as dependências do projeto usando uv:

```bash
uv sync
```

Isso instalará todas as dependências listadas no arquivo `pyproject.toml`.

Teste executando o comando

```
bash
duckdb
```

## Documentação

Mkdocs: [Github-Pages](https://douglasaturnino.github.io/dbt-duckdb/)

## Uso

Depois de instalar, você pode começar a usar o projeto. (Aqui, você pode adicionar instruções específicas sobre como executar scripts ou comandos relevantes para o projeto.)