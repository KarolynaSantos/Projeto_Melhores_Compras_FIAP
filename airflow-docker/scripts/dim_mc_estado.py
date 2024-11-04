from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela
import pandas as pd

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['SIGLA_ESTADO', 'NOME_ESTADO', 'GENTILICO', 'NOME_REGIAO']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'SIGLA_ESTADO', 'NOME_ESTADO', 'GENTILICO','NOME_REGIAO']]

# Consulta para ler a tabela dim_mc_estado
query = "SELECT * FROM dim_mc_regiao"
df_regiao = ler_tabela(query)

# Lendo a tabela dim_mc_cidade e fazendo merge
df_regiao = df.merge(df_regiao, left_on='NOME_REGIAO', right_on='nm_regiao')

# selecionar colunas que vão para a tabela
df_regiao = df_regiao[['sk_regiao','SIGLA_ESTADO', 'NOME_ESTADO', 'GENTILICO']]

# Renomeando df
df_regiao.columns = ['dim_mc_regiao', 'sg_estado', 'nm_estado', 'nm_gentilico'] #colunas da tabela

# Convertendo tipos de dados no DataFrame para evitar problemas no SQL Server
df_regiao['dim_mc_regiao'] = pd.to_numeric(df_regiao['dim_mc_regiao'], errors='coerce')

insert_into(df=df_regiao, nome_tabela='dim_mc_estado')


