from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela
import pandas as pd

df = pegar_arquivo_xls()

# ASelecioandno colunas e retirando duplicatas
df = df[['NOME_PRODUTO', 'EMBALAGEM', 'SUBCATEGORIA']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'NOME_PRODUTO', 'EMBALAGEM', 'SUBCATEGORIA']]

# Consulta para ler a tabela dim_mc_sub_categoria_prod
query = "SELECT * FROM dim_mc_sub_categoria_prod"
df_sub_catgo = ler_tabela(query)

# Lendo a tabela dim_mc_categoria_prod
df_sub_catgo = df.merge(df_sub_catgo, left_on='SUBCATEGORIA', right_on='nm_sub_categoria_prod')

# selecionar colunas que vão para a tabela
df_sub_catgo = df_sub_catgo[['sk_sub_categoria_prod', 'NOME_PRODUTO', 'EMBALAGEM']]

# Renomeando df
df_sub_catgo.columns = ['dim_mc_sub_categoria_prod', 'nm_produto', 'nm_tipo_embalagem'] #colunas da tabela

insert_into(df=df_sub_catgo, nome_tabela='dim_mc_produto')


