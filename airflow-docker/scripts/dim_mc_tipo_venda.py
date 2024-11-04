from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['TIPO_VENDA']].drop_duplicates().reset_index(drop=True)
df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'TIPO_VENDA']]

# selecionar colunas que vão para a tabela
df = df[['TIPO_VENDA']]

# Renomeando df
df.columns = ['ds_tipo_vnda'] #colunas da tabela

insert_into(df=df, nome_tabela='dim_mc_tipo_venda')
