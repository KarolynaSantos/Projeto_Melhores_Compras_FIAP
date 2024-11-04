from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela
import pandas as pd

df = pegar_arquivo_xls()

# Agrupando o DataFrame por 'CATEGORIA' e 'ST_CATEGORIA', calculando a média de 'NR_AVALIACAO_CATEGORIA'
df = (
    df.groupby(['SUBCATEGORIA', 'ST_SUB_CATEGORIA','CATEGORIA'], as_index=False)
    .agg({'NR_AVALIACAO_SUB_CATEGORIA': 'mean'})
    .drop_duplicates()
    .reset_index(drop=True)
)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'SUBCATEGORIA', 'ST_SUB_CATEGORIA', 'NR_AVALIACAO_SUB_CATEGORIA','CATEGORIA']]

# Consulta para ler a tabela dim_mc_estado
query = "SELECT * FROM dim_mc_categoria_prod"
df_catgo = ler_tabela(query)

# Lendo a tabela dim_mc_categoria_prod
df_catgo = df.merge(df_catgo, left_on='CATEGORIA', right_on='nm_categoria_prod')

# Alterando tipo para int
df_catgo['NR_AVALIACAO_SUB_CATEGORIA'] = df_catgo['NR_AVALIACAO_SUB_CATEGORIA'].astype(int)

# selecionar colunas que vão para a tabela
df_catgo = df_catgo[['sk_categoria_prod','SUBCATEGORIA', 'ST_SUB_CATEGORIA', 'NR_AVALIACAO_SUB_CATEGORIA']]

# Renomeando df
df_catgo.columns = ['dim_mc_categoria_prod', 'nm_sub_categoria_prod', 'st_sub_categoria', 'qt_nota_sub_categoria_prod'] #colunas da tabela

insert_into(df=df_catgo, nome_tabela='dim_mc_sub_categoria_prod')







