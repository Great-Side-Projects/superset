# Use the Superset base image
FROM apache/superset:latest
 
# Switch to root user to install additional dependencies
USER root

# Install additional drivers like cassandra-driver and jaydebeapi
RUN pip install cassandra-driver
RUN pip install jaydebeapi

# Define build arguments
ARG SUPERSET_SECRET_KEY
ARG SQLALCHEMY_DATABASE_URI
ARG USERNAME_ADMIN
ARG PASSWORD_ADMIN

# Assign environment variables from arguments
ENV SUPERSET_SECRET_KEY=${SUPERSET_SECRET_KEY}
ENV SQLALCHEMY_DATABASE_URI=${SQLALCHEMY_DATABASE_URI}
ENV USERNAME_ADMIN=${USERNAME_ADMIN}
ENV PASSWORD_ADMIN=${PASSWORD_ADMIN}
ENV SUPERSET_LOAD_EXAMPLES=no
ENV SERVER_WORKER_AMOUNT=4

# Copy the Superset configuration file (optional if you have a custom one)
COPY ./superset_config.py /app/pythonpath/superset_config.py

# Switch back to user "superset" to comply with security recommendations
USER superset

# Defines the entry point of the container
ENTRYPOINT ["/bin/sh", "-c", "echo 'Initializing Superset...' && \
    superset db upgrade && \
    superset fab create-admin --username ${USERNAME_ADMIN} --firstname Superset --lastname Admin --email admin@example.com --password ${PASSWORD_ADMIN} || true && \
    superset init && \
    /bin/sh -c /usr/bin/run-server.sh"]
