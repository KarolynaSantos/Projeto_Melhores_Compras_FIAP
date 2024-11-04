from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela
import pandas as pd

df = pegar_arquivo_xls()

# Selecionando colunas necessarias
df = df[['NOME_PRODUTO', 'EMBALAGEM', 'SUBCATEGORIA']]

df.index = df.index + 1
df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'NOME_PRODUTO', 'EMBALAGEM', 'SUBCATEGORIA']]

# Consulta para ler a tabela dim_mc_estado
query = "SELECT * FROM dim_mc_sub_categoria_prod"
df_prod = ler_tabela(query)

# Lendo a tabela dim_mc_categoria_prod
df_prod = df.merge(df_prod, left_on='SUBCATEGORIA', right_on='nm_sub_categoria_prod')

# Alterando tipo para int
df_prod['sk_sub_categoria_prod'] = df_prod['sk_sub_categoria_prod'].astype(int)

# selecionar colunas que vão para a tabela
df_prod = df_prod[['sk_sub_categoria_prod','NOME_PRODUTO', 'EMBALAGEM']]

# Renomeando df
df_prod.columns = ['dim_mc_sub_categoria_prod', 'nm_produto', 'nm_tipo_embalagem'] #colunas da tabela

insert_into(df=df_prod, nome_tabela='dim_mc_produto')







