# CHOOSE VM'S OS 
FROM debian:buster

# DOWNLOAD UTILS

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y nginx
RUN apt-get install -y openssl

#SSL MANAGEMENT 
RUN mkdir -p /etc/nginx/ssl
COPY /tools/cert.sh /cert.sh
RUN sh cert.sh
RUN rm cert.sh

#CONFIG NGINX
RUN mkdir -p /var/run/nginx
COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY /conf/default /etc/nginx/sites-enabled/default

#GIVES ACCESS RIGHTS
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
