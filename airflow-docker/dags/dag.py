from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
import os
import sys
import importlib.util

# Configurando o caminho da pasta
pasta_atual = os.path.dirname(os.path.abspath(__file__))
pasta_atual = pasta_atual.replace('\\', '/')
pasta_atual = '/'.join(pasta_atual.split('/')[:-1])

# Caminhos dos scripts
dim_mc_regiao = os.path.join(pasta_atual, 'scripts', 'dim_mc_regiao.py')
dim_mc_estado = os.path.join(pasta_atual, 'scripts', 'dim_mc_estado.py')
dim_mc_cidade = os.path.join(pasta_atual, 'scripts', 'dim_mc_cidade.py')
dim_mc_bairro = os.path.join(pasta_atual, 'scripts', 'dim_mc_bairro.py')
dim_mc_centro_distribuicao = os.path.join(pasta_atual, 'scripts', 'dim_mc_centro_distribuicao.py')
dim_mc_cliente = os.path.join(pasta_atual, 'scripts', 'dim_mc_cliente.py')
dim_mc_tipo_venda = os.path.join(pasta_atual, 'scripts', 'dim_mc_tipo_venda.py')
dim_mc_status_venda = os.path.join(pasta_atual, 'scripts', 'dim_mc_status_venda.py')
dim_mc_origem_vda = os.path.join(pasta_atual, 'scripts', 'dim_mc_origem_vda.py')
dim_mc_forma_pagto = os.path.join(pasta_atual, 'scripts', 'dim_mc_forma_pagto.py')
dim_mc_pedido_venda = os.path.join(pasta_atual, 'scripts', 'dim_mc_pedido_venda.py')
dim_mc_categoria_prod = os.path.join(pasta_atual, 'scripts', 'dim_mc_categoria_prod.py')
dim_mc_sub_categoria_prod = os.path.join(pasta_atual, 'scripts', 'dim_mc_sub_categoria_prod.py')
dim_mc_produto = os.path.join(pasta_atual, 'scripts', 'dim_mc_produto.py')

# Funções que irão executar os scripts
def run_blob_script_regiao():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_regiao", dim_mc_regiao)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_estado():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_estado", dim_mc_estado)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_cidade():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_cidade", dim_mc_cidade)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_bairro():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_bairro", dim_mc_bairro)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_centro_distribuicao():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_centro_distribuicao", dim_mc_centro_distribuicao)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_cliente():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_cliente", dim_mc_cliente)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_tipo_venda():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_tipo_venda", dim_mc_tipo_venda)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_status_venda():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_status_venda", dim_mc_status_venda)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_origem_vda():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_origem_vda", dim_mc_origem_vda)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_forma_pagto():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_forma_pagto", dim_mc_forma_pagto)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_pedido_venda():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_pedido_venda", dim_mc_pedido_venda)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_categoria_prod():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_categoria_prod", dim_mc_categoria_prod)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_sub_categoria_prod():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_sub_categoria_prod", dim_mc_sub_categoria_prod)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

def run_blob_script_produto():
    sys.path.append(os.path.join(pasta_atual, 'scripts'))
    spec = importlib.util.spec_from_file_location("dim_mc_produto", dim_mc_produto)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)

# Definindo o DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 10, 31),
    'retries': 1,
}

dag = DAG(
    'mc_compras',
    default_args=default_args,
    description='DAG para executar todos os scripts de dimensões em sequência',
    schedule_interval='@daily',
)

# Definindo as tarefas
run_blob_script_regiao_task = PythonOperator(
    task_id='run_blob_script_regiao',
    python_callable=run_blob_script_regiao,
    dag=dag,
)

run_blob_script_estado_task = PythonOperator(
    task_id='run_blob_script_estado',
    python_callable=run_blob_script_estado,
    dag=dag,
)

run_blob_script_cidade_task = PythonOperator(
    task_id='run_blob_script_cidade',
    python_callable=run_blob_script_cidade,
    dag=dag,
)

run_blob_script_bairro_task = PythonOperator(
    task_id='run_blob_script_bairro',
    python_callable=run_blob_script_bairro,
    dag=dag,
)

run_blob_script_centro_distribuicao_task = PythonOperator(
    task_id='run_blob_script_centro_distribuicao',
    python_callable=run_blob_script_centro_distribuicao,
    dag=dag,
)

run_blob_script_cliente_task = PythonOperator(
    task_id='run_blob_script_cliente',
    python_callable=run_blob_script_cliente,
    dag=dag,
)

run_blob_script_tipo_venda_task = PythonOperator(
    task_id='run_blob_script_tipo_venda',
    python_callable=run_blob_script_tipo_venda,
    dag=dag,
)

run_blob_script_status_venda_task = PythonOperator(
    task_id='run_blob_script_status_venda',
    python_callable=run_blob_script_status_venda,
    dag=dag,
)

run_blob_script_origem_vda_task = PythonOperator(
    task_id='run_blob_script_origem_vda',
    python_callable=run_blob_script_origem_vda,
    dag=dag,
)

run_blob_script_forma_pagto_task = PythonOperator(
    task_id='run_blob_script_forma_pagto',
    python_callable=run_blob_script_forma_pagto,
    dag=dag,
)

run_blob_script_pedido_venda_task = PythonOperator(
    task_id='run_blob_script_pedido_venda',
    python_callable=run_blob_script_pedido_venda,
    dag=dag,
)

run_blob_script_categoria_prod_task = PythonOperator(
    task_id='run_blob_script_categoria_prod',
    python_callable=run_blob_script_categoria_prod,
    dag=dag,
)

run_blob_script_sub_categoria_prod_task = PythonOperator(
    task_id='run_blob_script_sub_categoria_prod',
    python_callable=run_blob_script_sub_categoria_prod,
    dag=dag,
)

run_blob_script_produto_task = PythonOperator(
    task_id='run_blob_script_produto',
    python_callable=run_blob_script_produto,
    dag=dag,
)

# Definindo a ordem de execução
(run_blob_script_regiao_task >> run_blob_script_estado_task >> 
 run_blob_script_cidade_task >> run_blob_script_bairro_task)

(run_blob_script_categoria_prod_task >>
 run_blob_script_sub_categoria_prod_task >> run_blob_script_produto_task)

# Continuar a ordem de execução conforme necessário
run_blob_script_centro_distribuicao_task
run_blob_script_cliente_task 
run_blob_script_tipo_venda_task  
run_blob_script_status_venda_task 
run_blob_script_origem_vda_task 
run_blob_script_forma_pagto_task 
run_blob_script_pedido_venda_task
