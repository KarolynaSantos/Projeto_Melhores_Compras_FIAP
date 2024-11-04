# Criar diretórios necessários
New-Item -ItemType Directory -Path .\dags, .\logs, .\plugins, .\config, .\scripts -Force

# Iniciar o Airflow
docker-compose up airflow-init

# Rodar o Airflow
docker-compose up

# Fechar o terminal
exit
