FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install php7.3-fpm php-mysqli php-fpm wget sendmail

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

#ENTRYPOINT ["/var/www/create_wp.sh"]

#CMD ["/usr/sbin/php-fpm7.3"]
ENTRYPOINT tail -f /dev/null
