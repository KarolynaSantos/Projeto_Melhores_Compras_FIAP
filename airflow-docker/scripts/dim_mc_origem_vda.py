from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['ORIGEM_VENDA']].drop_duplicates().reset_index(drop=True)
df.index = df.index + 1

df['ID'] = df.index

df = df[['ID', 'ORIGEM_VENDA']]

# selecionar colunas que vão para a tabela
df = df[['ORIGEM_VENDA']]

# Renomeando df
df.columns = ['ds_origem_venda'] #colunas da tabela

insert_into(df=df, nome_tabela='dim_mc_origem_vda')

