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

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

EXPOSE 9000 

COPY ./tools/create_wp.sh /var/www/html/
WORKDIR /var/www/html
RUN chmod 777 /var/www/html/create_wp.sh
ENTRYPOINT ["./create_wp.sh"]
RUN		chown -R root:root /var/www/wordpress
ENTRYPOINT tail -f /dev/null
