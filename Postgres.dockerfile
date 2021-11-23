FROM ubuntu:latest

RUN mkdir -p /mosip_master
#RUN mkdir -p /mosip-data

COPY commons/db_scripts/mosip_master/ ./mosip_master
#COPY mosip-data/ ./mosip-data

RUN mkdir -p /logs

RUN cd mosip_master

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y postgresql-client
RUN apt-get install python3-pip -y

#ENTRYPOINT []
#ENTRYPOINT ./mosip_master/mosip_master_db_deploy.sh mosip_master/mosip_master_deploy.properties

# installed psql
