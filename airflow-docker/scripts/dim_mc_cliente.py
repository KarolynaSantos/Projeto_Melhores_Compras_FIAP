from aux_blob import pegar_arquivo_xls, insert_into, ler_tabela
from decimal import Decimal
from pandas import Timestamp

df = pegar_arquivo_xls()

# Selecionando a coluna necessaria
df = df[['NOME_CLIENTE', 'NR_ESTRELAS', 'ST_CLIENTE', 'DT_NASCIMENTO']].drop_duplicates().reset_index(drop=True)

df.index = df.index + 1

df['ID'] = df.index

# Selecionando colunas necessarias
df = df[['ID', 'NOME_CLIENTE', 'NR_ESTRELAS', 'ST_CLIENTE', 'DT_NASCIMENTO']]

# selecionar colunas que vão para a tabela
df = df[['NOME_CLIENTE', 'NR_ESTRELAS', 'ST_CLIENTE', 'DT_NASCIMENTO']]

# Renomeando df
df.columns = ['nm_cliente', 'nr_estrelas', 'st_cliente', 'dt_nascimento'] #colunas da tabela

# Convertendo tipos de dados no DataFrame para evitar problemas no SQL Server
# Converte valores Decimal para int ou float, e Timestamp para string
df['nr_estrelas'] = df['nr_estrelas'].apply(lambda x: int(x) if isinstance(x, Decimal) else x)
df['dt_nascimento'] = df['dt_nascimento'].apply(lambda x: x.strftime('%Y-%m-%d %H:%M:%S') if isinstance(x, Timestamp) else x)
    
insert_into(df=df, nome_tabela='dim_mc_cliente')


