FROM debian:buster

RUN apt-get update && apt-get install -y wget php7.3-fpm php7.3-mysql php7.3-json php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring expect vim

EXPOSE 9000

ENTRYPOINT tail -f /dev/null
