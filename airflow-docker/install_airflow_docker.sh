# Criar diretórios necessários
mkdir -p ./dags ./logs ./plugins ./config ./scripts

# Iniciar o Airflow
docker-compose up -d airflow-init

docker-compose up -d