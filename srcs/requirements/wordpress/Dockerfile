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

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/create_wp.sh ./
RUN chmod 755 create_wp.sh


CMD ["./create_wp.sh"]
