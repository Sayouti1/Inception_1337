#!/bin/bash


wget https://www.adminer.org/latest-mysql.php -O /var/www/html/adminer/adminer.php

php-fpm7.4 -F