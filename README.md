# Projeto Melhores Compras - ETL com Azure SQL e Modelo Dimensional Snowflake

## Contexto do Projeto
A empresa Melhores Compras está expandindo sua infraestrutura de dados com o objetivo de aprimorar as operações de estoque e análise de satisfação nas entregas. O projeto visa a construção de um Data Mart de Índice de Satisfação na Entrega de Produtos, com dados armazenados e tratados em uma estrutura de dados na nuvem utilizando o Azure SQL. A próxima etapa envolve a implementação de um pipeline de ETL para o carregamento de dados em um Modelo de Dados Dimensional Snowflake, proporcionando maior agilidade e insights mais precisos para a tomada de decisões.

## Objetivo do Projeto
Este projeto tem como principal objetivo criar um processo de ingestão de dados usando uma ferramenta ETL para popular um Modelo Dimensional Snowflake no Azure SQL, facilitando análises avançadas e monitoramento de métricas de satisfação na entrega de produtos.

## Etapas do Projeto
### 1. Configuração do Ambiente na Nuvem
Foi criada uma conta de armazenamento no Azure denominada "mcfiap", configurada com:

* Região: East US (mais econômica).
* Desempenho: Standard (uso padrão).
* Redundância de Dados: Local.

Dentro dessa conta, foi criado um contêiner chamado "Bronze" para armazenar dados brutos, que ainda não foram processados. Neste contêiner, carregamos o arquivo "Dados_Entrega_CentroDistribuicao_v1" contendo informações de entregas realizadas pelos centros de distribuição da empresa.

**Objetivo do Contêiner Bronze:**

O armazenamento do arquivo em Bronze visa facilitar o acesso aos dados para etapas futuras de análise e processamento. Este processo organiza os dados em níveis que incluem "Silver" e "Gold", onde as informações são refinadas e preparadas para relatórios e análises.

### 2. Processo de ETL - Pipeline de Dados
Com as tabelas criadas no banco de dados Azure SQL "MelhoresComprasDB", desenvolvemos um pipeline ETL utilizando o Apache Airflow. O Airflow foi configurado em um ambiente Docker, garantindo escalabilidade e portabilidade. A arquitetura do pipeline é composta por:

* Script docker-compose.yaml: Define os serviços e configurações do Airflow no Docker.
* Dockerfile: Personaliza o ambiente com as dependências do Airflow.
* Script install_airflow_docker.ps1: Automatiza a instalação e * inicialização do Airflow no Docker.
* O pipeline ETL extrai dados do arquivo Excel armazenado no Blob Storage da Azure, transforma-os, e carrega-os nas tabelas dimensionais do Azure SQL. Esse processo inclui limpeza e normalização dos dados, assegurando que estejam prontos para análises e relatórios.

**Benefícios do Pipeline ETL com Airflow:** 

A automação proporcionada pelo Airflow garante uma infraestrutura de dados eficiente, permitindo agilidade e confiabilidade nas atualizações de dados para as dimensões. Essa abordagem melhora diretamente a qualidade das decisões baseadas em dados.

### 3. Validação e Consultas Iniciais
Após o carregamento dos dados, realizamos uma série de consultas SQL para validar a integridade e consistência dos dados nas tabelas dimensionais. As consultas foram essenciais para verificar a qualidade das informações e extrair insights iniciais para futuras análises.

## Script de Criação: cria.sql
Este script contém a definição do modelo relacional, com a criação de todas as tabelas dimensionais listadas abaixo. Cada tabela possui seus atributos específicos para representar as dimensões de negócio da empresa Melhores Compras.

[Link para o script](C:\Users\Karol\OneDrive\Documentos\GitHub\Projeto_Melhores_Compras_FIAP\cria.sql)
cria.sql 


Exemplo de criação para a tabela dim_mc_cidade:

```sql
Copiar código
CREATE TABLE dim_mc_cidade 
    (
     sk_cidade NUMERIC (28) NOT NULL IDENTITY(1,1), 
     dim_mc_estado NUMERIC (28) NOT NULL , 
     nm_cidade VARCHAR (25) NOT NULL , 
     nr_populacao NUMERIC (10) , 
     cd_ibge NUMERIC (8) , 
     nr_altitude_mar NUMERIC (8) 
    );
```


**Tabelas Criadas**
* dim_mc_bairro
* dim_mc_categoria_prod
* dim_mc_centro_distribuicao
* dim_mc_cidade
* dim_mc_cliente
* dim_mc_estado
* dim_mc_forma_pagto
* dim_mc_origem_vda
* dim_mc_pedido_venda
* dim_mc_produto
* dim_mc_regiao
* dim_mc_status_venda
* dim_mc_sub_categoria_prod
* dim_mc_sub_produto
* dim_mc_tipo_venda

## Script de Remoção: apaga.sql
Este script elimina as tabelas no banco de dados, permitindo limpar e redefinir o ambiente antes de uma nova carga.

[Link para o script](C:\Users\Karol\OneDrive\Documentos\GitHub\Projeto_Melhores_Compras_FIAP\apaga.sql) apaga.sql

Exemplo de remoção para a tabela dim_mc_cidade:

```sql
Copiar código
DROP TABLE IF EXISTS dim_mc_cidade;
```