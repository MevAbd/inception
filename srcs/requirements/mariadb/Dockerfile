FROM debian:buster

RUN apt-get update > /dev/null
RUN apt-get upgrade -y > /dev/null
RUN apt-get install -y vim > /dev/null
RUN apt-get install -y mariadb-server > /dev/null

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

ARG MYSQL_DATA
ARG MYSQL_ADMIN
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS

RUN sed -i "s/_MYSQL_DATA_/${MYSQL_DATA}/g" /var/www/create_db.sql 
RUN sed -i "s/_MYSQL_ADMIN_/${MYSQL_ADMIN}/g" /var/www/create_db.sql
RUN sed -i "s/_MYSQL_PASS_/${MYSQL_PASS}/g" /var/www/create_db.sql
RUN sed -i "s/_MYSQL_ROOT_PASS_/${MYSQL_ROOT_PASS}/g" /var/www/create_db.sql

RUN service mysql start && mysql -u root < /var/www/create_db.sql && rm -rf /var/www/create_db.sql

CMD ["mysqld"]
