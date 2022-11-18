#CHOOSES VM'S OS
FROM debian:buster

#UTILS
RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y vim
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client 
RUN apt-get install -y procps 

#SET MY CONFIG
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ARG MYSQL_DATA
ARG MYSQL_ADMIN
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS

#EXPOSE
EXPOSE 3306

#RUN service mysql start \
#&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
#&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
#&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
#&& chmod -R 644 /var/run/mysqld/mysqld.sock \
#&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATA};" \ 
#&& mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN}'@'%' IDENTIFIED by '${MYSQL_PASS}';" \
#&& mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATA}.* TO '${MYSQL_ADMIN}'@'%';" \
#&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MYSQL_ROOT_PASS}';" \
#&& mysql -u root -p${MYSQL_ROOT_PASS} -e "FLUSH PRIVILEGES;"

#CMD ["mysqld_safe"]

WORKDIR /
COPY /tools/create_db.sh /
COPY /tools/init.sql /
RUN chmod 777 create_db.sh
RUN chmod 777 init.sql

#ENTRYPOINT ["sh", "create_db.sh"]

ENTRYPOINT tail -f /dev/null
