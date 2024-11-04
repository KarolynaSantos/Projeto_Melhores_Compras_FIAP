from aux_blob import pegar_arquivo_xls, insert_into

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['NOME_REGIAO']].drop_duplicates().reset_index(drop=True)
df.index = df.index + 1

df['ID'] = df.index

df = df[['NOME_REGIAO']]

# Renomeando df
df.columns = ['nm_regiao']

insert_into(df=df, nome_tabela='dim_mc_regiao')