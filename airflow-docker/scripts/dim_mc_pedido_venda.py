from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Converte as colunas para o tipo int
df['NR_PEDIDO'] = df['NR_PEDIDO'].astype(int)
df['NR_ITEM'] = df['NR_ITEM'].astype(int)

# Selecionando a coluna necessaria
df = df[['NR_PEDIDO', 'NR_ITEM']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['NR_PEDIDO', 'NR_ITEM']]

# Renomeando df
df.columns = ['nr_pedido_origem', 'nr_item_pedido_origem'] #colunas da tabela

insert_into(df=df, nome_tabela='dim_mc_pedido_venda')

