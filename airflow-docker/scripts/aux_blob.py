from azure.storage.blob import BlobServiceClient
import pandas as pd
from io import BytesIO
import pyodbc
import os
from decimal import Decimal

ACCOUNT_NAME_BLOB = os.getenv('ACCOUNT_NAME_BLOB')
ACCOUNT_KEY_BLOB = os.getenv('ACCOUNT_KEY_BLOB')
CONTAINER_NAME = os.getenv('CONTAINER_NAME')

# Dados de conexão banco de dados
SERVER_SQL_SERVER = os.getenv('SERVER_SQL_SERVER')
DATABASE_SQL_SERVER = os.getenv('DATABASE_SQL_SERVER')
USERNAME_SQL_SERVER = os.getenv('USERNAME_SQL_SERVER')
PASSWORD_SQL_SERVER = os.getenv('PASSWORD_SQL_SERVER')

# String de conexão
CONNECTION_STRING= f"""
    DRIVER={{ODBC Driver 17 for SQL Server}};
    SERVER={SERVER_SQL_SERVER};
    DATABASE={DATABASE_SQL_SERVER};
    UID={USERNAME_SQL_SERVER};
    PWD={PASSWORD_SQL_SERVER};
    Encrypt=yes;
    TrustServerCertificate=no;
    Connection Timeout=30;
"""

def pegar_arquivo_xls():

    # Construir a string de conexão
    connect_str = f"DefaultEndpointsProtocol=https;AccountName={ACCOUNT_NAME_BLOB};AccountKey={ACCOUNT_KEY_BLOB};EndpointSuffix=core.windows.net"

    # Criar um cliente de serviço de blob
    blob_service_client = BlobServiceClient.from_connection_string(connect_str)


    # Obter um cliente de container
    container_client = blob_service_client.get_container_client(CONTAINER_NAME)

    # Listar blobs
    blobs = container_client.list_blobs()
    blob = [x for x in blobs if '.xlsx' in x.name][0]

    blob_client = blob_service_client.get_blob_client(container=CONTAINER_NAME, blob=blob.name)

    # Baixar o conteúdo do blob como bytes
    blob_data = blob_client.download_blob().readall()

    # Carregar o conteúdo do blob em um DataFrame
    return pd.read_excel(BytesIO(blob_data), engine='openpyxl')

def ler_tabela(query):

    # Conectando ao SQL Server
    conn = pyodbc.connect(CONNECTION_STRING)
    cursor = conn.cursor()

    # Executando a consulta
    cursor.execute(query)

    # Recuperando os resultados
    rows = cursor.fetchall()

    # Obtendo os nomes das colunas
    columns = [column[0] for column in cursor.description]

    # Fechamento da conexão
    cursor.close()
    conn.close()

    # Convertendo os resultados para um DataFrame do Pandas
    return pd.DataFrame.from_records(rows, columns=columns)

def insert_into(df, nome_tabela):

    # Conectando ao SQL Server
    conn = pyodbc.connect(CONNECTION_STRING)
    cursor = conn.cursor()

    # Pegando o nome das colunas do df
    colunas = list(df.columns)

    # Deixando no formado aceito no insert
    colunas_insert = ','.join(colunas)

    for index, row in df.iterrows():
        valores = []
        for x in row[colunas]:
            # Verifica se o valor é do tipo Decimal e converte para int, caso contrário adiciona diretamente
            if isinstance(x, Decimal):
                valores.append(int(x))  # ou float(x) se precisar de decimal
            else:
                valores.append(x)
        # print(valores)
        query_insert = (
                    f"""
                    INSERT INTO NOME_DA_TABELA({colunas_insert})
                        values {valores}
                    """
                    .replace('NOME_DA_TABELA', nome_tabela)
                    .replace('[', '(')
                    .replace(']', ')')
        )
        # print(query_insert)
        cursor.execute(query_insert)

    # Commit e fechamento da conexão
    conn.commit()
    cursor.close()
    conn.close()