FROM postgres:13

COPY init.sql /docker-entrypoint-initdb.d/

# Убедитесь, что скрипт исполняемый
RUN chmod +x /docker-entrypoint-initdb.d/init.sql

