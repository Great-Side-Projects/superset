# Usa la imagen base de Superset
FROM apache/superset:latest

# Cambia a usuario root para instalar dependencias adicionales
USER root

# Instala controladores adicionales como cassandra-driver y jaydebeapi
RUN pip install cassandra-driver
RUN pip install jaydebeapi

# Define argumentos de construcción (build arguments)
ARG SUPERSET_SECRET_KEY
ARG SQLALCHEMY_DATABASE_URI
ARG USERNAME_ADMIN
ARG PASSWORD_ADMIN

# Asignar las variables de entorno a partir de los argumentos
ENV SUPERSET_SECRET_KEY=${SUPERSET_SECRET_KEY}
ENV SQLALCHEMY_DATABASE_URI=${SQLALCHEMY_DATABASE_URI}
ENV USERNAME_ADMIN=${USERNAME_ADMIN}
ENV PASSWORD_ADMIN=${PASSWORD_ADMIN}
ENV SUPERSET_LOAD_EXAMPLES=no
ENV SERVER_WORKER_AMOUNT=4

# Copia el archivo de configuración de Superset (opcional si tienes uno personalizado)
COPY ./superset_config.py /app/pythonpath/superset_config.py

# Vuelve a cambiar a usuario "superset" para cumplir con las recomendaciones de seguridad
USER superset

# Define el punto de entrada (entrypoint) del contenedor
ENTRYPOINT ["/bin/sh", "-c", "echo 'Initializing Superset...' && \
    superset db upgrade && \
    superset fab create-admin --username ${USERNAME_ADMIN} --firstname Superset --lastname Admin --email admin@example.com --password ${PASSWORD_ADMIN} || true && \
    superset init && \
    /bin/sh -c /usr/bin/run-server.sh"]
