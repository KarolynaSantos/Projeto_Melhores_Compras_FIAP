FROM apache/airflow:2.10.2

# Instala dependências do sistema e o ODBC Driver 17 for SQL Server
USER root

RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 unixodbc-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER airflow

COPY requirements.txt /requirements.txt
RUN pip install apache-airflow==${AIRFLOW_VERSION} --upgrade pip && \
    pip install apache-airflow==${AIRFLOW_VERSION} -r /requirements.txt
# executar em seguida
# docker-compose up -d --no-deps --build airflow-webserver airflow-scheduler