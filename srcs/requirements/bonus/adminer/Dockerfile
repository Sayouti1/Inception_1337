FROM debian:bullseye

RUN apt update && apt install -y wget php php-mysql 

RUN mkdir -p /var/www/html && \
    mkdir -p /run/php

RUN wget https://www.adminer.org/latest-mysql.php -O /var/www/html/index.php

WORKDIR /var/www/html

ENTRYPOINT ["php", "-S", "0.0.0.0:8080"]
