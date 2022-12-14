FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install php7.3-fpm php-mysqli php-fpm wget sendmail mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/create_wp.sh /var/www/
RUN chmod 777 /var/www/*

EXPOSE 9000 

ENTRYPOINT ["/var/www/create_wp.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F", "-R"]
ENTRYPOINT tail -f /dev/null
