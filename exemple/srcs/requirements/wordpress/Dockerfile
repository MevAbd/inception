FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install wget -y
RUN apt-get install php7.3 -y
RUN	apt-get install php-fpm -y 
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y
RUN rm /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/create_wp.sh ./
RUN chmod 755 ./create_wp.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD ["./create_wp.sh"]
