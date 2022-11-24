FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y php-fpm
RUN apt-get install -y mariadb-client
RUN apt-get install -y curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wp-config.php /root/
COPY ./tools/create_wp.sh /var/www/

ARG MYSQL_DATA
ARG MYSQL_ADMIN
ARG MYSQL_PASS

RUN sed -i "s/_MYSQL_DATA_/${MYSQL_DATA}/g" /root/wp-config.php 
RUN sed -i "s/_MYSQL_ADMIN_/${MYSQL_ADMIN}/g" /root/wp-config.php
RUN sed -i "s/_MYSQL_PASS_/${MYSQL_PASS}/g" /root/wp-config.php

RUN chmod 755 /var/www/create_wp.sh

EXPOSE 9000 

ENTRYPOINT ["/var/www/create_wp.sh"]
