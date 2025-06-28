FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-client curl php php-curl php-mysql php-fpm

RUN mkdir -p /var/www/html && \
	mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp
RUN  wp core download --allow-root

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/init.sh"]
