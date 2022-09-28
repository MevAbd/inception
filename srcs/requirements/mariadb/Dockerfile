# CHOOSE VM'S OS 
FROM debian:buster

# DOWNLOAD UTILS

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y vim
RUN apt-get install -y mariadb-server

#SET MY CONFIG
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#USER AND DATABASE
COPY /tools/create_db.sh /etc/../create_db.sh
RUN sh create_db.sh

EXPOSE 3306

ENTRYPOINT tail -f /dev/null
