FROM apache/superset:latest

USER root
# Install additional python packages cassandra-driver
RUN pip install cassandra-driver 
RUN pip install jaydebeapi

USER superset

