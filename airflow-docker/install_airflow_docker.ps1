# Criar diretórios necessários
New-Item -ItemType Directory -Path .\dags, .\logs, .\plugins, .\config, .\scripts -Force

# Iniciar o Airflow
docker-compose up -d airflow-init

docker-compose up -d
