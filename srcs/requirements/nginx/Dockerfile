# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: malbrand <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/07 17:20:24 by malbrand          #+#    #+#              #
#    Updated: 2022/09/07 17:38:09 by malbrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM   debian:buster

RUN    apt-get update && apt-get -y install nginx \ openssl 

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/malbrand.42.fr.pem -keyout /etc/ssl/malbrand.42.fr.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=malbrand/CN=malbrand.42.fr"

COPY   nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD    ["nginx", "-g", "daemon off;"]
