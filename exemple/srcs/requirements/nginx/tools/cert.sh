if [ ! -f /etc/nginx/ssl/inception.crt ]; then

echo "Nginx: setting up ssl ...";

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=malbrand.42.fr/UID=malbrand"

echo "Nginx: ssl is set up!";

fi
