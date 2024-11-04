from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
d# Selecionando a coluna necessaria
df = df[['STATUS VENDA']].drop_duplicates().reset_index(drop=True)
df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'STATUS VENDA']]

# selecionar colunas que vão para a tabela
df = df[['STATUS VENDA']]

# Renomeando df
df.columns = ['ds_status_venda'] #colunas da tabela

insert_into(df=df, nome_tabela='dim_mc_status_venda')

