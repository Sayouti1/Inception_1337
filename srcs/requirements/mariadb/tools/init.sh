#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /tmp/init.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" >> /tmp/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';" >> /tmp/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/init.sql

exec mysqld --init-file=/tmp/init.sql
