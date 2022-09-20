FROM debian:buster

RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-client
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim
#RUN mkdir -p /var/lib/mysql 
#RUN chown -R root:root /var/lib/mysql 

#&& rm -rf /var/lib/apt/lists/* \
# purge and re-create /var/lib/mysql with appropriate ownership
#&& mkdir -p /var/run/mysqld \
#&& chown -R mysql:mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
#&& chmod 777 /var/run/mysqld

EXPOSE 3306

ENTRYPOINT tail -f /dev/null

