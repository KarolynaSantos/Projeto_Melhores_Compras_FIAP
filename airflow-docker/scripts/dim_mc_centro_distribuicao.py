from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['NOME_CENTRO_DISTRIBUICAO']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'NOME_CENTRO_DISTRIBUICAO']]

# selecionar colunas que vão para a tabela
df = df[['NOME_CENTRO_DISTRIBUICAO']]

# Renomeando df
df.columns = ['nm_centro_distribuicao'] #colunas da tabela

insert_into(df=df, nome_tabela='dim_mc_centro_distribuicao')

