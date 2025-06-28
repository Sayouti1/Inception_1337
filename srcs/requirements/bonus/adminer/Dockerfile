FROM debian:bullseye

RUN apt update && apt install -y wget php php-fpm php-mysql 

RUN mkdir -p /var/www/html/adminer && \
    mkdir -p /run/php


COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

CMD ["/tmp/init.sh"]