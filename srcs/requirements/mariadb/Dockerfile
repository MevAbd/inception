# CHOOSE VM'S OS 
FROM debian:buster

# DOWNLOAD UTILS

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y vim
RUN apt-get install -y mariadb-server

#SET MY CONFIG
COPY /conf/50-server.cnf /etc/mysql/mariadb.cnf

#USER AND DATABASE
COPY /tools/create_db.sh /etc/../create_db.sh

EXPOSE 3306

RUN chmod 755 /create_db.sh
ENTRYPOINT ["/create_db.sh"]
#ENTRYPOINT tail -f /dev/null
