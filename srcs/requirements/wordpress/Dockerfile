FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y php
RUN apt-get install -y php-cgi
RUN apt-get install -y php-fpm
RUN apt-get install -y php-pdo
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

COPY ./conf/www.conf /var/www/html

#RUN mkdir /run/php

COPY ./tools/create_wp.sh /usr/local/bin/
ENTRYPOINT ["create_wp.sh"]


