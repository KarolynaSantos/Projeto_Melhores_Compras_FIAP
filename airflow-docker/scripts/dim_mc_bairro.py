from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['NOME_BAIRRO', 'NR_POPULACAO_BAIRRO', 'NR_NIVEL_SEGURANCA', 'NOME_CIDADE']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'NOME_BAIRRO', 'NR_POPULACAO_BAIRRO', 'NR_NIVEL_SEGURANCA', 'NOME_CIDADE']]

# Consulta para ler a tabela dim_mc_estado
query = "SELECT * FROM dim_mc_cidade"
df_estado = ler_tabela(query)

# Lendo a tabela dim_mc_cidade e fazendo merge
df_estado = df.merge(df_estado, left_on='NOME_CIDADE', right_on='nm_cidade')

# selecionar colunas que vão para a tabela
df_estado = df_estado[['sk_cidade', 'NOME_BAIRRO', 'NR_POPULACAO_BAIRRO', 'NR_NIVEL_SEGURANCA']]

# Renomeando df
df_estado.columns = ['dim_mc_cidade', 'nm_bairro', 'nr_populacao', 'nr_nivel_seguranca'] #colunas da tabela

insert_into(df=df_estado, nome_tabela='dim_mc_bairro')
