from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
# Agrupando o DataFrame por 'CATEGORIA' e 'ST_CATEGORIA', calculando a média de 'NR_AVALIACAO_CATEGORIA'
df = (
    df.groupby(['CATEGORIA', 'ST_CATEGORIA'], as_index=False)
    .agg({'NR_AVALIACAO_CATEGORIA': 'mean'})
    .drop_duplicates()
    .reset_index(drop=True)
)

# Convertendo a coluna 'NR_AVALIACAO_CATEGORIA' para inteiro
df['NR_AVALIACAO_CATEGORIA'] = df['NR_AVALIACAO_CATEGORIA'].astype(int)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'CATEGORIA', 'ST_CATEGORIA','NR_AVALIACAO_CATEGORIA']]

# selecionar colunas que vão para a tabela
df = df[['CATEGORIA', 'ST_CATEGORIA','NR_AVALIACAO_CATEGORIA']]

# Renomeando df
df.columns = ['nm_categoria_prod', 'st_categoria', 'qt_nota_categoria_prod'] #colunas da tabela

insert_into(df=df, nome_tabela='dim_mc_categoria_prod')




