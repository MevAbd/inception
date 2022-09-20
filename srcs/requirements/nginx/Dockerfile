#Precise with what our image will be built
FROM debian:buster

#Install nginx
RUN apt-get update && apt-get -y install nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssl
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install vim
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install dumb-init

#Generate a self certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/malbrand.42.fr.pem -keyout /etc/ssl/malbrand.42.fr.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=malbrand/CN=malbrand.42.fr"

#Copy the new configuration inside nginx
COPY conf/default /etc/nginx/sites-enabled

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]

