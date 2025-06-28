FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

CMD ["/tmp/init.sh"]

