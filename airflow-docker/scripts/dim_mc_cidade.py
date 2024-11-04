from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela
import pandas as pd

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['NOME_CIDADE', 'NR_POPULACAO', 'CODIGO_IBGE','ALTITUDE','SIGLA_ESTADO']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'NOME_CIDADE', 'NR_POPULACAO', 'CODIGO_IBGE','ALTITUDE','SIGLA_ESTADO']]

# Consulta para ler a tabela dim_mc_estado
query = "SELECT * FROM dim_mc_estado"
df_estado = ler_tabela(query)

# Lendo a tabela dim_mc_estado
df_estado = df.merge(df_estado, left_on='SIGLA_ESTADO', right_on='sg_estado')

# selecionar colunas que vão para a tabela
df_estado = df_estado[['NOME_CIDADE', 'NR_POPULACAO', 'CODIGO_IBGE','ALTITUDE','SIGLA_ESTADO']]

# Renomeando df
df_estado.columns = ['dim_mc_estado', 'nm_cidade', 'nr_populacao', 'cd_ibge', 'nr_altitude_mar'] #colunas da tabela

# Convertendo tipos de dados no DataFrame para evitar problemas no SQL Server
df_estado['nr_populacao'] = pd.to_numeric(df_estado['nr_populacao'], errors='coerce')
df_estado['cd_ibge'] = pd.to_numeric(df_estado['cd_ibge'], errors='coerce')
df_estado['nr_altitude_mar'] = pd.to_numeric(df_estado['nr_altitude_mar'], errors='coerce')


insert_into(df=df_estado, nome_tabela='dim_mc_cidade')